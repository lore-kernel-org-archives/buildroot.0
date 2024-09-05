Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C6CE7A91
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B33A4400E4;
	Thu,  5 Sep 2024 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H6YAWT9JnRF; Thu,  5 Sep 2024 19:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA33400FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA33400FC;
	Thu,  5 Sep 2024 19:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D97F1BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18013400FC
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dr64lZcj4auX for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B33DC400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B33DC400E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B33DC400E4
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:56:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0016D13F8A9;
 Thu,  5 Sep 2024 21:56:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 21:56:26 +0200
Date: Thu, 5 Sep 2024 21:56:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtoM6k0EaDsZa4mV@landeda>
References: <20240904205354.504964-1-yann.morin.1998@free.fr>
 <20240905213522.2a476624@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905213522.2a476624@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725566192;
 bh=tcGqM92uw/rLi01E6Te95+sarHr+txVgfJqSGq2HtHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEmqNIbB4G83WUQO7mFqaGrv+xJGj8cP5Ldn+0lcKeWI697PGAPqDHLcay0/4L62r
 dyFfnRcvjsUAnAjMttknX6mGBB088UP3sP0WtNhyOQrv1km15hnxB2qe93+2aYFUrR
 Iv9y0IsEDcgCiT74QnzdaWMvU37BVoVPshyNX8qqDXCCB4Cek51r7ofyduap55QVJP
 avjx9sY+ZOagA0DhjoP6vhRc+Gaf/ZirxjjSKSHcIAeLG+8CUDVgsMAtczVOQqTx1h
 ymun0l6cxCHedVGyXnKs+OW2eoXZ8DgP1cvP+L3euds/9x4poCk7/CqmorOt2sW54g
 JGq1jUf2opMSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EEmqNIbB
Subject: Re: [Buildroot] [PATCH v3] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

+Arnout whom I forgot to Cc in my patch.

On 2024-09-05 21:35 +0200, Thomas Petazzoni spake thusly:
> On Wed,  4 Sep 2024 22:53:54 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Change the documentation to only mention using a space-separated list.
[--SNIP--]
> I'm afraid I'm personally finding that this not going in the right
> direction. I didn't follow the discussions on v1 and v2, but on my
> side, I would very, very, very much prefer to use colon as a separator
> in the BR2_EXTERNAL variable. The PATH variable is like this, it works
> well, and I believe the principle of least surprise should encourage us
> to follow that and use colon as a separator.

The thing is that all the other lists are space-separated:
    BR2_ROOTFS_DEVICE_TABLE
    BR2_ROOTFS_STATIC_DEVICE_TABLE
    BR2_TARGET_TZ_ZONELIST
    BR2_ROOTFS_USERS_TABLES
    BR2_ROOTFS_OVERLAY
    BR2_ROOTFS_PRE_BUILD_SCRIPT
    BR2_ROOTFS_POST_BUILD_SCRIPT
    BR2_ROOTFS_POST_FAKEROOT_SCRIPT
    BR2_ROOTFS_POST_IMAGE_SCRIPT

The list goes on and on, notably the options to specify the lists of
.config fragments for the kernel, uclibc, uboot etc...

In fact, BR2_EXTERNAL is the odd one; it's the only one were we expect
a colon-separated list. Also, lists in Makefile are necessarily space-
separated, we can't handle paths with spaces in them anyway. I think we
should just accept that space is the splitting character for lists.

(v1 had too many typoes that I was ashamed enough to quickly respin v2,
which added the comment in the script, as explained in the post-commit
changelogs ;-) )

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
