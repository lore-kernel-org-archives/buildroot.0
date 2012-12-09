From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:02 +0100
Subject: [Buildroot] [PATCH 29/51] package/qemu: add VNC TLS-encryption
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-30-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only TLS is supported, as buildroot has no package for the SASL library.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   11 +++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index c52568c..c85568d 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -97,6 +97,17 @@ config BR2_PACKAGE_QEMU_VNC_JPEG
 	depends on BR2_PACKAGE_QEMU_VNC
 	select BR2_PACKAGE_JPEG
 
+# TLS does not work with static link, because the gnutls .pc is missing a
+# dependency on libintl... :-(
+config BR2_PACKAGE_QEMU_VNC_TLS
+	bool "TLS encryption"
+	depends on BR2_PACKAGE_QEMU_VNC
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_GNUTLS
+
+comment "VNC TLS encryption does not work for static link"
+    depends on BR2_PACKAGE_QEMU_VNC && BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
 	select BR2_PACKAGE_SDL
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2513109..eb95611 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -134,6 +134,13 @@ else
 QEMU_OPTS += --disable-vnc-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VNC_TLS),y)
+QEMU_OPTS += --enable-vnc-tls
+QEMU_DEPENDENCIES += gnutls
+else
+QEMU_OPTS += --disable-vnc-tls
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
 QEMU_DEPENDENCIES += sdl
@@ -165,7 +172,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-vnc-tls                   \
 	        --disable-vnc-sasl                  \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
-- 
1.7.2.5
