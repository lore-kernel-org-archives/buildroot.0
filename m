From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 11:02:56 +0200
Subject: [Buildroot] [git commit] gdb: don't force makeinfo programs for
	GDB_FROM_GIT variants
Message-ID: <20140527090626.992F29CDEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffd243c6527250c488a83ee22460416e167be7dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/16d/16d4a83eb1e1b9d65641de47f2a2bc5d8ab18bdd/
http://autobuild.buildroot.net/results/df6/df64fe6e834f016267f522f089e00a08b1fd893e/

The GDB_FROM_GIT variants unconditionally use makeinfo, so ensure our
host-texinfo version is used instead of the missing script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c3fca40..6640d2c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -50,11 +50,7 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
-HOST_GDB_CONF_ENV = \
-	ac_cv_prog_MAKEINFO=missing
-
 GDB_CONF_ENV = \
-	ac_cv_prog_MAKEINFO=missing \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
 	ac_cv_func_dcgettext=yes \
@@ -119,6 +115,10 @@ HOST_GDB_CONF_OPT = \
 
 ifeq ($(GDB_FROM_GIT),y)
 HOST_GDB_DEPENDENCIES += host-texinfo
+else
+# don't generate documentation
+GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+HOST_GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 endif
 
 # legacy $arch-linux-gdb symlink
