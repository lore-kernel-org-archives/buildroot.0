From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:03:39 +0200
Subject: [Buildroot] [git commit] dosfstools: fix compilation with musl libc
Message-ID: <20140928200606.0CF1C9D791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b21d7200d98af507775a95c9cf948de71036bfc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile of dosfstools passes -D_GNU_SOURCE to get access to
non-standard definitions such as 'loff_t'. But this flag gets dropped
by the CFLAGS override, so explicitly add it.

[Peter: reword commit message]
Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dosfstools/dosfstools.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a6b83d0..a9d8392 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -13,6 +13,8 @@ DOSFSTOOLS_LICENSE_FILES = COPYING
 # Avoid target dosfstools dependencies, no host-libiconv
 HOST_DOSFSTOOLS_DEPENDENCIES =
 
+DOSFSTOOLS_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DOSFSTOOLS_DEPENDENCIES += libiconv
 DOSFSTOOLS_LDLIBS += -liconv
@@ -23,7 +25,8 @@ FSCK_FAT_BINARY = fsck.fat
 MKFS_FAT_BINARY = mkfs.fat
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(DOSFSTOOLS_CFLAGS)" LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)+=$(FATLABEL_BINARY)
