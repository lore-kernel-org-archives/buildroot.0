From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 10:15:45 -0300
Subject: [Buildroot] [PATCH v2 3/3] granite: new package
In-Reply-To: <1457529345-24041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457529345-24041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457529345-24041-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
v2: no changes

 package/Config.in            |  1 +
 package/granite/Config.in    | 18 ++++++++++++++++++
 package/granite/granite.hash |  4 ++++
 package/granite/granite.mk   | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/granite/Config.in
 create mode 100644 package/granite/granite.hash
 create mode 100644 package/granite/granite.mk

diff --git a/package/Config.in b/package/Config.in
index 810e04f..386c1e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -887,6 +887,7 @@ menu "Graphics"
 	source "package/gdk-pixbuf/Config.in"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
+	source "package/granite/Config.in"
 	source "package/graphite2/Config.in"
 	source "package/gtkmm3/Config.in"
 	source "package/harfbuzz/Config.in"
diff --git a/package/granite/Config.in b/package/granite/Config.in
new file mode 100644
index 0000000..fef5e27
--- /dev/null
+++ b/package/granite/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GRANITE
+	bool "granite"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBGEE
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  An extension to GTK+ that provides several useful widgets and
+	  classes to ease application development.
+
+	  https://launchpad.net/granite
+
+comment "granite needs libgtk3 and a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/granite/granite.hash b/package/granite/granite.hash
new file mode 100644
index 0000000..5ce95e6
--- /dev/null
+++ b/package/granite/granite.hash
@@ -0,0 +1,4 @@
+# From https://launchpad.net/granite/0.3/0.3.1/+download/granite-0.3.1.tar.xz/+md5
+md5	4297d4fcec8cfe2e08b460a45c779bbe	granite-0.3.1.tar.xz
+# Calculated based on the hash above
+sha256	8ec1d61f9aba75f1b3a745e721288b0dfb34cb11d1307be80cef7b0571c2dec6	granite-0.3.1.tar.xz
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
new file mode 100644
index 0000000..dd5a09e
--- /dev/null
+++ b/package/granite/granite.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# granite
+#
+################################################################################
+
+GRANITE_VERSION_MAJOR = 0.3
+GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).1
+GRANITE_SITE = https://launchpad.net/granite/$(GRANITE_VERSION_MAJOR)/$(GRANITE_VERSION)/+download
+GRANITE_SOURCE = granite-$(GRANITE_VERSION).tar.xz
+GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
+GRANITE_INSTALL_STAGING = YES
+GRANITE_LICENSE = LGPLv3+
+GRANITE_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
2.4.10
