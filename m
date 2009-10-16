From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:56:08 +0200
Subject: [Buildroot] EFL in buildroot
In-Reply-To: <1255693819.28018.17.camel@coalu.atr>
References: <1255693819.28018.17.camel@coalu.atr>
Message-ID: <1255694168.28018.24.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH 6/6] Added libedje package

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/efl/Config.in          |    1 +
 package/efl/libedje/Config.in  |   16 ++++++++++++++++
 package/efl/libedje/libedje.mk |   23 +++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libedje/Config.in
 create mode 100644 package/efl/libedje/libedje.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 7a89120..2419bac 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,5 +12,6 @@ source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
+source "package/efl/libedje/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
new file mode 100644
index 0000000..af00dce
--- /dev/null
+++ b/package/efl/libedje/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje"
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEMBRYO
+	select BR2_PACKAGE_LIBEVAS
+	help
+          A graphical layout and animation library for animated
+          resizable, compressed and scalable themes.
+
+if BR2_PACKAGE_LIBEDJE
+
+config BR2_PACKAGE_LIBEDJE_CC
+	bool "build edje_cc"
+
+endif # BR2_PACKAGE_LIBEDJE
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
new file mode 100644
index 0000000..bd472c8
--- /dev/null
+++ b/package/efl/libedje/libedje.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# libedje
+#
+#############################################################
+
+LIBEDJE_VERSION = 0.9.92.062
+LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
+LIBEDJE_SITE = http://download.enlightenment.org/snapshots/2009-07-29/
+LIBEDJE_AUTORECONF = YES
+LIBEDJE_LIBTOOL_PATCH = YES
+LIBEDJE_INSTALL_STAGING = YES
+LIBEDJE_INSTALL_TARGET = YES
+
+LIBEDJE_DEPENDENCIES = host-pkgconfig uclibc libeet libecore libevas libembryo
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
+LIBEVAS_CONF_OPT += --enable-edje-cc
+else
+LIBEVAS_CONF_OPT += --disable-edje-cc
+endif
+
+$(eval $(call AUTOTARGETS,package,libedje))
-- 
1.6.4.3
