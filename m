From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:05:28 +0100
Subject: [Buildroot] [git commit] pulseview: new package
Message-ID: <20150320220712.3985F804EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c99144b31730fc58ef6831c231a09c3fe1da75f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Fix dependency on C++, it should use BR2_INSTALL_LIBSTDCPP and not
    BR2_TOOLCHAIN_BUILDROOT_CXX.
  - Fix comment dependency, there should be an || between all the
    toolchain dependencies. Also fix the dependency on Qt5 for the
    comment, which was in the wrong way: the comment was displayed
    only when Qt5 was disabled.
  - Use -DDISABLE_WERROR=TRUE instead of -DDISABLE_WERROR=y, since
    TRUE/FALSE are normally the accepted values for CMake options.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/pulseview/Config.in    |   27 +++++++++++++++++++++++++++
 package/pulseview/pulseview.mk |   24 ++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c938326..93fde92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ endif
 	source "package/pifmrds/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
+	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
new file mode 100644
index 0000000..de899af
--- /dev/null
+++ b/package/pulseview/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_PULSEVIEW
+	bool "pulseview"
+	select BR2_PACKAGE_LIBSIGROK
+	select BR2_PACKAGE_LIBSIGROKCXX
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	# libsigrok->libglib2:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  PulseView is a Qt based logic analyzer, oscilloscope
+	  and MSO GUI for sigrok.
+
+	  http://sigrok.org/wiki/PulseView
+
+comment "pulseview needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_QT5
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
new file mode 100644
index 0000000..9e22d3f
--- /dev/null
+++ b/package/pulseview/pulseview.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# pulseview
+#
+################################################################################
+
+# TODO Pulseview can be built and linked against Qt4 as well.
+
+# No https access on upstream git
+PULSEVIEW_SITE = git://sigrok.org/pulseview
+PULSEVIEW_VERSION = 19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81
+PULSEVIEW_LICENSE = GPLv3+
+PULSEVIEW_LICENSE_FILES = COPYING
+PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
+PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=TRUE
+
+ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
+PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=TRUE
+PULSEVIEW_DEPENDENCIES += libsigrokdecode
+else
+PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=FALSE
+endif
+
+$(eval $(cmake-package))
