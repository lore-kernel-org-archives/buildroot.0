From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:23:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libupnp18: drop
 package
Message-ID: <20210128200123.D41D880415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27817eb999240460d43cb3dc12e7bb6dfc9d5dc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Drop libupnp18 as libupnp has been bumped to 1.14.x and 1.8.x will not
been fixed against CallStranger a.k.a. CVE-2020-12695

mpd and vlc are already compliant with libupnp 1.14.x (i.e those
packages use UpnpInit2 instead of the deprecated UpnpInit)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eddc9df972d0b13f451abc0be75f286a2fdb70f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 | 11 +++++++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/libupnp18/Config.in      | 16 ----------------
 package/libupnp18/libupnp18.hash |  5 -----
 package/libupnp18/libupnp18.mk   | 26 --------------------------
 package/mpd/Config.in            |  2 +-
 package/mpd/mpd.mk               |  2 +-
 package/vlc/vlc.mk               |  4 ++--
 9 files changed, 15 insertions(+), 53 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e04853aea4..59a37b708f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_LIBUPNP18
+	bool "libupnp18 package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  Version 1.8.x of libupnp (i.e. libupnp18) has been removed
+	  because it will never be fixed against CallStranger a.k.a.
+	  CVE-2020-12695. The libupnp package (which has been updated to
+	  version 1.14.x) has been selected instead.
+
+
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9446ed00fb..e642a0d1db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -847,7 +847,6 @@ F:	package/librsync/
 F:	package/libsoup/
 F:	package/libsoxr/
 F:	package/libupnp/
-F:	package/libupnp18/
 F:	package/libv4l/
 F:	package/libxslt/
 F:	package/mbedtls/
diff --git a/package/Config.in b/package/Config.in
index 958b9fb08e..0a3cda65f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1694,7 +1694,6 @@ menu "Networking"
 	source "package/libtorrent/Config.in"
 	source "package/libtorrent-rasterbar/Config.in"
 	source "package/libupnp/Config.in"
-	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
diff --git a/package/libupnp18/Config.in b/package/libupnp18/Config.in
deleted file mode 100644
index 58508e4e26..0000000000
--- a/package/libupnp18/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_LIBUPNP18
-	bool "libupnp18"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_LIBUPNP
-	help
-	  The portable SDK for UPnP(tm) Devices (libupnp) provides
-	  developers with an API and open source code for building
-	  control points, devices, and bridges that are compliant with
-	  Version 1.0 of the Universal Plug and Play Device Architecture
-	  Specification
-
-	  http://pupnp.sourceforge.net/
-
-comment "libupnp18 needs a toolchain w/ threads"
-	depends on !BR2_PACKAGE_LIBUPNP
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
deleted file mode 100644
index 68aee9ba62..0000000000
--- a/package/libupnp18/libupnp18.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.6/libupnp-1.8.6.tar.bz2.sha1
-sha1 6132a949d7536dac835172609d1def1e7f2bd232  libupnp-1.8.6.tar.bz2
-# Locally computed:
-sha256	65faf240f8ccee50cc0e7fe7fb21dcd79f743fc227a9b652b091f50f6956c2c7	libupnp-1.8.6.tar.bz2
-sha256	c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3	COPYING
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
deleted file mode 100644
index f73c656831..0000000000
--- a/package/libupnp18/libupnp18.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# libupnp18
-#
-################################################################################
-
-LIBUPNP18_VERSION = 1.8.6
-LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
-LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
-LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
-LIBUPNP18_INSTALL_STAGING = YES
-LIBUPNP18_LICENSE = BSD-3-Clause
-LIBUPNP18_LICENSE_FILES = COPYING
-LIBUPNP18_DEPENDENCIES = host-pkgconf
-
-# Bind the internal miniserver socket with reuseaddr to allow clean restarts.
-LIBUPNP18_CONF_OPTS += --enable-reuseaddr
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBUPNP18_CONF_OPTS += --enable-open-ssl
-LIBUPNP18_DEPENDENCIES += openssl
-else
-LIBUPNP18_CONF_OPTS += --disable-open-ssl
-endif
-
-$(eval $(autotools-package))
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e9e7b83cbd..b61e7bd8c7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -350,7 +350,7 @@ config BR2_PACKAGE_MPD_TCP
 config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_MPD_CURL
 	help
 	  Enable MPD UPnP client support.
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b14af30e15..ae933cac53 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -269,7 +269,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
 MPD_DEPENDENCIES += \
 	expat \
-	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
+	libupnp
 MPD_CONF_OPTS += -Dupnp=enabled
 else
 MPD_CONF_OPTS += -Dupnp=disabled
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 51c92f54c7..1dd64945a8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -382,9 +382,9 @@ else
 VLC_CONF_OPTS += --disable-theora
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP)$(BR2_PACKAGE_LIBUPNP18),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
 VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
+VLC_DEPENDENCIES += libupnp
 else
 VLC_CONF_OPTS += --disable-upnp
 endif
