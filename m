From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Oct 2012 16:13:33 +0200
Subject: [Buildroot] [PATCH v2] wireshark: new package
Message-ID: <4b73cf9536d6cde485299c9afb9fc41affa909ae.1351087817.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only the bare minimum needed to build the textual tshark utility.
Support for more options, including the wireshark GUI, can be added later.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

Changes v1 -> v2:
	* Patch configure.in and enable autoreconf, instead of overriding
	  $prefix
	* Remove --with-sysroot as suggested by Arnout Vandecappelle

The tshark RPATH is still cluttered with local build paths. Adding
--libdir=/usr/lib doesn't solve this. Any suggestion?

 package/Config.in                                    |    1 +
 package/wireshark/Config.in                          |   14 ++++++++++++++
 .../wireshark/wireshark-dont-include-prefix.patch    |   18 ++++++++++++++++++
 package/wireshark/wireshark.mk                       |   10 ++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/wireshark/Config.in
 create mode 100644 package/wireshark/wireshark-dont-include-prefix.patch
 create mode 100644 package/wireshark/wireshark.mk

diff --git a/package/Config.in b/package/Config.in
index 1650c71..cd8d9ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -646,6 +646,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
index 0000000..6f3c946
--- /dev/null
+++ b/package/wireshark/wireshark-dont-include-prefix.patch
@@ -0,0 +1,18 @@
+configure.in: don't add the build host's /usr/include and /usr/lib to the 
+search path of include files and libraries. This is not what you want when 
+cross compiling.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar wireshark-1.8.3.orig/configure.in wireshark-1.8.3/configure.in
+--- wireshark-1.8.3.orig/configure.in	2012-08-15 23:33:32.000000000 +0300
++++ wireshark-1.8.3/configure.in	2012-10-24 09:54:15.259853331 +0200
+@@ -639,7 +639,7 @@
+ # If using $prefix we add "$prefix/include" to the include search path
+ # and "$prefix/lib" to the library search path.
+ #
+-if test "x$prefix" != "x" ; then
++if false ; then
+ 	AC_MSG_CHECKING(whether to use $prefix for headers and libraries)
+ 	if test -d $prefix/include ; then
+ 		AC_MSG_RESULT(yes)
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
new file mode 100644
index 0000000..b50c223
--- /dev/null
+++ b/package/wireshark/wireshark.mk
@@ -0,0 +1,10 @@
+WIRESHARK_VERSION = 1.8.3
+WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
+WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
+WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
+WIRESHARK_AUTORECONF = YES
+WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
+		     --enable-static=no
+
+$(eval $(call autotools-package))
-- 
1.7.10.4
