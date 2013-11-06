From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 22:56:58 +0100
Subject: [Buildroot] [git commit] package/nut: new package
Message-ID: <20131106222810.5185C9BAE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=856294dedfd88ac2497eca41da6fcd606a57f427
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'nut' are the Network UPS Tools.

[Note: original patch from Dallas, but completely revamped
 by Yann, so nothing remains from the original patch, but two
 variable names.]

Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
[yann.morin.1998 at free.fr: refresh patch, use latest version,
    add license, fix commit message, add dependencies, fix
    runtime path, fix libs-config, move to 'system utils']
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                     |    1 +
 package/nut/Config.in                 |   20 ++++++++
 package/nut/nut-0001-foo-config.patch |   72 ++++++++++++++++++++++++++++++
 package/nut/nut.mk                    |   79 +++++++++++++++++++++++++++++++++
 4 files changed, 172 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4c4da51..c0a3f20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,6 +962,7 @@ source "package/lxc/Config.in"
 source "package/monit/Config.in"
 source "package/ncdu/Config.in"
 source "package/numactl/Config.in"
+source "package/nut/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/nut/Config.in b/package/nut/Config.in
new file mode 100644
index 0000000..5b47e8b
--- /dev/null
+++ b/package/nut/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_NUT
+	bool "nut"
+	help
+	  Network UPS tools
+
+	  The primary goal of the Network UPS Tools (NUT) project is to provide
+	  support for Power Devices, such as Uninterruptible Power Supplies,
+	  Power Distribution Units and Solar Controllers.
+
+	  http://www.networkupstools.org/
+
+if BR2_PACKAGE_NUT
+
+config BR2_PACKAGE_NUT_DRIVERS
+	string "drivers"
+	help
+	  Select the individual drivers to enable, in a comma-separated list.
+	  Leave empty for all.
+
+endif # BR2_PACKAGE_NUT
diff --git a/package/nut/nut-0001-foo-config.patch b/package/nut/nut-0001-foo-config.patch
new file mode 100644
index 0000000..7202f13
--- /dev/null
+++ b/package/nut/nut-0001-foo-config.patch
@@ -0,0 +1,72 @@
+configure: fix calls to {gdlib,net-snmp}-config
+
+nut directly calls to {gdlib,net-snmp}-config. In Buildroot,
+those are not in the PATH, and nut would catch those of the
+system (if they are installed), or miss them entirely.
+
+Fix that by using environment variables that will tell where
+to look for them.
+
+Note: libusb also uses libusb-config, but only as a fallback
+if pkg-config fails. Since we ensure that pkg-config exists,
+and libusb is properly installed before we build nut, there
+is no need to fix the libusb-config calls, since they won't
+be called at all.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN nut-2.6.5.orig/m4/nut_check_libgd.m4 nut-2.6.5/m4/nut_check_libgd.m4
+--- nut-2.6.5.orig/m4/nut_check_libgd.m4	2012-07-31 19:38:56.000000000 +0200
++++ nut-2.6.5/m4/nut_check_libgd.m4	2013-11-01 16:24:02.626549810 +0100
+@@ -20,7 +20,7 @@
+ 	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
+ 
+ 	AC_MSG_CHECKING(for gd version via gdlib-config)
+-	GD_VERSION=`gdlib-config --version 2>/dev/null`
++	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
+ 	if test "$?" != "0" -o -z "${GD_VERSION}"; then
+ 		GD_VERSION="none"
+ 	fi
+@@ -34,9 +34,9 @@
+ 		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
+ 		;;
+ 	*)
+-		CFLAGS="`gdlib-config --includes 2>/dev/null`"
+-		LDFLAGS="`gdlib-config --ldflags 2>/dev/null`"
+-		LIBS="`gdlib-config --libs 2>/dev/null`"
++		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
++		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
++		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
+ 		;;
+ 	esac
+ 
+diff -durN nut-2.6.5.orig/m4/nut_check_libnetsnmp.m4 nut-2.6.5/m4/nut_check_libnetsnmp.m4
+--- nut-2.6.5.orig/m4/nut_check_libnetsnmp.m4	2012-07-31 19:38:56.000000000 +0200
++++ nut-2.6.5/m4/nut_check_libnetsnmp.m4	2013-11-01 16:30:07.398282923 +0100
+@@ -15,7 +15,7 @@
+ 
+ 	dnl See which version of the Net-SNMP library (if any) is installed
+ 	AC_MSG_CHECKING(for Net-SNMP version via net-snmp-config)
+-	SNMP_VERSION=`net-snmp-config --version 2>/dev/null`
++	SNMP_VERSION=`${NET_SNMP_CONFIG} --version 2>/dev/null`
+ 	if test "$?" != "0" -o -z "${SNMP_VERSION}"; then
+ 		SNMP_VERSION="none"
+ 	fi
+@@ -33,7 +33,7 @@
+ 			CFLAGS="${withval}"
+ 			;;
+ 		esac
+-	], [CFLAGS="`net-snmp-config --base-cflags 2>/dev/null`"])
++	], [CFLAGS="`${NET_SNMP_CONFIG} --base-cflags 2>/dev/null`"])
+ 	AC_MSG_RESULT([${CFLAGS}])
+ 
+ 	AC_MSG_CHECKING(for Net-SNMP libs)
+@@ -48,7 +48,7 @@
+ 			LIBS="${withval}"
+ 			;;
+ 		esac
+-	], [LIBS="`net-snmp-config --libs 2>/dev/null`"])
++	], [LIBS="`${NET_SNMP_CONFIG} --libs 2>/dev/null`"])
+ 	AC_MSG_RESULT([${LIBS}])
+ 
+ 	dnl Check if the Net-SNMP library is usable
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
new file mode 100644
index 0000000..8cb8a01
--- /dev/null
+++ b/package/nut/nut.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# nut
+#
+################################################################################
+
+NUT_VERSION = 2.6.5
+NUT_SITE = http://www.networkupstools.org/source/2.6/
+NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
+NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
+NUT_DEPENDENCIES = host-pkgconf
+
+# Our patch changes m4 macros, so we need to autoreconf
+NUT_AUTORECONF = YES
+
+# Put the PID files in a read-write place (/var/run is a tmpfs)
+# since the default location (/var/state/ups) maybe readonly.
+NUT_CONF_OPT = \
+	--with-altpidpath=/var/run/upsd
+
+NUT_CONF_ENV = \
+	GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
+	NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+
+# For uClibc-based toolchains, nut forgets to link with -lm
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+NUT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lm"
+endif
+
+ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
+NUT_CONF_OPT += --with-drivers=all
+else
+NUT_CONF_OPT += --with-drivers=$(BR2_PACKAGE_NUT_DRIVERS)
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS),yy)
+NUT_DEPENDENCIES += avahi dbus
+NUT_CONF_OPT += --with-avahi
+else
+NUT_CONF_OPT += --without-avahi
+endif
+
+# gd with support for png is required for the CGI
+ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
+NUT_DEPENDENCIES += gd libpng
+NUT_CONF_OPT += --with-cgi
+else
+NUT_CONF_OPT += --without-cgi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+NUT_DEPENDENCIES += libusb-compat
+NUT_CONF_OPT += --with-usb
+else
+NUT_CONF_OPT += --without-usb
+endif
+
+ifeq ($(BR2_PACKAGE_NEON_EXPAT)$(BR2_PACKAGE_NEON_LIBXML2),y)
+NUT_DEPENDENCIES += neon
+NUT_CONF_OPT += --with-neon
+else
+NUT_CONF_OPT += --without-neon
+endif
+
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+NUT_DEPENDENCIES += netsnmp
+NUT_CONF_OPT += --with-snmp
+else
+NUT_CONF_OPT += --without-snmp
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NUT_DEPENDENCIES += openssl
+NUT_CONF_OPT += --with-ssl
+else
+NUT_CONF_OPT += --without-ssl
+endif
+
+$(eval $(autotools-package))
