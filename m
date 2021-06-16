From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 16 Jun 2021 23:38:54 +0200
Subject: [Buildroot] [git commit] package/usbguard: new package
Message-ID: <20210616211146.2B4B4815C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbff7d7289cc95db991184f890f4ca1fcf8a101e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbguard is a software framework to implement USB
device blacklisting and whitelisting based on their
attributes.

More info. on: https://usbguard.github.io/

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout:
 - correct indirect dependencies from protobuf instead of libglib2;
 - say in Config.in help text that rules.conf has to be created]
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/usbguard/Config.in     | 22 +++++++++++++++++++
 package/usbguard/S20usbguard   | 37 +++++++++++++++++++++++++++++++
 package/usbguard/usbguard.hash |  3 +++
 package/usbguard/usbguard.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 114 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2047380e3..f6621e9670 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1504,6 +1504,7 @@ N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
 F:	package/libqb/
+F:	package/usbguard/
 
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
diff --git a/package/Config.in b/package/Config.in
index 6e6a9e5784..cb8ece4919 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -586,6 +586,7 @@ endmenu
 	source "package/upower/Config.in"
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
+	source "package/usbguard/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
new file mode 100644
index 0000000000..582e9b3852
--- /dev/null
+++ b/package/usbguard/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_USBGUARD
+	bool "usbguard"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_LIBQB
+	help
+	  The USBGuard software framework
+
+	  Install a custom accept/deny list in /etc/usbguard/rules.conf
+	  (e.g. using an overlay). This file can be generated on the
+	  target using "usbguard generate-policy".
+
+	  https://usbguard.github.io/
+
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/usbguard/S20usbguard b/package/usbguard/S20usbguard
new file mode 100644
index 0000000000..b16d7b4aa2
--- /dev/null
+++ b/package/usbguard/S20usbguard
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# Start psplash
+#
+
+PIDFILE=/var/run/$NAME.pid
+
+start() {
+    printf "Starting usbguard daemon: "
+    test -d /var/log/usbguard || mkdir -p /var/log/usbguard
+    start-stop-daemon -b -S -q -m -p $PIDFILE --exec /usr/sbin/usbguard-daemon -- -f -s -c /etc/usbguard/usbguard-daemon.conf
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+    printf "Stopping usbguard daemon: "
+    start-stop-daemon -K -q -p $PIDFILE
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+    start)
+	start
+	;;
+    stop)
+	stop
+	;;
+    restart|reload)
+	stop
+	start
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
new file mode 100644
index 0000000000..fd77acc75a
--- /dev/null
+++ b/package/usbguard/usbguard.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
new file mode 100644
index 0000000000..72e9e6459a
--- /dev/null
+++ b/package/usbguard/usbguard.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+## usbguard
+#
+################################################################################
+
+USBGUARD_VERSION = 1.0.0
+USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
+USBGUARD_LICENSE = GPL-2.0+
+USBGUARD_LICENSE_FILES = LICENSE
+USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
+		    --disable-debug-build --without-dbus --without-polkit \
+		    --disable-seccomp --disable-umockdev --disable-systemd
+
+USBGUARD_DEPENDENCIES += libqb protobuf
+
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=openssl
+USBGUARD_DEPENDENCIES += libopenssl
+endif
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
+USBGUARD_DEPENDENCIES += libgcrypt
+endif
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
+USBGUARD_CONF_OPTS += --with-crypto-library=sodium
+USBGUARD_DEPENDENCIES += libsodium
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+USBGUARD_CONF_OPTS += --enable-systemd
+USBGUARD_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+USBGUARD_CONF_OPTS += --enable-seccomp
+USBGUARD_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+USBGUARD_CONF_OPTS += --enable-libcapng
+USBGUARD_DEPENDENCIES += libcap-ng
+endif
+
+define USBGUARD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/usbguard/S20usbguard \
+		$(TARGET_DIR)/etc/init.d/S20usbguard
+endef
+
+$(eval $(autotools-package))
