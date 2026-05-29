Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27217CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FD484281;
	Fri, 29 May 2026 13:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wiwlb7cR5htA; Fri, 29 May 2026 13:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D26383B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061745;
	bh=A55rFsLNVvY5wYQeKzwi2DWnDj2ZBpX5gVCnvbmqUoc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BRKw80U4d2cEsryBdJy84zXwuScW8cLHZmvVZmNPRcwn6jTk6ZDtqFg1m4cqxR7yE
	 Rd6JfhDai2uN6vtk4HJdtSg3rZbsXuncd5lAt1LE4XemgQQQW6Cf+DQfIGEm3uRxKW
	 bPFEXTQYYQR/GifwZLEBoM2UvRZ+6AypNcDjHFaHZ6BCOPIjn2Ov8Jr50gy4GHMkUn
	 H8+1ietGy9FZTgF+6vedZNC/mndOOufXVXWOnHxpPaCRm5DuUjBuugR2iEfJOZ2ivS
	 3qb/F/mwOilLBK6FuedUV1bNEFCiBHURTVgy4nOg1VSsXW9gy9oKy+0QrRURKpj02j
	 OzWHStcFDUG7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D26383B35;
	Fri, 29 May 2026 13:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4900288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 851DF83B25
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yo1TnXeIdTHG for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF5E983B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5E983B35
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF5E983B35
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B6E1A1A372F;
 Fri, 29 May 2026 13:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CDBA601FA;
 Fri, 29 May 2026 13:35:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9B1010888650; 
 Fri, 29 May 2026 15:35:39 +0200 (CEST)
Date: Fri, 29 May 2026 15:35:39 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahmVnvDgDzFXgN4C@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-9-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-9-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780061741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=3HSundUmL3FT1vTjcYT5GCcT108sNsqE35ZF5lA2lsU=;
 b=zYr3eIb8WdBWI/VtfMSf0oBurXltMriESUJpzV4OOT4nAp3hlU5tt/yl6dXMIdJGQxZDSJ
 JJbT35YMUBJoqF8nZcKsiGqtDW3vEbe4d+oJx1SaJxnqx+/F91eDtsQPgXMkaCWuOD78rh
 cKX9iZg1HDCC73Rf06q2KB1BV20aOnxQnfPH8ZwivmyXO2hQqEFbRVm8LaT2PcEI72D4n9
 nhtbvDgkGboQ/icSMwhO7ige01a0ZzKKHdQ6RCxQzUS1hu7zM8j8NWSTj4p435WdI+/KH1
 a50bH73VblddjGw1cQsiaUo3OmZxFq8MlHCtPND07kMPusTuePALbJe5XO/07g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zYr3eIb8
Subject: Re: [Buildroot] [PATCH 08/11] package/ntp: Link libatomic when
 available
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

On Fri, Apr 24, 2026 at 03:23:23PM +0200, Jean-Michel Hautbois wrote:

> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index f481c5d79b..eb9bfff85c 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -17,6 +17,11 @@ NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
>  NTP_CPE_ID_UPDATE = p$(NTP_VERSION_POINT)
>  NTP_SELINUX_MODULES = ntp
>  NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +NTP_CONF_ENV += LIBS="-latomic"
> +endif

This looks good, but why don't we already see it with other
architectures for which atomic intrinsics are in libatomic? SPARC,
i386 32-bit, and also several other 32-bit architectures have 64-bit
atomic intrinsics in libatomic.

If you can reproduce the issue with another architecture (or an
already supported Coldfire), then you can send this patch
separately. From a quick look, I couldn't identify an autobuilder
failure.

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
