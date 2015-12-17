From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:52:55 +0100
Subject: [Buildroot] [git commit] package/efl/libefl: add harfbuzz dependency
Message-ID: <20151217230816.127A3803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da02d8fc67d10a1201e341bf552a2f2dbac1c77a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Harfbuzz allow to enable complex text shaping and layouting support in
efl libraries.

Also, it one of the "highly recommended" dependencies according to the
README but disabling it doesn't need the
--enable-i-really-know-what-i-am-doing... option.  That's why harfbuzz
is not added to BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libefl/libefl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 615968e..184604b 100644
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
@@ -45,7 +44,6 @@ LIBEFL_CONF_OPTS = \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
 	--disable-fb \
-	--disable-harfbuzz \
 	--disable-image-loader-jp2k \
 	--disable-image-loader-webp \
 	--disable-sdl \
@@ -109,6 +107,13 @@ else
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
