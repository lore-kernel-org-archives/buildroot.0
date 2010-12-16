From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 16 Dec 2010 17:49:52 +0800
Subject: [Buildroot] [PATCH v2] buildroot:linux: Add options to checkout
	Linux kernel source from SVN or GIT repository.
In-Reply-To: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1292492992-15797-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current buildroot Config.in and linux.mk don't support kernel source in SVN
or GIT repository. A pre-checkouted local SVN or GIT kernel tree set in
KERNEL_CUSTOM_TREE is the only option. Because the local path can be anywhere,
no buildroot default config file can be defined in sub folder
target/device/company/boards to run quick building. It is inconvient to run
regression testing. Since buildroot has already support SVN and GIT repository
for application packages, it is reasonable to have it for linux kernel as well.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 linux/Config.in |   19 ++++++++++++++++++-
 linux/linux.mk  |   31 ++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 480adca..07b08e2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -52,6 +52,10 @@ config BR2_LINUX_KERNEL_CUSTOM_TREE
 	help
 	  This option allows use of an already unpacked linux tree.
 
+config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
+	bool "Custom source repository"
+	help
+	  This option allows to specify the svn or git repository.
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -67,12 +71,25 @@ config BR2_LINUX_KERNEL_CUSTOM_PATH
 	string "PATH of custom kernel tree"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TREE
 
+config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_LOCATION
+	string "URL of custom kernel repository"
+	depends on BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
+	help
+	  This is either the clone URL of GIT or trunk/tag/branch URL of SVN. 
+
+config BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION
+	string "revision(svn/git), tag(git) or branch(git) of custom kernel source"
+	depends on BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
+	default "HEAD"
+	help
+	  Tag or branch of GIT repository should be filled in here.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "2.6.36" if BR2_LINUX_KERNEL_2_6_36
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE || BR2_LINUX_KERNEL_CUSTOM_REPOSITORY
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 4b680fd..a6306c9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -7,11 +7,32 @@ LINUX26_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 # Compute LINUX26_SOURCE and LINUX26_SITE from the configuration
 ifeq ($(LINUX26_VERSION),custom)
+
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY),y)
+LINUX26_SITE:=$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_LOCATION))
+LINUX26_DL_VERSION:=$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION))
+
+ifeq ($(findstring svn://,$(LINUX26_SITE)),svn://)
+LINUX26_SITE_METHOD:=svn
+LINUX26_DL_DIR:=linux-$(notdir $(LINUX26_SITE))
+else
+LINUX26_SITE_METHOD:=git
+LINUX26_DL_DIR:=linux-$(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_REPOSITORY_VERSION))
+LINUX26_BRANCH:=$(LINUX26_DL_VERSION)
+endif
+
+LINUX26_BASE_NAME:=$(LINUX26_DL_DIR)
+LINUX26_SOURCE:=$(LINUX26_DL_DIR).tar.gz
+else
+
 ifneq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
 LINUX26_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX26_SITE:=$(dir $(LINUX26_TARBALL))
-LINUX26_SOURCE:=$(notdir $(LINUX26_TARBALL))
+LINUX26_SOURCE:=linux-$(notdir $(LINUX26_TARBALL))
+endif
+
 endif
+
 else
 LINUX26_SOURCE:=linux-$(LINUX26_VERSION).tar.bz2
 LINUX26_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
@@ -155,6 +176,14 @@ $(LINUX26_BUILD_DIR)/.stamp_installed: $(LINUX26_BUILD_DIR)/.stamp_compiled
 	fi
 	$(Q)touch $@
 
+
+$(LINUX26_BUILD_DIR)/.stamp_downloaded: PKG=LINUX26
+$(LINUX26_BUILD_DIR)/.stamp_extracted: PKG=LINUX26
+$(LINUX26_BUILD_DIR)/.stamp_patched: PKG=LINUX26
+$(LINUX26_BUILD_DIR)/.stamp_configured: PKG=LINUX26
+$(LINUX26_BUILD_DIR)/.stamp_compiled: PKG=LINUX26
+$(LINUX26_BUILD_DIR)/.stamp_installed: PKG=LINUX26
+
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_BUILD_DIR)/.stamp_installed
 
 linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_BUILD_DIR)/.stamp_configured
-- 
1.6.0
