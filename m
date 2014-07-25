From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Jul 2014 18:38:39 +0200
Subject: [Buildroot] [PATCH v2 3/3] apply-patches.sh: don't print anything
	when "make -s" is used
In-Reply-To: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1406306319-11972-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The make "-s" option is used to enable the "Silent operation" so if that
option is used don't print anything as far as there isn't any error.

Add the "-s" option to "apply-patches.sh" to enable silent operation.

Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
used so others parts can use it to silence the build as well.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile                         |  2 ++
 package/Makefile.in              |  2 +-
 support/scripts/apply-patches.sh | 17 ++++++++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 6f502b0..d0d92e2 100644
--- a/Makefile
+++ b/Makefile
@@ -198,6 +198,8 @@ else
   Q = @
 endif
 
+BR_SILENT = $(if $(findstring s,$(MAKEFLAGS)),YES)
+
 # we want bash as shell
 SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	 else if [ -x /bin/bash ]; then echo /bin/bash; \
diff --git a/package/Makefile.in b/package/Makefile.in
index be95d8a..7e4fd47 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -218,7 +218,7 @@ FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 SED := $(shell which sed || type -p sed) -i -e
 
-APPLY_PATCHES = support/scripts/apply-patches.sh
+APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(BR_SILENT),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..8d4ba6d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -6,6 +6,8 @@
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
 #
 # Parameters:
+# - "-s",optional. Silent operation, don't print anything if there
+# isn't any error.
 # - the build directory, optional, default value is '.'. The place where are
 # the package sources.
 # - the patch directory, optional, default '../kernel-patches'. The place
@@ -28,6 +30,13 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+silent=
+if [[ $1 == "-s" ]] ; then
+    # add option to be used by the patch tool
+    silent=-s
+    shift
+fi
+
 # Set directories from arguments, or use defaults.
 builddir=${1-.}
 patchdir=${2-../kernel-patches}
@@ -77,14 +86,16 @@ function apply_patch {
 	return 0
 	;;
     esac
-    echo ""
-    echo "Applying $patch using ${type}: "
+    if [[ ! $silent ]] ; then
+	echo ""
+	echo "Applying $patch using ${type}: "
+    fi
     if [ ! -e "${path}/$patch" ] ; then
 	echo "Error: missing patch file ${path}/$patch"
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
+    ${uncomp} "${path}/$patch" | patch $silent -g0 -p1 -E -d "${builddir}" -t -N
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
-- 
2.0.2
