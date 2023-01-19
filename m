Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E12C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 12:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F34415E5;
	Thu, 19 Jan 2023 12:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F34415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N72DbIlEWh7; Thu, 19 Jan 2023 12:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7E34148B;
	Thu, 19 Jan 2023 12:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7E34148B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 212241BF2C8
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F160081337
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F160081337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSs2oy3DI882 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 12:38:37 +0000 (UTC)
X-Greylist: delayed 16:48:28 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A2C81336
Received: from mail.xogium.me (mail.xogium.me [IPv6:2604:6280:10e::3])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A2C81336
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 12:38:37 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id B323EF40214;
 Thu, 19 Jan 2023 07:38:35 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 13:10:02 +0100
Message-Id: <20230119121004.3416962-1-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1674131916;
 bh=5HX0+/hVaBPjkiNBhEtNyoKz94BhnOdEFRtSHzICGD8=;
 h=From:To:Cc:Subject:Date;
 b=U/W73uZ1V0lRb87DFrqOMPO/IVOP2eWqe8FZ4fQFqj/Km0hKGDw/uYYmcPTjMmDn4
 V16n6e6oR+PvrOi6KSXZYQ7AUN4rSG3heEnNGnOZbqW9dPvnBKzGH/otKnwSGBsZno
 anh4nhfNsMAyBGoF0Pwq4CqU04VAEwWeafEllaklAV6jeYKWe05kCy6im+YMka7LvH
 P+RlQCLdrADKkWIh+jTnB6OnAlEPOSXsyAeWPz2O4gQBc7wqgbmQh9VpC/p5UmGsa5
 uJ2UbGY2e0AXsAqp+t9g7/AFjSmLPkoStB82/KGVosmBNAcaWxvbeJt63dySIJdYHs
 lNM2viqWo13KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=U/W73uZ1
Subject: [Buildroot] [PATCH 0/2] make barebox build reproducible
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches are needed to make the barebox build reproducible when 
BR2_REPRODUCIBLE is enabled. To do this, there are two requirements:

- provide a patch for the lzop package so it can override the 
modification time with $SOURCE_DATE_EPOCH
- set the appropriate environment variables in barebox.mk, and pass them 
to the make invocation when building

Barebox makes use of lzop to compress the device tree included in its 
binary, hence the reason for the lzop patch. Also, barebox uses the very 
same variables as the kernel for making the build reproducible 
(KBUILD_BUILD_HOST, KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER).

Casey Reeves (2):
  package/lzop: provide a patch to allow overriding of modification time
  boot/barebox: pass required environment variables for reproducible
    build

 boot/barebox/barebox.mk                       |  9 +++-
 ...3-allow-overriding-modification-time.patch | 46 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 package/lzop/0003-allow-overriding-modification-time.patch

-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
