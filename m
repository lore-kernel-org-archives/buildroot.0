From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 31 Jan 2013 17:00:13 +0100
Subject: [Buildroot] [PATCH] Linux: enable local Linux tarball in config
Message-ID: <1359648013-13494-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a local file is given as BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
buildroot ties to load it from the net and fails.

This patch adds a check and sets LINUX_SITE_METHOD to "file" in case
the named tarball is a local file.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 91a9f50..fe89357 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -10,6 +10,10 @@ LINUX_LICENSE_FILES = COPYING
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+# If the tarball happens to be a local file SITE_METHOD is set accordingly
+ifneq ($(wildcard $(LINUX_TARBALL)),)
+LINUX_SITE_METHOD = "file"
+endif
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
-- 
1.7.0.4
