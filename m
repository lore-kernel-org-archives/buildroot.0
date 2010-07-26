From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Jul 2010 15:10:41 +0200
Subject: [Buildroot] [git commit master 1/1] flex: fix configure cache issue
	with BR2_NEEDS_GETTEXT
Message-ID: <20100726131117.1FEA281F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3da3c338773021406a76e17f37ba7b9c1650b8b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flex doesn't NEED gettext/libintl, but it's configure script checks for it,
so make sure those a built before flex, otherwise flex will populate
tgt-config.cache with invalid values, breaking the build of other packages
needing it (like libglib2).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index ad35548..41c9505 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,6 +10,9 @@ FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING=YES
+FLEX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBINTL),libintl)
 
 # lex -> flex
 define FLEX_INSTALL_LEX
-- 
1.7.1
