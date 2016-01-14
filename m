From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 20:48:46 +0100
Subject: [Buildroot] [git commit] harfbuzz: enable optional graphite2 support
Message-ID: <20160114195206.4978C802CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1588661996c3cfa2acd1ac3ff336bbcd439cff82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable building harfbuzz with the optional graphite2 support.
Also switch --without-X configure options to the correct/documented
--with-X=no syntax.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
