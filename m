From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 22:08:28 +0200
Subject: [Buildroot] [git commit] dosfstools: fix static linking with
	libiconv
Message-ID: <20140522201148.AC5E89CD32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d797decbd95acec99260b8b3ed20bb3e3da0eb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/246/246c067f1e9def748498f0c6fa6988c036e1d109/

Pass the libraries to be linked in LDLIBS instead of LDFLAGS so the end up
after the object files on the linker command line.

While we are at it, use TARGET_CONFIGURE_OPTS instead of explictly passing
CC/CFLAGS/LDFLAGS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dosfstools/dosfstools.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 8212f3f..a6b83d0 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,14 +9,13 @@ DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
-DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
 
 # Avoid target dosfstools dependencies, no host-libiconv
 HOST_DOSFSTOOLS_DEPENDENCIES =
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DOSFSTOOLS_DEPENDENCIES += libiconv
-DOSFSTOOLS_LDFLAGS += -liconv
+DOSFSTOOLS_LDLIBS += -liconv
 endif
 
 FATLABEL_BINARY = fatlabel
@@ -24,8 +23,7 @@ FSCK_FAT_BINARY = fsck.fat
 MKFS_FAT_BINARY = mkfs.fat
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
-		LDFLAGS="$(DOSFSTOOLS_LDFLAGS)" -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)+=$(FATLABEL_BINARY)
