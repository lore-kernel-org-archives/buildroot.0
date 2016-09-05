From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 21:07:44 +0200
Subject: [Buildroot] [git commit] e2fsprogs: bump version to 1.43.2
Message-ID: <20160905190813.58C017F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbd79e25b861d0325906475efb707e727c67ea9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Upstream patches removed.
- Do not autoreconf since this was neecessary for one of those patches
  that are now upstream. Also remove host-gettext dependency for the
  same reason.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../e2fsprogs/0002-fuse2fs-might-need-librt.patch  | 63 ----------------------
 package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch | 30 -----------
 package/e2fsprogs/e2fsprogs.hash                   |  4 +-
 package/e2fsprogs/e2fsprogs.mk                     |  8 +--
 4 files changed, 3 insertions(+), 102 deletions(-)

diff --git a/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch b/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
deleted file mode 100644
index fef3d20..0000000
--- a/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 14d9e94315cd8144ac72d368c45e70869a66799c Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 9 Jun 2016 07:47:03 -0300
-Subject: [PATCH] fuse2fs: might need librt
-
-It uses clock_gettime() which in older glibc versions is in librt.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[yann.morin.1998 at free.fr: properly expand it in the Makefile]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch status: sent to linux-ext4 ML
-
- configure.ac     | 5 +++++
- misc/Makefile.in | 3 ++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 67d7231..a387dfd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1162,6 +1162,11 @@ if test "$ac_cv_func_dlopen" = yes ; then
- fi
- AC_SUBST(MAGIC_LIB)
- dnl
-+dnl Check to see if librt is required for clock_gettime() (glibc < 2.17)
-+dnl
-+AC_CHECK_LIB(rt, clock_gettime, [CLOCK_GETTIME_LIB=-lrt])
-+AC_SUBST(CLOCK_GETTIME_LIB)
-+dnl
- dnl Check to see if the FUSE library is -lfuse or -losxfuse
- dnl
- FUSE_CMT=
-diff --git a/misc/Makefile.in b/misc/Makefile.in
-index 43e3c7e..070a6e3 100644
---- a/misc/Makefile.in
-+++ b/misc/Makefile.in
-@@ -387,7 +387,8 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
- 		$(LIBEXT2FS)
- 	$(E) "	LD $@"
- 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
--		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL)
-+		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \
-+		$(CLOCK_GETTIME_LIB)
- 
- journal.o: $(srcdir)/../debugfs/journal.c
- 	$(E) "	CC $@"
-diff --git a/misc/Makefile.in b/misc/Makefile.in
-index 43e3c7e..070a6e3 100644
---- a/misc/Makefile.in
-+++ b/misc/Makefile.in
-@@ -32,6 +32,8 @@
- 
- @FUSE_CMT at FUSE_PROG= fuse2fs
- 
-+CLOCK_GETTIME_LIB = @CLOCK_GETTIME_LIB@
-+
- SPROGS=		mke2fs badblocks tune2fs dumpe2fs $(BLKID_PROG) logsave \
- 			$(E2IMAGE_PROG) @FSCK_PROG@ e2undo
- USPROGS=	mklost+found filefrag e2freefrag $(UUIDD_PROG) \
--- 
-2.7.3
-
diff --git a/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch b/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch
deleted file mode 100644
index 61c6965..0000000
--- a/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ff6147dd7197519e561e796d56545c4e11eb43fa Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 22 Jun 2016 20:55:35 -0300
-Subject: [PATCH e2fsprogs] fuse2fs: needs SYSLIBS
-
-It otherwise leads to build failure when using an unbundled libintl.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: sent to ML http://marc.info/?l=linux-ext4&m=146664003825136&w=2
-
- misc/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/Makefile.in b/misc/Makefile.in
-index f67c9c7..e487692 100644
---- a/misc/Makefile.in
-+++ b/misc/Makefile.in
-@@ -389,7 +389,7 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
- 	$(E) "	LD $@"
- 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
- 		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \
--		$(CLOCK_GETTIME_LIB)
-+		$(CLOCK_GETTIME_LIB) $(SYSLIBS)
- 
- journal.o: $(srcdir)/../debugfs/journal.c
- 	$(E) "	CC $@"
--- 
-2.7.3
-
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index ec75573..57287f4 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.1/sha256sums.asc
-sha256	97e36a029224e2606baa6e9ea693b04a4d192ccd714572a1b50a2df9c687b23d	e2fsprogs-1.43.1.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.2/sha256sums.asc
+sha256 ddba23e44e06cbe32c7b1026bc92f9487b9cb08c89e961d007cb2a5e87c4ef5e  e2fsprogs-1.43.2.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7aa0285..3f3b1c0 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.1
+E2FSPROGS_VERSION = 1.43.2
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
@@ -15,12 +15,6 @@ E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 # we don't have a host-util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
 
-# For 0002-fuse2fs-might-need-librt.patch
-# host-gettext for the gettext macro file needed at autoreconf time
-E2FSPROGS_AUTORECONF = YES
-E2FSPROGS_DEPENDENCIES += host-gettext
-HOST_E2FSPROGS_DEPENDENCIES += host-gettext
-
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
