Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35221C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C726940412;
	Sun,  6 Aug 2023 16:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C726940412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZEPsP7o18hJ; Sun,  6 Aug 2023 16:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06E3B4035D;
	Sun,  6 Aug 2023 16:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06E3B4035D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192671BF2C3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD3340363
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD3340363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h13IwAm9X1xM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 16:05:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D4A402C2
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 16:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D4A402C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B83984546; Sun,  6 Aug 2023 16:05:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:04:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 78039eb59acfb2c3051ca81e7e161d9e281d3983
X-Git-Newrev: 0d8c70e93d1835c97d797ce1f390e6acc0adb225
X-Patchwork-Hint: ignore
Message-Id: <20230806160513.2B83984546@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi: fix filenames of
 kodi host utils
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d8c70e93d1835c97d797ce1f390e6acc0adb225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The variables WITH_JSONSCHEMABUILDER & WITH_TEXTUREPACKER are defined as
directories:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindJsonSchemaBuilder.cmake
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindTexturePacker.cmake

and during configure kodi searches these directories for usable
binaries with the name scheme.

${APP_NAME_LC}-JsonSchemaBuilder
${APP_NAME_LC}-TexturePacker

which translates to kodi-JsonSchemaBuilder and kodi-TexturePacker.

This is an improvement to follow upstream's expections and it does
neither fix a build nor a runtime error.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk     | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/kodi.mk                                     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 569bde8cd2..e017aa8d9c 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -20,7 +20,7 @@ HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
 define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
 		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
-		$(HOST_DIR)/bin/JsonSchemaBuilder
+		$(HOST_DIR)/bin/kodi-JsonSchemaBuilder
 endef
 
 $(eval $(host-cmake-package))
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 43d0c4bff6..58e51ffc8a 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -11,7 +11,7 @@ KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
 KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
 
 define KODI_SKIN_CONFLUENCE_BUILD_CMDS
-	$(HOST_DIR)/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
+	$(HOST_DIR)/bin/kodi-TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
 endef
 
 define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 44eba85d75..c0bc767dd4 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -35,7 +35,7 @@ HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
 define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
 		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
-		$(HOST_DIR)/bin/TexturePacker
+		$(HOST_DIR)/bin/kodi-TexturePacker
 endef
 
 $(eval $(host-cmake-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index aff272d014..4fe6ea46cc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -88,8 +88,8 @@ KODI_CONF_OPTS += \
 	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_VER=$(PYTHON3_VERSION_MAJOR) \
-	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
-	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
+	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/ \
+	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/ \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
