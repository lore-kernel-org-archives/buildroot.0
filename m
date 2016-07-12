From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 10:48:08 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: fix 0002 patch
Message-ID: <20160712084830.DAEE87FF29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0409d66d562bfcf0dd72738f351247160ec66a5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-fuse2fs-might-need-librt.patch introduced a new configure.ac
variable that should contain whether -lrt is needed to gt clock_gettime.

However, it forgot to propagate that variable into the Makefiles.

Because e2fprogs is not using automake (just autoconf), the configure
variables are not automatically propagated; it needs to be done
manually.

Fixes:
    http://autobuild.buildroot.org/results/edf/edf4195d33720d51031a84c3bdb6b6b0ed3b4731/
    http://autobuild.buildroot.org/results/987/987efb687870062c509361eaefd0ff80043392f8/
    http://autobuild.buildroot.org/results/f58/f58b5f8f5cd069b63aae4249bc7aefb145789b7d/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/0002-fuse2fs-might-need-librt.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch b/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
index 42a7fbd..fef3d20 100644
--- a/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
+++ b/package/e2fsprogs/0002-fuse2fs-might-need-librt.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] fuse2fs: might need librt
 It uses clock_gettime() which in older glibc versions is in librt.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[yann.morin.1998 at free.fr: properly expand it in the Makefile]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
 Patch status: sent to linux-ext4 ML
 
@@ -43,6 +45,19 @@ index 43e3c7e..070a6e3 100644
  
  journal.o: $(srcdir)/../debugfs/journal.c
  	$(E) "	CC $@"
+diff --git a/misc/Makefile.in b/misc/Makefile.in
+index 43e3c7e..070a6e3 100644
+--- a/misc/Makefile.in
++++ b/misc/Makefile.in
+@@ -32,6 +32,8 @@
+ 
+ @FUSE_CMT at FUSE_PROG= fuse2fs
+ 
++CLOCK_GETTIME_LIB = @CLOCK_GETTIME_LIB@
++
+ SPROGS=		mke2fs badblocks tune2fs dumpe2fs $(BLKID_PROG) logsave \
+ 			$(E2IMAGE_PROG) @FSCK_PROG@ e2undo
+ USPROGS=	mklost+found filefrag e2freefrag $(UUIDD_PROG) \
 -- 
 2.7.3
 
