From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:16 +0100
Subject: [Buildroot] [PATCH 5/5] efl: added libedje package
In-Reply-To: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261614916-8219-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/efl/Config.in          |    1 +
 package/efl/libedje/Config.in  |   17 +++++++++++++++++
 package/efl/libedje/libedje.mk |   21 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
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
index 0000000..7b4f275
--- /dev/null
+++ b/package/efl/libedje/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje"
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEMBRYO
+	select BR2_PACKAGE_LIBEVAS
+        select BR2_PACKAGE_LUA
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
index 0000000..78781ac
--- /dev/null
+++ b/package/efl/libedje/libedje.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# libedje
+#
+#############################################################
+
+LIBEDJE_VERSION = 0.9.93.063
+LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
+LIBEDJE_SITE = $(EFL_SNAPSHOT_URL)
+LIBEDJE_INSTALL_STAGING = YES
+LIBEDJE_INSTALL_TARGET = YES
+
+LIBEDJE_DEPENDENCIES = host-pkg-config lua libeet libecore libevas libembryo
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
+LIBEDJE_CONF_OPT += --enable-edje-cc
+else
+LIBEDJE_CONF_OPT += --disable-edje-cc
+endif
+
+$(eval $(call AUTOTARGETS,package,libedje))
-- 
1.6.5.7
