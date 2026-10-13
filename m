Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C616ACA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8819D40692;
	Tue, 13 Oct 2026 08:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxDI5llxY0ya; Tue, 13 Oct 2026 08:34:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 989264069B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880454;
	b=HXPoeMACoho+AKz4D2TKIxPGLWa7gEzuLGKebDGixyGvoyGd2wmZs2ZH/QXpQvCiJ6xk
	 1cd1KDCbHUKVMBzrFLrHk8KJfm22gvPsRxwboOfEZMkf4kwyZyoTjR96KpL4E6aoCxtdL
	 787xM5sQOsQqC2d1zEG3d5AHbnuGQXwlM7F/2M2e0uvxjY9Vy/pCSbCe9O6eWkDeVT6ib
	 CxPLTzSJrhYMp7ZejRyritj39Ur7em91GXWOAngdXTBPNJzs6VfbQ+81/qdMZgxvQ013C
	 h/9+0c+v0fOWzb6Dtdw+4clLXHeVmtpGFK6V5SNOmRGXtoNwYOCGaI69hM5t9Ec7Tvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7ZFas+i+exQwjcT2r2YNByS3m53c2HYjeLMViZpJl0g=;
	b=ABzjERLGTVKcQFdkuh8KABQL5LVaFd9+xH/sfv9VXVXGN00PkrpNjt0b6wUpZiInLxC2
	 Lgaa7N8/g1mxGByxVlAn8aTgE0p0oU2H9GlIMiDhJajKQDMOyoV4Zm3drtN5Q5NjKj6yI
	 o12yJBPuNDVwNr5nnEMoydDbKezp0wOpM6QdM2KHUrWOxGRHhlaFnJp2NPpylJpcNf1rT
	 FW4SHrLarEZumNBF1+EnlXtw48gPW4rrOaIFSFcabnYRPIJhKuAj7KVc3/4IUG9ummmDy
	 jy6aX6E3JNNdTBBEgGjK+N4elgo0WyRKlDQRq7LygJD6eJr00LuKtZcNDwRdGhuvntA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880454;
	bh=7ZFas+i+exQwjcT2r2YNByS3m53c2HYjeLMViZpJl0g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NGWNbBIVe4CYkkWPlGvPH4HTrXU8JRyfdV5bhY9mHOHJu0tJ6LmUBXShTCMDhvZLr
	 ZRwlpxUiHSZJx0ujEH1CCCJNVxF4gTe2lMhJVEsoV13eMml3I9Bs3A1+8SDP4QvBBO
	 4VsBm6jetIwQJExxhi16IiQ/F99mQsl1o+Lx3nmFeY5fd/u8Z6o+oaK5s9Dw+iZgPD
	 JJErPFT2jRpa4vPfz8rPjW4oFaIlw4vgGbEllArp7eJvt/iGHT5PfKvfRkUot2+j7A
	 a/vGKxHXQl/RIpSzDnJ6z8Ej906Ze9K1gwnyPcH7uCxSyW/rFLrc1GJwadp7f7TlN0
	 +89fPuZw/K+7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989264069B;
	Tue, 13 Oct 2026 08:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E0A1E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 775F640692
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKTTL5fL0IFL for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:34:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9595E4069B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880452;
 b=a9uAnu972ZqPFr2/ie3wkwrkd9+IEXpabSj554IJEslx9vUwceFo59/7VWze4DwcWGtl
 +v7Or0soETI0pBki44AzlBzmGLCO1kSTBSGe2qQAg7HWRM99mQ7g7T1b92qfXF6puWLiG
 pi6Zo6a1m18ttlOxB3rIyarqUa/LnSsvXYuwjOb9D5nwv6WzzZPZ9RPYyZmVZku9UrBBq
 ReBvpjlSJE9JXmO97QfQG8AFvKI/gTVDZYXamMopCqmxPoCpa2FW6+NeSRiMXS6qNVtKY
 lgNxSMiXwKKWrQv1gYGY6IRfqc9R6rshMenIolN9mwtdo9sj53+Cv7PZuBEGqELU3nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880452;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1QEy/TASm19eJTJqkbnN/Jt2DGbro7gc7oH6zJ/6+24=;
 b=F7O32HYwGP9g+RXXtczA8nCznn266V9f5V5SxLQMC+NY/rRC/+tIBYeW7C2P1Q2bZ5Qu
 6e8xS56rRP+bugFXQ4BOpd8v4VqXYDCmCUxLEVoAyvkNqvCRy786bDsxXpl1EGYW5uS+D
 2qzbrkA7X9HfAJ/AylpOHEN81cWaXYTiHokTAzkgNsxBBJijqgLY3PnUqOLbCBoaHAVGJ
 PEzJel1F4/TvgRjrc8uY0V1tPQu187KcrvRmoPMdNwprsxEQ7Ku0Xyzanu8sSOYyT9PAv
 g90bwC3Vg8B5PM4eznHx+BOPahCQphki2WoD4muVNpFxYq0Us44rlJRi9CDEAHMSw2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ScKZbgnu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9595E4069B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 948694E411E8;
 Tue, 13 Oct 2026 08:34:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68FA960362;
 Tue, 13 Oct 2026 08:34:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB6F711D70C45; 
 Tue, 13 Oct 2026 10:34:06 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:34:06 +0200
To: Nevo Hed <nhed+buildroot@starry.com>
Message-ID: <as3sjbzkJ8Teyy8t@windsurf>
References: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/umtprd: expose package build options
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
Cc: Paul Cercueil <paul@crapouillou.net>, arnout@rnout.be,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nevo,

Thanks a lot for your patch, and sorry for the delay! See below some
review.

On Thu, Jun 04, 2026 at 09:14:01PM +0000, Nevo Hed via buildroot wrote:
> Primary impetus: BR2_PACKAGE_UMTPRD_SYSTEMD_NOTIFY:
>     By default umtprd does not communicate daemon readyness.  Version
>     1.6.8 added a build option that enables creating a Type=notify
>     systemd service.
> 
> Added two other relevant build options that were available in the
> Makefile:
> - BR2_PACKAGE_UMTPRD_DEBUG
> - BR2_PACKAGE_UMTPRD_SYSLOG
> 
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> ---
>  package/umtprd/Config.in | 19 ++++++++++++++++++-
>  package/umtprd/umtprd.mk | 14 +++++++++++++-
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/package/umtprd/Config.in b/package/umtprd/Config.in
> index 24bf119549..dff5a44583 100644
> --- a/package/umtprd/Config.in
> +++ b/package/umtprd/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_UMTPRD
> +menuconfig BR2_PACKAGE_UMTPRD
>  	bool "umtprd"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> @@ -7,5 +7,22 @@ config BR2_PACKAGE_UMTPRD
>  
>  	  https://github.com/viveris/uMTP-Responder
>  
> +if BR2_PACKAGE_UMTPRD
> +
> +if BR2_PACKAGE_SYSTEMD
> +
> +config BR2_PACKAGE_UMTPRD_SYSTEMD_NOTIFY
> +	bool "Tell Systemd when uMTP-Responder is ready "

There is no need to have a separate option for this, just enable
systemd notify support at soon as BR2_PACKAGE_SYSTEMD=y.

> +endif
> +
> +config BR2_PACKAGE_UMTPRD_DEBUG
> +	bool "Enable debug"

What does it do? Perhaps we want to use BR2_ENABLE_RUNTIME_DEBUG=y
instead of having a custom option?

> +config BR2_PACKAGE_UMTPRD_SYSLOG
> +	bool "Send output to syslog"

Where is the output going otherwise? Shouldn't sending the output to
syslog simply be the unconditional default?

Peter, Arnout, any opinion on this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
