From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Dec 2009 10:22:12 +0100
Subject: [Buildroot] [git commit master] package/coreutils: ensure configure
	isn't considered out-of-date
Message-ID: <20091201092253.C7529777D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c14fb7c1dde86df909e00d2671b2ccf98485cf30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were patching m4/rename.m4 to workaround an upstream issue, but this
triggers a auto* rebuild and a configure rerun when we build coreutils
using whatever auto* versions the user has installed.

Doing a manual autoreconf run after patching is unfortunately not an
option as the coreutils configure.ac isn't compatible with the autotools
version we have in BR.

Instead, simply cheat by patching configure as well and setting the
timestamp of m4/rename.m4 sufficiently far back to ensure make doesn't
consider ./configure out of date.

Long term we should convert coreutils to Makefile.autotools.in format,
but this is good enought for 2009.11.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 .../coreutils/coreutils-7.4-rename-m4-fix.patch    |   19 +++++++++++++++++++
 package/coreutils/coreutils.mk                     |    3 +++
 3 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5cc8771..1452823 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,8 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: alsamixergui, fltk, microperl, ncurses, vim
+	Updated/fixed packages: alsamixergui, coreutils, fltk, microperl,
+	ncurses, vim
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/coreutils/coreutils-7.4-rename-m4-fix.patch b/package/coreutils/coreutils-7.4-rename-m4-fix.patch
index f869f43..8177200 100644
--- a/package/coreutils/coreutils-7.4-rename-m4-fix.patch
+++ b/package/coreutils/coreutils-7.4-rename-m4-fix.patch
@@ -23,3 +23,22 @@ Index: coreutils-7.4/m4/rename.m4
        AC_DEFINE([RENAME_DEST_EXISTS_BUG], [1],
  	[Define if rename does not work when the destination file exists,
  	 as on Windows.])
+Index: coreutils-7.4/configure
+===================================================================
+--- coreutils-7.4.orig/configure
++++ coreutils-7.4/configure
+@@ -28698,12 +28698,12 @@ $as_echo "$gl_cv_func_rename_dest_exists
+ 
+ $as_echo "#define rename rpl_rename" >>confdefs.h
+ 
+-    if test $gl_cv_func_rename_trailing_slash_bug; then
++    if test $gl_cv_func_rename_trailing_slash_bug = yes; then
+ 
+ $as_echo "#define RENAME_TRAILING_SLASH_BUG 1" >>confdefs.h
+ 
+     fi
+-    if test $gl_cv_func_rename_dest_exists_bug; then
++    if test $gl_cv_func_rename_dest_exists_bug = yes; then
+ 
+ $as_echo "#define RENAME_DEST_EXISTS_BUG 1" >>confdefs.h
+ 
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d2a3586..0dcb62b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -23,6 +23,9 @@ $(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
 	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
 	$(CONFIG_UPDATE) $(COREUTILS_DIR)/build-aux
+	# ensure rename.m4 file is older than configure / aclocal.m4 so
+	# auto* isn't rerun
+	touch -d '1979-01-01' $(@D)/m4/rename.m4
 	touch $@
 
 $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
-- 
1.6.3.3
