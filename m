Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FACC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1712741444;
	Fri, 12 Jul 2024 15:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goTyrBRwYXpP; Fri, 12 Jul 2024 15:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF4B41452
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF4B41452;
	Fri, 12 Jul 2024 15:17:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A90901BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A241041452
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mb4z74OZcth for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA48841444
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA48841444
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:17:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 980DF86081; Fri, 12 Jul 2024 15:17:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50b18ed68ceef78061e85a390d29ad172d1f9f95
X-Git-Newrev: 1b01c3c3331f3c33268c4232900079ee9166fc14
X-Patchwork-Hint: ignore
Message-Id: <20240712151711.980DF86081@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frotz: fix build with gcc 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b01c3c3331f3c33268c4232900079ee9166fc14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change -std=c99 into -std=gnu99 in the CFLAGS to avoid the following
build failure with gcc 14:

fastmem.c: In function 'z_restore':
fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
  842 |                 f_setup.aux_name = strdup(default_name);
      |                                    ^~~~~~
      |                                    strcmp

Fixes:
 - http://autobuild.buildroot.org/results/df3b3b98265ec3a75578614746b2d1426c90e125

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/frotz/frotz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index 5af235137c..4c477c396d 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -21,7 +21,7 @@ endif
 define FROTZ_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
 		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
-		CFLAGS="$(TARGET_CFLAGS) -std=c99"
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 endef
 
 define FROTZ_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
