From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:17:09 +0100
Subject: [Buildroot] [git commit] package/brltty: use host pkg-config when
 building host tools
Message-ID: <20200226210509.4BC868EB56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bed3ee409661107b6ce2a05c48adcc7f79258fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

brltty builds host tools which rely on the expat library, and
pkg-config is used to detect the expat library.

Since commit cd16e18584066d2817d3acb3822e173f9f23455e ("pkgconf:
always keep system libs"), the wrapper script added
--keep-system-libs, which adds a -L$(STAGING_DIR)/usr/lib to the
pkg-config results instead of just -lexpat. So, previously, by chance,
the pkg-config result for the target expat was "good enough" for the
host expat as well. But now that -L$(STAGING_DIR)/usr/lib is added, it
breaks the build in all sort of ways as obviously building host
binaries with the library search path pointing to $(STAGING_DIR) is
not a good idea.

To fix that, this commit adjusts the brltty build system so that the
PKG_CONFIG_FOR_BUILD variable is used when using pkg-config to build
host binaries.

Fixes:

  http://autobuild.buildroot.net/results/5a64dfb845389882c366b6c91aaf5868c090a802/

Many thanks to the initial work from Fabrice Fontaine at
http://patchwork.ozlabs.org/patch/1238163/ which provided an initial
starting point for this investigation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...so-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch | 38 ++++++++++++++++++++++
 package/brltty/brltty.mk                           |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch b/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch
new file mode 100644
index 0000000000..5839f78f3f
--- /dev/null
+++ b/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch
@@ -0,0 +1,38 @@
+From 568e0d6070021a9b805ba1fe1543e4b43a073413 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 20 Feb 2020 00:23:35 +0100
+Subject: [PATCH] mk4build: also pass PKG_CONFIG_FOR_BUILD to the native
+ configure
+
+In commit 0414ad2b4e8978a14343d920a5a1f11da892eaf3, mk4build was
+modified to pass a number of *_FOR_BUILD variables down to the
+configure script called for building the native tools.
+
+However, this configure script also uses the pkg-config tool, and the
+pkg-config to use for the native build and the cross build may be
+different, so let's also pass PKG_CONFIG_FOR_BUILD down to the
+sub-configure, as PKG_CONFIG, following the same logic as the other
+variables.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/brltty/brltty/pull/248
+[Upstream patch is different, due to other upstream changes.]
+---
+ mk4build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mk4build b/mk4build
+index 3c64963b7..ad88ee69c 100755
+--- a/mk4build
++++ b/mk4build
+@@ -73,6 +73,7 @@ then
+    CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
+    LDFLAGS=${LDFLAGS_FOR_BUILD} \
+    LDLIBS=${LDLIBS_FOR_BUILD} \
++   PKG_CONFIG=${PKG_CONFIG_FOR_BUILD} \
+    "${sourceRoot}/configure" \
+       --disable-api \
+       --disable-gpm \
+-- 
+2.24.1
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 11b8c0d35f..acc172fab0 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -15,6 +15,9 @@ BRLTTY_LICENSE_FILES = LICENSE-LGPL README
 BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
+BRLTTY_CONF_ENV = \
+	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
+
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
 	--disable-lisp-bindings \
