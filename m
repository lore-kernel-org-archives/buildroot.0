From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:41:54 +0200
Subject: [Buildroot] [git commit] package/brltty: bump version to 6.1
Message-ID: <20200415193448.9C8BD8ECD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6d378b080bad73b53dc5bff2e6a6b37eb26d790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://brltty.app/doc/ChangeLog.txt

Removed patches committed upstream:
https://github.com/brltty/brltty/commit/0414ad2b4e8978a14343d920a5a1f11da892eaf3
https://github.com/brltty/brltty/commit/a2e3aa25e8ef5044422aeeaa65968f97550b5e8d

Updated hash of README due to non-license related commits:
https://github.com/brltty/brltty/commits/master/README

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ange-how-the-_FOR_BUILD-variables-are-pas.patch | 53 ----------------------
 ...so-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch | 38 ----------------
 package/brltty/brltty.hash                         |  5 +-
 package/brltty/brltty.mk                           |  2 +-
 4 files changed, 4 insertions(+), 94 deletions(-)

diff --git a/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch b/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch
deleted file mode 100644
index ddcc5ba9ea..0000000000
--- a/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0414ad2b4e8978a14343d920a5a1f11da892eaf3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 26 Oct 2019 14:28:51 +0200
-Subject: [PATCH] mk4build: change how the _FOR_BUILD variables are passed to
- sub-configure
-
-The logic that eval's for *_FOR_BUILD variables to set them to their
-equivalent without _FOR_BUILD before calling the sub-configure for the
-host machine doesn't work: the variables are not exported, and
-therefore they are not seen by the ./configure script, which runs as a
-separate process.
-
-So instead, keep things simple and pass them explicitly in the
-environment of the ./configure script.
-
-This patch was written in the context of the Buildroot build system,
-which does cross-compilation, through which we discovered that the
-*_FOR_BUILD variables are not properly passed down to the
-sub-configure.
-
-Upstream: https://github.com/brltty/brltty/pull/183
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- mk4build | 13 ++++++-------
- 1 file changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/mk4build b/mk4build
-index 3fb9d8917..3c64963b7 100755
---- a/mk4build
-+++ b/mk4build
-@@ -67,13 +67,12 @@ then
- 
-    needTemporaryDirectory
- 
--   for variable in CC CFLAGS CXX CXXFLAGS LDFLAGS LDLIBS
--   do
--      unset "${variable}"
--      variableForBuild="${variable}_FOR_BUILD"
--      eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'
--   done
--
-+   CC=${CC_FOR_BUILD} \
-+   CFLAGS=${CFLAGS_FOR_BUILD} \
-+   CXX=${CXX_FOR_BUILD} \
-+   CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
-+   LDFLAGS=${LDFLAGS_FOR_BUILD} \
-+   LDLIBS=${LDLIBS_FOR_BUILD} \
-    "${sourceRoot}/configure" \
-       --disable-api \
-       --disable-gpm \
--- 
-2.21.0
-
diff --git a/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch b/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch
deleted file mode 100644
index 5839f78f3f..0000000000
--- a/package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 568e0d6070021a9b805ba1fe1543e4b43a073413 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 20 Feb 2020 00:23:35 +0100
-Subject: [PATCH] mk4build: also pass PKG_CONFIG_FOR_BUILD to the native
- configure
-
-In commit 0414ad2b4e8978a14343d920a5a1f11da892eaf3, mk4build was
-modified to pass a number of *_FOR_BUILD variables down to the
-configure script called for building the native tools.
-
-However, this configure script also uses the pkg-config tool, and the
-pkg-config to use for the native build and the cross build may be
-different, so let's also pass PKG_CONFIG_FOR_BUILD down to the
-sub-configure, as PKG_CONFIG, following the same logic as the other
-variables.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/brltty/brltty/pull/248
-[Upstream patch is different, due to other upstream changes.]
----
- mk4build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mk4build b/mk4build
-index 3c64963b7..ad88ee69c 100755
---- a/mk4build
-+++ b/mk4build
-@@ -73,6 +73,7 @@ then
-    CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
-    LDFLAGS=${LDFLAGS_FOR_BUILD} \
-    LDLIBS=${LDLIBS_FOR_BUILD} \
-+   PKG_CONFIG=${PKG_CONFIG_FOR_BUILD} \
-    "${sourceRoot}/configure" \
-       --disable-api \
-       --disable-gpm \
--- 
-2.24.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 4373d7da96..d4f87c42f2 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,3 +1,4 @@
-sha256 cfa80c2d171a4d92d7a327b1942e6fc463669b1c3bb658bfb3323b723f9096f7 brltty-6.0.tar.xz
+# Locally computed
+sha256 4a28e3f1879aee9082f9ce4100fd4053be47add7f8ab0f2af6d6a20590934b62 brltty-6.1.tar.xz
 sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
-sha256 69d7cbb371bcb165ccde6c496f61481a557d17f0afa0aaa86ece214c4bd698cb README
+sha256 9ac2af461c3f5c1640601d607a299c7cb9fe3d2f9974bf671af46601e4f9198f README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index acc172fab0..e34b9b2b76 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.0
+BRLTTY_VERSION = 6.1
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
