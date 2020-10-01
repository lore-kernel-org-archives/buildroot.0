From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 22:57:20 +0200
Subject: [Buildroot] [git commit] package/freetype: add harfbuzz optional
 dependency
Message-ID: <20201001204733.594EB836D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=939e714393e9d7f60f3a198d831608b08a25662e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

harfbuzz is an optional dependency (enabled by default) since version
2.5.3 and
https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=86026a47b345a8c254dd5e6be77bf116737cdafb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freetype/freetype.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 428531ed08..b0aba78c51 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,7 +15,11 @@ FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
-HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
+HOST_FREETYPE_CONF_OPTS = \
+	--without-bzip2 \
+	--without-harfbuzz \
+	--without-png \
+	--without-zlib
 
 # since 2.9.1 needed for freetype-config install
 FREETYPE_CONF_OPTS += --enable-freetype-config
@@ -35,6 +39,13 @@ else
 FREETYPE_CONF_OPTS += --without-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+FREETYPE_DEPENDENCIES += harfbuzz
+FREETYPE_CONF_OPTS += --with-harbuzz
+else
+FREETYPE_CONF_OPTS += --without-harfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
 FREETYPE_CONF_OPTS += --with-png
