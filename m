From: Will Newton <will.newton@gmail.com>
Date: Thu, 26 Jan 2012 17:42:25 +0000
Subject: [Buildroot] [PATCH 04/14] libeina: Add new package along with EFL
	infrastructure
Message-ID: <CAFbHwiT0gRXscpUTjtzdwGRruwKETPcmW-zS+eGrqAHfYQnJQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in              |    1 +
 package/efl/Config.in          |   16 ++++++++++++++++
 package/efl/efl.mk             |    1 +
 package/efl/libeina/Config.in  |    4 ++++
 package/efl/libeina/libeina.mk |   16 ++++++++++++++++
 5 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/Config.in
 create mode 100644 package/efl/efl.mk
 create mode 100644 package/efl/libeina/Config.in
 create mode 100644 package/efl/libeina/libeina.mk

diff --git a/package/Config.in b/package/Config.in
index b245da8..9d435d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"

 comment "other GUIs"
+source "package/efl/Config.in"
 source "package/qt/Config.in"
 source "package/x11r7/Config.in"

diff --git a/package/efl/Config.in b/package/efl/Config.in
new file mode 100644
index 0000000..cc677cb
--- /dev/null
+++ b/package/efl/Config.in
@@ -0,0 +1,16 @@
+menuconfig BR2_PACKAGE_EFL
+	bool "Enlightenment Foundation Libraries"
+	depends on BR2_USE_WCHAR
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
+
+comment "EFL requires WCHAR support in toolchain"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
new file mode 100644
index 0000000..d8d53cf
--- /dev/null
+++ b/package/efl/efl.mk
@@ -0,0 +1 @@
+include package/efl/*/*.mk
diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
new file mode 100644
index 0000000..b937b3b
--- /dev/null
+++ b/package/efl/libeina/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBEINA
+	bool "libeina"
+	help
+	  Eina is a tiny library to handle data types (list, hash, etc.)
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
new file mode 100644
index 0000000..3ed43db
--- /dev/null
+++ b/package/efl/libeina/libeina.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libeina
+#
+#############################################################
+
+LIBEINA_VERSION = 1.1.0
+LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
+LIBEINA_SITE = http://download.enlightenment.org/releases/
+LIBEINA_AUTORECONF = YES
+LIBEINA_INSTALL_STAGING = YES
+
+LIBEINA_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
