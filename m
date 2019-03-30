From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Mar 2019 15:43:40 +0100
Subject: [Buildroot] [git commit] package/uboot-tools: fix build on hosts
 with old compilers
Message-ID: <20190330144030.E0881884A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f27b9667b5e3b7b758d46804e4aa9a221cafd34e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot tools code uses some C99 constructs, but old compilers such
as gcc 4.7 don't default to -std=c99. This commit adds a patch,
submitted upstream, that makes sure host tools are built with
-std=gnu99 (because the U-Boot code uses GNU extensions).

Fixes:

  http://autobuild.buildroot.net/results/5cc55f5eabd5005e071ad4eabab8202604ac7b66/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Makefile-build-host-tools-with-std-gnu99.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch b/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
new file mode 100644
index 0000000000..60ad37d2f8
--- /dev/null
+++ b/package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
@@ -0,0 +1,42 @@
+From aaabed350ec51f7bb9a07290ffb3ce6e794c8f22 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 19 Mar 2019 23:01:50 +0100
+Subject: [PATCH] tools/Makefile: build host tools with -std=gnu99
+
+Parts of the code are using C99 constructs (such as variables declared
+inside loops), but also GNU extensions (such as typeof), so using
+-std=gnu99 is necessary to build with older versions of gcc that don't
+default to building with gnu99.
+
+It fixes the following build failure:
+
+./tools/../lib/crc16.c: In function "crc16_ccitt":
+./tools/../lib/crc16.c:70:2: error: "for" loop initial declarations are only allowed in C99 mode
+  for (int i = 0;  i < len;  i++)
+  ^
+./tools/../lib/crc16.c:70:2: note: use option -std=c99 or -std=gnu99 to compile your code
+
+when building the host tools with gcc 4.7.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 081383d7a7..d377d85f74 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -254,7 +254,8 @@ HOST_EXTRACFLAGS += -include $(srctree)/include/compiler.h \
+ 		-I$(srctree)/tools \
+ 		-DUSE_HOSTCC \
+ 		-D__KERNEL_STRICT_NAMES \
+-		-D_GNU_SOURCE
++		-D_GNU_SOURCE \
++		-std=gnu99
+ 
+ __build:	$(LOGO-y)
+ 
+-- 
+2.20.1
+
