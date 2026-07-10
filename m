Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696CCC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 21:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0517081172;
	Fri, 10 Jul 2026 21:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPUgbTfNlrls; Fri, 10 Jul 2026 21:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E48C81156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783720710;
	bh=Um6bHN8tRnBeBl1uBbhDyiheGSktQ7YifyfDmr92maI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TByB4M2fs99cM/Gjt+Qy2wLG/4sQ1mtwcgmosyYXiP217kh6J1qACYPBDfmLbZqzf
	 78NNm1TZ7PPd2DY6kmEBYpchqG6EpX6saA26drEAPdaC+f1g2aA5ss1KRG77gm2Xhx
	 VP36UOSKQlPWdueKAhekJtWoiuat6nik+cfyxhgmus5Xb8Zjih3iYRFDjcvZ1GGfPp
	 F+zP1hSzYxc81T0U1qTvGIVBYaS6Pu04IJlwQLYJxYC0dHEu5rhXYyUWbm3FXSnM8y
	 jD24aiWHnIdHsFsjweYYgFwKNzjjFHQeB2yTcV1zHik6Yg2sShxxrJpDcYhWkEK8Wx
	 SlDqqJMoyOVBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E48C81156;
	Fri, 10 Jul 2026 21:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF9A372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C22440A30
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qbcw0MBa_uxn for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 21:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA6044094A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6044094A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA6044094A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:58:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1wudxl1AT9-00E7mT; Fri, 10
 Jul 2026 23:58:18 +0200
Message-ID: <5f5b1c03-08ed-4a6e-8d99-0cc2a4e9ff1f@gmx.de>
Date: Fri, 10 Jul 2026 23:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
 <20260709131720.1250301-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260709131720.1250301-2-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:N0DC2oM2u6VIR1esQlDwDU9tDpijjY3rB31MpYhP6U/VvKEOrSo
 r2iZeOoY72Pnc5FtKKWhtV2I0iHg187szLCYj61WerMtCMuubWodRfLDWK+alQu84Fcy6gO
 2DP5DCBHpEjAbegjhFPI1eYYoENo8voD4/8BgKFQNbXzVdLvkETo+MbX7woBRXcwl7fswpf
 57tvdjzKMEU9FBj2HArhg==
UI-OutboundReport: notjunk:1;M01:P0:oU3ZoGQXs7Y=;TKGULZ8D2G+6zUGumJcrJJHc6KH
 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
 WCZ98rvQLnmHrJQJqa/giJPtSiP9OS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783720698; x=1784325498; i=fiona.klute@gmx.de;
 bh=0T07euZhMlM7qpFqXOp87UeeqDeR4quW6BXTHTsrAN0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VHdMwkizCG5nnR4TQ1Fyjnjff9XfFCk4bSn3uN/n1ioCtWLC8kC4Pf4ym5ikBa7V
 37Kiqdu1gkHS5YmkMDQ7gqQr187HWQTfc8D7vT+GdD2BQMbxIUy9ckOSzbeth5/MN
 qfUNNuU68mwNATLVi2FBllz//r6q2zFCZZAVplIg8qnNalY0IV9R2NACy9Bx4Rm6A
 Ra8f22YYODb+xj0sezpttM3TH/7/Jx0s/n+XF3uqInQ+KumJ/tEAOSuJG6mruVxCG
 cM1GWefzlzwm8MEQ3O04TFzcXLlSnGRluVjo8AEUPkXev5rL/0Q32p41ZOxzBfSWs
 4pyZ5BVzGerwXGnCBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VHdMwkiz
Subject: Re: [Buildroot] [PATCH v2 2/3] package/gnutls: allow enabling
 host-p11-kit support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario!

Am 09.07.26 um 15:17 schrieb Dario Binacchi:
> Add a new BR2_PACKAGE_HOST_GNUTLS_P11_KIT option to enable the
> host-p11-kit dependency while preserving backward compatibility by
> keeping p11-kit support disabled by default.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes v1 -> v2:
>   - Explicitly enable p11-kit in case BR2_PACKAGE_HOST_GNUTLS_P11_KIT
>     is enabled.
> 
>   package/gnutls/Config.in | 3 +++
>   package/gnutls/gnutls.mk | 8 +++++++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 59af32bf1efb..93f2287bf80d 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -39,3 +39,6 @@ endif
>   
>   comment "gnutls needs a toolchain w/ wchar, dynamic library"
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_HOST_GNUTLS_P11_KIT
> +	bool

Thanks for the updated patch! Unfortunately I missed one important 
detail here: You're adding a host package option, so it should go into a 
Config.in.host file. Sorry about that!

On the other hand, p11-kit isn't a very heavy dependency, so we could 
also just add the dependency unconditionally for host-gnutls. I don't 
have a strong opinion either way.

Best regards,
Fiona

> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 6411a7d62115..5d6360bd76d5 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -64,10 +64,16 @@ HOST_GNUTLS_CONF_OPTS = \
>   	--disable-openssl-compatibility \
>   	--without-brotli \
>   	--without-idn \
> -	--without-p11-kit \
>   	--without-zlib \
>   	--without-zstd
>   
> +ifeq ($(BR2_PACKAGE_HOST_GNUTLS_P11_KIT),y)
> +HOST_GNUTLS_DEPENDENCIES += host-p11-kit
> +HOST_GNUTLS_CONF_OPTS += --with-p11-kit
> +else
> +HOST_GNUTLS_CONF_OPTS += --without-p11-kit
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
>   GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
>   GNUTLS_LICENSE_FILES += COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
