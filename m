From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:02 +0200
Subject: [Buildroot] [PATCH 06/12] core: generate all br2-external files in
 one go
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <b010c88b116a1a3c03fff4b329573b873076dfdb.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we introduced support for multiple br2-external trees, we
introduced two files, one on the Makefile side, needed very early,
and one on the kconfig side, needed later in the configuration
process. We naturally introduced a two-step generation, as it looked
like the simplest and most obvious way.

But now, we are on the verge of generating more files on the kconfig
side, and it does not make sense to add even more steps to generate
them.

And even better yet, we can generate both the Makefile-side and
kconfig-side files at the same time, in fact.

Make it so.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                     | 12 ++----------
 support/scripts/br2-external | 23 ++++++++---------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index 196bb3c958..d611eb9c02 100644
--- a/Makefile
+++ b/Makefile
@@ -181,8 +181,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br2-external.mk
 -include $(BR2_EXTERNAL_FILE)
-$(shell support/scripts/br2-external \
-	-m -o '$(BR2_EXTERNAL_FILE)' $(BR2_EXTERNAL))
+$(shell support/scripts/br2-external -d '$(BASE_DIR)' $(BR2_EXTERNAL))
 BR2_EXTERNAL_ERROR =
 include $(BR2_EXTERNAL_FILE)
 ifneq ($(BR2_EXTERNAL_ERROR),)
@@ -939,7 +938,7 @@ HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
 .PHONY: prepare-kconfig
-prepare-kconfig: outputmakefile $(BASE_DIR)/.br2-external.in
+prepare-kconfig: outputmakefile
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
@@ -1036,13 +1035,6 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
-# Even though the target is a real file, we mark it as PHONY as we
-# want it to be re-generated each time make is invoked, in case the
-# value of BR2_EXTERNAL is changed.
-.PHONY: $(BASE_DIR)/.br2-external.in
-$(BASE_DIR)/.br2-external.in: $(BUILD_DIR)
-	$(Q)support/scripts/br2-external -k -o "$(@)" $(BR2_EXTERNAL)
-
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index a70e0159af..91ce1801a9 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -14,13 +14,11 @@ MANUAL_URL='https://buildroot.org/manual.html\#br2-external-converting'
 
 main() {
     local OPT OPTARG
-    local br2_ext ofile ofmt
+    local br2_ext outputdir
 
-    while getopts :kmo: OPT; do
+    while getopts :d: OPT; do
         case "${OPT}" in
-        o)  ofile="${OPTARG}";;
-        k)  ofmt="kconfig";;
-        m)  ofmt="mk";;
+        d)  outputdir="${OPTARG}";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -28,23 +26,18 @@ main() {
     # Forget options; keep only positional args
     shift $((OPTIND-1))
 
-    case "${ofmt}" in
-    mk|kconfig)
-        ;;
-    *)  error "no output format specified (-m/-k)\n";;
-    esac
-    if [ -z "${ofile}" ]; then
-        error "no output file specified (-o)\n"
+    if [ -z "${outputdir}" ]; then
+        error "no output directory specified (-d)\n"
     fi
 
-    exec >"${ofile}"
-
     # Trap any unexpected error to generate a meaningful error message
     trap "error 'unexpected error while generating ${ofile}\n'" ERR
 
     do_validate ${@//:/ }
 
-    do_${ofmt}
+    mkdir -p "${outputdir}"
+    do_mk >"${outputdir}/.br2-external.mk"
+    do_kconfig >"${outputdir}/.br2-external.in"
 }
 
 # Validates the br2-external trees passed as arguments. Makes each of
-- 
2.14.1
