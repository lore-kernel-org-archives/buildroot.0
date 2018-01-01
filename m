From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 12:32:55 +0100
Subject: [Buildroot] [git commit] gconf: new package
Message-ID: <20180101113320.166048364F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa6605f6f84518cc27d492c337350bb088f86683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Thomas:
 - propagate dependencies of selected packages in Config.in
 - add missing Config.in comment about dependencies
 - add missing upstream URL in Config.in
 - add missing comment header in .mk file
 - remove --disable-nls from configuration options, it is taken care
   of by the package infrastructure
 - remove --disable-dependency-tracking, it is taken care of in the
   package infrastructure
 - add $(TARGET_NLS_DEPENDENCIES) to <pkg>_DEPENDENCIES, since gconf
   has optional NLS support
 - add host-intltool to <pkg>_DEPENDENCIES, since gconf needs
   intltool-update
 - fix license: it's LGPL-2.0+, not GPL-2.0.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/gconf/Config.in  | 19 +++++++++++++++++++
 package/gconf/gconf.hash |  4 ++++
 package/gconf/gconf.mk   | 16 ++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 829c2d6..8e3e6b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -844,6 +844,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/gconf/
 F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-websockets/
diff --git a/package/Config.in b/package/Config.in
index e6e37cf..b7ca5d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1456,6 +1456,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
diff --git a/package/gconf/Config.in b/package/gconf/Config.in
new file mode 100644
index 0000000..a682875
--- /dev/null
+++ b/package/gconf/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GCONF
+	bool "gconf"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GConf was a system used by the GNOME desktop environment for storing
+	  configuration settings for the desktop and applications. It is similar
+	  to the Windows Registry.
+
+	  https://projects.gnome.org/gconf/
+
+comment "gconf needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
new file mode 100644
index 0000000..24d0cf9
--- /dev/null
+++ b/package/gconf/gconf.hash
@@ -0,0 +1,4 @@
+# http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
+sha256 1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
+# License files, locally calculated
+sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
new file mode 100644
index 0000000..39df95f
--- /dev/null
+++ b/package/gconf/gconf.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gconf
+#
+################################################################################
+
+GCONF_VERSION = 3.2.6
+GCONF_SOURCE = GConf-${GCONF_VERSION}.tar.xz
+GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
+GCONF_CONF_OPTS = --disable-orbit
+GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
+	host-intltool $(TARGET_NLS_DEPENDENCIES)
+GCONF_LICENSE = LGPL-2.0+
+GCONF_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
