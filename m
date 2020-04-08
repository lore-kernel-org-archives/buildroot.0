From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:23:39 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] boot/syslinux: fix build
 of efi part with gnu-efi 3.0.10
Message-ID: <20200408141053.91CD48DFAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce862d0f14ec641abc1cfdd05fe2fd5f17205824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The following defconfig:

BR2_x86_i686=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_EFI=y

fails to build due to missing setjmp/longjmp definitions, which is a
consequence of a change introduced between gnu-efi 3.0.9 and 3.0.10.

This build failure is fixed by adding another syslinux paytch, which
has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d5da6d9169dfcd6154357ab6bdecb36b5d413c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0015-efi-main.c-include-efisetjmp.h.patch      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
new file mode 100644
index 0000000000..2fd61ecbc8
--- /dev/null
+++ b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
@@ -0,0 +1,60 @@
+From 7d68fa68cd9f2987bd85339f3391913a8b0e58c7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 24 Mar 2020 10:21:27 +0100
+Subject: [PATCH] efi/main.c: include <efisetjmp.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building syslinux against gnu-efi 3.0.10 currently fails with:
+
+syslinux/efi/main.c:33:8: error: unknown type name ???jmp_buf???
+   33 | static jmp_buf load_error_buf;
+      |        ^~~~~~~
+syslinux/efi/main.c: In function ???local_boot???:
+syslinux/efi/main.c:189:5: warning: implicit declaration of function ???longjmp??? [-Wimplicit-function-declaration]
+  189 |     longjmp(&load_error_buf, 1);
+      |     ^~~~~~~
+syslinux/efi/main.c: In function ???build_gdt???:
+syslinux/efi/main.c:907:75: warning: taking address of packed member of ???struct dt_desc??? may result in an unaligned pointer value [-Waddress-of-packed-member]
+  907 |  status = emalloc(gdt.limit, __SIZEOF_POINTER__ , (EFI_PHYSICAL_ADDRESS *)&gdt.base);
+      |                                                                           ^~~~~~~~~
+syslinux/efi/main.c: In function ???efi_main???:
+syslinux/efi/main.c:1390:7: warning: implicit declaration of function ???setjmp??? [-Wimplicit-function-declaration]
+ 1390 |  if (!setjmp(&load_error_buf))
+      |       ^~~~~~
+make[3]: *** [syslinux/mk/efi.mk:63: main.o] Error 1
+
+This is due to gnu-efi commit 486ba3c3bdd147b7d98159b9e650be60bce0f027
+("Do not include efisetjmp.h on efi.h"), in which they state:
+
+    Do not include efisetjmp.h on efi.h
+
+    People than really want to use efisetjmp implementation can include
+    the header on their own.
+
+    Signed-off-by: leo <leo.sartre@geebol.fr>
+
+So we act as specified, and include <efisetjmp.h> from efi/main.c.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://www.syslinux.org/archives/2020-March/026621.html
+---
+ efi/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/efi/main.c b/efi/main.c
+index 6a748412..e924cfb1 100644
+--- a/efi/main.c
++++ b/efi/main.c
+@@ -12,6 +12,7 @@
+ #include <sys/ansi.h>
+ 
+ #include "efi.h"
++#include <efisetjmp.h>
+ #include "fio.h"
+ #include "version.h"
+ #include "efi_pxe.h"
+-- 
+2.25.1
+
