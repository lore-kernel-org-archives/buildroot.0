From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 14 Sep 2015 15:51:33 +0530
Subject: [Buildroot] [PATCH 1/3] gssdp: new package
In-Reply-To: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1442226095-4316-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/Config.in        |  1 +
 package/gssdp/Config.in  | 15 +++++++++++++++
 package/gssdp/gssdp.hash |  2 ++
 package/gssdp/gssdp.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/gssdp/Config.in
 create mode 100644 package/gssdp/gssdp.hash
 create mode 100644 package/gssdp/gssdp.mk

diff --git a/package/Config.in b/package/Config.in
index 030477a..25cc6df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,6 +981,7 @@ menu "Networking"
 	source "package/fmlib/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/gssdp/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
new file mode 100644
index 0000000..fb8a888
--- /dev/null
+++ b/package/gssdp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GSSDP
+	bool "gssdp"
+	depends on BR2_USE_WCHAR # libsoup and glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  GSSDP implements resource discovery and announcement over SSDP.
+
+	  http://www.gupnp.org
+
+comment "gssdp needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
new file mode 100644
index 0000000..09b8532
--- /dev/null
+++ b/package/gssdp/gssdp.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.13/gssdp-0.13.2.sha256sum:
+sha256 8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce  gssdp-0.13.2.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
new file mode 100644
index 0000000..d4b1db1
--- /dev/null
+++ b/package/gssdp/gssdp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# gssdp
+#
+################################################################################
+
+GSSDP_VERSION = 0.13.2
+GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
+GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/0.13
+GSSDP_LICENSE = LGPLv2+
+GSSDP_LICENSE_FILES = COPYING
+GSSDP_INSTALL_STAGING = YES
+GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
+
+$(eval $(autotools-package))
-- 
1.9.1
