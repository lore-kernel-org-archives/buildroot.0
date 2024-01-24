Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9A7C47DDC
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 15:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CBB6408C6;
	Wed, 24 Jan 2024 15:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBB6408C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggGenaQFQ-_B; Wed, 24 Jan 2024 15:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A556040554;
	Wed, 24 Jan 2024 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A556040554
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1021BF8C7
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8459960BC3
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8459960BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akOLT9f2u-pk for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 15:38:10 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0F1460AEA
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 15:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F1460AEA
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29041f26e28so2921068a91.0
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 07:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110690; x=1706715490;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXbZ6/mfcOsQKmFhHaSpBsu0v4S1SbtxrofKUypzv6c=;
 b=PdZCEohNanTVDXsKKhMYrGkXA3q7LHgOVfqrASrj6zQtufRTbUyvH1/GEyrE8ZFQnX
 UDhRLfwYBC5CCSIO7nJCeu8xz8sV01ACSkB+Wp+P+ISla5OINC8E3KPvSIh2xLrwhKZO
 PkuRFQ4oHnm5l1ss2engp6WlZxr7J1zg3r/sBf1wi7UV6wshMPy/C/rk6wJphJCySgtO
 0jreRsDvvqkqVhZNgCLwRSEn3UpZTZ4OKdvanddVKLAKVkOPJAQ1syFTWjO4BW+57drc
 3CYyDZNiMiKuJIoKJ0pcuXTMbOROWu9C1AWX5x6aeEP34eshM+fJ1ZmYHId1OdTpw3Hd
 F95A==
X-Gm-Message-State: AOJu0YwfPhNPMX95ZtKpG/gj1Vp7Dvg8zTEWxqC0WwCklLSbg4kWP8fI
 nJe7TJryBxfErXfjiYVH0Fq7ngeLYzt23R6TsvAwK0oTPNytzfXo
X-Google-Smtp-Source: AGHT+IG+OQb8jB5PgsZvgtJysBVoEHBN8+JYzxsP0n1oGyCfkZQynrmu4o/ptIpfcoVwDCDMg3ZAmA==
X-Received: by 2002:a17:90a:51c5:b0:290:b361:8a9d with SMTP id
 u63-20020a17090a51c500b00290b3618a9dmr3151745pjh.18.1706110689897; 
 Wed, 24 Jan 2024 07:38:09 -0800 (PST)
Received: from p1g2 ([2001:861:3201:3d10:726c:e617:2336:af41])
 by smtp.gmail.com with ESMTPSA id
 cz4-20020a17090ad44400b0028c8a2a9c73sm13952455pjb.25.2024.01.24.07.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:38:09 -0800 (PST)
Date: Wed, 24 Jan 2024 16:38:05 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <ZbEu3e7RovcI2WtU@p1g2>
References: <20240115-imx93-support-v4-0-8d7f90f60980@armadeus.com>
 <20240115-imx93-support-v4-3-8d7f90f60980@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115-imx93-support-v4-3-8d7f90f60980@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110690; x=1706715490; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GXbZ6/mfcOsQKmFhHaSpBsu0v4S1SbtxrofKUypzv6c=;
 b=eoAlGphpKDrRdLBYIVwWc5PMHbCV9guVJF68Fdq73KtZCxlSekquEnMZlEW7fMzYPd
 bZwOnLQFF50mq/WkzHfma8gabTBs+bLh0iQKIZAx8cyYfl1TRNXUUGOSf7r4+tGGURHU
 i/n+UV2h6QSM/NTr4W9pKLHNWxRh11nX2aXI65KDKW+FtP5rbwPjSmtzm7V/nl0y3X+N
 exJV4c2yhQPJHZm3JeKsg8ITcxe9U0RR7EcYDH9wDwtG6mt2LQBDqcDAwhDpeTxXaXfJ
 aHwz9VnCWbugA9mC8PRR3khqR81ONycnqPs5t11Im4wf6X3f4JX1CD+W+5prHux+Rl84
 3PHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eoAlGphp
Subject: Re: [Buildroot] [PATCH v4 3/3] configs/freescale_imx93evk: new
 defconfig
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi S=E9bastien,

On Tue, Jan 23, 2024 at 09:45:17AM +0100, S=E9bastien Szymanski wrote:
> This patch adds support for the NXP i.MX 93 11x11 EVK board [1].
> =

> [1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-dev=
elopment-boards/i-mx-93-evaluation-kit:i.MX93EVK
> =

> Reviewed-by: Julien Olivain <ju.o@free.fr>
> Tested-by: Julien Olivain <ju.o@free.fr>
> [Julien: tested on NXP board i.MX93EVK, cpu rev A1, board rev B]
> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Not sure my review is needed as there's already one but here it is ;)
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Thanks for this series!

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
