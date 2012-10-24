From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:38 +0200
Subject: [Buildroot] [PATCH 12/47] package/spice: enable client
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-13-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/spice/Config.in |   12 ++++++++++++
 package/spice/spice.mk  |    8 +++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index ced3ec7..e906acf 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -21,3 +21,15 @@ config BR2_PACKAGE_SPICE
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
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+
+endif # BR2_PACKAGE_SPICE
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 37b1bff..de7bf71 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -26,10 +26,16 @@ SPICE_CONF_OPT =            \
   --disable-gui             \
   --disable-opengl          \
   --disable-smartcard       \
-  --disable-client          \
   --disable-automated-tests \
   --without-sasl            \
 
+ifeq ($(BR2_PACKAGE_SPICE_CLIENT),y)
+SPICE_CONF_OPT += --enable-client
+SPICE_DEPENDENCIES += xlib_libXrandr xlib_libXfixes
+else
+SPICE_CONF_OPT += --disable-client
+endif
+
 SPICE_DEPENDENCIES += host-pkg-config
 
 SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-- 
1.7.2.5
