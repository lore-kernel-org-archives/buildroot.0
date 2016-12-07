From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  7 Dec 2016 15:49:05 +0100
Subject: [Buildroot] [PATCH v2] package/easydbus: new package
Message-ID: <20161207144905.25650-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v1 -> v2:
 * Replicate libglib2 dependencies and add corresponding comment
   (suggested by Thomas)

 package/Config.in              |  1 +
 package/easydbus/Config.in     | 14 ++++++++++++++
 package/easydbus/easydbus.hash |  2 ++
 package/easydbus/easydbus.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/easydbus/Config.in
 create mode 100644 package/easydbus/easydbus.hash
 create mode 100644 package/easydbus/easydbus.mk

diff --git a/package/Config.in b/package/Config.in
index 664d0d9..c14575c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -521,6 +521,7 @@ menu "Lua libraries/modules"
 	source "package/cosmo/Config.in"
 	source "package/coxpcall/Config.in"
 	source "package/dado/Config.in"
+	source "package/easydbus/Config.in"
 	source "package/lbase64/Config.in"
 	source "package/ljlinenoise/Config.in"
 	source "package/ljsyscall/Config.in"
diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
new file mode 100644
index 0000000..51519d6
--- /dev/null
+++ b/package/easydbus/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EASYDBUS
+	bool "easydbus"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Easy to use DBus library for Lua.
+
+	  https://github.com/mniestroj/easydbus
+
+comment "easydbus needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
new file mode 100644
index 0000000..0ef73f2
--- /dev/null
+++ b/package/easydbus/easydbus.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3e5907664f5dfebbc0e652faf87564fd58dbd639742f442c100ef2db8be46e52 easydbus-59c340f2cd2c92ded82f9d4436866847f295faab.tar.gz
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
new file mode 100644
index 0000000..376b09b
--- /dev/null
+++ b/package/easydbus/easydbus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# easydbus
+#
+################################################################################
+
+EASYDBUS_VERSION = 59c340f2cd2c92ded82f9d4436866847f295faab
+EASYDBUS_SITE = $(call github,mniestroj,easydbus,$(EASYDBUS_VERSION))
+EASYDBUS_DEPENDENCIES = luainterpreter libglib2
+EASYDBUS_LICENSE = MIT
+EASYDBUS_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.10.2
