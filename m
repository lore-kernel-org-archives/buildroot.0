From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 00:23:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: enable systemd support
Message-ID: <1469226198-26474-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd it one of the "highly recommended" dependecies according to the
README [1] but disabling it doesn't need the
--enable-i-really-know-what-i-am-doing... option.

That's why BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG is not disabled when
systemd is not selected.

[1] https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.17#n489

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Tested with Qemu for x86_64 target with systemd + X11 server
---
 package/efl/efl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 18d409b..d404e71 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -25,7 +25,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # Configure options:
 # --disable-lua-old: build elua for the target.
 # --disable-sdl: disable sdl2 support.
-# --disable-systemd: disable systemd support.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
 # --with-opengl=none: disable opengl support.
 EFL_CONF_OPTS = \
@@ -34,7 +33,6 @@ EFL_CONF_OPTS = \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-lua-old \
 	--disable-sdl \
-	--disable-systemd \
 	--disable-xinput22 \
 	--with-opengl=none
 
@@ -57,6 +55,13 @@ else
 EFL_CONF_OPTS += --disable-libmount
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+EFL_CONF_OPTS += --enable-systemd
+EFL_DEPENDENCIES += systemd
+else
+EFL_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 EFL_CONF_OPTS += --enable-fontconfig
 EFL_DEPENDENCIES += fontconfig
-- 
2.5.5
