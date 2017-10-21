From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:20:09 +0200
Subject: [Buildroot] [git commit] Revert "zstd: install to staging directory"
Message-ID: <20171021151312.EF01781144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61fc25af83ba6f10cb27882560e281e7c29d1001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 95c15aaf15f4bd5b1ebcf87d204ddf5a345197d5. It was
mistakenly pushed, and causes problems because it installs the shared
library to staging, but not to target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zstd/zstd.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index f149ad2..089d654 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,7 +6,6 @@
 
 ZSTD_VERSION = v1.3.2
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
-ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
@@ -47,9 +46,4 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
-define ZSTD_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
-endef
-
 $(eval $(generic-package))
