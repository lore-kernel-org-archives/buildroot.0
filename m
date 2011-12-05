From: Daniel Mack <zonque@gmail.com>
Date: Mon,  5 Dec 2011 18:30:41 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <4EDCFEB2.60603@gmail.com>
References: <4EDCFEB2.60603@gmail.com>
Message-ID: <1323106241-22192-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ConnMan project provides a daemon for managing internet connections
within embedded devices running the Linux operating system. The
Connection Manager is designed to be slim and to use as few resources as
possible, so it can be easily integrated. It is a fully modular system
that can be extended, through plug-ins, to support all kinds of wired or
wireless technologies. Also, configuration methods, like DHCP and domain
name resolving, are implemented using plug-ins. The plug-in approach
allows for easy adaption and modification for various use cases.

The location for released tarballs is still unavailable due to the
recent kernel.org outage, hence the package obtains the sources from git
for now.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
Changelog:
v3: bump to v0.78, drop --sysconfdir
v2: replace ifeq-blocks with $(if $(BR2_PACKAGE_CONNMAN_FOO),--enable-foo,--disable-foo) constructs
v1: initial

 package/Config.in          |    1 +
 package/connman/Config.in  |   47 ++++++++++++++++++++++++++++++++++++++++++++
 package/connman/connman.mk |   21 +++++++++++++++++++
 3 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/connman/Config.in
 create mode 100644 package/connman/connman.mk

diff --git a/package/Config.in b/package/Config.in
index a781870..c94bcc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
+source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cifs-utils/Config.in"
 source "package/cups/Config.in"
diff --git a/package/connman/Config.in b/package/connman/Config.in
new file mode 100644
index 0000000..59f1a8d
--- /dev/null
+++ b/package/connman/Config.in
@@ -0,0 +1,47 @@
+menuconfig BR2_PACKAGE_CONNMAN
+	bool "connman"
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IPTABLES
+	help
+	  The Connection Manager (ConnMan) project provides a daemon for
+	  managing internet connections within embedded devices running
+	  the Linux operating system.
+
+	  For more information, see http://connman.net/
+
+if BR2_PACKAGE_CONNMAN
+
+config BR2_PACKAGE_CONNMAN_THREADS
+	bool "enable threading support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	default y
+
+config BR2_PACKAGE_CONNMAN_ETHERNET
+	bool "enable Ethernet support"
+	default y
+
+config BR2_PACKAGE_CONNMAN_WIFI
+	bool "enable WiFi support"
+	select BR2_PACKAGE_WPA_SUPPLICANT
+	default y
+
+config BR2_PACKAGE_CONNMAN_BLUETOOTH
+	bool "enable Bluetooth support"
+
+config BR2_PACKAGE_CONNMAN_LOOPBACK
+	bool "enable loopback support"
+
+config BR2_PACKAGE_CONNMAN_NTPD
+	bool "enable ntpd support"
+
+config BR2_PACKAGE_CONNMAN_DEBUG
+	bool "enable compiling with debugging information"
+
+config BR2_PACKAGE_CONNMAN_CLIENT
+	bool "enable command line client"
+
+endif # BR2_PACKAGE_CONNMAN
+
+comment "connman needs DBus enabled"
+	depends on !BR2_PACKAGE_DBUS
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
new file mode 100644
index 0000000..8a34bd5
--- /dev/null
+++ b/package/connman/connman.mk
@@ -0,0 +1,21 @@
+#######################################################
+#
+# connman - open source connection manager
+#
+#######################################################
+
+CONNMAN_VERSION = 0.78
+CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
+CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_AUTORECONF = YES
+CONNMAN_CONF_OPT += --localstatedir=/var \
+	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
+	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
+	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
+	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
+	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
+	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
+	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)			\
+	$(if $(BR2_PACKAGE_CONNMAN_CLIENT),--enable-client,--disable-client)
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.7.3
