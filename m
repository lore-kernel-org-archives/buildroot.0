From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] core: get rid of our dummy br2-external
	tree
Message-ID: <20161016110154.1D9138211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64e12a370c6d48f7a508a0add68f205943628142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we generate a kconfig snippet, we can conditionally include the
BR2_EXTERNAL's Config.in only when BR2_EXTERNAL is supplied by the user,
which means our empty/dummy Config.in is no needed.

As for external.mk, we can also include it only when BR2_EXTERNAL is
supplied by the user, which means our empty/dummy external.mk is no
longer needed.

Ditch both of those files, and:

  - only generate actual content in the Kconfig snippet when we actually
    do have a BR2_EXTERNAL provided by the user (i.e. BR2_EXTERNAL is not
    empty);

  - add a variable that contains the path to the external.mk provided by
    the user, or empty if none, and include the path set in that variable
    (make can 'include' nothing without any problem! ;-) )

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                           | 11 ++++-------
 support/dummy-external/Config.in   |  0
 support/dummy-external/external.mk |  0
 support/scripts/br2-external       | 18 +++++++++++++++---
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 5329cb2..f5d7536 100644
--- a/Makefile
+++ b/Makefile
@@ -147,16 +147,11 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # on the command line, therefore the file is re-created every time make is run.
 #
 # When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
-# line), the .br-external file is removed and we point to
-# support/dummy-external. This makes sure we can unconditionally include the
-# Config.in and external.mk from the BR2_EXTERNAL directory. In this case,
-# override is necessary so the user can clear BR2_EXTERNAL from the command
-# line, but the dummy path is still used internally.
+# line), the .br-external file is removed.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
 ifeq ($(BR2_EXTERNAL),)
-  override BR2_EXTERNAL = support/dummy-external
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
   _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
@@ -165,6 +160,7 @@ else
   endif
   override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
 endif
 
 # To make sure that the environment variable overrides the .config option,
@@ -457,7 +453,8 @@ include boot/common.mk
 include linux/linux.mk
 include fs/common.mk
 
-include $(BR2_EXTERNAL)/external.mk
+# Nothing to include if no BR2_EXTERNAL tree in use
+include $(BR2_EXTERNAL_MK)
 
 # Now we are sure we have all the packages scanned and defined. We now
 # check for each package in the list of enabled packages, that all its
diff --git a/support/dummy-external/Config.in b/support/dummy-external/Config.in
deleted file mode 100644
index e69de29..0000000
diff --git a/support/dummy-external/external.mk b/support/dummy-external/external.mk
deleted file mode 100644
index e69de29..0000000
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 6c2b85b..1c42ffa 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -19,9 +19,11 @@ main() {
     # Forget options; keep only positional args
     shift $((OPTIND-1))
 
-    if [ ${#} -ne 1 ]; then
-        error "need exactly one br2-external tree to be specified\n"
+    # Accept 0 or 1 br2-external tree.
+    if [ ${#} -gt 1 ]; then
+        error "only zero or one br2-external tree allowed.\n"
     fi
+
     br2_ext="${1}"
 
     if [ -z "${ofile}" ]; then
@@ -38,6 +40,11 @@ main() {
 do_validate() {
     local br2_ext="${1}"
 
+    # No br2-external tree is valid
+    if [ -z "${br2_ext}" ]; then
+        return
+    fi
+
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
@@ -52,12 +59,17 @@ do_validate() {
 do_kconfig() {
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
+
+    if [ -z "${BR2_EXT}" ]; then
+        printf '# No br2-external tree defined.\n'
+        return
+    fi
+
     printf 'config BR2_EXTERNAL\n'
     printf '\tstring\n'
     printf '\tdefault "%s"\n' "${BR2_EXT}"
     printf '\n'
     printf 'menu "User-provided options"\n'
-    printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n'
     printf '\n'
     printf 'source "%s/Config.in"\n' "${BR2_EXT}"
     printf '\n'
