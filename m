From: Paul Cercueil <paul.cercueil@analog.com>
Date: Thu, 18 Sep 2014 11:44:27 +0200
Subject: [Buildroot] [PATCH v2] libiio: new package
Message-ID: <1411033467-7919-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libiio is a library to ease the development of software interfacing
Linux Industrial I/O (IIO) devices.

http://wiki.analog.com/resources/tools-software/linux-software/libiio

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/Config.in        |  1 +
 package/libiio/Config.in | 42 ++++++++++++++++++++++++++
 package/libiio/libiio.mk | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 package/libiio/Config.in
 create mode 100644 package/libiio/libiio.mk

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..487b948 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libhid/Config.in"
+	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
new file mode 100644
index 0000000..b1f1e4c
--- /dev/null
+++ b/package/libiio/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_LIBIIO
+	bool "libiio"
+	help
+	  Libiio is a library to ease the development of software interfacing
+	  Linux Industrial I/O (IIO) devices.
+
+	  http://wiki.analog.com/resources/tools-software/linux-software/libiio
+
+if BR2_PACKAGE_LIBIIO
+
+config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	bool "Local backend"
+	default y
+	help
+	  Enable the local backend of the library.
+
+config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	bool "Network backend"
+	select BR2_PACKAGE_LIBXML2
+	default y
+	help
+	  Enable the network backend of the library.
+
+config BR2_PACKAGE_LIBIIO_IIOD
+	bool "IIO Daemon"
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	default y
+	help
+	  Install the IIO Daemon.
+
+comment "IIO Daemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBIIO_TESTS
+	bool "Install test programs"
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	help
+	  Install the test programs (iio_info, iio_genxml, iio_readdev).
+
+endif
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
new file mode 100644
index 0000000..2bfe8d9
--- /dev/null
+++ b/package/libiio/libiio.mk
@@ -0,0 +1,76 @@
+################################################################################
+#
+# libiio
+#
+################################################################################
+
+LIBIIO_VERSION = 2014_R1
+LIBIIO_SITE = $(call github,analogdevicesinc,libiio,$(LIBIIO_VERSION))
+LIBIIO_INSTALL_STAGING = YES
+LIBIIO_LICENSE = LGPLv2.1+
+LIBIIO_LICENSE_FILES = COPYING
+
+LIBIIO_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) VERSION_GIT=$(LIBIIO_VERSION)
+
+# Avahi support in libiio requires avahi-client,
+# which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+	LIBIIO_DEPENDENCIES += avahi
+else
+	LIBIIO_MAKE_OPTS += WITH_AVAHI=no
+endif
+
+ifneq ($(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),y)
+	LIBIIO_MAKE_OPTS += WITH_LOCAL_BACKEND=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
+	LIBIIO_DEPENDENCIES += libxml2
+else
+	LIBIIO_MAKE_OPTS += WITH_NETWORK_BACKEND=no
+endif
+
+# Libiio can run without threads
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	LIBIIO_MAKE_OPTS += WITH_PTHREAD=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
+define LIBIIO_BUILD_IIOD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod $(LIBIIO_MAKE_OPTS)
+endef
+define LIBIIO_INSTALL_IIOD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod install \
+		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_TESTS),y)
+define LIBIIO_BUILD_TESTS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests $(LIBIIO_MAKE_OPTS)
+endef
+define LIBIIO_INSTALL_TESTS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests install \
+		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+endif
+
+define LIBIIO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) libiio $(LIBIIO_MAKE_OPTS)
+	$(LIBIIO_BUILD_IIOD)
+	$(LIBIIO_BUILD_TESTS)
+endef
+
+define LIBIIO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-sysroot \
+		$(LIBIIO_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBIIO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-lib \
+		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	$(LIBIIO_INSTALL_IIOD)
+	$(LIBIIO_INSTALL_TESTS)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
