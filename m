Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A2FC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2CA60AC3;
	Mon,  5 Feb 2024 16:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B2CA60AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YStl0XbseCj9; Mon,  5 Feb 2024 16:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CA26059E;
	Mon,  5 Feb 2024 16:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CA26059E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6FD61BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EC0F41A49
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC0F41A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UarsIK7Dgt_S for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:26:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA96641A46
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA96641A46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A70D886D62; Mon,  5 Feb 2024 16:26:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 17:26:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f565b52225785bfa268ea19c4c347917d38ade4
X-Git-Newrev: 31b488337921d57c14893c34766ac22c53e5382b
X-Patchwork-Hint: ignore
Message-Id: <20240205162635.A70D886D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leptonica: affected by gcc bug
 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=31b488337921d57c14893c34766ac22c53e5382b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

leptonica is affected by gcc bug 101737 resulting in the following build
failure since at least bump to version 1.82.0 in commit
81a961c545cc9f240841b75d6c21f13b334bc274:

sh4eb-buildroot-linux-gnu-gcc.br_real: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report, with preprocessed source (by using -freport-bug).
See <http://bugs.buildroot.net/> for instructions.

Fixes:
 - http://autobuild.buildroot.org/results/f18979454399d9c728f9e017e4cc3a1b27458f5b
 - http://autobuild.buildroot.org/results/f3c803892175b3bb2ce68e3140c879b4a4d4b302

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leptonica/leptonica.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 8eedf2fda9..4cb73296e8 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -14,6 +14,10 @@ LEPTONICA_DEPENDENCIES = host-pkgconf
 
 LEPTONICA_CONF_OPTS += --disable-programs
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+LEPTONICA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_GIFLIB),y)
 LEPTONICA_DEPENDENCIES += giflib
 LEPTONICA_CONF_OPTS += --with-giflib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
