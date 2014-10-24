From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:42:01 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: don't print anything
	when "make -s" is used
Message-ID: <20141024234356.81740B0BC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a4e217b73bbf8fe0619f03c66f7301c4126b6a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The make "-s" option is used to enable the "Silent operation" so if that
option is used don't print anything as far as there isn't any error.

Add the "-s" option to "apply-patches.sh" to enable silent operation.

[Peter: use the existing QUIET variable]
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in              |    2 +-
 support/scripts/apply-patches.sh |   17 ++++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dd62537..7c929ef 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -222,7 +222,7 @@ FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 SED := $(shell which sed || type -p sed) -i -e
 
-APPLY_PATCHES = support/scripts/apply-patches.sh
+APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..b32d592 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -6,6 +6,8 @@
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
 #
 # Parameters:
+# - "-s", optional. Silent operation, don't print anything if there
+# isn't any error.
 # - the build directory, optional, default value is '.'. The place where are
 # the package sources.
 # - the patch directory, optional, default '../kernel-patches'. The place
@@ -28,6 +30,13 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+silent=
+if [ "$1" = "-s" ] ; then
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
+    if [ -z "$silent" ] ; then
+	echo ""
+	echo "Applying $patch using ${type}: "
+    fi
     if [ ! -e "${path}/$patch" ] ; then
 	echo "Error: missing patch file ${path}/$patch"
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
