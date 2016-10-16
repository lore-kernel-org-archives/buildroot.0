From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] core: offload handling of BR2_EXTERNAL
	into the script
Message-ID: <20161016110154.2F32D8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bd19ccf0ddeb4a0d6987589bc73cc019e7798df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we treat the case where we have no br2-external tree
(BR2_EXTERNAL is empty) differently from the case where we do have one
(BR2_EXTERNAL is not empty).

There is now no reason to treat those two cases differently:

  - the kconfig snippet is always generated appropriately (i.e. it would
    include the br2-external tree if set, or include nothing otherwise);

  - we no longer have a dummy br-external tree either.

Also, the Makefile code to handle BR2_EXTERNAL is currently quite
readable if at least a little bit tricky.

However, when we're going to add support for using multiple br2-external
trees simultaneously, this code would need to get much, much more complex.

To keep the Makefile (rather) simple, offload all of the handling of
BR2_EXTERNAL to the recently added br2-external helper script.

However, because of Makefiles idiosyncracies, we can't use a rule to
generate that Makefile fragment.

Instead, we use $(shell ...) to call the helper script, and include the
fragment twice: once before the $(shell ...) so we can grab a previously
defined BR2_EXTERNAL value, a second time to use the one passed on the
command line, if any.

Furthermore, we can't error out (e.g. on non-existent br2-external tree)
directly from the fragment or we'd get that error on subsequent calls,
with no chance to override it even from command line.

Instead, we use a variable in which we store the error, set it to empty
before the second inclusion, so that only the one newly generated, if
any, is taken into account.

Since we know the script will always be called from Makefile context
first, we know validation will occur in Makefile context first. So we
can assume that, if there is an error, it will be detected in Makefile
context. Consequently, if the script is called to generate the kconfig
fragment, validation has already occured, and there should be no error.
So we change the error function to generate Makefile code, so that
errors are caught as explained above.

Lastly, when the value of BR2_EXTERNAL changes, we want to 'forget'
about the previous value of the BR2_EXTERNAL_MK variable, especially in
the case where BR2_EXTERNAL is now set to empty, so that we do not try
to include it later. That's why we first generate empty version of
BR2_EXTERNAL_MK, and then assign it the new value, if any.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                     | 29 +++++++++-----------
 support/scripts/br2-external | 64 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index f5d7536..ff93cae 100644
--- a/Makefile
+++ b/Makefile
@@ -143,24 +143,19 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # Handling of BR2_EXTERNAL.
 #
 # The value of BR2_EXTERNAL is stored in .br-external in the output directory.
-# On subsequent invocations of make, it is read in. It can still be overridden
-# on the command line, therefore the file is re-created every time make is run.
-#
-# When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
-# line), the .br-external file is removed.
+# The location of the external.mk makefile fragment is computed in that file.
+# On subsequent invocations of make, this file is read in. BR2_EXTERNAL can
+# still be overridden on the command line, therefore the file is re-created
+# every time make is run.
 
-BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
+BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external.mk
 -include $(BR2_EXTERNAL_FILE)
-ifeq ($(BR2_EXTERNAL),)
-  $(shell rm -f $(BR2_EXTERNAL_FILE))
-else
-  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
-  ifeq ($(_BR2_EXTERNAL),)
-    $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
-  endif
-  override BR2_EXTERNAL := $(_BR2_EXTERNAL)
-  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
-  BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
+$(shell support/scripts/br2-external \
+	-m -o '$(BR2_EXTERNAL_FILE)' $(BR2_EXTERNAL))
+BR2_EXTERNAL_ERROR =
+include $(BR2_EXTERNAL_FILE)
+ifneq ($(BR2_EXTERNAL_ERROR),)
+$(error $(BR2_EXTERNAL_ERROR))
 endif
 
 # To make sure that the environment variable overrides the .config option,
@@ -876,7 +871,7 @@ endif
 # value of BR2_EXTERNAL is changed.
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	$(Q)support/scripts/br2-external -o "$(@)" $(BR2_EXTERNAL)
+	$(Q)support/scripts/br2-external -k -o "$(@)" $(BR2_EXTERNAL)
 
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 1c42ffa..b2bff64 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -6,12 +6,14 @@ declare BR2_EXT
 
 main() {
     local OPT OPTARG
-    local br2_ext ofile
+    local br2_ext ofile ofmt
 
-    while getopts :ho: OPT; do
+    while getopts :hkmo: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         o)  ofile="${OPTARG}";;
+        k)  ofmt="kconfig";;
+        m)  ofmt="mk";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -26,17 +28,31 @@ main() {
 
     br2_ext="${1}"
 
+    case "${ofmt}" in
+    mk|kconfig)
+        ;;
+    *)  error "no output format specified (-m/-k)\n";;
+    esac
     if [ -z "${ofile}" ]; then
         error "no output file specified (-o)\n"
     fi
 
+    exec >"${ofile}"
+
     do_validate "${br2_ext}"
 
-    do_kconfig >"${ofile}"
+    do_${ofmt}
 }
 
 # Validates the br2-external tree passed as argument. Makes it cannonical
 # and store it in global variable BR2_EXT.
+#
+# Note: since this script is always first called from Makefile context
+# to generate the Makefile fragment before it is called to generate the
+# Kconfig snippet, we're sure that any error in do_validate will be
+# interpreted in Makefile context. Going up to generating the Kconfig
+# snippet means that there were no error.
+#
 do_validate() {
     local br2_ext="${1}"
 
@@ -55,6 +71,26 @@ do_validate() {
     BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
 }
 
+# Generate the .mk snippet that defines makefile variables
+# for the br2-external tree
+do_mk() {
+    local BR2_EXT="${1}"
+
+    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+    printf '\n'
+
+    printf 'BR2_EXTERNAL ?= %s\n' "${BR2_EXT}"
+    printf 'BR2_EXTERNAL_MK =\n'
+    printf '\n'
+
+    if [ -z "${BR2_EXT}" ]; then
+        printf '# No br2-external tree defined.\n'
+        return
+    fi
+
+    printf 'BR2_EXTERNAL_MK = %s/external.mk\n' "${BR2_EXT}"
+}
+
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
@@ -79,14 +115,26 @@ do_kconfig() {
 help() {
     cat <<-_EOF_
 	Usage:
-	    ${my_name} -o FILE PATH
+	    ${my_name} <-m|-k> -o FILE PATH
 
-	${my_name} generates the kconfig snippet to include the configuration
-	options specified in the br2-external tree passed as positional argument.
+	With -m, ${my_name} generates the makefile fragment that defines
+	variables related to the br2-external tree passed as positional
+	argument.
+
+	With -k, ${my_name} generates the kconfig snippet to include the
+	configuration options specified in the br2-external tree passed
+	as positional argument.
+
+	Using -k and -m together is not possible. The last one wins.
 
 	Options:
+	    -m  Generate the makefile fragment.
+
+	    -k  Generate the kconfig snippet.
+
 	    -o FILE
-	        FILE in which to generate the kconfig snippet.
+	        FILE in which to generate the kconfig snippet or makefile
+	        fragment.
 
 	Returns:
 	    0   If no error
@@ -94,7 +142,7 @@ help() {
 	_EOF_
 }
 
-error() { local fmt="${1}"; shift; printf "%s: ${fmt}" "${my_name}" "${@}" >&2; exit 1; }
+error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
 
 my_name="${0##*/}"
 main "${@}"
