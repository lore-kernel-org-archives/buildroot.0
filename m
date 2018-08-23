From: Brad Love <brad@nextdimension.cc>
Date: Thu, 23 Aug 2018 14:56:27 -0500
Subject: [Buildroot] [PATCH 2/2] i2c-tools: install library and header to
 staging
In-Reply-To: <1535054187-6055-1-git-send-email-brad@nextdimension.cc>
References: <1535054187-6055-1-git-send-email-brad@nextdimension.cc>
Message-ID: <1535054187-6055-3-git-send-email-brad@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the dynamic/static library of i2c-tools is enabled it is installed
to the target destination. However, in order for external packages to
link against it, it must also be installed to staging.

Here, the flag is set to install the package to staging. The
INSTALL_STAGING command is included to only install the library
and header file in order to utilize libi2c externally. The make
targets are used for the installation to accomodate whether static
or dynamic library was selected during configuration.


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 package/i2c-tools/i2c-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index a346698..c571056 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -10,6 +10,7 @@ I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (library)
 I2C_TOOLS_LICENSE_FILES = COPYING
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
+I2C_TOOLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
@@ -62,4 +63,11 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
+define I2C_TOOLS_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install-lib
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install-include
+endef
+
 $(eval $(generic-package))
-- 
2.7.4
