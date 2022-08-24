Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651E8C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 07:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE5058193E;
	Wed, 24 Aug 2022 07:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5058193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26pxpZlK-rMr; Wed, 24 Aug 2022 07:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA62D8176B;
	Wed, 24 Aug 2022 07:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA62D8176B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8471BF844
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6610160B75
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6610160B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6X6EhM4ku5b for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 07:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D2B460B64
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D2B460B64
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 07:38:11 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 2so12907402edx.2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 00:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=3A9dgDPDonmQxcl+veG+evf2bnrJUGpUKTzhd0BizHM=;
 b=YVYn/U2SvBPKDmXBlpGDfXJ0KjcQs9ZBz2W9wYAdAPcoPDvzzeoVlRVcLs7powPSAp
 WZ8g9DUGAlynt5xE+U2jRQMd+SUoyxetUL0tRlhoQqQ4Xq6vrCY7tGgNqgTfeYXvlh0A
 67oWoXChZya2bwg8gSjpH7uwdLBM9i2euUoaLYItXNZBY4Dq+g5HFdairn0U5WMmNv0n
 wS/sHcjj5LBmocWmEKZGrvQrDvbMr1DSIrCwePO/grs7o4WOz1LeTKVxqr30ig3ML19c
 HX1WvKIxzloMMJuMt0Oei9qqOY6k9HMIunBfDaN59pU3SddoplxmH6a1GcoOUck+CqF2
 Ovbw==
X-Gm-Message-State: ACgBeo1qCQpc47bqHqMai506DzkCKeNPJ3xl4Y9zgIKWj3V/Retrvzyi
 pnBp4W9S8TxFygMY2Y4sqHvsObqUWLoK+g==
X-Google-Smtp-Source: AA6agR79NemdbEcGqz7XAfH+KnGYNhYlGI9LuNZ3y67HNK/lOTZLiB8ddGKVFKMZZ1gRs/B9iALSFA==
X-Received: by 2002:a05:6402:378e:b0:43e:73f7:5c53 with SMTP id
 et14-20020a056402378e00b0043e73f75c53mr6581242edb.124.1661326690117; 
 Wed, 24 Aug 2022 00:38:10 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 w11-20020a170906d20b00b0073cd7cc2c81sm770180ejz.181.2022.08.24.00.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 00:38:09 -0700 (PDT)
Date: Wed, 24 Aug 2022 09:38:07 +0200
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YwXVXxWR1B2hN9Hm@nitrogen.local>
References: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
 <20220823233012.513e0bf8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823233012.513e0bf8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=3A9dgDPDonmQxcl+veG+evf2bnrJUGpUKTzhd0BizHM=;
 b=tnmCR8kQfsA0/0YU1eCIUjbiDVwoKYjEATL0lypNPMSmbaVBff2aT9Z+aZQu86hLAu
 ZhYz7kwildrNW0XThA5+M3MPpmO+CsTJb5JHEmr2NDQe2qNQyDYuNwetzJSiYRqvvRw2
 RvEtnF0agPo96N6lr8uJdOy9v67K49at0DcdHanfFNJ/RbvR16fisBO+p35WTCyaWb3D
 MQnON0PU5cM3oJWI5h69neLf+TE1fXKeVUawJyCIFoBy4QicjlsoMQPTg0h21TP7Udbe
 CoxUzj+KhVEQGDSRZlJXcgTSOMI3rQQBUjLJfw6Cx0NeojfQ+GeGkD6EQr5Smuwjrr64
 dJnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=tnmCR8kQ
Subject: Re: [Buildroot] [PATCH 1/2] board/freescale/common/imx: align
 u-boot-spl to 4 bytes
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Seems like I made a mistake in my git send-email. Indeed there is no
PATCH 2/2. Sorry for that.

Thanks,
Bram

On Tue, Aug 23, 2022 at 11:30:12PM +0200, Thomas Petazzoni wrote:
> Hello Bram,
> 
> On Tue, 16 Aug 2022 14:07:17 +0200
> Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:
> 
> > When enable DM for SPL binary, the DTB part of SPL may not 4 bytes aligned.
> > If u-boot-spl is not aligned, the offset of the DDR firmware is not 4
> > byte aligned when u-boot-spl-ddr.bin is created. This causes the ddr
> > firmware to not be loaded correctly at boot.
> > 
> > See imx-mkimage commit bba038d893046b44683182dba540f104dab80fe7 for
> > implementation in imx-mkimage.
> > 
> > Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> > ---
> >  .../freescale/common/imx/imx8-bootloader-prepare.sh  | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks. Even though your patch was marked PATCH 1/2,
> there was no PATCH 2/2 posted on the list. Was this a mistake?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
