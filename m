From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 07 Oct 2011 17:30:56 +0200
Subject: [Buildroot] [PATCH v2] linux custom tarball: automatically detect a
 change in tarball configuration
Message-ID: <cd50c0fad39099b28f3a.1318001456@localhost6.localdomain6>
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

Although the resulting linux directory name in output/build will look strange, I
think that developers using the 'custom tarball' option will not mind given the
benefits of it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---

v2: take into account that LINUX_TARBALL may be an URL (thanks to Daniel Nystr?m
for the URL transformation suggestion).

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
+LINUX_VERSION = custom-$(subst /,_,$(lastword $(subst ://, ,$(LINUX_TARBALL))))
+
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
