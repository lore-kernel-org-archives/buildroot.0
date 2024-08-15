Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE3C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD85760727;
	Thu, 15 Aug 2024 20:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySy1Xc7bKPrg; Thu, 15 Aug 2024 20:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C382A608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C382A608FB;
	Thu, 15 Aug 2024 20:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 886821BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7672B408C9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhaTQPYy_uEt for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 410A0400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 410A0400B5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 410A0400B5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:00:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 80FE613F89A;
 Thu, 15 Aug 2024 22:00:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 22:00:36 +0200
Date: Thu, 15 Aug 2024 22:00:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zr5eZO21C1avtmSz@landeda>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
 <20240815215040.0908cb47@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240815215040.0908cb47@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723752039;
 bh=zMDdtBIXUDKJL9PNpGKM28tGg4Rx0IwxVKeBOoHabDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HUIqO2lUP5luV48pTRWZqtpS5kwwVvyLHhudhNabSLUOst1S6qgIWG5fTDqTz0RAE
 4qHgn5tBaNf3Rltnh3YrRPTqZE5gh2GDry6hrAzJJMzhAwh+ciXKxJ2zwnkCLp9+I3
 ZZRBhf7cxHmsrD1Jdy1NxkgmqUyhqtPz39tWlVaGJgQ8Pi6o+lZXjM2o5ZO3h5We1y
 8VYjdcMAB5vstieuDz2/NOnr0h2KE3UCkZjCHA9Cfp5J+1yG+fHwqlqpqg9EfAtASg
 3Dw+BBOn7GMAYk73C/lOgqBurX0GtGhbz4ilIiC8J/71vw/fImjJGvuwuwUageeVn3
 4O4/u12Z9HfHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HUIqO2lU
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
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
Cc: Dong Wang <wangdong115@foxmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-15 21:50 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 16 Aug 2024 01:28:26 +0800
> Dong Wang <wangdong115@foxmail.com> wrote:
> > This patch fixes the wrongly calculated uboot partition size in
> > genimage.cfg. The size should be 1016K, which is
> > 1MB (typical partition start) - 8K(offset dictated by the bootrom).
[--SNIP--]
> > -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> > +		size = 1016K # 1MB - 8KB(offset)
> Actually, does this size argument really make sense? This space will
> automatically take the size of the "u-boot-sunxi-with-spl.bin" file I
> believe. Or is it needed to make sure that the next partition doesn't
> start before 1 MB?
> 
> Why is it important that the size is 1MB - 8KB, and not 1MB or 2MB ?

The above has two effects:
  - ensure the uboot image is not bigger than the allocated space,
  - the filesystem image (rootfs) is aligned to a 1MiB boundary.

The latter could be achieved by setting offset=1MiB (or 2MiB or
whatever). I'm not sure how genimage would handle the case where the
uboot image would be too big that the offset of the next partition could
not be honored...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
