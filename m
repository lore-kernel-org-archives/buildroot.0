From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] libgtk2: add option to install the
	gtk-demo program
Message-ID: <20110518180431.A1F7583564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0710636813dfceea3299b40983863fb0fbc0f566
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/Config.in  |    7 +++++++
 package/libgtk2/libgtk2.mk |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 38b0b47..efaf12f 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -16,5 +16,12 @@ config BR2_PACKAGE_LIBGTK2
 
 	  http://www.gtk.org/
 
+config BR2_PACKAGE_LIBGTK2_DEMO
+	bool "Install libgtk2 demo program"
+	depends on BR2_PACKAGE_LIBGTK2
+	help
+	  The GTK+ source base contains a gtk-demo program. This
+	  option allows to install this program to the target.
+
 comment "libgtk2 requires a toolchain with WCHAR and C++ support"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 3586c86..169ef97 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -114,11 +114,13 @@ else
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK2_DEMO),)
 define LIBGTK2_POST_INSTALL_TWEAKS
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 endef
 
 LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK2_POST_INSTALL_TWEAKS
+endif
 
 # We do not build a full version of libgtk2 for the host, because that
 # requires compiling Cairo, Pango, ATK and X.org for the
-- 
1.7.3.4
