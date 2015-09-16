From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:50:32 +0200
Subject: [Buildroot] [git commit] gupnp: new package
Message-ID: <20150916205246.8A6BA8013C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3390492cd89e53e741b28dfce7ecc616cbd1fb16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/gupnp/Config.in  |   20 ++++++++++++++++++++
 package/gupnp/gupnp.hash |    2 ++
 package/gupnp/gupnp.mk   |   16 ++++++++++++++++
 4 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2aeed85..1712bf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -982,6 +982,7 @@ menu "Networking"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/gssdp/Config.in"
+	source "package/gupnp/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
new file mode 100644
index 0000000..a5ecab7
--- /dev/null
+++ b/package/gupnp/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_GUPNP
+	bool "gupnp"
+	depends on BR2_USE_WCHAR # glib2, gssdp, util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, gssdp
+	depends on BR2_USE_MMU # glib2, gssdp
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GSSDP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  GUPnP implements the UPnP specification: resource announcement
+	  and discovery, description, control, event notification, and
+	  presentation.
+
+	  http://www.gupnp.org/
+
+comment "gupnp needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
new file mode 100644
index 0000000..597cb42
--- /dev/null
+++ b/package/gupnp/gupnp.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.19/gupnp-0.19.4.sha256sum:
+sha256 3c1fb2873cb2f8f152b9d49598d55b15b8f3c1096a03ade46ce69694798fb243  gupnp-0.19.4.tar.xz
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
new file mode 100644
index 0000000..85faaa4
--- /dev/null
+++ b/package/gupnp/gupnp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gupnp
+#
+################################################################################
+
+GUPNP_VERSION_MAJOR = 0.19
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
+GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
+GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
+GUPNP_LICENSE = LGPLv2+
+GUPNP_LICENSE_FILES = COPYING
+GUPNP_INSTALL_STAGING = YES
+GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
+
+$(eval $(autotools-package))
