From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 21:55:20 +0100
Subject: [Buildroot] [git commit] package/exempi: new package
Message-ID: <20181230205055.E8C3B8155D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133f85f87dc8337586a2106e32106278fb2498fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
[Thomas:
 - add missing dependencies on expat and zlib
 - add missing depends on C++ and dynamic library support, and the
   corresponding Config.in comment
 - add the missing entry to the DEVELOPERS file
 - add the missing hash for the license file
 - adjust indentation in the Config.in file
 - use --disable-unittest instead of --enable-unittest=no.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/exempi/Config.in   | 14 ++++++++++++++
 package/exempi/exempi.hash |  3 +++
 package/exempi/exempi.mk   | 16 ++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f24775d5e..4aed6fc4a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -959,6 +959,9 @@ F:	package/angularjs/
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
+N:	Ilya Averyanov <averyanovin@gmail.com>
+F:	package/exempi/
+
 N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
 
diff --git a/package/Config.in b/package/Config.in
index eaf3c046bf..733c7e6764 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1249,6 +1249,7 @@ menu "Graphics"
 	source "package/cairomm/Config.in"
 	source "package/chipmunk/Config.in"
 	source "package/exiv2/Config.in"
+	source "package/exempi/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
 	source "package/freetype/Config.in"
diff --git a/package/exempi/Config.in b/package/exempi/Config.in
new file mode 100644
index 0000000000..b3ec2c513d
--- /dev/null
+++ b/package/exempi/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EXEMPI
+	bool "exempi"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_ZLIB
+	help
+	  Exempi is an implementation of XMP (Extensible Metadata
+	  Platform). Version 2.x is based on Adobe XMP SDK.
+
+	  http://libopenraw.freedesktop.org/wiki/Exempi
+
+comment "exempi needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || BR2_INSTALL_LIBSTDCPP
diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
new file mode 100644
index 0000000000..562a4d9b75
--- /dev/null
+++ b/package/exempi/exempi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 406185feb88e84ea1d4b4251370be2991205790d7113a7e28e192ff46a4f221e  exempi-2.4.5.tar.bz2
+sha256 3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
new file mode 100644
index 0000000000..73906e8e2b
--- /dev/null
+++ b/package/exempi/exempi.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# exempi
+#
+################################################################################
+
+EXEMPI_VERSION = 2.4.5
+EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
+EXEMPI_SITE = https://libopenraw.freedesktop.org/download
+EXEMPI_INSTALL_STAGING = YES
+EXEMPI_CONF_OPTS = --enable-unittest=no
+EXEMPI_DEPENDENCIES = host-pkgconf expat zlib
+EXEMPI_LICENSE = BSD-3-Clause
+EXEMPI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
