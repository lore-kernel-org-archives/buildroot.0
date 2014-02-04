From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 11:01:46 +0100
Subject: [Buildroot] [git commit] Added local directory as source of kernel
	code
Message-ID: <20140204101606.B3EFE9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73da2ff6f718f2889e3c5024d899f8d58f502863
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the option to use a local directory as the source for
building the Linux kernel, which can be useful during
kernel development.

Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |   13 +++++++++++++
 linux/linux.mk  |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 91d4d71..0fdc194 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -63,6 +63,12 @@ config BR2_LINUX_KERNEL_CUSTOM_HG
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Mercurial repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	bool "Local directory"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a local directory.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -90,6 +96,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the Linux kernel source code.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.13.1" if BR2_LINUX_KERNEL_LATEST_VERSION
@@ -99,6 +111,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 62033d2..1a81f77 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -9,10 +9,13 @@ LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
-ifeq ($(LINUX_VERSION),custom)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
+LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
