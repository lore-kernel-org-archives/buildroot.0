Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790A8C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 17:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF0E81467;
	Sat, 15 Mar 2025 17:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3q9Wfpyx-yo; Sat, 15 Mar 2025 17:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3B28156A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3B28156A;
	Sat, 15 Mar 2025 17:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31D98C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1550081467
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 17:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-47PbalfEbY for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 17:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80E1381E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E1381E2C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E1381E2C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 17:11:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so317878f8f.0
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 10:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742058665; x=1742663465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHEe+OF3w/A46Np5ugZ42bMx5ad2kye8pz0WTQ/kun0=;
 b=rOhrmHcaqHGoc6NvwSONWSNl8hRzc3jJXFENCHZDOTONtUZ046lDqM1htucm7Htq4Y
 ZzjQsiS2y/UoqO4Gw1acjvNhtQb8WkUZunjwFA/D11KfqNJNlPYYHpLIom0irQFkEOWF
 xKC5CajD4iFpupuhHPn2UqP9zecoye1/LocVt2i/5tN4o0IeUoMJLRP6qxCZipdm7Tt7
 bR+KW4wooiA+8p2whJs2Bq+1aVJO3i/7PKHF6hvd9bj5Uxtw7FCcWmI81rYDYOL/Dm8G
 xvS72+jbdI3X7Tr2JPcbfLb6/+MPchWG/D4E6aI78ZB4M2iKkGgrkJGbvU4F7yFNLqcC
 lizg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe//4h02HKjM12ZSJLuABoHk9UQT5RdF3nrDistEcowboQdTywDmudbVyvBp+R9uO4ofBjNzHUzLA=@buildroot.org
X-Gm-Message-State: AOJu0Yz0hoMLuRBO0a+5Y3nsHyJmApMxzZmf7yKYarH/bldZvr+Yb0BQ
 HeD0XaAYaFaNdny4z7X8zhRwDoVSzR9BIpHtnpu5+itWPM44YeOE
X-Gm-Gg: ASbGncs5pldgZVk2Vex7ZCSGq1TZ0vCllXF0olkwauCvH3eocn+Tlfd/zA907EIwbnq
 PIRT6CgbiO25qgVRNZX1xZg8/gNyHx6cNuoh/7IYTKE3iZyP1kvaeZq3Z1PxwybUmQmbn9r+L5J
 MZnrTQiiKtIHjEj/srct+4et0SHuNsMdWQa9LY8Fr66U0szmnnKumNHlq0sqGsc+5VSGG6eFuXp
 mOnDecbwl4y9zAbf6WQa8qQNeE2spGVV8tVfA5sqUR7LEMVxre7GFfXZ3IV4V1e+NP378OoLcKg
 3EoX7mrHn1peBiToRl41XgpUMq2RqcFb
X-Google-Smtp-Source: AGHT+IFcBSqNMknlcmiaA8PBfSjTrG85PnaU4c2JJGULp/c8tsoLAaVwQp79Qo45OFacak6uXsxaow==
X-Received: by 2002:a05:6000:1a8e:b0:38e:48a6:280f with SMTP id
 ffacd0b85a97d-3971f12bb41mr3304611f8f.9.1742058665246; 
 Sat, 15 Mar 2025 10:11:05 -0700 (PDT)
Received: from skbuf ([86.127.125.88]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cd78sm9613670f8f.78.2025.03.15.10.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 10:11:04 -0700 (PDT)
Date: Sat, 15 Mar 2025 19:11:01 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250315171101.qcng2f6rsice3a4n@skbuf>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-6-olteanv@gmail.com>
 <7ppsoggazufebwywfwqqlkmssypneyqtmbg4tr4dx76o5dx7q7@iyndbkzeo2zl>
 <616d3621a153da86972c8b1497f71c53@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <616d3621a153da86972c8b1497f71c53@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742058665; x=1742663465; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FHEe+OF3w/A46Np5ugZ42bMx5ad2kye8pz0WTQ/kun0=;
 b=jhwhSRZQRcS6w4hC1nqTMEIjbzWPLkvcJXjwiR2/cZraNVTEV4M2OFLJR/QYPzkeUA
 n8foGhSAVkDMRtcyoz608heS4o+jVR25WhohP0B7dmBh5PkTzKa8x1GM1oJdoRocDFI4
 1ygCAHWV1CfdItu7n81nMZkzoVJXmlb0MFwJujSWIxYgQfwLc8pmM9pz6MDoOix7sIRF
 DnBypAAaoWkqEt3R1p0jHqmcKmpxM2zB0ZwlaeTCs43/jW0XDrlL6/iCY36nL4ipyTU4
 kWVNHRrcqgSvuZz9CZb37poqgFL+CJb6BeHOsvxgMjMlym17Ggxulk/7gqbEOTnTaeHt
 qh9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jhwhSRZQ
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Julien,

On Sat, Mar 15, 2025 at 01:47:55PM +0100, Julien Olivain wrote:
> Vladimir: could you add a comment describing how to find the
> "best" version? And also, describe to what other components version
> it should be aligned.
> 
> To keep track of that, the way we're trying to do it on i.MX
> components, is to add the tag name of the nxp bsp it's coming from,
> in the commit log.
> For example:
> """
> qoriq-mc-binary version 10.39.0 is aligned with
> nxp-qoriq yocto bsp lf-6.6.36-2.1.0.
> """
> This helps further debug, when some components are misaligned.

So, if I understand you correctly, a sentence in the commit message is
sufficient?

"The API exposed by the MC firmware respects backwards compatibility
principles, which means that the latest firmware version can always be
(and should always be) used on a platform, irrespective of the Linux,
U-Boot, RCW and restool versions, even though the latest features might
not be used by older API consumers.

In terms of forwards compatibility, old MC firmware versions can be used
as long as the qoriq-restool package is built with a MC_VERSION_COMPATIBLE
variable (located in its Makefile, signifying "minimum compatible
version") older than, or equal to it.

If the use of qoriq-restool is not desired (networking objects are
statically created by the DPL), old MC firmware versions are supported
by U-Boot and the Linux kernel with a limited feature set. Thus, it
is still possible to an extent to use firmware versions older than
MC_VERSION_COMPATIBLE.

According to the upstream maintainer, the latest MC firmware version
is identified by the fact that it is always located at the HEAD of the
"master" branch:
https://lore.kernel.org/buildroot/482493f17e63d2b4cb285b50049ed8e6@free.fr/T/#m62c3ec04ba546ac9b0a194d13bc35fedeaa9deb0
Currently, the latest MC firmware version is 10.39.0. This version
should be in sync with the qoriq-mc-utils package.

At this stage, the latest lf-6.6.52-2.2.0 NXP BSP has qoriq-restool with
an MC_VERSION_COMPATIBLE='10.32.0', which means that it supports this MC
firmware version.
https://github.com/nxp-qoriq/restool/blob/lf-6.6.52-2.2.0/Makefile#L23"

Should I resend with the above paragraphs appended to the commit message
in this way?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
