From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 10:55:54 +0200
Subject: [Buildroot] [PATCH] linux custom tarball: automatically detect a
 change in tarball configuration
Message-ID: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When you specify a LINUX_TARBALL, the variable LINUX_VERSION will be set to
the fixed "custom". As a result, LINUX_DIR remains the same even though you
modified the .config file to specify a different tarball.  When re-running
make, buildroot does not see the change because the stamp files still look
up-to-date, and you'll have to force building the new kernel in some way.

This patch overwrites LINUX_VERSION to include the LINUX_TARBALL string, If a
new custom tarball is configured, LINUX_DIR will be different, the old stamp
files will not matter, and buildroot will correctly start the build process for
the new kernel.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---

 linux/linux.mk |  4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -10,6 +10,10 @@
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(dir $(LINUX_TARBALL))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+# Overwrite LINUX_VERSION so that LINUX_DIR becomes unique, in which case a
+# change in the LINUX_TARBALL configuration automatically gets picked up.
+LINUX_VERSION = custom-$(LINUX_TARBALL)
+
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
