From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 15 Sep 2015 13:34:41 +0530
Subject: [Buildroot] [PATCH v2 3/3] gupnp-av: new package
In-Reply-To: <1442304281-16222-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442304281-16222-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1442304281-16222-4-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GUPnP A/V reference manual https://developer.gnome.org/gupnp-av/
says latest available stable version is 0.11.2 but there are
couple of bug fixes releases after that in same series. It looks
like manual is not up-to-date. Use latest version 0.11.6
of series 0.11 instead.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Changes v1 -> v2:
	- gupnp also needs wchar, threads and MMU so add it to list in comment
	- add <PKG>-VERSION_MAJOR variable (suggested by Vincent Olivert Riera)
---
 package/Config.in              |  1 +
 package/gupnp-av/Config.in     | 17 +++++++++++++++++
 package/gupnp-av/gupnp-av.hash |  2 ++
 package/gupnp-av/gupnp-av.mk   | 16 ++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/gupnp-av/Config.in
 create mode 100644 package/gupnp-av/gupnp-av.hash
 create mode 100644 package/gupnp-av/gupnp-av.mk

diff --git a/package/Config.in b/package/Config.in
index 165d00f..4e69c8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -983,6 +983,7 @@ menu "Networking"
 	source "package/glib-networking/Config.in"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
+	source "package/gupnp-av/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
diff --git a/package/gupnp-av/Config.in b/package/gupnp-av/Config.in
new file mode 100644
index 0000000..5320b82
--- /dev/null
+++ b/package/gupnp-av/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GUPNP_AV
+	bool "gupnp-av"
+	depends on BR2_USE_WCHAR # glib2, gupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, gupnp
+	depends on BR2_USE_MMU # glib2, gupnp
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GUPNP
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GUPnP-AV is a collection of helpers for building AV (audio/video)
+	  applications using GUPnP.
+
+	  http://www.gupnp.org/
+
+comment "gupnp-av needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
new file mode 100644
index 0000000..0101ed4
--- /dev/null
+++ b/package/gupnp-av/gupnp-av.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.11/gupnp-av-0.11.6.sha256sum:
+sha256 401991336babb18c4ebed16e75e0b4d3e5848cff7bb878bbfd54a5d15203c4cc gupnp-av-0.11.6.tar.xz
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
new file mode 100644
index 0000000..6360c93
--- /dev/null
+++ b/package/gupnp-av/gupnp-av.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gupnp-av
+#
+################################################################################
+
+GUPNP_AV_VERSION_MAJOR = 0.11
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).6
+GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
+GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
+GUPNP_AV_LICENSE = LGPLv2+
+GUPNP_AV_LICENSE_FILES = COPYING
+GUPNP_AV_INSTALL_STAGING = YES
+GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
+
+$(eval $(autotools-package))
-- 
1.9.1
