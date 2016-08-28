From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Aug 2016 23:55:30 +0200
Subject: [Buildroot] [git commit branch/next] Revert "Added local directory
	as source of kernel code"
Message-ID: <20160828215613.78C3581992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e782cd5b1bc231dda527d5d0a04e6a338669b92c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 73da2ff6f718f2889e3c5024d899f8d58f502863.

The reason for adding support for a local location was to be able to do
development on the Linux kernel source tree on a local directory rather
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

We only handle the boolean option in legacy, as there is nothing we can
do with the directory path.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Rafal Fabich <rafal.fabich@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 12 ++++++++++++
 linux/Config.in  | 13 -------------
 linux/linux.mk   |  3 ---
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 746b80a..59e3f84 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,18 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2016.11"
+
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	bool "Linux kernel local directory option removed"
+	help
+	  The option to select a local directory as the source of the Linux
+	  kernel has been removed. It hurts reproducibility of builds.
+
+	  In case you were using this option during development of your
+	  Linux kernel, use the override mechanism instead.
+
+###############################################################################
 comment "Legacy options removed in 2016.08"
 
 config BR2_PACKAGE_SYSTEMD_COMPAT
diff --git a/linux/Config.in b/linux/Config.in
index e02d138..ebcafcc 100644
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
 	default "4.7" if BR2_LINUX_KERNEL_LATEST_VERSION
@@ -116,7 +104,6 @@ config BR2_LINUX_KERNEL_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
-	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index fb844ef..6e41a92 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -21,9 +21,6 @@ LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
-LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
-LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
