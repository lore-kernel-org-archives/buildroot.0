Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70661C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C0380F05;
	Tue,  7 Feb 2023 17:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C0380F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LoWMmnNeTJG; Tue,  7 Feb 2023 17:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5022D80E07;
	Tue,  7 Feb 2023 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5022D80E07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5306F1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6D140A71
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6D140A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ssCLMdu5e1dY for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F7A40A68
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F7A40A68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34CDD842D4; Tue,  7 Feb 2023 17:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:10:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf92dcfaa92f6564830d10d4e18ae00fd8102ab2
X-Git-Newrev: 17481bd0bf6abff260ccc579974b813050f91d4e
X-Patchwork-Hint: ignore
Message-Id: <20230207171058.34CDD842D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: pass $(TARGET_DEBUGGING)
 flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=17481bd0bf6abff260ccc579974b813050f91d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to have debugging symbols in uClibc, let's pass
$(TARGET_DEBUGGING) in UCLIBC_EXTRA_CFLAGS.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
and split into its own independent patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d2baffc95e..342d841087 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -375,7 +375,7 @@ endif
 # Commands
 #
 
-UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI) $(TARGET_DEBUGGING)
 
 # uClibc-ng does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
