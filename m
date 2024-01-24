Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576FBC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 15:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D750E40923;
	Wed, 24 Jan 2024 15:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D750E40923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACCLCYrFN3Qv; Wed, 24 Jan 2024 15:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384B2408C2;
	Wed, 24 Jan 2024 15:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384B2408C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2111BF8C7
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3597408E5
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 15:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3597408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56IdJkBdiaFY for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 15:34:48 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 037FC4056E
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 15:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 037FC4056E
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d7431e702dso25591515ad.1
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 07:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110487; x=1706715287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWdcMgTBdbDm2icrQvi2OB1PCDDwONlLUEvXAxFrUGg=;
 b=Rv5oz3hZxZNWG2sIiILqbgUY45OoM/znYE8XdkFDQzeRv0yWyqKfdmD8h1dhLVIlPk
 RljBOE7sQpLoMbAHQq2xPOBMjxMBXc3O2vphc2JMasY1MkmQCkACXLVSvYOVhf3xAgS9
 0GI9fixuDx50k2gb1FjB9H/Z/K7dGvJ0PDL/hN6Qgyf/+kNQq5mxxAOGyo/b2cuZFbQb
 0orK76kOL+4vBa13GG0++QB1+RY369HOefAVbVrr0ignvrb5crIDD02iJ5a5uQa8t7af
 MdBKqzH7/nW1ebgMPKL+I20mVenSbdYSe9kmq8bGwR7tLMfeb82GFxNLPGmvaA5wa4e+
 stYA==
X-Gm-Message-State: AOJu0YzdZa+4bIyDQ9wet7lBWvGsB0uMHCUpKN7+I0jy0ZTA4YF8gyZy
 YXSz6GD/hZzVigsTY4+Bnh3EpAqs1MbAQ+1Onf0I2ptq2zwpfFQ3
X-Google-Smtp-Source: AGHT+IHmA1dFASaw2mDpkVJCWr4mtmqP0rYCgPVESB02ofgYQLqVVooZj9dxz3BTe9oIRehuCxNlKw==
X-Received: by 2002:a17:902:e744:b0:1d7:7ec4:58ba with SMTP id
 p4-20020a170902e74400b001d77ec458bamr846679plf.6.1706110487155; 
 Wed, 24 Jan 2024 07:34:47 -0800 (PST)
Received: from p1g2 ([2001:861:3201:3d10:726c:e617:2336:af41])
 by smtp.gmail.com with ESMTPSA id
 lf6-20020a170902fb4600b001d785fc6ec7sm1164147plb.177.2024.01.24.07.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:34:46 -0800 (PST)
Date: Wed, 24 Jan 2024 16:34:42 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <ZbEuEhnWMwack5E7@p1g2>
References: <20240115-imx93-support-v4-0-8d7f90f60980@armadeus.com>
 <20240115-imx93-support-v4-1-8d7f90f60980@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115-imx93-support-v4-1-8d7f90f60980@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110487; x=1706715287; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kWdcMgTBdbDm2icrQvi2OB1PCDDwONlLUEvXAxFrUGg=;
 b=DVxuifcGZUSUklN+b2yl5dC3Oq5IqnkH+pvfS9BCVo1eGEtb4tt6lU0lOSyA1EaGb8
 t8RK6vUVC8opucAbwcgtEjb+n1CXPgSMrJRNXLNm2MgBXTH+QvV/jgoPP+AWVwVqRQNx
 omQlSQZYNWwAIdNCJxK8f7eMaYWtoWBWqbATQb6s0e1KMK7h51JXb+EGepExkWZafEsX
 O7CDobPZT4tb6MI/zSGf8459AZckQaK14xzw8lTCukQGCGYF0uy2BRlbr+XgW1tOhpJa
 s5yTE//XJpL1v2ptbKAudPTVzdTRj6Tszmp6b9jH/QxrtLgaiq7ZDNeD1Vs/wSOjU1K2
 xjjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DVxuifcG
Subject: Re: [Buildroot] [PATCH v4 1/3] package/freescale-imx: add i.MX91
 and i.MX93 SoC support
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

On Tue, Jan 23, 2024 at 09:45:15AM +0100, S=E9bastien Szymanski wrote:
> This commit adds i.MX91 and i.MX93 support to Buildroot.
> https://www.nxp.com/products/processors-and-microcontrollers/arm-processo=
rs/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS
> =

> There is no i.MX95 software provided by NXP at the moment that's why
> i.MX95 is left behind.
> =

> Adapt package firmware-imx for the LPPDR4 firwmares binaries.
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
