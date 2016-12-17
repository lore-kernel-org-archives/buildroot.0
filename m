From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:55:32 +0100
Subject: [Buildroot] [git commit] linux: check that a repo and version is
	defined when using a custom repo
Message-ID: <20161217145601.D8A5581839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93f31b20da05a9d7a99c47a8a3dfe1a6f4ffe203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If not set the system will use an empty string which will result in
download errors for 'linux-.tar.gz' packages.

This patch makes it obvious to the user that the variable needs to be
set.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e75dcaa..7f4432e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -428,6 +428,17 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
 # Checks to give errors that the user can understand
+
+# When a custom repository has been set, check for the repository version
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION)),)
+$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
+endif
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
+$(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
+endif
+endif
+
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
