From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:58:24 +0200
Subject: [Buildroot] [git commit] i2c-tools: install library and header to
 staging
Message-ID: <20180907111604.484517FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3991499b3f9f4e9263866a31dba7f95d423e0d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the dynamic/static library of i2c-tools is enabled it is installed
to the target destination. However, in order for external packages to
link against it, it must also be installed to staging.

Here, the flag is set to install the package to staging. The
INSTALL_STAGING command is included to complete the operation.

Signed-off-by: Brad Love <brad@nextdimension.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2c-tools/i2c-tools.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index ec06c73325..11d0cf9808 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -10,6 +10,7 @@ I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
 I2C_TOOLS_LICENSE_FILES = COPYING COPYING.LGPL README
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
+I2C_TOOLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
@@ -62,4 +63,9 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
+define I2C_TOOLS_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
+endef
+
 $(eval $(generic-package))
