From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:18 +0200
Subject: [Buildroot] [PATCH 09/30] package/qemu: add VNC TLS-encryption
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <a7745fcf104bf1c4f88914f7553cb00aef73c67c.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only TLS is supported, as buildroot has no package for the SASL library.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 11 +++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index beb5fe8..9c92388 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -87,6 +87,17 @@ config BR2_PACKAGE_QEMU_VNC_JPEG
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
index 715292a..10022cf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -136,6 +136,13 @@ else
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
@@ -161,7 +168,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-vnc-tls                   \
 	        --disable-vnc-sasl                  \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
-- 
1.9.1
