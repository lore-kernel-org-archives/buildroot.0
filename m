From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 13 Mar 2013 09:28:17 -0300
Subject: [Buildroot] [PATCH] fs/common.mk: Strip extra whitespace when
	device table is empty
In-Reply-To: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <1363177697-31728-2-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since ROOTFS_DEVICE_TABLES it is a concatenation of two strings
separated by spaces, there will always be a space on it, which means
it's never empty. Therefore, when testing for empty, the condition
never evaluate to false.

The following change fixes this problem; it runs the qstrip on
the overall combination of the variables, causing the space to be
removed if it's the only thing left.

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
---
 fs/common.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..a0b7b39 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -33,8 +33,8 @@
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
-	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
+       $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
-- 
1.7.8.6
