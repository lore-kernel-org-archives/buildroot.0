From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 12:13:21 +0200
Subject: [Buildroot] [PATCH] package: fix fallout from checking kconfig
	config files
Message-ID: <1436868801-14596-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those checks should only be dione when the package is actually enabled.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 2 +-
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d8c8bad..6b2abca 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -225,7 +225,7 @@ endef
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX)$(BR_BUILDING),yy)
 ifeq ($(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),)
 $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_CONFIG setting)
 endif
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3aceae3..9dfafad 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -476,7 +476,7 @@ endef
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_PACKAGE_UCLIBC)$(BR_BUILDING),yy)
 ifeq ($(call qstrip,$(BR2_UCLIBC_CONFIG)),)
 $(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG setting)
 endif
-- 
1.9.1
