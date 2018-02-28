From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 20:45:08 +0100
Subject: [Buildroot] [git commit] iw: bump to version 4.14
Message-ID: <20180305200719.3566E81199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b690d534679ddf188d67289141af6167044af459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop IW_MAKE_OPTS, passing the CC, LD, and LDFLAGS in the environment
via TARGET_CONFIGURE_OPTS is enough.

Add license file hash.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iw/iw.hash | 4 +++-
 package/iw/iw.mk   | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 414f34225f..6423df7732 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	324cc805fad52cba2c16b9ab569906889fb645cc962aac4cfda1db85d2de97ce	iw-4.9.tar.xz
+sha256	f01671c0074bfdec082a884057edba1b9efd35c89eda554638496f03b769ad89	iw-4.14.tar.xz
+# Locally calculated
+sha256	5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af	COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index aa85cbb5b9..8264e8b5dc 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-IW_VERSION = 4.9
+IW_VERSION = 4.14
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 define IW_BUILD_CMDS
-	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPTS) -C $(@D)
+	$(IW_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define IW_INSTALL_TARGET_CMDS
