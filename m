From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Oct 2012 08:27:15 +0200
Subject: [Buildroot] [PATCH] wireshark: new package
Message-ID: <c866c7ffc05da225311abef42a80696310d22157.1350887157.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only the bare minimum needed to build the textual tshark utility.
Support for more options, including the wireshark GUI, can be added later.
---
I override the $prefix configure variable because otherwise the host
/usr/include is added to the -I and -L paths. I'm not sure this is a good idea
though, since it clutters the tshark RPATH with directories from the local
build paths. If you have a better I'd be glad to hear.

 package/Config.in              |    1 +
 package/wireshark/Config.in    |   14 ++++++++++++++
 package/wireshark/wireshark.mk |   10 ++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/wireshark/Config.in
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
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
new file mode 100644
index 0000000..c89fbf8
--- /dev/null
+++ b/package/wireshark/wireshark.mk
@@ -0,0 +1,10 @@
+WIRESHARK_VERSION = 1.8.3
+WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
+WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
+WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
+WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
+		     prefix=$(STAGING_DIR)/usr --with-sysroot=$(STAGING_DIR) \
+		     --enable-static=no
+
+$(eval $(call autotools-package))
-- 
1.7.10.4
