From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 17:56:16 +0100
Subject: [Buildroot] [PATCH 09/19] package/spice: enable client
In-Reply-To: <cover.1355676845.git.yann.morin.1998@free.fr>
References: <cover.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <0be08def92b0e0aee8dab2f9fbea788dcbd7ea28.1355676845.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 
-- 
1.7.2.5
