From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Mon, 12 Dec 2016 12:27:37 +0100
Subject: [Buildroot] [PATCH] linux: Setting a repo_version is mandatory for
	custom repositories
In-Reply-To: <1481542057-19945-1-git-send-email-christian.kellermann@solectrix.de>
References: <58df8b4b-2d61-b93d-c96b-69ac9a4c084c@mind.be>
 <1481542057-19945-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <1481542057-19945-2-git-send-email-christian.kellermann@solectrix.de>
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
 linux/linux.mk                         | 12 ++++++++++++
 package/linux-headers/linux-headers.mk | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e826cc..2460ebd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -35,6 +35,18 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
+
+# When a custom repository has been set, check for the repository version
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION)),)
+$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
+endif
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
+$(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
+endif
+
+endif
+
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..b79ae29 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -51,6 +51,17 @@ LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)/testing
 endif # -rc
 endif
 
+# When a custom repository has been set, check for the repository version
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION)),)
+$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
+endif
+ifeq ($(call qstrip,$(LINUX_HEADERS_SITE)),)
+$(error No header site URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
+endif
+endif
+
+
 LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 # We rely on the generic package infrastructure to download and apply
-- 
2.1.4
