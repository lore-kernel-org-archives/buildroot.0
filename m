From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:43 +0100
Subject: [Buildroot] [PATCH v6 07/33] package/efl/libefl: add harfbuzz
	dependency
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-8-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Harfbuzz allow to enable complex text shaping and layouting
support in efl libraries.

Also, it one of the "highly recommended" dependecies
according to the README but disabling it doesn't need
the --enable-i-really-know-what-i-am-doing... option.
That's why harfbuzz is not added to
BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: use --enable/disable options
v4: rename to libefl
    improve commit log.
---
 package/efl/libefl/libefl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 7bd3820..80eb3d8 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -31,7 +31,6 @@ LIBEFL_GETTEXTIZE = YES
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-fb: disable frame buffer support.
-# --disable-harfbuzz: disable harfbuzz support.
 # --disable-image-loader-jp2k: disable JPEG 2000 support.
 # --disable-image-loader-webp: disable webp support.
 # --disable-sdl: disable sdl2 support.
@@ -46,7 +45,6 @@ LIBEFL_CONF_OPTS = \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
 	--disable-fb \
-	--disable-harfbuzz \
 	--disable-image-loader-jp2k \
 	--disable-image-loader-webp \
 	--disable-sdl \
@@ -110,6 +108,13 @@ else
 LIBEFL_CONF_OPTS += --disable-pulseaudio
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+LIBEFL_DEPENDENCIES += harfbuzz
+LIBEFL_CONF_OPTS += --enable-harfbuzz
+else
+LIBEFL_CONF_OPTS += --disable-harfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 LIBEFL_DEPENDENCIES += tslib
 LIBEFL_CONF_OPTS += --enable-tslib
-- 
2.4.3
