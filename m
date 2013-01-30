From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2013 07:42:39 +0200
Subject: [Buildroot] [PATCH] wireshark: new package
Message-ID: <9b4fd5a7c061d1912a23865e2cd2bbfe9cef6390.1359524462.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only the bare minimum needed to build the textual tshark utility.
Support for more options, including the wireshark GUI, can be added later.

Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
The "big" wireshark build of Stefan Fr?berg isn't here yet, so please consider
applying this minimal wireshark as a starting point.

tshark still contains build directories in its RPATH, but as Thomas has
indicated (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/52377),
this should not be a show-stopper.

Changes v3 -> v4:
	* Update to version 1.8.4

Changes v2 -> v3:
	* Use an upstreamable patch as suggested by Thomas Petazzoni
	* Add license info

Changes v1 -> v2:
	* Patch configure.in and enable autoreconf, instead of overriding
	  $prefix
	* Remove --with-sysroot as suggested by Arnout Vandecappelle

 package/Config.in                                  |    1 +
 package/wireshark/Config.in                        |   14 +++++++
 .../wireshark/wireshark-dont-include-prefix.patch  |   41 ++++++++++++++++++++
 package/wireshark/wireshark.mk                     |   18 +++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 package/wireshark/Config.in
 create mode 100644 package/wireshark/wireshark-dont-include-prefix.patch
 create mode 100644 package/wireshark/wireshark.mk

diff --git a/package/Config.in b/package/Config.in
index ebd9817..63ab1f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -727,6 +727,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/wget/Config.in"
 endif
 source "package/wireless_tools/Config.in"
+source "package/wireshark/Config.in"
 source "package/wpa_supplicant/Config.in"
 source "package/xinetd/Config.in"
 source "package/xl2tp/Config.in"
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
new file mode 100644
index 0000000..e6d4e72
--- /dev/null
+++ b/package/wireshark/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_WIRESHARK
+	bool "wireshark"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # glib2
+	help
+	  Network traffic sniffer and protocol decoder. Currently only tshark,
+	  the console interface, is enabled.
+
+	  http://www.wireshark.org
+
+comment "wireshark requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/wireshark/wireshark-dont-include-prefix.patch b/package/wireshark/wireshark-dont-include-prefix.patch
new file mode 100644
index 0000000..567af9a
--- /dev/null
+++ b/package/wireshark/wireshark-dont-include-prefix.patch
@@ -0,0 +1,41 @@
+configure.in: don't add the build host's /usr/include and /usr/lib to the 
+search path of include files and libraries. This is not what you want when 
+cross compiling.
+
+Sent upstream as https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7926.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar wireshark-1.8.3.orig/configure.in wireshark-1.8.3/configure.in
+--- wireshark-1.8.3.orig/configure.in	2012-08-15 23:33:32.000000000 +0300
++++ wireshark-1.8.3/configure.in	2012-10-28 10:07:54.864388531 +0200
+@@ -635,29 +635,6 @@
+ AC_SUBST(CORESERVICES_FRAMEWORKS)
+ AC_SUBST(LAUNCHSERVICES_FRAMEWORKS)
+ 
+-#
+-# If using $prefix we add "$prefix/include" to the include search path
+-# and "$prefix/lib" to the library search path.
+-#
+-if test "x$prefix" != "x" ; then
+-	AC_MSG_CHECKING(whether to use $prefix for headers and libraries)
+-	if test -d $prefix/include ; then
+-		AC_MSG_RESULT(yes)
+-		#
+-		# Arrange that we search for header files in "$prefix/include", as
+-		# various packages we use may have been installed under "$prefix/include".
+-		#
+-		CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-
+-		#
+-		# Arrange that we search for libraries in "$prefix/lib".
+-		#
+-		AC_WIRESHARK_ADD_DASH_L(LDFLAGS, $prefix/lib)
+-	else
+-		AC_MSG_RESULT(no)
+-	fi
+-fi
+-
+ dnl Look in /usr/local for header files and libraries ?
+ dnl XXX FIXME don't include /usr/local if it is already in the system
+ dnl search path as this causes gcc 3.2 on Linux to complain about a change
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
new file mode 100644
index 0000000..c2efc2c
--- /dev/null
+++ b/package/wireshark/wireshark.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# wireshark
+#
+#############################################################
+
+WIRESHARK_VERSION = 1.8.4
+WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
+WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
+WIRESHARK_LICENSE = wireshark license
+WIRESHARK_LICENSE_FILES = COPYING
+WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
+WIRESHARK_AUTORECONF = YES
+WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
+		     --enable-static=no
+
+$(eval $(call autotools-package))
-- 
1.7.10.4
