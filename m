From: Paul Cercueil <paul.cercueil@analog.com>
Date: Tue, 2 Sep 2014 14:08:27 +0200
Subject: [Buildroot] [PATCH] libiio: Added package
Message-ID: <1409659707-5297-1-git-send-email-paul.cercueil@analog.com>
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
 package/libiio/Config.in | 41 +++++++++++++++++++++++++
 package/libiio/libiio.mk | 79 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 package/libiio/Config.in
 create mode 100644 package/libiio/libiio.mk

diff --git a/package/Config.in b/package/Config.in
index 883dd66..b67d95d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libhid/Config.in"
+	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
new file mode 100644
index 0000000..347269c
--- /dev/null
+++ b/package/libiio/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_LIBIIO
+	bool "libiio"
+	help
+	  Libiio is a library to ease the development of software interfacing
+	  Linux Industrial I/O (IIO) devices.
+
+	  http://wiki.analog.com/resources/tools-software/linux-software/libiio
+
+if BR2_PACKAGE_LIBIIO
+	config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+		bool "Local backend"
+		default y
+		help
+		  Enable the local backend of the library.
+
+	config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+		bool "Network backend"
+		select BR2_PACKAGE_LIBXML2
+		default y
+		help
+		  Enable the network backend of the library.
+
+	config BR2_PACKAGE_LIBIIO_IIOD
+		bool "IIO Daemon"
+		select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+		depends on BR2_TOOLCHAIN_HAS_THREADS
+		default y
+		help
+		  Install the IIO Daemon.
+
+	comment "IIO Daemon needs a toolchain w/ threads"
+		depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_PACKAGE_LIBIIO_TESTS
+		bool "Install test programs"
+		select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+		select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+		default n
+		help
+		  Install the test programs (iio_info, iio_genxml, iio_readdev).
+endif
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
new file mode 100644
index 0000000..7ea9c25
--- /dev/null
+++ b/package/libiio/libiio.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# libiio
+#
+################################################################################
+
+LIBIIO_VERSION = 2014_R1
+LIBIIO_SITE = $(call github,analogdevicesinc,libiio,$(LIBIIO_VERSION))
+LIBIIO_INSTALL_STAGING = YES
+LIBIIO_LICENSE = LGPLv2
+LIBIIO_LICENSE_FILES = COPYING
+
+LIBIIO_CONFIGURE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) \
+						VERSION_GIT=$(LIBIIO_VERSION)
+
+# Avahi support in libiio requires avahi-client,
+# which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+	LIBIIO_DEPENDENCIES += avahi
+else
+	LIBIIO_CONFIGURE_OPTS += WITH_AVAHI=no
+endif
+
+ifneq ($(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),y)
+	LIBIIO_CONFIGURE_OPTS += WITH_LOCAL_BACKEND=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
+	LIBIIO_DEPENDENCIES += libxml2
+else
+	LIBIIO_CONFIGURE_OPTS += WITH_NETWORK_BACKEND=no
+endif
+
+# Libiio can run without threads
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	LIBIIO_CONFIGURE_OPTS += WITH_PTHREAD=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
+define LIBIIO_BUILD_IIOD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod $(LIBIIO_CONFIGURE_OPTS)
+endef
+	LIBIIO_POST_BUILD_HOOKS += LIBIIO_BUILD_IIOD
+
+define LIBIIO_INSTALL_IIOD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod install \
+		$(LIBIIO_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+	LIBIIO_POST_INSTALL_TARGET_HOOKS += LIBIIO_INSTALL_IIOD
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_TESTS),y)
+define LIBIIO_BUILD_TESTS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests $(LIBIIO_CONFIGURE_OPTS)
+endef
+	LIBIIO_POST_BUILD_HOOKS += LIBIIO_BUILD_TESTS
+
+define LIBIIO_INSTALL_TESTS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests install \
+		$(LIBIIO_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+	LIBIIO_POST_INSTALL_TARGET_HOOKS += LIBIIO_INSTALL_TESTS
+endif
+
+define LIBIIO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) libiio $(LIBIIO_CONFIGURE_OPTS)
+endef
+
+define LIBIIO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-sysroot \
+		$(LIBIIO_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBIIO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-lib \
+		$(LIBIIO_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
