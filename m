From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:53:15 +0200
Subject: [Buildroot] EFL in buildroot
In-Reply-To: <1255693819.28018.17.camel@coalu.atr>
References: <1255693819.28018.17.camel@coalu.atr>
Message-ID: <1255693995.28018.19.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH 1/6] Added libeina package

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/Config.in              |    2 ++
 package/efl/Config.in          |   12 ++++++++++++
 package/efl/efl.mk             |    3 +++
 package/efl/libeina/Config.in  |    5 +++++
 package/efl/libeina/libeina.mk |   17 +++++++++++++++++
 5 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/Config.in
 create mode 100644 package/efl/efl.mk
 create mode 100644 package/efl/libeina/Config.in
 create mode 100644 package/efl/libeina/libeina.mk

diff --git a/package/Config.in b/package/Config.in
index 13c845e..8d59703 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,6 +328,8 @@ source "package/qt/Config.in"
 
 source "package/x11r7/Config.in"
 
+source "package/efl/Config.in"
+
 comment "X libraries and helper libraries"
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
new file mode 100644
index 0000000..1a05c4d
--- /dev/null
+++ b/package/efl/Config.in
@@ -0,0 +1,12 @@
+menuconfig BR2_PACKAGE_EFL
+	bool "Enlightenment Foundation Libraries"
+	help
+	  Enlightenment Foundation Libraries
+
+	  http://enlightenment.org
+
+if BR2_PACKAGE_EFL
+
+source "package/efl/libeina/Config.in"
+
+endif # BR2_PACKAGE_EFL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
new file mode 100644
index 0000000..1f9f43a
--- /dev/null
+++ b/package/efl/efl.mk
@@ -0,0 +1,3 @@
+ifeq ($(BR2_PACKAGE_EFL),y)
+include package/efl/*/*.mk
+endif
diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
new file mode 100644
index 0000000..370451d
--- /dev/null
+++ b/package/efl/libeina/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBEINA
+	bool "libeina"
+	help
+	  Eina is a tiny library to handle data types (List, hash,
+	  etc)
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
new file mode 100644
index 0000000..e545470
--- /dev/null
+++ b/package/efl/libeina/libeina.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libeina
+#
+#############################################################
+
+LIBEINA_VERSION = 0.0.2.062
+LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
+LIBEINA_SITE = http://download.enlightenment.org/snapshots/2009-07-29/
+LIBEINA_AUTORECONF = YES
+LIBEINA_LIBTOOL_PATCH = YES
+LIBEINA_INSTALL_STAGING = YES
+LIBEINA_INSTALL_TARGET = YES
+
+LIBEINA_DEPENDENCIES = host-pkgconfig uclibc
+
+$(eval $(call AUTOTARGETS,package,libeina))
-- 
1.6.4.3
