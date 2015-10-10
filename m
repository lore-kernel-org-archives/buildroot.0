From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:07 +0200
Subject: [Buildroot] [PATCH v3 02/37] package/expedite: move to package
	directory
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add efl reverse dependencies.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                |  1 +
 package/efl/Config.in            |  1 -
 package/efl/expedite/Config.in   | 15 ---------------
 package/efl/expedite/expedite.mk | 20 --------------------
 package/expedite/Config.in       | 18 ++++++++++++++++++
 package/expedite/expedite.mk     | 20 ++++++++++++++++++++
 6 files changed, 39 insertions(+), 36 deletions(-)
 delete mode 100644 package/efl/expedite/Config.in
 delete mode 100644 package/efl/expedite/expedite.mk
 create mode 100644 package/expedite/Config.in
 create mode 100644 package/expedite/expedite.mk

diff --git a/package/Config.in b/package/Config.in
index 3794f44..fbe3d62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -66,6 +66,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/dropwatch/Config.in"
 	source "package/dstat/Config.in"
 	source "package/duma/Config.in"
+	source "package/expedite/Config.in"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3d31a26..cb91660 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -10,7 +10,6 @@ menuconfig BR2_PACKAGE_EFL
 
 if BR2_PACKAGE_EFL
 
-source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
deleted file mode 100644
index 1e12108..0000000
--- a/package/efl/expedite/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_EXPEDITE
-	bool "expedite"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBEET
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	help
-	  Expedite is the official Evas benchmark tool. It can test different
-	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
-	  DirectFB and so on. Its tests are quite extensive, trying to
-	  reproduce real world usage cases.
-
-comment "expedite needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
deleted file mode 100644
index 9b232f8..0000000
--- a/package/efl/expedite/expedite.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# expedite
-#
-################################################################################
-
-EXPEDITE_VERSION = 1.7.10
-EXPEDITE_SITE = http://download.enlightenment.org/releases
-EXPEDITE_LICENSE = BSD-2c
-EXPEDITE_LICENSE_FILES = COPYING
-
-EXPEDITE_DEPENDENCIES = libevas libeina libeet
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
-EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-endif
-
-$(eval $(autotools-package))
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
new file mode 100644
index 0000000..82bceb9
--- /dev/null
+++ b/package/expedite/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_EXPEDITE
+	bool "expedite"
+	select BR2_PACKAGE_EFL
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBEET
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	help
+	  Expedite is the official Evas benchmark tool. It can test different
+	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
+	  DirectFB and so on. Its tests are quite extensive, trying to
+	  reproduce real world usage cases.
+
+comment "expedite needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
new file mode 100644
index 0000000..9b232f8
--- /dev/null
+++ b/package/expedite/expedite.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# expedite
+#
+################################################################################
+
+EXPEDITE_VERSION = 1.7.10
+EXPEDITE_SITE = http://download.enlightenment.org/releases
+EXPEDITE_LICENSE = BSD-2c
+EXPEDITE_LICENSE_FILES = COPYING
+
+EXPEDITE_DEPENDENCIES = libevas libeina libeet
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
+EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+endif
+
+$(eval $(autotools-package))
-- 
2.4.3
