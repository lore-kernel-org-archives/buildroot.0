Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831CAC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3659682093;
	Wed, 11 Jan 2023 09:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3659682093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAVq9e08rI3y; Wed, 11 Jan 2023 09:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C09813F9;
	Wed, 11 Jan 2023 09:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C09813F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD941BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72749402B8
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72749402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxju15XhgH6Q for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B14402ED
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B14402ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65C50878DD; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 08:11:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 15de6b689bb48a827f6f43d008223517f03da8b6
X-Git-Newrev: 6fe6d31b0a07ee2e8d37f624d75c1166b9c08394
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.65C50878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Revert "package/zip:
 install to staging"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fe6d31b0a07ee2e8d37f624d75c1166b9c08394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This reverts commit c5b5b5ccabe35e11f0ca8db4361bb3f335fc59fb.

Commit "c5b5b5ccab package/zip: install to staging" contains a typo that
prevents installing to staging.
ZIP_INSTALLING_STAGING_CMDS -> ZIP_INSTALL_STAGING_CMDS

But the package does not install headers or libraries, only ELF and
manual files.
So instead of fixing the install to staging, revert the bogus commit.

Cc: Jan Pedersen <jp@jp-embedded.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 11614fdde1611f846b8e5d99f55af7c6c131b817)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zip/zip.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 2d11e1c763..67958a4a66 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -11,7 +11,6 @@ ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
-ZIP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
@@ -41,11 +40,6 @@ define ZIP_INSTALL_TARGET_CMDS
 		prefix=$(TARGET_DIR)/usr
 endef
 
-define ZIP_INSTALLING_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
-		prefix=$(STAGING_DIR)/usr
-endef
-
 define HOST_ZIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
