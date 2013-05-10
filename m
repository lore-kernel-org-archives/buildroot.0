From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 10 May 2013 10:51:48 +0200
Subject: [Buildroot] [PATCH] linux.mk: change linux tarball compression to xz
Message-ID: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After selecting BR2_LINUX_KERNEL or BR2_LINUX_KERNEL_CUSTOM_VERSION 
configuration item, if any of linux tarball linux-$(LINUX_VERSION).tar.xx
in local download tarball directory $(BR2_DL_DIR) exists, it used should be,
otherwise *we* set the compression of linux tarball to download to xz.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 linux/linux.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8a73767..fba9d44 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -3,6 +3,7 @@
 # Linux kernel target
 #
 ###############################################################################
+
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
@@ -15,8 +16,15 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
-else
+# If any of linux tarball locally exists it used should be
+else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.xz),)
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
+else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.bz2),)
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
+else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.gz),)
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.gz
+else
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
-- 
1.7.9.5
