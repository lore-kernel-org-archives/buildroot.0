Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A23C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19A36103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C19A36103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F3140324;
	Mon, 13 Sep 2021 21:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBVA3T7DRFP1; Mon, 13 Sep 2021 21:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D211440318;
	Mon, 13 Sep 2021 21:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0141BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DA9E4030B
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LychnvXWWtbY for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF2E44030F
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567055;
 bh=Oj4nZ5zw9aeahuv0vTlu+K30AR5aa4i91VP3YcBJZLY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=eGM+tdfj1iUT/zRVLNx7k3oz/KIk6Nna3cJJ5DHxEs2abJluByTRcyoSaE0TDCGYb
 V99/Psm9vFhO18llJ2QN6VZwFPUvjaeDNcrJUsKn+kVq+/X1B7cE+PeqqFvv4Xv2qL
 4/qOrvlhm8+QEaI8RkI+0r61g/uXEWlYigt9Se24=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDhlV-1mF81Z2qxT-00AmxK for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:12 +0200
Message-Id: <20210913210412.24042-14-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uITRkYDzpQT9VwCeSgqvfXbPrHQhXG3AswxHEcZTaBy/a3ClrUU
 pYPj8ONjQOYf8CqyOksHbE94mDJUAIApYpGHm0jq8cN/uGgLFpR/i6JTwGq1ebCiZab0/8B
 drmDQxPQTA4awqNtYexrjBeAc1b84BDF1DNgtNTyZc75dvbjf1wCp1wMZrjNEf2yUioduY4
 GYrs9PN7wKX7MJy6H1klA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FfhmsnnZR/g=:chr48ipel4+APtuhObtmpW
 4Wxr3ECR5FBb/uDRc+IN0Y8f4Jf+GHDdr/J9SCfp1qWeSJMmLb6dZQBg4ZrX7atO2O7qmtNzG
 jE2dLydLuwlFrMbiw6L1lg+Calu3cezRiqb2M33aH0nEdxm0PKA9OYtV61pYbjFJ5cqTcaBOE
 SjzIUGDMrJ3pEM1aut+ey1R4JLeMnyeFPmE77/eZtrjGglFpnd41HD5wxXkPY1RGnO1jwvCKq
 1Ixme4KqKvf2VgxAChK2hQrSAmQ4Lhf12YbURl7z2GS/25aDrVoS7u8b4OrQ++79w6OCa5a/X
 r3SbNNibz+dt/3EPdjSvvEiLKMQCNDgDRVAW6hj7NHr68sUqWkVAe/Ho1qUx3qaMMAPX4PbPo
 MoYVxMvB0lodpRxTpQNa+PrPgX338Z97Od9oHh4vrFIwFYfUPTLmpAhZpYjiO+jN2Uci17ZVi
 KHb4qAc3NmEsYsYcA3Hl1KEDCyc8zNFoM+kbm8fAGfaC3KQoaNMTIlXhXP95D6YuDMNh7nmQ2
 LO2nUlPgON+x9P7I3nd5gLVUahDY4ouXlQqCiHYRAjfT+RevlSoPVy20N66XOYboCobb4cYPV
 rWz7Zpy4uJUb+fjohJp9l9wTKOFE0jJUs5LE2KMKnifR/6CmoYIq1kOfVpv9WDUkAib0atxJr
 XJqh5tjLD23jFtUV8HP52RHITgtfyfAK+W3/Y39bHQDpY0v3HWwvMWCCSsDWx0vjzBqVgEaXL
 YHpfKtq3KesyC56Wx4zX13QKbYbGWZ9kYbW+p9nGrAMKUbsBmqepr23on+eBuPB1LwupCn3ZG
 xqyTWPm181R8X5MCQnRKWO3jV5TejK3F8jK9vae4azTSq9zR8aFhk7de/hYhwjNkucJ5PGlcW
 u0N2k3cwiuiOS+E2dGOnUGIA1F5ZsxPuGG2CeWKaFnl88are1Hq7kBcqM2fnBfHVBTUzHELHK
 M/6BNaFIu3+5PnWikRWlSM/ztVSO5nH9KwX12sBRqXjIqlrifsmoHYA5ooTFulKyTf4KABzfo
 cxmveCsU4jOPwxyKLcJxGskm2YWEexOMZKvFa+BJfXwLQ7NxZL4a129PMDi8OUbYj5/EnjNKo
 AZ8Uytd34/exa0=
Subject: [Buildroot] [PATCH v1 13/13] package/gst1-interpipe: bump version
 to 1.1.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 124a2e4073..a84be7a085 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  2fd86aebfe03849a19e9d02db3a8f97bf6f77de835d36ae84282d6f734df323c  gst1-interpipe-1.1.4-br1.tar.gz
+sha256  4543b2872ee5985679375aa4e588b2dcf8b8c4f61f106655989c89f4aab0d736  gst1-interpipe-1.1.5-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index eb1e6dd533..8d1da080a1 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.4
+GST1_INTERPIPE_VERSION = 1.1.5
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
