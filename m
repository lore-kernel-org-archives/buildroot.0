Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EEACD37B5
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 09:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0217A41278;
	Mon, 11 May 2026 09:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MLLliKLS0Lw; Mon, 11 May 2026 09:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E8241283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778492733;
	bh=6CAQS3L48NSolXU5naBCUeKmiNRYNyC5Yef6CMtnx6Y=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EwAvE2fqYy/1+Sn0R+w92tAvrJGKDbhfR9CZ6kfR7mu9IZDrjaeZtUaI/RaNpEfkD
	 ZuZXifagoZK0oYtSVdJvWYAgglFCOnChXqva2R5GlGcVLnLdP562GdvE42+lk7omjO
	 4Tp0ZvL7z3S8JN4GtsWCrIhYSoILBjZDEFoeU4ZWFhKEepPWoy0s+Kw0Avt4EV8a5K
	 Y1qvLB90i3417GhVv+oAhhAQXiqu9b1J/x9hWG+2y5BAkt4vKOziDEdr9SBsT/7QH/
	 HpTDaPS+y4e2WGPBQdU+6MdPKzS2L6EIt6PnsAXrCkGh3CHFniE02MmCvxinP1iR68
	 K1g6SLnClO/ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E8241283;
	Mon, 11 May 2026 09:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6889F272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A4CE40ADA
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSTInUaNK3T5 for <buildroot@buildroot.org>;
 Mon, 11 May 2026 09:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCD8A41278
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD8A41278
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD8A41278
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:45:29 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 541674402AF;
 Mon, 11 May 2026 12:45:01 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511093310.2189957-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 May 2026 11:33:08 +0200")
References: <20260511093310.2189957-1-peter@korsgaard.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 11 May 2026 12:45:25 +0300
Message-ID: <875x4u1dqi.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1778492701;
 bh=GY4kUUL4J8l8Cm/+LOflr6MgnMtatpzRHPMMJ0AAzzg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h21oMjr+6R4Vd10MVumhy/YEncnOvJrQrvwdP0xT+YntvW70nBU+GGRfkrGXmIObY
 TsdMjFNZKa/bJPXqbgI9SR9tFhzHKUbztNnyvqOtyiTgIT1/+1D/omi3YlkPwUQf+X
 1Q+GkcCO2oFQpw15XIglCIcA1X315Q1mNb0cb6ExleeBfE/wRR3B62LOqXxo0sKPJs
 pohczIeFJC6moxK445zHdv+ormcVq6kX9qPQWYwOgFLNGtQyA7Xu3ZWzIsqjxa8mkc
 sHY1qMu2cNvYI4PQkSlthpsAbJWdf+KzpknNcfSHELwRnkgEEg1nk7FwDqDpy+kXiG
 VK5SGGLFjhd5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=h21oMjr+
Subject: Re: [Buildroot] [PATCH] package/dropbear: bump version to 2026.91
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Mon, May 11 2026, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/6372e58671d3719b127dcb69642420a07f441790/
>
> Bugfix release fixing a build regression introduced in 2026.90 related to
> reallocarray.
>
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.91
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Duplicate patch
https://patchwork.ozlabs.org/project/buildroot/patch/20260511053836.208037-1-bernd@kuhls.net/

baruch

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 81296375a1..31ac153b89 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
> +sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index beb635e15e..a7de8432af 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2026.90
> +DROPBEAR_VERSION = 2026.91
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
