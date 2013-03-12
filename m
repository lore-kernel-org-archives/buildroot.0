From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:58:39 +0100
Subject: [Buildroot] [PATCH 1/5] openobex: new package
In-Reply-To: <cover.1363063832.git.s.martin49@gmail.com>
References: <cover.1363063832.git.s.martin49@gmail.com>
Message-ID: <5396952b52f8a5fdae94050335f4d50ded8d054a.1363063832.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
- Update dependencies in Config.in (Thomas P.)
- Fix license (Thomas P.)
- Fix missing dependencies against host-pkgconf
---
 package/Config.in                                  |  1 +
 package/openobex/Config.in                         | 45 ++++++++++++++++++++++
 ...penobex-libusb_check_when_cross-compiling.patch | 18 +++++++++
 .../openobex-replace_deprecated_functions.patch    | 30 +++++++++++++++
 package/openobex/openobex.mk                       | 38 ++++++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 package/openobex/Config.in
 create mode 100644 package/openobex/openobex-libusb_check_when_cross-compiling.patch
 create mode 100644 package/openobex/openobex-replace_deprecated_functions.patch
 create mode 100644 package/openobex/openobex.mk

diff --git a/package/Config.in b/package/Config.in
index a65054c..560ae9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -689,6 +689,7 @@ source "package/ntp/Config.in"
 source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
+source "package/openobex/Config.in"
 source "package/openssh/Config.in"
 source "package/openswan/Config.in"
 source "package/openvpn/Config.in"
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
new file mode 100644
index 0000000..6494b29
--- /dev/null
+++ b/package/openobex/Config.in
@@ -0,0 +1,45 @@
+comment "openobex requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_OPENOBEX
+	bool "openobex"
+	depends on BR2_INET_IPV6
+	help
+	  Free open source implementation of the Object Exchange (OBEX)
+	  protocol.
+
+	  http://www.openobex.org
+
+if BR2_PACKAGE_OPENOBEX
+
+comment "bluez support require a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENOBEX_BLUEZ
+	bool "enable bluez support"
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_BLUEZ_UTILS
+
+comment "libusb support require a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENOBEX_LIBUSB
+	bool "enable libusb support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
+
+config BR2_PACKAGE_OPENOBEX_APPS
+	bool "install test applications"
+	help
+	  Also install the openobex test applications on target.
+
+config BR2_PACKAGE_OPENOBEX_SYSLOG
+	bool "enable debugging to the system logger"
+
+config BR2_PACKAGE_OPENOBEX_DUMP
+	bool "enable protocol dumping for debugging"
+
+endif
diff --git a/package/openobex/openobex-libusb_check_when_cross-compiling.patch b/package/openobex/openobex-libusb_check_when_cross-compiling.patch
new file mode 100644
index 0000000..7b8056a
--- /dev/null
+++ b/package/openobex/openobex-libusb_check_when_cross-compiling.patch
@@ -0,0 +1,18 @@
+Fix libusb check when cross-compiling.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+Index: openobex-1.5/acinclude.m4
+===================================================================
+--- openobex-1.5.orig/acinclude.m4	2010-06-16 10:32:47.000000000 +0200
++++ openobex-1.5/acinclude.m4	2010-06-16 10:35:33.000000000 +0200
+@@ -158,7 +158,7 @@
+ 		;;
+ 	*)
+ 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
+-		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
++		REQUIRES="libusb"
+ 		;;
+ 	esac
+ 	AC_SUBST(USB_CFLAGS)
diff --git a/package/openobex/openobex-replace_deprecated_functions.patch b/package/openobex/openobex-replace_deprecated_functions.patch
new file mode 100644
index 0000000..17274d3
--- /dev/null
+++ b/package/openobex/openobex-replace_deprecated_functions.patch
@@ -0,0 +1,30 @@
+obex_test_cable.c: avoid to use SuSv3 LEGACY APIs
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+Index: openobex-1.5/apps/obex_test_cable.c
+===================================================================
+--- openobex-1.5.orig/apps/obex_test_cable.c	2009-02-08 19:30:22.000000000 +0100
++++ openobex-1.5/apps/obex_test_cable.c	2010-06-16 11:11:05.000000000 +0200
+@@ -113,9 +113,9 @@
+ 			if(total == sizeof(tmpbuf))
+ 				return -1;
+ 
+-			if( (answer = index(tmpbuf, '\n')) )	{
++			if( (answer = strchr(tmpbuf, '\n')) )	{
+ 				// Remove first line (echo)
+-				if( (answer_end = index(answer+1, '\n')) )	{
++				if( (answer_end = strchr(answer+1, '\n')) )	{
+ 					// Found end of answer
+ 					done = 1;
+ 				}
+@@ -178,7 +178,7 @@
+ 	}
+ 
+ 	tcgetattr(gt->ttyfd, &gt->oldtio);
+-	bzero(&gt->newtio, sizeof(struct termios));
++	memset(&gt->newtio, 0, sizeof(struct termios));
+ 	gt->newtio.c_cflag = B115200 | CS8 | CREAD | CRTSCTS;
+ 	gt->newtio.c_iflag = IGNPAR;
+ 	gt->newtio.c_oflag = 0;
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
new file mode 100644
index 0000000..0fb4f65
--- /dev/null
+++ b/package/openobex/openobex.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# openobex
+#
+#############################################################
+
+OPENOBEX_VERSION = 1.5
+OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
+# Libraries seems to be released under LGPLv2.1+,
+# while other material is under GPLv2+.
+OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
+OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
+
+OPENOBEX_DEPENDENCIES = host-pkgconf
+OPENOBEX_AUTORECONF = YES
+OPENOBEX_INSTALL_STAGING = YES
+
+OPENOBEX_CONF_OPT += \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug) \
+	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
+	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
+	$(if $(BR2_PACKAGE_OPENOBEX_DUMP),--enable-dump)
+
+ifeq ($(BR2_PACKAGE_OPENOBEX_BLUEZ),y)
+OPENOBEX_DEPENDENCIES += bluez_utils
+OPENOBEX_CONF_OPT += --with-bluez=$(STAGING_DIR)
+else
+OPENOBEX_CONF_OPT += --disable-bluetooth
+endif
+
+ifeq ($(BR2_PACKAGE_OPENOBEX_LIBUSB),y)
+OPENOBEX_DEPENDENCIES += libusb
+OPENOBEX_CONF_OPT += --with-usb=$(STAGING_DIR)
+else
+OPENOBEX_CONF_OPT += --disable-usb
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.5
