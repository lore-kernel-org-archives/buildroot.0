From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:40:12 +0200
Subject: [Buildroot] [git commit] package/wireshark: fix kconfig dependencies
Message-ID: <20161020194031.793468023A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=151c4ba71abbaf6b3f40fae1f177d7e322e483ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fa6feff (wireshark: needs the qt5tools lrelease utility)
introduced a circular dependency chain in Kconfig:

    package/qt5/qt5base/Config.in:118:error: recursive dependency detected!
    package/qt5/qt5base/Config.in:118:      symbol BR2_PACKAGE_QT5BASE_GUI is selected by BR2_PACKAGE_QT5TOOLS_PIXELTOOL
    package/qt5/qt5tools/Config.in:19:      symbol BR2_PACKAGE_QT5TOOLS_PIXELTOOL depends on BR2_PACKAGE_QT5TOOLS
    package/qt5/qt5tools/Config.in:1:       symbol BR2_PACKAGE_QT5TOOLS is selected by BR2_PACKAGE_QT5BASE_WIDGETS
    package/qt5/qt5base/Config.in:131:      symbol BR2_PACKAGE_QT5BASE_WIDGETS is selected by BR2_PACKAGE_QT5X11EXTRAS
    package/qt5/qt5x11extras/Config.in:1:   symbol BR2_PACKAGE_QT5X11EXTRAS depends on BR2_PACKAGE_QT5BASE_XCB
    package/qt5/qt5base/Config.in:186:      symbol BR2_PACKAGE_QT5BASE_XCB depends on BR2_PACKAGE_QT5BASE_GUI

Fix that by dropping the select on the Qt5Tools, and introduce an
intermediate kconfig-level variable to represent the new condition, to
simplify the .mk file.

That would make the condition for enabling/disabling the GUI to be a
little bit more complex by adding yet another (long-ish) variable.

So we also introduce an intermediate kconfig-level variable that
represent the condition to enable the GUI.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Tested-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/Config.in    | 15 +++++++++++++--
 package/wireshark/wireshark.mk |  4 ++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 959fb5b..b5a874b 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_QT5TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
@@ -12,6 +10,19 @@ config BR2_PACKAGE_WIRESHARK
 
 	  https://www.wireshark.org
 
+config BR2_PACKAGE_WIRESHARK_QT
+	bool
+	default y
+	depends on BR2_PACKAGE_QT5BASE_WIDGETS
+	depends on BR2_PACKAGE_QT5TOOLS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
+
+config BR2_PACKAGE_WIRESHARK_GUI
+	bool
+	default y if BR2_PACKAGE_LIBGTK2
+	default y if BR2_PACKAGE_LIBGTK3
+	default y if BR2_PACKAGE_WIRESHARK_QT
+
 comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 593b196..227ead6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -38,7 +38,7 @@ WIRESHARK_CONF_OPTS += --with-gtk=no
 endif
 
 # Qt4 needs accessibility, we don't support it
-ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
+ifeq ($(BR2_PACKAGE_WIRESHARK_QT),y)
 WIRESHARK_CONF_OPTS += --with-qt=5
 WIRESHARK_DEPENDENCIES += qt5base qt5tools
 WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
@@ -52,7 +52,7 @@ WIRESHARK_CONF_OPTS += --with-qt=no
 endif
 
 # No GUI at all
-ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS),)
+ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
