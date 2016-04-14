From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 14 Apr 2016 16:32:01 +0200
Subject: [Buildroot] [PATCH] [RFC] U-Boot: don't check hashes for U-Boot
	external patches
Message-ID: <1460644321-13849-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

BR2_TARGET_UBOOT_PATCH allows user to give URL of patches on the Web, but in
that case BR dl infra tries to compare hashes of the downloaded patches with the
infos from boot/uboot/uboot.hash.
So, for that case (user specified patches), tell BR not to check hashes.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 48f40c3..9e24b48 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -109,6 +109,8 @@ UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 # directories or files.
 UBOOT_PATCHES = $(call qstrip,$(BR2_TARGET_UBOOT_PATCH))
 UBOOT_PATCH = $(filter ftp://% http://% https://%,$(UBOOT_PATCHES))
+UBOOT_PATCHES_NAME = $(notdir $(UBOOT_PATCHES))
+BR_NO_CHECK_HASH_FOR += $(UBOOT_PATCHES_NAME)
 
 define UBOOT_APPLY_LOCAL_PATCHES
 	for p in $(filter-out ftp://% http://% https://%,$(UBOOT_PATCHES)) ; do \
-- 
2.1.4
