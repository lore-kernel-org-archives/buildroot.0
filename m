From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jun 2016 08:03:07 -0300
Subject: [Buildroot] [PATCH 2/2] e2fsprogs: fix build failure with old glibc
	versions
In-Reply-To: <1465470187-2185-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465470187-2185-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465470187-2185-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In old (< 2.17) glibc versions clock_gettime() resides in librt, however
there's no check for this, so add a patch to fix it. Fixes:
http://autobuild.buildroot.net/results/25c/25c042d2862affebf552ed24bc2a58e0c484226f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../e2fsprogs/0002-fuse2fs-might-need-librt.patch  | 48 ++++++++++++++++++++++
 package/e2fsprogs/e2fsprogs.mk                     |  4 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/e2fsprogs/0002-fuse2fs-might-need-librt.patch

diff --git a/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch b/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
new file mode 100644
index 0000000..42a7fbd
--- /dev/null
+++ b/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
@@ -0,0 +1,48 @@
+From 14d9e94315cd8144ac72d368c45e70869a66799c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 9 Jun 2016 07:47:03 -0300
+Subject: [PATCH] fuse2fs: might need librt
+
+It uses clock_gettime() which in older glibc versions is in librt.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: sent to linux-ext4 ML
+
+ configure.ac     | 5 +++++
+ misc/Makefile.in | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 67d7231..a387dfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1162,6 +1162,11 @@ if test "$ac_cv_func_dlopen" = yes ; then
+ fi
+ AC_SUBST(MAGIC_LIB)
+ dnl
++dnl Check to see if librt is required for clock_gettime() (glibc < 2.17)
++dnl
++AC_CHECK_LIB(rt, clock_gettime, [CLOCK_GETTIME_LIB=-lrt])
++AC_SUBST(CLOCK_GETTIME_LIB)
++dnl
+ dnl Check to see if the FUSE library is -lfuse or -losxfuse
+ dnl
+ FUSE_CMT=
+diff --git a/misc/Makefile.in b/misc/Makefile.in
+index 43e3c7e..070a6e3 100644
+--- a/misc/Makefile.in
++++ b/misc/Makefile.in
+@@ -387,7 +387,8 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
+ 		$(LIBEXT2FS)
+ 	$(E) "	LD $@"
+ 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
+-		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL)
++		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \
++		$(CLOCK_GETTIME_LIB)
+ 
+ journal.o: $(srcdir)/../debugfs/journal.c
+ 	$(E) "	CC $@"
+-- 
+2.7.3
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 17ac011..548c91d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,6 +12,10 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h li
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
+# For 0002-fuse2fs-might-need-librt.patch
+# host-gettext for the gettext macro file needed@autoreconf time
+E2FSPROGS_AUTORECONF = YES
+E2FSPROGS_DEPENDENCIES += host-gettext
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
-- 
2.7.3
