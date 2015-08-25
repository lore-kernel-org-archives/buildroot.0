From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 16:35:15 +0200
Subject: [Buildroot] [git commit] libgudev: New package
Message-ID: <20150825182425.DE2FA81E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b935d49a91a31d42a88eba5997796f131256e371
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As libgudev recently was split from the main systemd/udev source, this
library is now required to build certain packages.

This library is only relevant to systemd, as the code it contains is
still contained in eudev.

[Thomas:
 - don't show the dependency comment when systemd is not available,
   since libgudev is anyway useless when you're not using systemd.
 - fix the license, it's LGPLv2.1+ and not GPLv2+
 - remove useless empty lines in the .mk file.]

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libgudev/Config.in   |   22 ++++++++++++++++++++++
 package/libgudev/libgudev.mk |   15 +++++++++++++++
 package/systemd/Config.in    |    1 -
 4 files changed, 38 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 35fe026..eb28ccb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -853,6 +853,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
new file mode 100644
index 0000000..9b64ffc
--- /dev/null
+++ b/package/libgudev/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBGUDEV
+	bool "libgudev"
+	depends on BR2_INIT_SYSTEMD
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  This library provides GObject bindings for libudev.  It was
+	  originally part of udev-extras, then udev, then systemd.
+	  It's now a project on its own. Required for building some
+	  programs that use udev, when using systemd.
+
+	  When systemd is not used, libgudev is directly provided by
+	  eudev.
+
+	  https://wiki.gnome.org/Projects/libgudev
+
+comment "libgudev needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_INIT_SYSTEMD
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
new file mode 100644
index 0000000..dce9cd8
--- /dev/null
+++ b/package/libgudev/libgudev.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libgudev
+#
+################################################################################
+
+LIBGUDEV_VERSION = 230
+LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
+LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
+LIBGUDEV_INSTALL_STAGING = YES
+LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
+LIBGUDEV_LICENSE = LGPLv2.1+
+LIBGUDEV_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 510badd..f7fc3bb 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -55,7 +55,6 @@ config BR2_PACKAGE_SYSTEMD
 
 	  The selection of other packages will enable some features:
 
-	  - libglib2 package will add support for gudev.
 	  - acl package will add support for multi-seat.
 
 	  http://freedesktop.org/wiki/Software/systemd
