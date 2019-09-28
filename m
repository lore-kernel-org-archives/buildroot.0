From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 14:08:33 +0200
Subject: [Buildroot] [PATCH 1/3] package/brltty: bump to version 6.0
Message-ID: <20190928120835.29302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch (already in version)
- Update hash of README: small updates in year, version
- Remove --without-viavoice option (not available anymore)
- Disable espeak-ng (not available in buildroot yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ... 0001-Fix-linking-error-on-mips64el.patch} |  0
 .../0001-buildsys-fix-cross-compilation.patch | 41 -------------------
 package/brltty/brltty.hash                    |  4 +-
 package/brltty/brltty.mk                      | 10 ++---
 4 files changed, 7 insertions(+), 48 deletions(-)
 rename package/brltty/{0002-Fix-linking-error-on-mips64el.patch => 0001-Fix-linking-error-on-mips64el.patch} (100%)
 delete mode 100644 package/brltty/0001-buildsys-fix-cross-compilation.patch

diff --git a/package/brltty/0002-Fix-linking-error-on-mips64el.patch b/package/brltty/0001-Fix-linking-error-on-mips64el.patch
similarity index 100%
rename from package/brltty/0002-Fix-linking-error-on-mips64el.patch
rename to package/brltty/0001-Fix-linking-error-on-mips64el.patch
diff --git a/package/brltty/0001-buildsys-fix-cross-compilation.patch b/package/brltty/0001-buildsys-fix-cross-compilation.patch
deleted file mode 100644
index 9a10d46414..0000000000
--- a/package/brltty/0001-buildsys-fix-cross-compilation.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 088666535a045dae71bd2fcc6b3a1553023106ce Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Wed, 22 Aug 2018 10:10:19 +0200
-Subject: [PATCH] buildsys: fix cross-compilation
-
-Some identifiers for includes and libs paths may contain digit, e.g.
-X11_PACKAGE or ATSPI2_PACKAGE or GLIB2_PACKAGE...
-
-Also detect those identifiers when doing cros-compilation, so that the
-_FOR_BUILD variants are really created and do not clash with the target
-variants.
-
-Fixes:
-    http://autobuild.buildroot.org/results/a37/a37782b3cfc1a96cc129db8fade20a36a7b2d470/build-end.log
-    http://autobuild.buildroot.org/results/97e/97edc6a47d2140968e84b409cdc960604e5896f2/build-end.log
-    [...]
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstram status: submitted
-https://github.com/brltty/brltty/pull/142
----
- mk4build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk4build b/mk4build
-index db90c86a9..551283825 100755
---- a/mk4build
-+++ b/mk4build
-@@ -112,7 +112,7 @@ fi
- 
- sedScript="${outputName}.${sedExtension}"
- sed -n -e '
--s/^ *\([A-Za-z][A-Za-z_]*\) *=.*$/\1/
-+s/^ *\([A-Za-z][A-Za-z0-9_]*\) *=.*$/\1/
- t found
- d
- :found
--- 
-2.14.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 6b9470c82e..4373d7da96 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,3 +1,3 @@
-sha256 6171258aca833bb2012afd9c63928573a48c3daab7b149a3e90001ba53beb80f brltty-5.6.tar.xz
+sha256 cfa80c2d171a4d92d7a327b1942e6fc463669b1c3bb658bfb3323b723f9096f7 brltty-6.0.tar.xz
 sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
-sha256 42685d8fa420f618e325d423be110c69abd976afdef183dfac385ccd44cb12e9 README
+sha256 69d7cbb371bcb165ccde6c496f61481a557d17f0afa0aaa86ece214c4bd698cb README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 21f6877bb8..30114606f1 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 5.6
+BRLTTY_VERSION = 6.0
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
@@ -22,14 +22,14 @@ BRLTTY_CONF_OPTS = \
 	--disable-python-bindings \
 	--disable-tcl-bindings \
 	--disable-x \
+	--without-espeak-ng \
 	--without-midi-package \
 	--without-mikropuhe --without-speechd --without-swift \
-	--without-theta --without-viavoice
+	--without-theta
 
 # Autoreconf is needed because we're patching configure.ac in
-# 0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch. However,
-# a plain autoreconf doesn't work, because this package is only
-# autoconf-based.
+# 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
+# because this package is only autoconf-based.
 define BRLTTY_AUTOCONF
 	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
 endef
-- 
2.23.0
