From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:01:49 +0200
Subject: [Buildroot] [git commit] i2c-tools: add support to build python
	extension
Message-ID: <20150406090221.061A28175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea8edb95144456529ad3047bce86b7449438ca42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to build the python bindings for i2c-tools -
py-smbus. The steps for building the python bindings is the same as
the distutil steps that are a part of the python infrastructure.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Baruch Siach <baruch@tkos.co.il>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.mk |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

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
