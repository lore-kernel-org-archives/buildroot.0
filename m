From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 09:37:36 +0100
Subject: [Buildroot] [PATCH] Fix fallout after generated defconfig support
Message-ID: <1450859856-15891-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix improper use of qstrip; use correct variables.

Fixes #8546.

Reported-by: craigswank at gmail.com
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Thomas,

I did that patch in quite a rush this morning, but it's quite a
critical topic so I just send it as-is, after just a very brief
testing here. Please re-test it on your side. Thanks!

Yann.
---
 boot/at91bootstrap3/at91bootstrap3.mk | 2 +-
 boot/barebox/barebox.mk               | 2 +-
 linux/linux.mk                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 0f5d3bd..32732f4 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -57,7 +57,7 @@ ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
 # We must use the user-supplied kconfig value, because
 # AT91BOOTSTRAP3_KCONFIG_DEFCONFIG will at least contain
 # the trailing _defconfig
-ifeq ($(AT91BOOTSTRAP3_KCONFIG_DEFCONFIG),)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
 endif
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f36ca70..7715daf 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -112,7 +112,7 @@ ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
 # We must use the user-supplied kconfig value, because
 # BAREBOX_KCONFIG_DEFCONFIG will at least contain the
 # trailing _defconfig
-ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(BAREBOX_KCONFIG_DEFCONFIG)),)
+ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
 $(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index 06a27eb..69a09aa 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -405,7 +405,7 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 # We must use the user-supplied kconfig value, because
 # LINUX_KCONFIG_DEFCONFIG will at least contain the
 # trailing _defconfig
-ifeq ($(qstrip $(BR2_LINUX_KERNEL_DEFCONFIG)),)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
 $(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
 endif
 endif
-- 
1.9.1
