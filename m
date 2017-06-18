From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jun 2017 09:39:52 +0200
Subject: [Buildroot] [PATCH v3,1/1] boinc: new package
Message-ID: <1497771592-119110-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Open-source software for volunteer computing and grid computing.

Use the idle time on your computer to cure diseases, study global
warming, discover pulsars, and do many other types of scientific
research.

https://boinc.berkeley.edu

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Bernd Kuhls):
 - Remove wchar dependency
 - Update hash of patches
 - Update version to 7.6.34
 - Remove whitespace at the end of BOINC_LiCENSE_FILES line
 - Remove BOINC_INSTALL_STAGING as there is no packages which depends on
   boinc libraries for now
 - Always build boinc client and so always select libcurl and openssl
 - Fix --with-libcurl option: use $(STAGING_DIR)/usr instead of
   $(STAGING_DIR)/usr/lib
 - Add a dependency on BR2_STATIC_LIBS due to dlfcn.h

Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update LDFLAGS patch and retrieve it from upstream
 - Use client_release/7.6.33 tag instead of vboxwrapper/26198 tag and add a
   comment about it following advice of upstream project member
 - Keep license as LGPLv3 as confirmed by upstream project member (see last
   comments of https://github.com/BOINC/boinc/pull/1798)
 - Put dependencies on one line

 package/Config.in                  |  1 +
 package/boinc/Config.in            | 22 ++++++++++++++
 package/boinc/S99boinc-client      | 37 +++++++++++++++++++++++
 package/boinc/boinc-client.service | 10 +++++++
 package/boinc/boinc.hash           |  4 +++
 package/boinc/boinc.mk             | 60 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 134 insertions(+)
 create mode 100644 package/boinc/Config.in
 create mode 100644 package/boinc/S99boinc-client
 create mode 100644 package/boinc/boinc-client.service
 create mode 100644 package/boinc/boinc.hash
 create mode 100644 package/boinc/boinc.mk

diff --git a/package/Config.in b/package/Config.in
index 2704cf6..c811470 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1544,6 +1544,7 @@ menu "Networking applications"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
+	source "package/boinc/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
diff --git a/package/boinc/Config.in b/package/boinc/Config.in
new file mode 100644
index 0000000..5239019
--- /dev/null
+++ b/package/boinc/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BOINC
+	bool "boinc"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Open-source software for volunteer computing and grid
+	  computing.
+
+	  Use the idle time on your computer to cure diseases, study
+	  global warming, discover pulsars, and do many other types of
+	  scientific research.
+
+	  https://boinc.berkeley.edu
+
+comment "boinc needs a toolchain w/ dynamic library, C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boinc/S99boinc-client b/package/boinc/S99boinc-client
new file mode 100644
index 0000000..f4b2a2c
--- /dev/null
+++ b/package/boinc/S99boinc-client
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=boinc_client
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/boinc/boinc-client.service b/package/boinc/boinc-client.service
new file mode 100644
index 0000000..9de940e
--- /dev/null
+++ b/package/boinc/boinc-client.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=BOINC client
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/boinc_client
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
new file mode 100644
index 0000000..c6675ec
--- /dev/null
+++ b/package/boinc/boinc.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256	9c58df3925e75f99ce46e0abcc4a90b58d345e568198bcb33a4d98bcd318709a	boinc-7.6.34.tar.gz
+sha256	745de39985a4498f562a311945771f96ff0719c4afe9c5732bd9b223862021de	25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch
+sha256	22ac42c27bd7b2f36ff9eb0b190b134867e561d32784f12e9ba317e6a2461791	bf807980c1b217c0f20668a664806d8727df3239.patch
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
new file mode 100644
index 0000000..1c178b2
--- /dev/null
+++ b/package/boinc/boinc.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# boinc
+#
+################################################################################
+
+BOINC_VERSION_MAJOR = 7.6
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).34
+# client_release can be used to build the Client and Manager but not the Server
+# part. The Server currently has no versioning (see
+# https://github.com/BOINC/boinc/pull/1798).
+BOINC_SITE = \
+	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
+BOINC_LICENSE = LGPLv3
+BOINC_LICENSE_FILES = COPYING COPYING.LESSER
+BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
+BOINC_AUTORECONF = YES
+BOINC_CONF_OPTS = \
+	--disable-apps \
+	--disable-boinczip \
+	--disable-manager \
+	--disable-server \
+	--enable-client \
+	--enable-libraries \
+	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY) \
+	--with-libcurl=$(STAGING_DIR)/usr
+
+# Fix execinfo.h detection and LDFLAGS
+BOINC_PATCH += \
+	https://github.com/BOINC/boinc/commit/25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch \
+	https://github.com/BOINC/boinc/commit/bf807980c1b217c0f20668a664806d8727df3239.patch
+
+ifeq ($(BR2_PACKAGE_LIBFCGI),y)
+BOINC_DEPENDENCIES += libfcgi
+BOINC_CONF_OPTS += --enable-fcgi
+else
+BOINC_CONF_OPTS += --disable-fcgi
+endif
+
+# Remove boinc-client because it is incompatible with buildroot
+define BOINC_REMOVE_UNNEEDED_FILE
+	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
+endef
+
+BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
+
+define BOINC_INSTALL_INIT_SYSV
+	 $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
+		$(TARGET_DIR)/etc/init.d/S99boinc-client
+endef
+
+define BOINC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/boinc/boinc-client.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/boinc-client.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/boinc-client.service
+endef
+
+$(eval $(autotools-package))
-- 
2.5.0
