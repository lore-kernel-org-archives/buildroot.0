Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F136C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59DA40944;
	Wed, 24 Jan 2024 15:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59DA40944
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueyiiPaLDNXF; Wed, 24 Jan 2024 15:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0A1408F0;
	Wed, 24 Jan 2024 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0A1408F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C216E1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF7B60A77
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF7B60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG8RcyzWcmiT for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 15:36:26 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C308260AD2
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 15:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C308260AD2
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3627f61fc15so8463455ab.2
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 07:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110586; x=1706715386;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KOMMHM2p64qO1cxokPKLAKbCRjNbLzNVLuksrLsOkHQ=;
 b=ZK+akV7BYYxVKBiA75QV0tSBy7bAAxupJ9jgUgJGOFyS3o6BOl23VUGUFXQIr67UTc
 6sd/ROpxI3oe9lD82ctqJ8OgKpFO1lqg9e+cjlR3bLpbWD7Zqjgtvur1HIvDE71xp4p2
 KTyHN95InXt0k8HYz4unbkb8AwOPR3aRYU6mOLT55f+NpID3pGZmHv537fBbulJJz1xE
 cMedG+/Eeq7yDjuxEhcfqFRqgt5pYXKCQfC7tVuOlLhbxxcJ/TPweWrBrAnMp1AU/r35
 wo+hvXE18xjO0YGFsz2V51Rma7GSMeRfjQLYWjeKnckuQjsFYntSa6QBUIJjoRqDkq18
 RuNA==
X-Gm-Message-State: AOJu0Ywq18MF6o2pyd4hxhk+0Q3PZxcA41MHawq1k58A7UHJVCALyfDE
 wXfdrNaXdhO2saX7iat1LCXZtWpDVUq0/zwhXy6IU4W+JRXuzdm+
X-Google-Smtp-Source: AGHT+IE9nHsFQzGT+GTOmaHxXEUJ3KCcjhwvDqKAHzldp4zfXizZSUz/I3xXPC4olnuk1LVP8YGLbg==
X-Received: by 2002:a05:6e02:1d1d:b0:361:abdb:8e17 with SMTP id
 i29-20020a056e021d1d00b00361abdb8e17mr2278779ila.23.1706110585694; 
 Wed, 24 Jan 2024 07:36:25 -0800 (PST)
Received: from p1g2 ([2001:861:3201:3d10:726c:e617:2336:af41])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a637511000000b005d43d5a9678sm2053382pgc.35.2024.01.24.07.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:36:25 -0800 (PST)
Date: Wed, 24 Jan 2024 16:36:21 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <ZbEudVy_cwILU48x@p1g2>
References: <20240115-imx93-support-v4-0-8d7f90f60980@armadeus.com>
 <20240115-imx93-support-v4-2-8d7f90f60980@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115-imx93-support-v4-2-8d7f90f60980@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110586; x=1706715386; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KOMMHM2p64qO1cxokPKLAKbCRjNbLzNVLuksrLsOkHQ=;
 b=ilDIFwpGVVnyXnDNAYvPLKxWdCF2Bta34kvm4uWvzzeMbzkgCeVRJW00ML7cdO+NGB
 46ZgT2erA5T7kbbWQ3PXXf1TbORyn9F/kufENLF2ThcsuW2QWYgitT8ZFfDPI//d8MHL
 mZOFn4M7qMSm05nZhRfpDfTou06IX+CNu6Qy3s2ZAiKzlxP2iebkOjZQMy5E0dSswmYj
 T6dWnXTUBb2MgBDdUyfAIVB6oDKvb1s5uTSGxCtY9XaiDn3+KKZkYlAYSQBvWq9tjM/P
 HtZmdfe7JS8w7pitul/fFb4wGbR3QVCYTc3b4TG6VaLHC7j8pwjMEWLPYD83tWJgb34+
 6Jdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ilDIFwpG
Subject: Re: [Buildroot] [PATCH v4 2/3]
 package/freescale-imx/firmware-ele-imx: new package
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

On Tue, Jan 23, 2024 at 09:45:16AM +0100, S=E9bastien Szymanski wrote:
> This package provides firmware blobs for the Edgelock Secure
> Enclave (ELE) [1] present on i.MX8ULP and i.MX9 Socs.
> This version comes from the 6.1.55-2.2.0 release.
> =

> [1] https://www.nxp.com/products/nxp-product-information/nxp-product-prog=
rams/edgelock-secure-enclave:EDGELOCK-SECURE-ENCLAVE
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
