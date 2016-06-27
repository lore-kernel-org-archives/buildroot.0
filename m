From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jun 2016 00:34:04 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source of
	kernel code"
Message-ID: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 73da2ff6f718f2889e3c5024d899f8d58f502863.

The reason for adding support for a local location was to be able to do
development on the Linux kernel source tree on a local direrctory rather
than have to clone it for every build.

We already have a mechanism for that, it's called override-srcdir. It's
been available since September 2011, more than a year before this patch
was committed.

Otherwise, we're going to be adding support for local sources in other
packages. First was U-Boot as submitted by Adam. But what next? We can't
have such support for all packages, especially since override-srcdir
does the job.

Besides, using a local source tree makes the build non-reproducible, so
we don't really want to have this in a .config (or defconfig).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Rafal Fabich <rafal.fabich@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adam Duskett <aduskett@gmail.com>

---
Rafal, if your use-case was just to use a local tree for development
purposes, please see to using the override-srcdir mechanism instead.
If you had another use-case that requires using a local source tree,
could you explain it, please? Thanks!
---
 linux/Config.in | 13 -------------
 linux/linux.mk  |  5 +----
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a4ff8bc..a06fed2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -69,12 +69,6 @@ config BR2_LINUX_KERNEL_CUSTOM_SVN
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Subversion repository.
 
-config BR2_LINUX_KERNEL_CUSTOM_LOCAL
-	bool "Local directory"
-	help
-	  This option allows Buildroot to get the Linux kernel source
-	  code from a local directory.
-
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -102,12 +96,6 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
-config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
-	string "Path to the local directory"
-	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
-	help
-	  Path to the local directory with the Linux kernel source code.
-
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
@@ -116,7 +104,6 @@ config BR2_LINUX_KERNEL_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
-	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index fb844ef..19a3a6d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -16,14 +16,11 @@ define LINUX_HELP_CMDS
 endef
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
-ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
+ifeq ($(LINUX_VERSION),custom)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
-LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
-LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
-- 
2.7.4
