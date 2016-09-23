From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 23 Sep 2016 16:06:44 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging dir
Message-ID: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

On debian (and maybe other distribs), there is a package named libi2c-dev
that install a useful header from i2c-tools (for the one wanting to write
I2C applications). See https://packages.debian.org/fr/wheezy/libi2c-dev.
Do the same in Buildroot. Note that "install" target in i2c-tools Makefile
would do the job, but BR installs i2c-tools's stuff manualy.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/i2c-tools/i2c-tools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index e16b940..5e095f3 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -8,6 +8,7 @@ I2C_TOOLS_VERSION = v3.1.2
 I2C_TOOLS_SITE = git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
+I2C_TOOLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
@@ -50,6 +51,10 @@ define I2C_TOOLS_BUILD_CMDS
 	$(I2C_TOOLS_BUILD_PYSMBUS)
 endef
 
+define I2C_TOOLS_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 644 -D $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux
+endef
+
 define I2C_TOOLS_INSTALL_TARGET_CMDS
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-- 
2.1.4
