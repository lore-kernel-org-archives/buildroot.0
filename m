Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE8C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DA540B5B;
	Sun, 20 Sep 2026 12:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-Oa_vgMKTWF; Sun, 20 Sep 2026 12:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 873A840B49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907066;
	b=iO9O0zVx8gDqIdKA3kWGmh4Y/D90k8KuwkjHMyIzeMS/IFODVaviZZJERpdkZAunKQmX
	 SfaHs9HHs0kthNKi37awmqyY61YgfA1Tbydb7M35kAbUeedvd3BwOHvtWGfBdvXpHEulg
	 7ZCEy+WJyhdvWlB8SQ5JydlcY6udae80RnW0gZHPky8+sTsKINB5IT79oeQuhAE7T1YYQ
	 u9eqzX/HjcTGug2qtXcsb0zkqUEFjP/UbuEsa8mfwpkL75MKmrWe80BTaCW39JJWzaBO0
	 n/wRgp0tSNikS2ZcG6Yv0PLhgU3n5t2gHzIzSUI1yRZfb9cc1Ce0R08GqsdxyI2Fizg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JJRs8WgVFiA1gC9RhvwmfhljC/UFX2k7K5UL0dH7BIc=;
	b=AoOpzoX5xX9ELZp46tmycBw9bqoj9TF5Rc/sIl5Vm+IwjJ13DSxYhNplBO2HJY32S+3z
	 +yxPg9UCAfuCeEUNdB+J6YoD00oqW1mgF06BNfN27utUvFBbBFbTpQs6DWucRdWql49Cm
	 BY4bwVGBG/b/nwhMszth9keyN4MfyQvJBTPzvqSNl2n70F7XRhw3QUFdmZk+WOVm+sBjH
	 u3lLK+q0yEJZa269E8QrvDsCVZOLL/mtSs1+OSEfD7mDpy3xh7jFvcSdFYABIp99+b+d0
	 sjtJyw9ypFgb6Vel7UHrEeMeMJgpjCp5xK/8fGEkRoeK32Opo1kmu/O2x/ougZblsnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907066;
	bh=JJRs8WgVFiA1gC9RhvwmfhljC/UFX2k7K5UL0dH7BIc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cpJSjcHUxCGpg5OOLYeqt2URiOoOTOFiPn93y/DYf1W2DAphXbvVbK2OGlHaDWS4I
	 31IxbdIACwpIUJoLHaYIq67C5GqyaarTyUFCPsojj5+DcvehdwtdK5cXlAuluqTm+K
	 UwenxaUlPOQUorVfa3HRDukvL7QH6Cs1Yg7qngPIb4P+frd0G9H4h6n9LkGOa6B1uK
	 n93CrpdrHZp4ZzOov/rrCfdCIc99lxSgQaExp3XbnvdFBJvVCdYlA3HVrDx7ilBPRj
	 RHHz4EgzGRIt7oeP0ZyCjpZY222YmhBAXCLHONlEwi7Yh00/w7I2t9IF0aFzm9YW8f
	 6M1QJYiuCjfgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873A840B49;
	Sun, 20 Sep 2026 12:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06514371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC1C7400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vtXIIgC7pP0 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:24:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 738874005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907063;
 b=ZZJNq/VjJd9qefjJPtJTI7TSBCM/UVJDyKiqikXE4BQR52IP5+J8n/lrtB2W76axdapn
 eapqxLJdccdNOVtQgRYJlod0FvrKxHOQ3vHzS8PRbMFeKQbUspmBFzrIAIhE/5u7EgcRE
 fcvIj+1/oSrx2V4mRUWUjLZyJvpu38Q8VFjT5vKsmND03gZzkiwkV4qMWax1dQjeSZFkc
 lPylDnOvyyws5qGYe7iyL3Gg0CIHAhcXnCNxEwt6WsTIOj2iOw0bmLyemFKRmg1Iqpx3y
 0lRZIrgqx9s+2JpAAE1wyf1b1s4y2t5hSWp7U5J8gQin4CRIWXYtclHqh1B07ecWFLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907063;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Cc8HXG3PpwqeyM1OBUtDJKlycv6OFjej2loZnjoJDeY=;
 b=GKrO2esNa5h7tbTpkBC5jv6ARljV4VgzZSu/JwjcalTT2f+4oCZIqFfzxPQ7PInG2xTo
 xgfI37gpho6dlWMsC49lWtPX2j8ZuizhCZcUz40+dBdnY49s8EAlGq+KmIVPkTM/BGw/s
 7C8CVT2dEkuF+HdzeZ/M8Jia87MGIV0/hfrFIfCxmf2GARhVcyLppd1n4OPmfER/m1D6F
 6RWMHA4JFQKnY7rpELZhUeoIy5AvIgBXq59D3xa3U+wBhDphat9bYny85UvkHkD2XqW67
 P/BWNGcZOOtEbgVbal5HO2Cy1i45olpWMa5XKqMxN24AD7QK5XOAfh7wWTxcTXuH46A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CCSwi125; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 738874005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:24:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 98E174E40923;
 Sun, 20 Sep 2026 12:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66384604C9;
 Sun, 20 Sep 2026 12:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 104F1103282B4; 
 Sun, 20 Sep 2026 14:24:16 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:24:14 +0200
To: Wei Dai <daiwei@sunkaisens.com>
Cc: buildroot@buildroot.org, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <aq_QTowML2VcCocH@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
 <20260920074056.1320014-2-daiwei@sunkaisens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920074056.1320014-2-daiwei@sunkaisens.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/strongswan: add eap-aka-3gpp
 support
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

HJello,

On Sun, Sep 20, 2026 at 03:40:55PM +0800, Wei Dai wrote:
> Add the eap-aka-3gpp plugin, an EAP-AKA backend implementing the
> 3GPP MILENAGE algorithms in software. Select the EAP-AKA plugin
> it depends on.
> 
> Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
> ---
>  package/strongswan/Config.in     | 5 +++++
>  package/strongswan/strongswan.mk | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 6847ca4f62..827634c071 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -135,6 +135,11 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA
>  	bool "Enable EAP-AKA"
>  	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
>  
> +config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP
> +	bool "Enable EAP AKA backend plugin implementing 3GPP MILENAGE algorithms"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy

Since BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP is new, there's no point is
bothering with legacy handling, so I've dropped this line, and applied
your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
