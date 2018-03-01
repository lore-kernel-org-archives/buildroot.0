From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  1 Mar 2018 21:54:29 +0100
Subject: [Buildroot] [PATCH] uboot: ensure host includes are searched before
 system default includes
Message-ID: <20180301205429.4191-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit baae5156ce37e (uboot: use local fdt headers) changed the uboot logic
to pass the host include directories with -idirafter instead of -I, so
include files local to u-boot would be preferred over host includes.

This unfortunately breaks configurations using
BR2_TARGET_UBOOT_NEEDS_OPENSSL on hosts with incompatible openssl headers
installed in the system default include directories as explained here:

http://lists.busybox.net/pipermail/buildroot/2018-March/214651.html

The problem is that -idirafter directories gets added to the very end of the
search order, AFTER the system default directories.

Instead use -isystem which causes the directories to be added after -I but
before the system default directories.  With this in place, the include
directories of u-boot will first be scanned, followed by the host includes
and finally the system default include directories.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c7cd739150..5da339850d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -131,7 +131,7 @@ endif
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH) \
-	HOSTCC="$(HOSTCC) $(subst -I/,-idirafter /,$(subst -I /,-idirafter /,$(HOST_CFLAGS)))" \
+	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
-- 
2.11.0
