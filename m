From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:47:00 +0200
Subject: [Buildroot] [git commit] directfb: mark as available only for gcc
	>= 4.5
Message-ID: <20150910122136.747AC81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=113dc8f35a8be183d8eff365f8ee6fd8cc467590
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new DirectFB version does not build with gcc 4.3 from the Blackfin
toolchain. One of the reason is that va_copy has some issues, which
were fixed in gcc 4.4.0
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36799). There are also
some other issues, which were fixed by a patch proposed by Peter
Seiderer at
http://lists.busybox.net/pipermail/buildroot/2015-February/120281.html.

However, it probably doesn't make a lot of sense to carry patches that
are not upstream for such old compilers. Instead, this commit takes
the action of making DirectFB available only on toolchains using gcc
>= 4.5, which was tested with the Arago toolchain. gcc 4.4 could
potentially work, but wasn't tested (it is no longer supported by the
internal toolchain backend, and we don't have any toolchain based on
gcc 4.4), so we take the safe decision of requiring at least gcc 4.5.

[Peter: add comment explaining toolchain dependenc as suggested by Vincente]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in                    |    5 +++--
 package/gstreamer/gst-plugins-bad/Config.in   |    4 ++++
 package/gstreamer1/gst1-plugins-bad/Config.in |    4 ++++
 package/qt5/qt5base/Config.in                 |    4 ++++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 2b0d5c7..3ab40f9 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -157,5 +158,5 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 1b465b2..339c6a6 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -263,6 +263,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	select BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # directfb
+
+comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d268fc6..590a9cf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -495,6 +495,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	select BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # directfb
+
+comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 106517f..603df45 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -179,6 +179,10 @@ config BR2_PACKAGE_QT5BASE_LINUXFB
 config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "directfb support"
 	select BR2_PACKAGE_DIRECTFB
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # directfb
+
+comment "directfb needs a toolchain w/ gcc >= 4.5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
