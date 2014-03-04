From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:14:26 +0100
Subject: [Buildroot] [git commit] Revert "i2c-tools: Add i2c-dev.h to
	staging directory for userspace i2c drivers."
Message-ID: <20140304181827.0A12B9BD2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41711cfdeda6f5fd9b2531f538f3643854d7d3ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ff673f9a22b1467878f1a117f2c6198e9683d5c7, as the
modified i2c-dev.h from i2c-tools has some definitions that conflict
with the i2c.h from the kernel headers. This means that a userspace
program or library that includes both will fail to build, as is the
case with libsoc.

Fixes:

  http://autobuild.buildroot.org/results/1f4/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 450dba7..c6a967d 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -9,7 +9,6 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
-I2C_TOOLS_INSTALL_STAGING = YES
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -22,8 +21,4 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define I2C_TOOLS_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
-endef
-
 $(eval $(generic-package))
