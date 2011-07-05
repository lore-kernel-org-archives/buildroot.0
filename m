From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:16 +0200
Subject: [Buildroot] [PATCH 25/28] linux: allow specification of a custom
	Git repository as a source
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7eb9b16a239be6ecbe4962ca074b1b90dc2bf529.1309895466.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |   15 +++++++++++++++
 linux/linux.mk  |    3 +++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bdfa5b7..aa31f1f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -47,6 +47,12 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  This option allows to specify the http or ftp location of a
 	  specific kernel source tarball
 
+config BR2_LINUX_KERNEL_CUSTOM_GIT
+        bool "Custom Git tree"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a Git repository.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -58,12 +64,21 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
+        string "URL of custom Git repository"
+	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+
+config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
+        string "Custom Git version"
+	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "2.6.39.2" if BR2_LINUX_KERNEL_2_6_39
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 0012ca9..c1f7c48 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -10,6 +10,9 @@ ifeq ($(LINUX_VERSION),custom)
 LINUX_TARBALL := $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE    := $(dir $(LINUX_TARBALL))
 LINUX_SOURCE  := $(notdir $(LINUX_TARBALL))
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
+LINUX_SITE        := $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
+LINUX_SITE_METHOD := git
 else
 LINUX_SOURCE  := linux-$(LINUX_VERSION).tar.bz2
 LINUX_SITE    := $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
-- 
1.7.4.1
