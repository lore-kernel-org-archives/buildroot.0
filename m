From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jul 2011 10:18:21 +0200
Subject: [Buildroot] [git commit] busybox: remove quirk for old unsupported
	versions
Message-ID: <20110704082353.E29FD8A2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1e4aac40ec1271aae5c056243cdc9e2b0b6f2bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This code is no longer useful, since the oldest version supported by
Builroot is 1.16.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b77880c..034801e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -49,17 +49,6 @@ define BUSYBOX_SET_SYSKLOGD
 endef
 endif
 
-# id applet breaks on >=1.13.0 with old uclibc unless the bb pwd routines are used
-ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_BUSYBOX_VERSION_1_14_X)$(BR2_UCLIBC_VERSION_0_9_29),yy)
-define BUSYBOX_SET_BB_PWD
-	if grep -q 'CONFIG_ID=y' $(BUSYBOX_BUILD_CONFIG); \
-	then \
-		echo 'warning: CONFIG_ID needs BB_PWD_GRP with old uclibc, enabling' >&2;\
-		$(SED) "s/^.*CONFIG_USE_BB_PWD_GRP.*/CONFIG_USE_BB_PWD_GRP=y/;" $(BUSYBOX_BUILD_CONFIG); \
-	fi
-endef
-endif
-
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
-- 
1.7.3.4
