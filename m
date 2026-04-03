Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C44E7E36C
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 11:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD6940F14;
	Fri,  3 Apr 2026 11:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqpf6em93BES; Fri,  3 Apr 2026 11:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E3040EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775217134;
	bh=VqrrFD7b2dcOLz4nZFPUvNPZElo9V1FcSq0qHCQD9wE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AXd1/dMC3flpLqC23blnpW1BtEz1pbrgPje1Wd+D7d3kWpYEOZa9dVl/af2BTsdoJ
	 yDgjWGqY1E6OG7ZBbAiDmOGrdm+4e3uLfjHWKE9oCA/4O0riJaFFaWnziGggenRS1J
	 4P3nWUQOsNdG6gdFp3bRVkKQBNW7ZW9cf2qKjCN0Idjg9M2MJVb2sj6p+yr1mqWW1x
	 +srn+Sn4pAT5sWyB5awyAKov32WLJu8kimDhfdrG95xKvqyY5W5jygyOX0ezOmk3Lz
	 R5l8UVhf9OPijRI20ZeThagPsNQXKNnY2ecptRE2myDJanPBqMdRnm86LFmHPet1kb
	 ebdylbDlx4x/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E3040EE8;
	Fri,  3 Apr 2026 11:52:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9D42CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 11:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C67A4020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 11:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHNV9glNQrMB for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 11:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D43E4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D43E4003D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D43E4003D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 11:52:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E39D2C59F5E
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 11:52:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EDC67603C1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 11:52:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAADB104500C4; 
 Fri,  3 Apr 2026 13:52:06 +0200 (CEST)
Date: Fri, 3 Apr 2026 13:52:06 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <ac-pu604QIA40Sf3@windsurf>
References: <20260403-openscap_bump-v1-1-20f99c3c9429@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403-openscap_bump-v1-1-20f99c3c9429@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775217128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=c7vPWlMnoAOOJXsClKfc80hKh/vpb9/9E3SAgqw6USs=;
 b=wdCqmX0vhtaQBhfaXbDbgY6nt2EpfuIJNsnTrGOPe2FD9CyxODSY9ID0wqacPP2KcLGrxc
 l3S4Jqt/IL5MHBm8bkVK7C2l9j9+GixxZmmYzfrSXoTtWXkw7rE0DFkbojZvQ93u/AcPsN
 tr3Se4x041dQ6k2GuH2jfmqwD1aSN5kyVKNA079U3jkRdYwBEa57b/ON/CovxdBXhulUKG
 2TpQLfhzZLa/SuuBFy9p2HOIHm2Fm7YYHVnC8cL0AVyGUsxfeTL33aUIh87CNSQATl+sGG
 NFK6r7mx3/qPgsXdz+o78LoxnmOKbuo44cdvk2tLg1EXLYMwRMqahSDxHax8+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wdCqmX0v
Subject: Re: [Buildroot] [PATCH] package/openscap: bump to version 1.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, Apr 03, 2026 at 11:51:52AM +0200, Alexis Lothor=E9 wrote:
> The custom patch to enforce project as C project as been merged upstream

                                                   ^^^ has

=1B[O> diff --git a/package/openscap/Config.in b/package/openscap/Config.in
> index 317055c75327..827590598e41 100644
> --- a/package/openscap/Config.in
> +++ b/package/openscap/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_OPENSCAP
>  	select BR2_PACKAGE_LIBXSLT
>  	select BR2_PACKAGE_LIBXMLSEC1
>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> -	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE2
>  	select BR2_PACKAGE_PCRE_UTF

Since you're now selecting PCRE2, it no longer makes sense to select
BR2_PACKAGE_PCRE_UTF, which is a suboption of BR2_PACKAGE_PCRE.

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
