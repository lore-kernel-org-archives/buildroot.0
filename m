From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 10:39:53 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/freetype:
 unconditionally disable harfbuzz
Message-ID: <20201003082951.E5529847B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10b27e62885afbcb65b5b82453a4de9d85a80aed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Commit 939e714393e9d7f60f3a198d831608b08a25662e added an optional
harfbuzz dependency to freetype but this creates a circular dependency
so unconditionally disable it

Fixes:
 - http://autobuild.buildroot.org/results/3cc4ce3207a253186a9c4f8f5151ea0fc0854a28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a98b79e2e6e1b786adb26b111b4da9c8189d59bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 6658f18ccc..9cf75d1628 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -14,6 +14,10 @@ FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
+# harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
+# a circular dependency
+FREETYPE_CONF_OPTS = --without-harfbuzz
+
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 HOST_FREETYPE_CONF_OPTS = \
 	--without-bzip2 \
@@ -39,13 +43,6 @@ else
 FREETYPE_CONF_OPTS += --without-bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
-FREETYPE_DEPENDENCIES += harfbuzz
-FREETYPE_CONF_OPTS += --with-harbuzz
-else
-FREETYPE_CONF_OPTS += --without-harfbuzz
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
 FREETYPE_CONF_OPTS += --with-png
