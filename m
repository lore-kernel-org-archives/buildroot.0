Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953E8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 09:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5BE61216
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 09:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF5BE61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE36402DB;
	Sat, 11 Sep 2021 09:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_x75xGtkawq; Sat, 11 Sep 2021 09:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81016402DC;
	Sat, 11 Sep 2021 09:30:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C05A91BF955
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 09:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFD07403D1
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 09:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32QUAnBSQgek for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 09:30:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C84CC400A9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:30:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 41F96B00572;
 Sat, 11 Sep 2021 11:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631352654;
 bh=lT8tVvSE3rCDsB37BF6lW6+c/tAbHKrPJug4JC75OM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bl86OS96+C+IFsSOLSyG/yTfBvlIXpodU8Hcc3bnyAKI0GjN7ndvrbeeSuD3t+jBO
 /ipLeQYg7kSytIZn7rWz6jVzjmTCTeRTd/56jyD5EX0OKxx+n+73g3kVRcgiJPBZ/K
 IWkFbQZHFPk4fLvm3hZYYSOjakE8jbYmeBfclmxk4/PckxlFLZYIzgPXd0j3wlC42t
 WhCTervuxMxxpfubQhS6abndhRbBFWcwQ+xLg9OBNyaDTbTPcAzx6KpxVYNBjttq5k
 mZNWm5rlluBgRGYtehnzNbJlXzxYZwXlpO0GWB1HmF/5IYfTbIqMq46xf4ALBgCmcQ
 yb6Di+IDfGFtQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 11:30:50 +0200
Date: Sat, 11 Sep 2021 11:30:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dagg Stompler <daggs@gmx.com>
Message-ID: <20210911093049.GJ1053080@scaer>
References: <20210911084204.22150-1-daggs@gmx.com>
 <20210911092713.GI1053080@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911092713.GI1053080@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to
 256M
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

Dagg, All,

On 2021-09-11 11:27 +0200, Yann E. MORIN spake thusly:
> On 2021-09-11 11:42 +0300, Dagg Stompler spake thusly:
> > following Commit 9f127cc4, the resulting image is bigger than possible.
> > so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.
> > 
> > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071376

In fact, that error is about another issue that was recently fixed:

    https://git.buildroot.org/buildroot/commit/?id=4ad23552c6

Can you verify that the test still works with the current master, before
increasing the fs size?

Regards,
Yann E. MORIN.

> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  configs/odroidc2_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
> > index 5f97fc3dd8..daa818e036 100644
> > --- a/configs/odroidc2_defconfig
> > +++ b/configs/odroidc2_defconfig
> > @@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
> >  BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> >  BR2_TARGET_ROOTFS_EXT2=y
> >  BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> >  BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
> > 
> > --
> > 2.33.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@lists.buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
