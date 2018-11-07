From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 7 Nov 2018 10:06:23 +0000
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of kernel
 code
Message-ID: <20181107100605.13141-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rafal Fabich <rafal.fabich@gmail.com>

This patch is a resubmit of commit 73da2ff6f718f2889e3c5024d899f8d58f502863,
which was reverted by commit e782cd5b1bc231dda527d5d0a04e6a338669b92c in 2016.

This is the original commit message:
   Add the option to use a local directory as the source for
   building the Linux kernel, which can be useful during
   kernel development.

As for the arguments used in the commit message when the patch was reverted:
* Using _OVERRIDE_SRCDIR is not a good solution since it forces some content in
local.mk, which should stay a mechanism local to the developer's workspace.
* Without this patch, the linux kernel has no equivalent to the
FOO_SITE_METHOD = local variable which is available for almost all the other
packages.
* When using packages with _SITE_METHOD = local, an external tool is used to
retrieve the packages' sources, like a sub-repository mechanism or google repo.
This tool has the responsibility of the build reproductibility in regard of
these packages.
It is the same for a linux kernel using the local method.

Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

# Conflicts:
#	linux/Config.in

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 linux/Config.in | 13 +++++++++++++
 linux/linux.mk  |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index ecb12d0b16..e6c5c561b9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -91,6 +91,12 @@ config BR2_LINUX_KERNEL_CUSTOM_SVN
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Subversion repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	bool "Local directory"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a local directory.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -118,6 +124,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the Linux kernel source code.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION
@@ -127,6 +139,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 476ff16329..c47c792926 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -20,6 +20,9 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
+LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
-- 
2.11.0
