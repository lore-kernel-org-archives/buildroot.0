From: Denis THULIN <denis.thulin@openwide.fr>
Date: Tue,  4 Aug 2015 14:27:07 +0200
Subject: [Buildroot] [PATCH 2/2] i2c-tools: Adds check of i2c kernel option
In-Reply-To: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
References: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1438691227-23379-3-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package will now check if i2c is enabled whithin the kernel before
the configure step. If not, build of the package will fail.
Also adds linux as a dependancy of i2c-tools to make sure that the kernel
config is created before checking one of its options.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/i2c-tools/i2c-tools.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 187bd09..7eb4fbb 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -10,6 +10,20 @@ I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
+I2C_TOOLS_DEPENDENCIES += linux
+define I2C_TOOLS_KERNEL_OPTION_MISSING
+	echo '$(LINUX_KCONFIG_CONFIG_DEFCONFIG_LIST)'
+	@if [ -z $(LINUX_KCONFIG_CONFIG_I2C) ]; then \
+		echo ERROR: CONFIG_I2C is not selected in the kernel; \
+		exit 1; \
+	elif [ $(LINUX_KCONFIG_CONFIG_I2C) != y -a $(LINUX_KCONFIG_CONFIG_I2C) != m ]; then \
+		echo ERROR: CONFIG_I2C is not selected in the kernel; \
+		exit 1; \
+	fi
+endef
+I2C_TOOLS_PRE_CONFIGURE_HOOKS += I2C_TOOLS_KERNEL_OPTION_MISSING
+
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
 endif
-- 
2.5.0
