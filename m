Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC5AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A91414A1;
	Thu, 28 Jul 2022 20:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A91414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBtZmJgty01z; Thu, 28 Jul 2022 20:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53780410BA;
	Thu, 28 Jul 2022 20:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53780410BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E87E1BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 416D7414C0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 416D7414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zvrnnitc3OW for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40411414A1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40411414A1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C0E6867FE; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:56:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd4783258b187b06ce9da6baaa4b1b9197c3f184
X-Git-Newrev: cc08b57079eaf1494ab4f2d1f79ccecc63a8d767
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.1C0E6867FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wine: simplify alsa-lib feature
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc08b57079eaf1494ab4f2d1f79ccecc63a8d767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having the user need to figure out that 2 alsa-lib features
are needed for wine ALSA support, have the top-level wine option select
the relevant alsa-lib features, when alsa-lib is enabled as already done
for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/Config.in | 2 ++
 package/wine/wine.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 18fb0a64a2..db3b1570ef 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_WINE
 	depends on !BR2_STATIC_LIBS
 	# pthread_attr_setstack
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI if BR2_PACKAGE_ALSA_LIB
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 5f4d2ef6e3..a1c65bef4e 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -41,7 +41,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 WINE_CONF_OPTS += --with-alsa
 WINE_DEPENDENCIES += alsa-lib
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
