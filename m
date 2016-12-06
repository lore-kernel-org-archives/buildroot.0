From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Tue,  6 Dec 2016 09:13:22 +0100
Subject: [Buildroot] [PATCH 1/1] linux: Setting a repo_version is mandatory
	for custom repositories
Message-ID: <1481012002-30425-1-git-send-email-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If not set the system will use an empty string which will result in
download errors for 'linux-.tar.gz' packages.

This patch makes it obvious to the user that the variable needs to be
set.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
---
 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e826cc..f8a2cd9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -35,6 +35,14 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
+
+# When a custom repository has been set, check for the repository version
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION),)
+$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
+endif
+endif
+
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
-- 
2.1.4
