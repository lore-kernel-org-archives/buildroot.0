From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:32:02 +0200
Subject: [Buildroot] [git commit] syslinux: add patches to build with the
	latest gnu-efi release
Message-ID: <20170611133214.D4DAA8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cd762de56345f2798e208926dca7dd52c97e1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...definition-is-now-part-of-the-exports-of-.patch | 37 ++++++++++++++++++++++
 ..._BASE_CODE-struct-has-been-renamed-to-EFI.patch | 30 ++++++++++++++++++
 ...longjump-calls-to-fit-the-new-declaration.patch | 37 ++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch b/boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
new file mode 100644
index 0000000..c376010
--- /dev/null
+++ b/boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
@@ -0,0 +1,37 @@
+From 39274503292a6003b1b0c93f694e34f11e85ea44 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Fri, 9 Jun 2017 11:55:14 +0200
+Subject: [PATCH] The VPrint definition is now part of the exports of
+ gnu-efi
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ efi/fio.h | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/efi/fio.h b/efi/fio.h
+index 65fff8d..a1bfe68 100644
+--- a/efi/fio.h
++++ b/efi/fio.h
+@@ -11,15 +11,6 @@
+ #define MAX_EFI_ARGS		64
+ #define WS(c16)         (c16 == L' ' || c16 == CHAR_TAB)
+ 
+-/* VPrint is not in export declarations in gnu-efi lib yet
+- * although it is a global function; declare it here
+- */
+-extern UINTN
+-VPrint (
+-    IN CHAR16   *fmt,
+-    va_list     args
+-    );
+-
+ extern EFI_STATUS efi_errno;
+ 
+ void efi_memcpy(unsigned char *dst, unsigned char *src, size_t len);
+-- 
+2.1.4
+
diff --git a/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch b/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch
new file mode 100644
index 0000000..c5ed38a
--- /dev/null
+++ b/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch
@@ -0,0 +1,30 @@
+From 6e25d11a062ef49c8add24476cf1bb74aa67e906 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Fri, 9 Jun 2017 11:56:27 +0200
+Subject: [PATCH] The EFI_PXE_BASE_CODE struct has been renamed to
+ EFI_PXE_BASE_CODE_PROTOCOL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ efi/pxe.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/efi/pxe.c b/efi/pxe.c
+index 6e59109..8060dff 100644
+--- a/efi/pxe.c
++++ b/efi/pxe.c
+@@ -90,7 +90,7 @@ struct embedded_dhcp_options embedded_dhcp_options =
+ void net_parse_dhcp(void)
+ {
+     EFI_PXE_BASE_CODE_MODE *mode;
+-    EFI_PXE_BASE_CODE *bc;
++    EFI_PXE_BASE_CODE_PROTOCOL *bc;
+     unsigned int pkt_len = sizeof(EFI_PXE_BASE_CODE_PACKET);
+     EFI_STATUS status;
+     uint8_t hardlen;
+-- 
+2.1.4
+
diff --git a/boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch b/boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch
new file mode 100644
index 0000000..cb36998
--- /dev/null
+++ b/boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch
@@ -0,0 +1,37 @@
+From db49dbac8a0c563fb6d07c348873e8ae50fee2a6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Fri, 9 Jun 2017 11:59:43 +0200
+Subject: [PATCH] Update the longjump calls to fit the new declaration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ efi/main.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/efi/main.c b/efi/main.c
+index fd95f5c..b5383cd 100644
+--- a/efi/main.c
++++ b/efi/main.c
+@@ -10,7 +10,6 @@
+ #include <syslinux/firmware.h>
+ #include <syslinux/linux.h>
+ #include <sys/ansi.h>
+-#include <setjmp.h>
+ 
+ #include "efi.h"
+ #include "fio.h"
+@@ -31,7 +30,7 @@ uint32_t timer_irq;
+ __export uint8_t KbdMap[256];
+ char aux_seg[256];
+ 
+-static jmp_buf load_error_buf;
++static jmp_buf *load_error_buf;
+ 
+ EFI_HANDLE image_handle, image_device_handle, mnpsb_handle;
+ 
+-- 
+2.1.4
+
