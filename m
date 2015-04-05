From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun,  5 Apr 2015 14:48:46 -0500
Subject: [Buildroot] [PATCH v2 2/2] i2c-tools: add support to build python
	extension
In-Reply-To: <1428263326-10320-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428263326-10320-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1428263326-10320-2-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option to build the python bindings for i2c-tools -
py-smbus. The steps for building the python bindings is the same as
the distutil steps that are a part of the python infrastructure.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Tjeerd Pinkert <t.j.pinkert@vu.nl>
CC: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
 - Fixed spelling in config entry
 - Utilize the python infrastructure variables for environment and
   build/install opts (suggested by Thomas P)
 - Only support python2.7 since this is not compatabile with python3
   (suggested by Baruch)
---
 package/i2c-tools/Config.in    | 13 +++++++++++++
 package/i2c-tools/i2c-tools.mk | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index e83dbd6..6426f30 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -8,3 +8,16 @@ config BR2_PACKAGE_I2C_TOOLS
 	  EEPROM decoding scripts, and more.
 
 	  http://www.lm-sensors.org/wiki/I2CTools
+
+if BR2_PACKAGE_I2C_TOOLS
+
+config BR2_PACKAGE_I2C_TOOLS_PYSMBUS
+	bool "py-smbus"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python bindings to smbus from the i2c-tools package.
+
+comment "i2c-tools py-smbus depends on python2"
+	depends on !BR2_PACKAGE_PYTHON
+
+endif
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 0115e22..ec2995f 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -21,4 +21,31 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
+# BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
+I2C_TOOLS_PYTHON_BASE_ENV = \
+	$(PKG_PYTHON_DISTUTILS_ENV) \
+	CFLAGS="$(TARGET_CFLAGS) -I../include"
+
+# Build/install steps mirror the distutil python package type in the python package
+# infrastructure
+ifeq ($(BR2_PACKAGE_I2C_TOOLS_PYSMBUS),y)
+I2C_TOOLS_DEPENDENCIES += python
+
+define I2C_TOOLS_BUILD_PYSMBUS
+	(cd $(@D)/py-smbus;  \
+	$(I2C_TOOLS_PYTHON_BASE_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py build \
+		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
+endef
+I2C_TOOLS_POST_BUILD_HOOKS += I2C_TOOLS_BUILD_PYSMBUS
+
+define I2C_TOOLS_INSTALL_PYSMBUS
+	(cd $(@D)/py-smbus; \
+	$(I2C_TOOLS_PYTHON_BASE_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
+endef
+I2C_TOOLS_POST_INSTALL_TARGET_HOOKS += I2C_TOOLS_INSTALL_PYSMBUS
+endif
+
 $(eval $(generic-package))
-- 
1.9.1
