From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 23:50:58 +0100
Subject: [Buildroot] [git commit] uboot-tools: backport patch fixing build
 failure with libfdt-devel installed
Message-ID: <20180310225130.A939182AE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cbfc94c5a0ac4120925aa8c7337eb7957dc4678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot host programs fail to build when libfdt-devel is installed
system-wide, with errors like this:

      HOSTCC  tools/aisimage.o
    In file included from tools/../include/../lib/libfdt/libfdt.h:10:0,
                     from tools/../include/libfdt.h:1,
                     from tools/fdt_host.h:11,
                     from tools/imagetool.h:24,
                     from tools/aisimage.c:8:
    /usr/include/libfdt_env.h:70:30: error: conflicting types for ???fdt64_t???
     typedef uint64_t FDT_BITWISE fdt64_t;
                                  ^~~~~~~
    In file included from <command-line>:0:0:
    ././include/libfdt_env.h:19:16: note: previous declaration of ???fdt64_t??? was here
     typedef __be64 fdt64_t;
                    ^~~~~~~
    In file included from ././include/libfdt_env.h:12:0,
                     from <command-line>:0:
    /usr/include/libfdt_env.h:90:24: error: expected ???)??? before ???x???
     static inline uint32_t fdt32_to_cpu(fdt32_t x)
                            ^
This commit backports an upstream patch that fixes this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...de-U-Boot-libfdt-headers-from-their-actua.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch b/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch
new file mode 100644
index 0000000000..9f18342868
--- /dev/null
+++ b/package/uboot-tools/0004-tools-Include-U-Boot-libfdt-headers-from-their-actua.patch
@@ -0,0 +1,33 @@
+From e0d20dc1521e74b82dbd69be53a048847798a90a Mon Sep 17 00:00:00 2001
+From: Paul Kocialkowski <contact@paulk.fr>
+Date: Fri, 2 Mar 2018 23:13:42 +0100
+Subject: [PATCH] tools: Include U-Boot libfdt headers from their actual path
+
+There are no headers for libfdt in lib/libfdt, as they are instead
+located in scripts/dtc/libfdt. Specifying lib/libfdt for headers
+inclusion in host tools results in using the system libfdt headers,
+which is not what we want. Change this to the proper path.
+
+Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
+[Backport from upstream commit e0d20dc1521e74b82dbd69be53a048847798a90a]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index d3387fad69..f38f68ee47 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -244,7 +244,7 @@ endif # !LOGO_BMP
+ #
+ HOST_EXTRACFLAGS += -include $(srctree)/include/compiler.h \
+ 		$(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
+-		-I$(srctree)/lib/libfdt \
++		-I$(srctree)/scripts/dtc/libfdt \
+ 		-I$(srctree)/tools \
+ 		-DUSE_HOSTCC \
+ 		-D__KERNEL_STRICT_NAMES \
+-- 
+2.14.3
+
