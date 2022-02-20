Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BFDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D3E8177C;
	Sun, 20 Feb 2022 10:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cN3BvBS90tpp; Sun, 20 Feb 2022 10:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57696813E9;
	Sun, 20 Feb 2022 10:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9E9F1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4999408BF
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQhsi-oibXrM for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFC77408BE
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:01:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3DD3883241; Sun, 20 Feb 2022 09:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:59:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0a0b8d233b86a7c1a197345936d37fce1ea22e8
X-Git-Newrev: e0da90512c04f5cfcdcbe1c4a8f32e559828e0c9
X-Patchwork-Hint: ignore
Message-Id: <20220220095315.3DD3883241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apparmor: drop APPARMOR_FIXUP_APXS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0da90512c04f5cfcdcbe1c4a8f32e559828e0c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop APPARMOR_FIXUP_APXS which was added by commit
3c836e54203b16015c9c52cbe007adc92d293a0d but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/apparmor.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 6f0e59224d..43bfa05308 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -54,16 +54,6 @@ ifeq ($(BR2_PACKAGE_APACHE),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
 APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
-
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APPARMOR_FIXUP_APXS
-	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
-		$(STAGING_DIR)/usr/bin/apxs \
-		$(STAGING_DIR)/usr/build/config_vars.mk \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
-endif
 endif
 
 define APPARMOR_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
