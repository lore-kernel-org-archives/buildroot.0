From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:34:13 +0100
Subject: [Buildroot] [git commit] package/spice: enable client
Message-ID: <20121216204048.C4EFC9A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a872142c2f25761cbcfe024d4b9f0072f2639cea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |   13 +++++++++++++
 package/spice/spice.mk  |    8 +++++++-
 2 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 086b1bc..aacc779 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -21,3 +21,16 @@ config BR2_PACKAGE_SPICE
 	  This package implements the server-part of Spice.
 	  
 	  http://www.spice-space.org/
+
+if BR2_PACKAGE_SPICE
+
+comment "client depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_SPICE_CLIENT
+	bool "Enable client"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+
+endif # BR2_PACKAGE_SPICE
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 2752b8a..2f7fc20 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -26,12 +26,18 @@ SPICE_CONF_OPT =            \
   --disable-gui             \
   --disable-opengl          \
   --disable-smartcard       \
-  --disable-client          \
   --disable-automated-tests \
   --without-sasl            \
 
 SPICE_DEPENDENCIES += host-pkgconf
 
+ifeq ($(BR2_PACKAGE_SPICE_CLIENT),y)
+SPICE_CONF_OPT += --enable-client
+SPICE_DEPENDENCIES += xlib_libXfixes xlib_libXrandr
+else
+SPICE_CONF_OPT += --disable-client
+endif
+
 SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
