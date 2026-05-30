Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B0CCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FA380F6B;
	Sat, 30 May 2026 08:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRls5KCY9BVu; Sat, 30 May 2026 08:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C6A80FFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780128586;
	bh=QOiZGYP6SiS87Hn+O7INF2n1fE6+/BoKV88823TtcB0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S76Aljez90pokXMRgsOnn9vQfUVqGmHSqCsuMa34ejtu+2KTfxEcE8iCNON9lPnsf
	 20dy23svrLCTYarm85dHjfc/8D1YAex3W5p6s5oValexXIeT9UeS8jo+OPVdlB6XCm
	 Yv03X/JCIXfAUuZAHxyZwpp3n8KiWogIZXG7DpnQlugJXedW8vROVg/TSK4+vIAHqB
	 AJNzOL0nf0za0HFMkA4pDRu0Gp4YS7fY0wNBFi1qLYD4Kt8CeS6S5q4xLdX3m0+3jp
	 qztmQL3tBHUrWU6piEs5o/XAKwplmjGnl5jv+PNAJEyJBzkwedEhZMd23kA7T4Hyli
	 StBRGZ7MY9d8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C6A80FFB;
	Sat, 30 May 2026 08:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42CD3D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3635980FFB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EvRCo_bysQS for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AC7E80F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC7E80F6B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AC7E80F6B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:09:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CEB7AC6246A;
 Sat, 30 May 2026 08:09:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B1B6B6073B;
 Sat, 30 May 2026 08:09:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1EE810888054; 
 Sat, 30 May 2026 10:09:38 +0200 (CEST)
Date: Sat, 30 May 2026 10:09:37 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahqbG2noGqK-3bsK@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-3-jeanmichel.hautbois@yoseli.org>
 <ahlvrRhu_eSb3WIb@windsurf>
 <7257763a-5577-44e0-a12a-e13872c041ad@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7257763a-5577-44e0-a12a-e13872c041ad@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780128580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=hDtTX/tCyZzlWKl6NsGafKnuk+eutR57XToxKFvGQdI=;
 b=wSyW5sjB+Ke2Su5XsR99b8QdHZU+3HL0pp04/r1vU1YDDX3fmLxPqvni5BkjEk+n2AqvfO
 nwzA4Vw+nTBicujmI5WEYX+TxPHFncFL6b77jIbQRiSdPgxcCbMPUul+QZVdRZbQpz3Ido
 +3VAUJLS5LiDujk9hde8UZ8xGp/mR2khLPnoGxxJq1N9abUrRmN+nQQjkPPz0qs9EyBWdS
 FohoXuTN9LnI8/323QFBtbLLjezJjw2Ye6cudq8daQ3NXPkYnHwWrlr+bU8bsC6tWZ75ws
 OA1UFyV3U+b1mYDAAgUPjR7HAY//tgJi5QSC1kndMr/dBiY+koeqGWUsvol7ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wSyW5sjB
Subject: Re: [Buildroot] [PATCH 02/11] package/gcc: force --with-arch=cf on
 m68k MCF5441x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jean-Michel,

On Sat, May 30, 2026 at 09:31:53AM +0200, Jean-Michel Hautbois wrote:

> You are right, that wording is poor and I will fix it in v2.
> 
> MCF5441x is indeed only a ColdFire (V4e) core.
> The real reason --with-arch=cf is needed is in gcc/config.gcc.
> 
> The gcc m68k backend serves both the 680x0 family (arch "m68k") and the
> ColdFire family (arch "cf") from one tree, with a shared multilib generator
> (gcc/config/m68k/t-mlibs).
> 
> The trigger here is that BR2_m68k_cf5441x selects an MMU target, so the
> tuple is m68k-*-linux* rather than the m68k-*-uclinux* used by the existing
> 5208. In the m68k-*-linux* case, config.gcc does:
> 
>     with_arch=${with_arch:-m68k}
> 
> So, it defaults --with-arch to "m68k" (680x0) when none is given.
> 
> That pulls in config/m68k/t-m68k, which sets M68K_ARCH=m68k and restricts
> the multilib CPU set to non-ColdFire devices (CPU !~ "^mcf"). Buildroot
> passes --with-cpu=54418 (a ColdFire core) via R2_GCC_TARGET_CPU, so t-mlibs
> then trips its own sanity check:
> 
>     $(error Error default cpu '...' is not in multilib set '...')
> 
> because the default CPU is ColdFire while the multilib set was narrowed
> to 680x0.
> 
> Passing --with-arch=cf:
> - overrides the m68k default
> - selects config/m68k/t-cf
> - the ColdFire default CPU is back in the set.
> 
> This is also why 5208 does not need it: as a no-MMU m68k-*-uclinux*
> target it does not get the with_arch=m68k default, so its multilib set
> spans all devices and the ColdFire default is accepted.
> 
> The change itself is unchanged. I will just rewrite that paragraph in
> v2 to describe the m68k-*-linux* with_arch default instead of the
> "disambiguate" phrasing, if you are ok with that ?

Thanks for the detailed explanation, makes sense!

> PS: Sorry for the long detailed explanation, but I spent quite a bit of time
> on this one so I must be certain everything is really like I understood it
> :-)

Long detailed explanations are very very good, no need to apologize!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
