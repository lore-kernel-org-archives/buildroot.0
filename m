From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] core: do not hard-code inclusion of
	br2-external in Kconfig
Message-ID: <20161016110154.111C48211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f4435e950240d1beff6cffae2b23ab4089b0d41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the inclusion of br2-external's Config.in to the generated kconfig
snippet.

This will ultimately allow us to use more than one br2-external tree.

Offload the "User-provided options" menu to the generated Kconfig
snippet. We can also move the definition of the Kconfig-version of
BR2_EXTERNAL into this snippet.

We introduce an extra check that was not present in the previous code,
to check that we do have permission on that directory. Prevciously, it
was handled as a side effect of not being able to cd into there, but it
is cleaner to check it expressly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                    | 11 ------
 Makefile                     |  2 +-
 support/scripts/br2-external | 88 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index d9fc400..21173b7 100644
--- a/Config.in
+++ b/Config.in
@@ -14,10 +14,6 @@ config BR2_HOSTARCH
 	string
 	option env="HOSTARCH"
 
-config BR2_EXTERNAL
-	string
-	option env="BR2_EXTERNAL"
-
 config BR2_BUILD_DIR
 	string
 	option env="BUILD_DIR"
@@ -729,11 +725,4 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
-menu "User-provided options"
-	depends on BR2_EXTERNAL != "support/dummy-external"
-
-source "$BR2_EXTERNAL/Config.in"
-
-endmenu
-
 source "$BR2_BUILD_DIR/.br2-external.in"
diff --git a/Makefile b/Makefile
index 4110861..5329cb2 100644
--- a/Makefile
+++ b/Makefile
@@ -879,7 +879,7 @@ endif
 # value of BR2_EXTERNAL is changed.
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	@touch $@
+	$(Q)support/scripts/br2-external -o "$(@)" $(BR2_EXTERNAL)
 
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
new file mode 100755
index 0000000..6c2b85b
--- /dev/null
+++ b/support/scripts/br2-external
@@ -0,0 +1,88 @@
+#!/bin/bash
+set -e
+
+# The location of the br2-external tree, once validated.
+declare BR2_EXT
+
+main() {
+    local OPT OPTARG
+    local br2_ext ofile
+
+    while getopts :ho: OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        o)  ofile="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+    done
+    # Forget options; keep only positional args
+    shift $((OPTIND-1))
+
+    if [ ${#} -ne 1 ]; then
+        error "need exactly one br2-external tree to be specified\n"
+    fi
+    br2_ext="${1}"
+
+    if [ -z "${ofile}" ]; then
+        error "no output file specified (-o)\n"
+    fi
+
+    do_validate "${br2_ext}"
+
+    do_kconfig >"${ofile}"
+}
+
+# Validates the br2-external tree passed as argument. Makes it cannonical
+# and store it in global variable BR2_EXT.
+do_validate() {
+    local br2_ext="${1}"
+
+    if [ ! -d "${br2_ext}" ]; then
+        error "'%s': no such file or directory\n" "${br2_ext}"
+    fi
+    if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
+        error "'%s': permission denied\n" "${br2_ext}"
+    fi
+
+    BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
+}
+
+# Generate the kconfig snippet for the br2-external tree.
+do_kconfig() {
+    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+    printf '\n'
+    printf 'config BR2_EXTERNAL\n'
+    printf '\tstring\n'
+    printf '\tdefault "%s"\n' "${BR2_EXT}"
+    printf '\n'
+    printf 'menu "User-provided options"\n'
+    printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n'
+    printf '\n'
+    printf 'source "%s/Config.in"\n' "${BR2_EXT}"
+    printf '\n'
+    printf "endmenu # User-provided options\n"
+}
+
+help() {
+    cat <<-_EOF_
+	Usage:
+	    ${my_name} -o FILE PATH
+
+	${my_name} generates the kconfig snippet to include the configuration
+	options specified in the br2-external tree passed as positional argument.
+
+	Options:
+	    -o FILE
+	        FILE in which to generate the kconfig snippet.
+
+	Returns:
+	    0   If no error
+	    !0  If any error
+	_EOF_
+}
+
+error() { local fmt="${1}"; shift; printf "%s: ${fmt}" "${my_name}" "${@}" >&2; exit 1; }
+
+my_name="${0##*/}"
+main "${@}"
