From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:24:39 +0100
Subject: [Buildroot] [git commit] package/supertuxkart: bump to version v1.1
Message-ID: <20200111141444.6869D8A2E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=318d7765264fbd24f3a1bae77a27041ab8e7d9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add harfbuzz and fribifi dependencies for text handling in STK [1].
- Fribidi is now mandatory.
- Add optional support for sqlite3 (manage server stats and ban list) [2].
- Add an option to use openssl instead of nettle for cryptography [3].
- Use bundled libmcpp library since there is no such package in Buildroot.
- Add license file hash.

[1] https://github.com/supertuxkart/stk-code/commit/43d322c6341fcd999cbd14a903ff2e56b88abc5b
[2] https://github.com/supertuxkart/stk-code/commit/bcc3aef4c87d8326bcb4206dd4887a38064cc57a
[3] https://github.com/supertuxkart/stk-code/commit/173e3907556070f07e1c77ad5ae20d56dad757c2

See:
https://github.com/supertuxkart/stk-code/blob/1.1/CHANGELOG.md
http://blog.supertuxkart.net/2020/01/supertuxkart-11-released.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supertuxkart/Config.in         |  4 +++-
 package/supertuxkart/supertuxkart.hash | 11 +++++++----
 package/supertuxkart/supertuxkart.mk   | 31 +++++++++++++++++++++----------
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 21093cc085..fcb27445da 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -11,15 +11,17 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ENET
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_NETTLE
+	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index dc65c700b9..9654ad24a2 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,5 +1,8 @@
 # Locally computed
-sha256	6d88f43f0de5202766ba305c87e3d9843103e81d31b7193059286098d2a5d980  supertuxkart-1.0-src.tar.xz
-# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/1.0/
-sha1	cd270c851c5b15fb69c6e78e9824d87187c1f801  supertuxkart-1.0-src.tar.xz
-md5	3059ea9c146b50f40f2b59a606da0fc0  supertuxkart-1.0-src.tar.xz
+sha256	e9b02b0b11ab68aacaec38306903feffe59a501224805cd3645cebf10e880ae8  supertuxkart-1.1-src.tar.xz
+# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/1.1/
+sha1	68be26f4b15d30dede26563cbcc6de999036c5e0  supertuxkart-1.1-src.tar.xz
+md5	731569c58428f32a0e46943fad7ba1e3  supertuxkart-1.1-src.tar.xz
+
+# Locally computed
+sha256	d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 02558df800..4427ddd1ee 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.0
+SUPERTUXKART_VERSION = 1.1
 SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
 SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
 
@@ -18,8 +18,10 @@ SUPERTUXKART_DEPENDENCIES = \
 	host-pkgconf \
 	freetype \
 	enet \
+	harfbuzz \
 	jpeg \
 	libcurl \
+	libfribidi \
 	libgl \
 	libglew \
 	libglu \
@@ -27,7 +29,6 @@ SUPERTUXKART_DEPENDENCIES = \
 	libpng \
 	libsquish \
 	libvorbis \
-	nettle \
 	openal \
 	xlib_libXrandr \
 	zlib
@@ -38,14 +39,8 @@ SUPERTUXKART_DEPENDENCIES = \
 SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 	-DBUILD_RECORDER=OFF \
 	-DUSE_SYSTEM_GLEW=ON \
-	-DUSE_SYSTEM_ENET=ON
-
-ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-SUPERTUXKART_DEPENDENCIES += libfribidi
-SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=ON
-else
-SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=OFF
-endif
+	-DUSE_SYSTEM_ENET=ON \
+	-DUSE_SYSTEM_SQUISH=ON
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 SUPERTUXKART_DEPENDENCIES += bluez5_utils
@@ -55,4 +50,20 @@ else
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
 endif
 
+# Prefer openssl (the default) over nettle.
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SUPERTUXKART_DEPENDENCIES += openssl
+SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=ON
+else
+SUPERTUXKART_DEPENDENCIES += nettle
+SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+SUPERTUXKART_DEPENDENCIES += sqlite
+SUPERTUXKART_CONF_OPTS += -DUSE_SQLITE3=ON
+else
+SUPERTUXKART_CONF_OPTS += -DUSE_SQLITE3=OFF
+endif
+
 $(eval $(cmake-package))
