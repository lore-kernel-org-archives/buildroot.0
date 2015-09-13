From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 22:43:35 +0200
Subject: [Buildroot] [git commit] mtd: fix static build with uuid
Message-ID: <20150913204625.1BE6B81910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfcf697712e5b636d755751ac0f69afed253f46a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uuid library might depend on gettext. Use pkg-config to discover uuid
dependencies at build time, and edit Makefile accordingly to avoid missing
symbols when linking statically.

Based on a patch from Vicente Olivert Riera.

Fixes:
http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
http://autobuild.buildroot.net/results/3af/3af4ef252c8cb2b22134d91ce48e5930c60ec437/
http://autobuild.buildroot.net/results/648/648341fce974e8f016eee57c95d7511a886eef49/

[Peter: drop MTD_MKFSUBIFS_LIBS variable]
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0fb9fc2..adbf28d 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -17,7 +17,12 @@ MTD_DEPENDENCIES = zlib lzo
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
-MTD_DEPENDENCIES += util-linux zlib lzo
+MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
+define MTD_ADD_MISSING_LINTL
+	$(SED) "/^LDLIBS_mkfs\.ubifs/ s%$$% `$(PKG_CONFIG_HOST_BINARY) --libs uuid`%" \
+		$(@D)/Makefile
+endef
+MTD_POST_PATCH_HOOKS += MTD_ADD_MISSING_LINTL
 endif
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
