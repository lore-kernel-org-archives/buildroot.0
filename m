From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 17:49:05 +0200
Subject: [Buildroot] [git commit] syslinux: use the host compiler to build
 extlinux
Message-ID: <20180401154907.4AD8582DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcaed9ea7b030068d2a6126be9d3c63e84bc8bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like the utilities, it is meant to run on the host machine, hence must
be built using the host toolchain.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-extlinux-Use-the-host-toolchain-to-build.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch b/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch
new file mode 100644
index 0000000000..62675cf6cc
--- /dev/null
+++ b/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch
@@ -0,0 +1,53 @@
+From 4df2e7c0ae84bfbdba0ed285c0664aa089b38b7e Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sat, 30 Sep 2017 19:49:55 -0300
+Subject: [PATCH] extlinux: Use the host toolchain to build.
+
+It is meant to run on the host machine, hence must be built using the
+host toolchain.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ extlinux/Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/extlinux/Makefile b/extlinux/Makefile
+index 02d1db51..5c4baa5a 100644
+--- a/extlinux/Makefile
++++ b/extlinux/Makefile
+@@ -18,9 +18,9 @@ include $(MAKEDIR)/syslinux.mk
+ 
+ OPTFLAGS = -g -Os
+ INCLUDES = -I$(SRC) -I$(objdir) -I$(SRC)/../libinstaller
+-CFLAGS	 = $(GCCWARN) -Wno-sign-compare -D_FILE_OFFSET_BITS=64 \
++CFLAGS	 = $(CFLAGS_FOR_BUILD) $(GCCWARN) -Wno-sign-compare -D_FILE_OFFSET_BITS=64 \
+ 	   $(OPTFLAGS) $(INCLUDES)
+-LDFLAGS	 = 
++LDFLAGS	 = $(LDFLAGS_FOR_BUILD)
+ 
+ SRCS     = main.c \
+ 	   mountinfo.c \
+@@ -52,16 +52,16 @@ spotless: clean
+ installer: extlinux
+ 
+ extlinux: $(OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ strip:
+ 	$(STRIP) extlinux
+ 
+ %.o: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+ %.i: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
+ %.s: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
+ 
+ -include .*.d
+-- 
+2.13.5
+
