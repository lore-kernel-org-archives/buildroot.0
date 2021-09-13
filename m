Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72F9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864A361107
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864A361107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2948C401F4;
	Mon, 13 Sep 2021 21:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laBW0aGH5ivN; Mon, 13 Sep 2021 21:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4099340195;
	Mon, 13 Sep 2021 21:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA6BA1BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C1880E28
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tyCsU14GBka for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:20:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C61E80E19
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631568043;
 bh=bxeJJ+2HDlL0v6ys0Jft8HiTIljAi9dNMnuyFY9RXyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dqM/V1VwozauAXX/Ogd6SGTk/8P3QbH9aRY/iFdWXZtodZShnf7mZY704CeXUJeLN
 gXpuvgrZBUFBwUUMDfG1GWbF3LEsDLxvlr5EZWahg+93ds6z3TpXJpyd7Tzuy0O4nl
 8RgwhR0JuNZR4LE6exvypZk0+2jJnoJlADJSkgeU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [83.130.82.162] ([83.130.82.162]) by web-mail.gmx.net
 (3c-app-mailcom-bs02.server.lan [172.19.170.129]) (via HTTP); Mon, 13 Sep
 2021 23:20:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-87c6f8bc-6a3a-4831-971c-b0f35c4dc794-1631568042596@3c-app-mailcom-bs02>
From: daggs <daggs@gmx.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 13 Sep 2021 23:20:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210911194453.GU1053080@scaer>
References: <20210911162515.29022-1-daggs@gmx.com>
 <20210911194453.GU1053080@scaer>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Eu4mBWrc4ik5MlkI6wnXvztvrIRmY+9kntdXmho3lKZWcgqsfsVGbjPJ4Zr4E/EPjARq4
 fHsDkXPhVUfg+yavkK4nEt1/YWLUvV/SFehRRKUg7YOpKeA+BJ6iX9kqFTOA0ajdIMTkU9MoiZ79
 VVRRPYFVx5ckJKBV7aMx0RJ6qNkTcvVIUpPpVFvOIOorFN1yE/3u/f0NO90uKGHEMs0eHkw31OHp
 jxSB9L2Ei77FsIdhzS/G6/jRTHe+eGDOwsyq0XYZaqjZJ0ScqBZpDVy94LZFicCSMh7NqGsxiBep
 J8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:9jGPaeLU4wU=:CHvSGGyHcIxUaEsFsK3v49
 3T+75hsOlX3nCNs0kQwXNoVep0AXm6wGZa/hM3PyjG4KKA593JXfg1UEXfSm/sU0Ig/Ao/onO
 F5LOYkjQees5+odLz+Sti+vUU9d6FP8QnTMh+b/X0q1JyVI+txXVkGqtoEaKOfeR5CsMDoEJN
 nlzGNObGtSHTWayqDeqPXLJHxAX41DrqxTrtIlfcjTwUQkp89sU5bkWalye54fjk7p1CstqBi
 HhPthMOR6gi/0y8fOxbxLl5m94/q3A4oh0y2t6QDdvpu9gaWpKHFq1JjLFkPT7dPMQosHnLbj
 R6MkzjxgvEoZhUADAEFYOCGpssuqmwny0uJMwDcuvgZqMmkJVG8oUaVZdQt4LG38l6L9haBDT
 3b3mx7oud6VOcQOorUU2uuHaCyktk2qgPcT2iP2RrbKFGHXgb8KQdIyHXawbg8mFIE8hRd//4
 qSDpk+sHCg1dcBXDrEkwLsKujCMoytiL3oqAqmYeBmVbvfTEw/0g73k6epTpWTHA4os2m6qVw
 huAvcAPBGKheoRsCQKdGiDr2Is6GIVXX0agXXW2AkxzCw/i82POSuvt+GkyWo8sLnYFtAkL3G
 eITX0s+1NupTvy8RQ+GTKVlEwYCFiMB9z75Qw7AEKe3e7qKSa6rt+e6oLG1MstcAD0WOFN4TM
 7p0HtzNB0r28tnJM4+SYp4rTR8H5ClZnbBwd44m2y2/pfyQHjsGNeTgD2EoxnePP8Hl25t+bK
 n6z1a8A29SNqX0d+kz3udsvpUE8la6S4i8HW5b7v1N2VpgpgD//fOPU57TKcDuEppG4Xwcp6F
 cZGAG4eAWmaqXSPtJ7WTL+J0cp5UuOOrLI7ks7AMS12K7di+ZU=
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/odroidc2: increase rootfs
 size to 124M
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Greetings Yan,

> Sent: Saturday, September 11, 2021 at 10:44 PM
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH v2 1/2] configs/odroidc2: increase rootfs size to 124M
>
> Dagg,
>
> On 2021-09-11 19:25 +0300, Dagg Stompler spake thusly:
> > as result of e2fsprogs version bump, the image size required was
> > increased.
> > so to fix it and make sure there is enough size, set BR2_TARGET_ROOTFS_EXT2_SIZE
> > to 124M
>
> So, I was wondering what the reason for the size increase was, so I
> spawned a build in three conditions:
>
>   - my server's Ubuntu 16.04
>   - my laptop's Ubuntu 21.04
>   - a docker Bullseye on my server (so, minus the kernel, a stock Debian
>     Bullseye)
>
> In all three cases, the build succeeded with current master. The sice
> of the target/ directory is roughly 40MiB in all three cases, which is
> still far enoiugh from 60MiB that it should not cause any issue.
>
> So, I'm still not sure that the reason is "Debian Bullseye", or that the
> solution is "increase the filesystem size".
>
> Could you please try by aplying this patch to master, and rerun the
> build, and share the error message, please:
>
>     diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
>     index 74c99bd7b1..83c967c9df 100644
>     --- a/fs/ext2/ext2.mk
>     +++ b/fs/ext2/ext2.mk
>     @@ -16,7 +16,7 @@ EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
>      EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
>      #" Syntax highlighting... :-/ )
>
>     -EXT2_OPTS = \
>     +EXT2_OPTS = -v \
>      	-d $(TARGET_DIR) \
>      	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
>      	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
>
it doesn't reproduces anymore with latest master

Dagg.

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
