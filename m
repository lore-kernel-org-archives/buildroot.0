From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:25:23 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: bump version
Message-ID: <20181008192711.CD6FD8E4F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c9e144640139eda3863b0d22e100d04fb9f6118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The currently used github repo from oliv3r does not exist anymore.
https://sourceforge.net/projects/mjpg-streamer/ shows that the status of
the original project site is "Inactive" and points to
https://github.com/jacksonliam/mjpg-streamer as the new site.

The new maintainer is active so we bump the package to HEAD of its
master branch which fixes a glibc-related build error:
http://autobuild.buildroot.net/results/4c8/4c8aac898d4580ed0b8b52cef7779d0f6f6a631f/

Further changes due to this bump:
- removed patch 0001, fix was applied upstream:
  https://github.com/jacksonliam/mjpg-streamer/commit/eb4dafd802b366d9b0310e91e7bb93a1082e7657#diff-511ff6908e8db4543e5a59d0ea4a2f1f
- switched to CMake

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpg-streamer/0001-musl-pthread.patch | 18 ------------------
 package/mjpg-streamer/Config.in               |  2 +-
 package/mjpg-streamer/mjpg-streamer.hash      |  3 ++-
 package/mjpg-streamer/mjpg-streamer.mk        | 22 +++++-----------------
 4 files changed, 8 insertions(+), 37 deletions(-)

diff --git a/package/mjpg-streamer/0001-musl-pthread.patch b/package/mjpg-streamer/0001-musl-pthread.patch
deleted file mode 100644
index 9e76e760d8..0000000000
--- a/package/mjpg-streamer/0001-musl-pthread.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix musl build
-
-Patch written by Thomas Petazzoni:
-http://patchwork.ozlabs.org/patch/572309/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.org/plugins/input.h mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b/plugins/input.h
---- mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.org/plugins/input.h	2015-11-09 15:56:47.000000000 +0100
-+++ mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b/plugins/input.h	2016-01-26 20:19:05.884349502 +0100
-@@ -20,6 +20,7 @@
- #                                                                              #
- *******************************************************************************/
- 
-+#include <pthread.h>
- #include <syslog.h>
- #include "../mjpg_streamer.h"
- #define INPUT_PLUGIN_PREFIX " i: "
diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
index f42c2a50db..3587af0288 100644
--- a/package/mjpg-streamer/Config.in
+++ b/package/mjpg-streamer/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_MJPG_STREAMER
 	  filesystem or other input plugins and streams them as
 	  M-JPEG via HTTP to webbrowsers, VLC and other software.
 
-	  http://mjpg-streamer.sourceforge.net
+	  https://github.com/jacksonliam/mjpg-streamer
 
 comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 8bbac29e33..f544550c53 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	756a60cbc3404ac21109bb66091774ac8e1d64ebf60e2bf2c0d08a06d1abb9be	mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.tar.gz
+sha256 094fda686ef63e5167cbef81b5ac6aea74fa98ea2674fa4eba3bc6ba29cc5857  mjpg-streamer-f387bb44e6c087271b763b27da998bf2e06c4f5d.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 4fecf69ec9..2941e314b3 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,27 +4,15 @@
 #
 ################################################################################
 
-# Original source is located at
-# http://sourceforge.net/p/mjpg-streamer/code/commit_browser
-# oliv3r forked the repo to add support for 3.16 and 3.17 kernels:
-# http://sourceforge.net/p/mjpg-streamer/patches/14/
-MJPG_STREAMER_VERSION = bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b
-MJPG_STREAMER_SITE = $(call github,oliv3r,mjpg-streamer,$(MJPG_STREAMER_VERSION))
+MJPG_STREAMER_VERSION = f387bb44e6c087271b763b27da998bf2e06c4f5d
+MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
+MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
-MJPG_STREAMER_LICENSE_FILES = LICENSE
+MJPG_STREAMER_LICENSE_FILES = $(MJPG_STREAMER_SUBDIR)/LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
-MJPG_STREAMER_USE_LIBV4L += USE_LIBV4L2=true
 endif
 
-define MJPG_STREAMER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) $(MJPG_STREAMER_USE_LIBV4L)
-endef
-
-define MJPG_STREAMER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
