From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 14 Jan 2016 13:20:52 -0300
Subject: [Buildroot] [PATCH] harfbuzz: enable optional graphite2 support
Message-ID: <1452788452-30013-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Enable building harfbuzz with the optional graphite2 support.
Also switch --without-X configure options to the correct/documented
--with-X=no syntax.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/harfbuzz/harfbuzz.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 36b291a..c704f32 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -10,16 +10,16 @@ HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
-HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
+HARFBUZZ_CONF_OPTS = --with-coretext=no --with-uniscribe=no
 
 # freetype & glib2 support required by host-pango
 HOST_HARFBUZZ_DEPENDENCIES = \
 	host-freetype \
 	host-libglib2
 HOST_HARFBUZZ_CONF_OPTS = \
-	--without-corext \
-	--without-uniscribe \
-	--without-graphite2 \
+	--with-coretext=no \
+	--with-uniscribe=no \
+	--with-graphite2=no \
 	--with-cairo=no \
 	--with-icu=no \
 	--with-freetype=yes \
@@ -44,6 +44,13 @@ else
 HARFBUZZ_CONF_OPTS += --with-freetype=no
 endif
 
+ifeq ($(BR2_PACKAGE_GRAPHITE2),y)
+HARFBUZZ_DEPENDENCIES += graphite2
+HARFBUZZ_CONF_OPTS += --with-graphite2=yes
+else
+HARFBUZZ_CONF_OPTS += --with-graphite2=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 HARFBUZZ_DEPENDENCIES += libglib2
 HARFBUZZ_CONF_OPTS += --with-glib=yes
-- 
2.4.10
