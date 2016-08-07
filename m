From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Aug 2016 17:32:09 +0200
Subject: [Buildroot] [PATCH] support/scripts: add follow-selects
Message-ID: <1470583929-17856-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we need to change the dependencies of a package, we have to
propagate that new dependency to all packages that select the package
to which we add that dependency, and that recursively.

In some cases, that chain-o-selects can be quite big, especially in the
case of low-level libraries such as libffi: 153 packages would be
impacted when changing the dependencies of libffi, with the chain being
5-level deep.

Furthermore, some packages may appear at different depth, because they
may select deeper and more shallow packages that both in turn have a
chain-o-select down to the original package.

For example, when adding a dependency to libffi, it propagates down
to midori by way of (but not only) webkitgtk and gcr (packages more
indented select the package less indented (e.g. gst1-plugins-good
selects gdk-pixbuf):

    libffi
      libglib2
        gdk-pixbuf
          gst1-plugins-good
            webkitgtk
              midori
        gcr
          midori

What we are really interested in when propagating such a new dependency
is the shortest chain-o-selects.

It is thus pretty difficult to follow by mere visual inspection, and
simple greps are not much use either.

Add a script that, given a package as argument, will follow the chain
of selects and dump the most shallow chain-o-selects that lead to that
package. It also prints the number of affected packages (including the
starting one) and the maximum depth of the chain considering only the
shortest chains (the actual depth can be larger if we'd take into
account the longest chain, but that's not useful in this case).

There is a bunch of output option,. covering the various envisioned
use-cases for that script:

  - a tree-like output (default), with only the names of the packages,
  - a comment-like, arrowed list suitable for adding as a comment of a
    depednency;
  - the filenames of the affected packages.

It can be silenced (not progress no summary, only dependency chains).
It can be debugged to see how packages are added and moved in the
chains. Also, -h gives the help.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
For example, here is the chain-o-select for xzlinux (using libffi is way
too long for a note in a commit log):

    $ support/scripts/follow-selects xz
    xz
      cmake
      squashfs
      systemd
      tiff
        directfb
        efl
        imlib2
          feh
          giblib
        kodi
        libgeotiff
        opencv
        opencv3
        qt
          pinentry
          python-pyqt
          python-sip
        sdl_image
          python-pygame

    Scan completed in: ~2s
    Packages: 20 (-1)
    Maximum depth: 3
---
 support/scripts/follow-selects | 188 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100755 support/scripts/follow-selects

diff --git a/support/scripts/follow-selects b/support/scripts/follow-selects
new file mode 100755
index 0000000..ef8a727
--- /dev/null
+++ b/support/scripts/follow-selects
@@ -0,0 +1,188 @@
+#!/usr/bin/env bash
+
+# Given a package as 1st argument, this script will follow the
+# reverse dependencies (i.e. the selects) that lead to said package.
+
+declare -A PKG_FILE
+declare -A SELECTS
+declare -A PKG_DEPTH
+declare -a DEPTH
+
+main() {
+    local pkg="${1}"
+    local OPT OPTARG
+    local COMMENT DEBUG SHOW_FILE SILENT
+    local D d p start_t end_t
+
+    while getopts :hcdfs OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        c)  COMMENT=y;;
+        d)  DEBUG=y;;
+        f)  SHOW_FILE=y;;
+        s)  SILENT=y;;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        *)  error "unhandled option '%s'\n" "${OPT}";;
+        esac
+    done
+    shift $((OPTIND-1))
+    pkg="${1}"
+
+    if [ -z "${pkg}" ]; then
+        printf "Usage: %s [OPTION ...] <pkg>\nSee -h for some help\n" "${my_name}" >&2
+        exit 1
+    fi
+
+    start_t=${SECONDS}
+    PKG_DEPTH["${pkg}"]=0
+    find_pkg "${pkg}"
+    find_rev_deps 1 "${pkg}"
+    printf "\r\033[K" >&2
+
+    for p in "${!PKG_DEPTH[@]}"; do
+        d="${PKG_DEPTH[${p}]}"
+        D=$(( d>D?d:D ))
+        DEPTH[${d}]="${DEPTH[${d}]} ${p}"
+    done
+    end_t=${SECONDS}
+
+    dump_rev_deps "${pkg}"
+
+    if [ -z "${SILENT}" ]; then
+        printf "\nScan completed in: ~%ds\n" $((end_t-start_t))
+        printf "Packages: %d (-1)\n" ${#PKG_DEPTH[@]}
+        printf "Maximum depth: %d\n" ${D}
+    fi
+}
+
+find_rev_deps() {
+    local depth=${1}
+    local pkg="${2}"
+    local PKG p pf
+    local -a rev_deps
+
+    progress
+    PKG="$( sed -r -e 's/[^[:alnum:]]/_/g;' <<<"BR2_PACKAGE_${pkg^^}" )"
+    for pf in $(grep -r -l -E "select ${PKG}\>" package/ boot/ linux/ \
+                |LC_ALL=C sort
+              )
+    do
+        p="${pf%/*}"; p="${p##*/}"
+        PKG_FILE[${p}]="${pf}"
+        if [ -n "${SELECTS[${p}]}" ]; then
+            if [ ${PKG_DEPTH[${p}]} -le ${depth} ]; then
+                debug "%s already known in a shorter chain (-> %s vs %s)\n" \
+                      "${p}" "${SELECTS[${p}]}" "${pkg}"
+                continue
+            fi
+            debug "%s relocated to a shorter chain (from %s to %s)\n" \
+                  "${p}" "${SELECTS[${p}]}" "${pkg}"
+        else
+            debug "%s added to chain (-> %s)\n" \
+                  "${p}" "${pkg}"
+        fi
+        rev_deps+=( "${p}" )
+        SELECTS["${p}"]="${pkg}"
+        PKG_DEPTH["${p}"]=${depth}
+    done
+
+    for p in "${rev_deps[@]}"; do
+        find_rev_deps $((depth+1)) "${p}"
+    done
+}
+
+dump_rev_deps() {
+    local p pkg depth
+
+    dump_pkg_chain "${@}"
+    for pkg; do :; done
+    for p in $( printf "%s\n" "${!SELECTS[@]}" |LC_ALL=C sort ); do
+        if [ "${SELECTS[${p}]}" = "${pkg}" ]; then
+            dump_rev_deps "${@}" "${p}"
+        fi
+    done
+}
+
+dump_pkg_chain() {
+    local pkg depth
+
+    depth=0
+    for pkg; do
+        if [ -n "${COMMENT}" ]; then
+            [ ${depth} -eq 0 -o -n "${SHOW_FILE}" ] || printf " <- "
+            [ -n "${SHOW_FILE}" ] || printf "%s" "${pkg}"
+        fi
+        : $((depth++))
+    done
+    [ -n "${COMMENT}" -o -n "${SHOW_FILE}" ] || printf "%*.*s%s" $((depth*2-2)) $((depth*2-2)) "" "${pkg}"
+    [ -z "${SHOW_FILE}" ] || printf "%s" "${PKG_FILE[${pkg}]}"
+    printf "\n"
+}
+
+find_pkg() {
+    local pkg PKG pf
+
+    pkg="${1}"
+    PKG="$( sed -r -e 's/[^[:alnum:]]/_/g;' <<<"BR2_PACKAGE_${pkg^^}" )"
+
+    pf="$( grep -r -l -E "^(menu)?config ${PKG}\$" package/ boot/ linux/ )"
+    PKG_FILE[${pkg}]="${pf}"
+}
+
+help() {
+    cat <<-_EOF_
+NAME
+    ${my_name} - recursively follow selects that lead to a package
+
+SYNOPSIS
+    ${my_name} [OPTION ...] <PACKAGE>
+
+    The reverse chain of selects leading to PACKAGE is printed in a
+    tree-like structure. E.g. for PACKAGE=foo:
+
+        foo
+          bar
+            buz
+          baz
+            fuz
+              faz
+
+        Packages: 6 (-1)
+        Maximum depth: 3
+
+OPTIONS
+
+    -h  This help text
+
+    -c  Dump the chains ready to be pasted as a comment to a dependency
+        instead of the default tree-like structure:
+
+            foo
+            foo <- bar
+            foo <- bar <- buz
+            foo <- baz
+            foo <- baz <- fuz
+            foo <- baz <- fuz <- faz
+
+    -d  Print the debugging info on how the dependency chains are
+        constructed.
+
+    -f  Only filename of affected packages instead of the dependency
+        chains.
+
+    -s  Be silent: do not print the progress info for packages being
+        scanned; do not print the summary.
+
+_EOF_
+}
+
+trace()    { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()     { trace "${@}" >&2; }
+errorN()   { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+error()    { errorN 1 "${@}"; }
+debug()    { [ -z "${DEBUG}" ] || trace "\r\033[K${@}" >&2; }
+progress() { [ -n "${SILENT}" ] || printf "\r\033[KScanning: %s" "${pkg}" >&2; }
+
+my_name="${0##*/}"
+main "${@}"
-- 
2.7.4
