From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun,  5 Apr 2015 17:15:05 -0500
Subject: [Buildroot] [PATCH v5 2/2] i2c-tools: add support to build python
	extension
In-Reply-To: <1428272105-27627-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428272105-27627-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1428272105-27627-2-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option to build the python bindings for i2c-tools -
py-smbus. The steps for building the python bindings is the same as
the distutil steps that are a part of the python infrastructure.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Baruch Siach <baruch@tkos.co.il>
CC: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v4 -> v5:
 - Actually send v4 change :)

Changes v3 -> v4:
 - Move define of BASE_ENV under BR2_PACKAGE_PYTHON (Yann)

Changes v2 -> v3:
 - Removed Config.in entry (suggested by Baruch)
 - Moved install and build defines with the CMD block (suggested
   by Yann)

Changes v1 -> v2:
 - Fixed spelling in config entry
 - Utilize the python infrastructure variables for environment and
   build/install opts (suggested by Thomas P)
 - Only support python2.7 since this is not compatabile with python3
   (suggested by Baruch)
---
 package/i2c-tools/i2c-tools.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 0115e22..6c156ca 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -10,8 +10,34 @@ I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
+# Build/install steps mirror the distutil python package type in the python package
+# infrastructure
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+I2C_TOOLS_DEPENDENCIES += python
+# BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
+I2C_TOOLS_PYTHON_BASE_ENV = \
+	$(PKG_PYTHON_DISTUTILS_ENV) \
+	CFLAGS="$(TARGET_CFLAGS) -I../include"
+
+define I2C_TOOLS_BUILD_PYSMBUS
+	(cd $(@D)/py-smbus;  \
+	$(I2C_TOOLS_PYTHON_BASE_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py build \
+		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
+endef
+
+define I2C_TOOLS_INSTALL_PYSMBUS
+	(cd $(@D)/py-smbus; \
+	$(I2C_TOOLS_PYTHON_BASE_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
+endef
+
+endif # BR2_PACKAGE_PYTHON
+
 define I2C_TOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(I2C_TOOLS_BUILD_PYSMBUS)
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
@@ -19,6 +45,7 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	do \
 		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
 	done
+	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
