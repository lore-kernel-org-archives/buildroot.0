From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 09:36:08 +0100
Subject: [Buildroot] [git commit] xfsprogs: add cross-compile fix patch
Message-ID: <20151216083612.0369C81F98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=792867f94ac00cb357ec1c15d667e63e865f6358
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't use CFLAGS (target) with BUILD_CC (host), fixes:
http://autobuild.buildroot.net/results/c94/c945bdb1427b55e03901027fa674b577e45963a1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...3-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
new file mode 100644
index 0000000..6617935
--- /dev/null
+++ b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
@@ -0,0 +1,40 @@
+From 5b3dd8eb1f7720c68dab032c3d89d4e3102d6347 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 15 Dec 2015 20:51:35 -0300
+Subject: [PATCH] xfsprogs: don't use CFLAGS with BUILD_CC
+
+When cross-compiling CFLAGS might not be suitable for the host
+(BUILD_CC) compiler since it might contain arch-specific options.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: reported http://oss.sgi.com/bugzilla/show_bug.cgi?id=1132
+
+ libxfs/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libxfs/Makefile b/libxfs/Makefile
+index ecf1921..3979077 100644
+--- a/libxfs/Makefile
++++ b/libxfs/Makefile
+@@ -111,7 +111,7 @@ default: crc32selftest ltdepend $(LTLIBRARY)
+ 
+ crc32table.h: gen_crc32table.c
+ 	@echo "    [CC]     gen_crc32table"
+-	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
++	$(Q) $(BUILD_CC) -o gen_crc32table $<
+ 	@echo "    [GENERATE] $@"
+ 	$(Q) ./gen_crc32table > crc32table.h
+ 
+@@ -122,7 +122,7 @@ crc32table.h: gen_crc32table.c
+ # disk.
+ crc32selftest: gen_crc32table.c crc32table.h crc32.c
+ 	@echo "    [TEST]    CRC32"
+-	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
++	$(Q) $(BUILD_CC) -D CRC32_SELFTEST=1 crc32.c -o $@
+ 	$(Q) ./$@
+ 
+ # set up include/xfs header directory
+-- 
+2.4.10
+
