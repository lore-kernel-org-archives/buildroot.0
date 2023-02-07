Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B02AC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B675E40362;
	Tue,  7 Feb 2023 21:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B675E40362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQIjtcJq8WrZ; Tue,  7 Feb 2023 21:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DA240361;
	Tue,  7 Feb 2023 21:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DA240361
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF4D21BF955
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B61B660D53
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B61B660D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOCaaDWJ_XUn for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:38:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B5360B65
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B5360B65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF1F684377; Tue,  7 Feb 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:37:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36b8c9494b56b877fea62f17926f747c7c7bfb8d
X-Git-Newrev: f79a9c775ff0a59027f274a237d98b5f8d31c022
X-Patchwork-Hint: ignore
Message-Id: <20230207213844.CF1F684377@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: handle ARM Thumb situation
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

commit: https://git.buildroot.net/buildroot/commit/?id=f79a9c775ff0a59027f274a237d98b5f8d31c022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default on ARM32, wolfssl uses assembly instructions that are not
supported on Thumb (original Thumb, not Thumb 2), causing a build
failure:

/tmp/ccgn33X7.s:299: Error: selected processor does not support `umlal r4,r5,r10,ip' in Thumb mode
/tmp/ccgn33X7.s:386: Error: instruction not supported in Thumb16 mode -- `adds r4,r4,r6'
/tmp/ccgn33X7.s:387: Error: unshifted register required -- `adc r3,r3,#0'
/tmp/ccgn33X7.s:395: Error: instruction not supported in Thumb16 mode -- `adds r4,r4,r6'

Fix that by passing --with-arm-target=thumb, which tells wolfssl to
use a different set of assembly routines.

Fixes:

  http://autobuild.buildroot.net/results/907/907a5967439c3157c426023b0be1e613092d7bfe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index f415e11bb5..8f6cba56ec 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -43,4 +43,8 @@ else
 WOLFSSL_CONF_OPTS += --disable-armasm
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+WOLFSSL_CONF_OPTS += --with-arm-target=thumb
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
