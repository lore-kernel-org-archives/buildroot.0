From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:19:38 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: change to meson build
Message-ID: <20200912121059.2FF5B7FF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4f470ed40285f750f805d5dd09f62290746286f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add defaults for all meson options (and order according to
  meson_options.txt file)
- drop pthread linking flags previously needed for the test
  programs (maybe not needed by meson, tests disabled by option)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.mk | 67 +++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 54932f69df..6d35e8b65e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -10,60 +10,77 @@ HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
 HARFBUZZ_INSTALL_STAGING = YES
-HARFBUZZ_CONF_OPTS = --with-coretext=no --with-uniscribe=no
+HARFBUZZ_CONF_OPTS = \
+	-Dgobject=disabled \
+	-Dfontconfig=disabled \
+	-Dgdi=disabled \
+	-Ddirectwrite=disabled \
+	-Dcoretext=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled \
+	-Ddocs=disabled \
+	-Dbenchmark=disabled \
+	-Dicu_builtin=false \
+	-Dexperimental_api=false \
+	-Dfuzzer_ldflags=""
 
 # freetype & glib2 support required by host-pango
 HOST_HARFBUZZ_DEPENDENCIES = \
 	host-freetype \
 	host-libglib2
 HOST_HARFBUZZ_CONF_OPTS = \
-	--with-coretext=no \
-	--with-uniscribe=no \
-	--with-graphite2=no \
-	--with-cairo=no \
-	--with-icu=no \
-	--with-freetype=yes \
-	--with-glib=yes
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-# forgets to link test programs with -pthread breaking static link
-HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
-endif
+	-Dglib=enabled \
+	-Dgobject=disabled \
+	-Dcairo=disabled \
+	-Dfontconfig=disabled \
+	-Dicu=disabled \
+	-Dgraphite=disabled \
+	-Dfreetype=enabled \
+	-Dgdi=disabled \
+	-Ddirectwrite=disabled \
+	-Dcoretext=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled \
+	-Ddocs=disabled \
+	-Dbenchmark=disabled \
+	-Dicu_builtin=false \
+	-Dexperimental_api=false \
+	-Dfuzzer_ldflags=""
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 HARFBUZZ_DEPENDENCIES += cairo
-HARFBUZZ_CONF_OPTS += --with-cairo=yes
+HARFBUZZ_CONF_OPTS += -Dcairo=enabled
 else
-HARFBUZZ_CONF_OPTS += --with-cairo=no
+HARFBUZZ_CONF_OPTS += -Dcairo=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 HARFBUZZ_DEPENDENCIES += freetype
-HARFBUZZ_CONF_OPTS += --with-freetype=yes
+HARFBUZZ_CONF_OPTS += -Dfreetype=enabled
 else
-HARFBUZZ_CONF_OPTS += --with-freetype=no
+HARFBUZZ_CONF_OPTS += -Dfreetype=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GRAPHITE2),y)
 HARFBUZZ_DEPENDENCIES += graphite2
-HARFBUZZ_CONF_OPTS += --with-graphite2=yes
+HARFBUZZ_CONF_OPTS += -Dgraphite=enabled
 else
-HARFBUZZ_CONF_OPTS += --with-graphite2=no
+HARFBUZZ_CONF_OPTS += -Dgraphite=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 HARFBUZZ_DEPENDENCIES += libglib2
-HARFBUZZ_CONF_OPTS += --with-glib=yes
+HARFBUZZ_CONF_OPTS += -Dglib=enabled
 else
-HARFBUZZ_CONF_OPTS += --with-glib=no
+HARFBUZZ_CONF_OPTS += -Dglib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 HARFBUZZ_DEPENDENCIES += icu
-HARFBUZZ_CONF_OPTS += --with-icu=yes
+HARFBUZZ_CONF_OPTS += -Dicu=enabled
 else
-HARFBUZZ_CONF_OPTS += --with-icu=no
+HARFBUZZ_CONF_OPTS += -Dicu=disabled
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
