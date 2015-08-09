From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:19 +0200
Subject: [Buildroot] [PATCH 4/5] support/graphs: real-time build status on
	graph-depends
In-Reply-To: <cover.1439159331.git.yann.morin.1998@free.fr>
References: <cover.1439159331.git.yann.morin.1998@free.fr>
Message-ID: <6f42b9d8310705660128f0b23880902eb7791123.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, following the state of the build is not easily done. One may
want to see at a glance where the build has progressed so far, which
package are built, what dependency chains are finished, why a certain
package is not yet built.

We add a new make target, rt-graph-depends, that takes the exisiting
dependency graph (graph-depends) and overlays the build status for each
package, with colors and the current action being done on the package.

The new scritps loops forever, each time parsing the build-time.log file
to extract the status for each package; it then uses that to replace the
color and label in the .dot script and eventually re-renders the graph.

Also add the <pkg>-rt-graph-depends to limit tracking the build to that
specific package's dependencies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: the script should be able to handle the full-parallel build once
it lands in the tree.
---
 Makefile                         |   7 ++
 package/pkg-generic.mk           |   7 ++
 support/scripts/rt-graph-depends | 175 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100755 support/scripts/rt-graph-depends

diff --git a/Makefile b/Makefile
index e70bbd6..014e95a 100644
--- a/Makefile
+++ b/Makefile
@@ -688,6 +688,13 @@ graph-depends: graph-depends-requirements
 	|tee $(GRAPHS_DIR)/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
 
+rt-graph-depends:
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/rt-graph-depends \
+		-l $(BUILD_DIR)/build-time.log -d $(GRAPHS_DIR) \
+		-g graph-depends -T$(BR_GRAPH_OUT) -- \
+		$(BR2_GRAPH_DOT_OPTS)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d0d580a..fe752b2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -623,6 +623,13 @@ $(1)-graph-depends: graph-depends-requirements
 			|tee $$(GRAPHS_DIR)/$$(@).dot \
 			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
 
+$(1)-rt-graph-depends:
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/rt-graph-depends \
+		-l $(BUILD_DIR)/build-time.log -d $(GRAPHS_DIR) \
+		-g $(1)-graph-depends -T$(BR_GRAPH_OUT) -- \
+		$(BR2_GRAPH_DOT_OPTS)
+
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
 
diff --git a/support/scripts/rt-graph-depends b/support/scripts/rt-graph-depends
new file mode 100755
index 0000000..752f56b
--- /dev/null
+++ b/support/scripts/rt-graph-depends
@@ -0,0 +1,175 @@
+#!/bin/bash
+
+declare -A COLORS
+COLORS=(
+    ["start:extract"]="coral"
+    ["end:extract"]="coral"
+    ["start:patch"]="coral"
+    ["end:patch"]="coral"
+    ["start:configure"]="orange"
+    ["end:configure"]="orange"
+    ["start:build"]="orange"
+    ["end:build"]="orange"
+    ["start:install-staging"]="green"
+    ["end:install-staging"]="green"
+    ["start:install-target"]="green"
+    ["end:install-target"]="green"
+    ["start:install-image"]="green"
+    ["end:install-image"]="green"
+    ["start:install-host"]="green"
+    ["end:install-host"]="green"
+    ["start:assemble"]="green"
+    ["end:assemble"]="green"
+)
+
+# The label to print under the package name when there is an action
+# being done on that package. Empty means to not add an action label,
+# and is used when the package reaches a terminal state (e.g. installed
+# for packages, assembled for rootfs images).
+#
+# Note: some packages have only one of the target/staging/image install
+# commands, so we don't know which will be the last to be done. So, we
+# just consider each to be terminal.
+declare -A TRANSLATE
+TRANSLATE=(
+    ["start:extract"]="extracting"
+    ["end:extract"]="extracted"
+    ["start:patch"]="patching"
+    ["end:patch"]="patched"
+    ["start:configure"]="configuring"
+    ["end:configure"]="configured"
+    ["start:build"]="building"
+    ["end:build"]="built"
+    ["start:install-staging"]="installing staging"
+    ["end:install-staging"]=""
+    ["start:install-target"]="installing target"
+    ["end:install-target"]=""
+    ["start:install-image"]="installing image"
+    ["end:install-image"]=""
+    ["start:install-host"]="installing host"
+    ["end:install-host"]=""
+    ["start:assemble"]="assembling"
+    ["end:assemble"]=""
+)
+
+main() {
+    local OPT OPTARG
+    local log gdir gname dot_type
+    local infile outfile outgraph
+    local -A pkg_status
+    local -a sed_expr
+    local _ step stat pkg last_pkg color h _h _r _s _t
+
+    while getopts :hl:d:g:T: OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        l)  log="${OPTARG}";;
+        d)  gdir="${OPTARG}";;
+        g)  gname="${OPTARG}";;
+        T)  dot_type="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+    done
+    # Forget our options, and keep only the ones for 'dot'
+    shift $((OPTIND-1))
+
+    if [ -z "${log}" ]; then
+        error "no build-time.log file specified\n"
+    fi
+
+    if [ -z "${gdir}" ]; then
+        error "no graph directory specified\n"
+    fi
+
+    if [ -z "${gname}" ]; then
+        error "no graph name specified\n"
+    fi
+
+    if [ -z "${dot_type}" ]; then
+        error "no output type specified\n"
+    fi
+
+    if [ ! -f "${gdir}/${gname}.${dot_type}" ]; then
+        make ${gname} || exit $?
+    fi
+
+    infile="${gdir}/${gname}.dot"
+    outfile="$(sed -r -e 's/(graph-depends)/rt-\1/' <<<${gname})"
+    outgraph="${gdir}/${outfile}.${dot_type}"
+    cp "${gdir}/${gname}.${dot_type}" "${outgraph}"
+
+    printf "Realtime graph is at: %s\n" "${outgraph}"
+    printf "Now rendering realtime status... (Ctrl-C to interrupt)"
+
+    _h=""
+    while true; do
+        pkg_status=()
+        sed_expr=()
+        while read _ step stat pkg; do
+            pkg_status["${pkg}"]="${step}:${stat}"
+        done < <( sed -r -e 's/:/ /g; s/ +/ /g;' "${log}" 2>/dev/null )
+        h="$( printf "%s\n" "${pkg_status[@]}" |sort |md5sum )"
+        if [ "${h}" = "${_h}" ]; then
+            inotifywait -t 1 -e modify -qq "${log}" >/dev/null 2>&1
+            [ -f "${log}" ] || sleep 0.1
+            continue
+        fi
+        _h="${h}"
+        for pkg in "${!pkg_status[@]}"; do
+            stat="${pkg_status["${pkg}"]}"
+            color="${COLORS["${stat}"]}"
+            [ -n "${color}" ] || continue
+            _s="^(${pkg//-/}\>.*color=)[^,]+(.*)\$"
+            _r="\\1${color}\\2"
+            sed_expr+=( "s/${_s}/${_r}/;" )
+            _t="${TRANSLATE["${stat}"]}"
+            if [ -n "${_t}" ]; then
+                _s="^(${pkg//-/}\>.*label = \"[^\"]+)(.*)\$"
+                _r="\\1\n[${_t}]\\2"
+                sed_expr+=( "s/${_s}/${_r}/;" )
+            fi
+        done
+        sed -r -e "${sed_expr[*]}" "${infile}"  \
+        |dot "${@}" -T${dot_type} -o"${outgraph}.tmp"
+        mv -f "${outgraph}.tmp" "${outgraph}"
+    done
+}
+
+help() {
+cat <<_EOF_
+NAME
+    ${my_name} - draw the dependency graph with packages status
+
+SYNOPSIS
+    ${my_name} [OPTION...]
+
+DESCRIPTION
+    ${my_name} displays the dependency graph and colors each package
+    depending on their build status. The graph is refreshed every time
+    the status of a package changes, so that it is possible to follow
+    the status of the build in near-realtime.
+
+    -l  full-path to the build-time.log file
+
+    -d  base directory with the existing dependency graph, in 'dot'
+        format.
+
+    -g  base name of the dependency graph
+
+    -T  output type, anything acepted by the 'dot' program (which uses
+        the same option)
+
+EXIT STATUS
+    Unless there is an error, ${my_name} never exits on its own, you
+    must interrupt it (Ctrl-C).
+_EOF_
+}
+
+trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()   { trace "${@}" >&2; }
+errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+error()  { errorN 1 "${@}"; }
+
+my_name="${0##*/}"
+main "${@}"
-- 
1.9.1
