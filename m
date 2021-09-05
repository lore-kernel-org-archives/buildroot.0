Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777C0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:25:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C542360F21
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C542360F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D97401DF;
	Sun,  5 Sep 2021 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sDe4BMSwDSY; Sun,  5 Sep 2021 17:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9285C401F3;
	Sun,  5 Sep 2021 17:25:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D62B51BF425
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F5380F90
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXPozw0DzPAP for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 17:25:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FC3F80F1E
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 17:25:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8df:59ab:c58f:7e9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C18F5B0054E;
 Sun,  5 Sep 2021 19:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630862742;
 bh=790wrx1bMbXVvIxprJVhFk+GwrMVzlsJWNvqbVjVyPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cDIh65zRLmU9Z954giMsYNzAITzGUJGW9rPwziVwVH678tEevYi2z/yDvS/gEd5fx
 N/5iIzIoq4vN8uBaswoOEbOP0BE8uGxWeuWlTH3aUCzuQScRrq0ujoqLuShDaP37Be
 ybNgmEfW7cJvrqLT6Z74B/RnfBzfrlSVO1kMuT4f7XLwc+whjIaIaVeRiGnwaOrt+a
 IaZXqNz047HPhqBVhf51Fb0KgcDeBP3PRo9wfncZPnFh1wjSpitXs7Kca6NtJG+uNK
 WzliHocYqkXSbRmynBUVWRKG2IdFy6EGH1LD1waUHbZY8ylXZ8TZJKzPrQ7g5Xvjew
 cInTdJsbywkDQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Sep 2021 19:25:35 +0200
Date: Sun, 5 Sep 2021 19:25:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>, kevin.tomary@hotmail.com
Message-ID: <20210905172535.GU1053080@scaer>
References: <mailman.926.1604348782.66322.buildroot@busybox.net>
 <fce5af4945c0c4ff18ed7c340d696713@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fce5af4945c0c4ff18ed7c340d696713@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] mkfs.ext4: Could not allocate block in ext2
 filesystem while populating file system
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Kevin, Andreas, All,

On 2020-11-03 08:05 +0100, Andreas Ziegler spake thusly:
> >Subject: [Buildroot] mkfs.ext4: Could not allocate block in ext2
> >	filesystem while populating file system
> >Message-ID:
> >	<AM0PR10MB2433AA0D0ED377CB19D8F22A82100@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
> Check the hint directly below the error message:
> >mkfs.ext4: Could not allocate block in ext2 filesystem while
> >populating file system
> >*** Maybe you need to increase the filesystem size
> >(BR2_TARGET_ROOTFS_EXT2_SIZE)
> 
> Your new root filesystem is larger than the default space in the image,
> which is specified in the buildroot config.

In fact, I believe this is a regression in e2fsprogs 1.46.3; see bug
#14196: https://bugs.busybox.net/show_bug.cgi?id=14196

I'll soon send a patch to fix that both in master and in the stable
2021.08.x branches.

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
