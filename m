Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69602FF5136
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3577A60D4D;
	Tue,  7 Apr 2026 19:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWAqRUauobSr; Tue,  7 Apr 2026 19:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5699560E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775591884;
	bh=WYgwD1OabOSV9Gxrhs4dOI846QnpKVirWNvokVWfUMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cba00JED4bb2cUZ4zKf06iJRZdtydvb4WIwqYyx3oneg8I1ARZHSQJSNaqCqfMIZX
	 i/r/y/Q2lgFX0x3uO5LODlXE1kOYUSjuy9TejbHqcoYGIVdie3mCAB0J7pFM2/tmkj
	 4mvHFxhXCS1hb13DQq/bxhVXlU2cpDaF0OUiDcJIM88F/O4HmM1SXSvow1p1ow/j9M
	 uUt3AbRp8pKSXfCbz0CFBZKU6dgnOotJ86BppwXtwswIFYTpCoZEO2b2LU5kBxAKQQ
	 Ij8VDbRo2Y7u7N4jfa5JPdmFzwipRclkqu7CCKi8HeusCt1dEgCBJiU0N+w9mG4ivd
	 ojec/M5N2vbGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5699560E0E;
	Tue,  7 Apr 2026 19:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FBA42C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2034640DAF
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j43NeW0L43xq for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CC6940DB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC6940DB7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CC6940DB7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:58:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 124EEB97BCFF; Tue,  7 Apr 2026 21:57:58 +0200 (CEST)
Message-ID: <dbc669a5-595c-4e4d-97cb-9bd5d393d578@rnout.be>
Date: Tue, 7 Apr 2026 21:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260307180711.1025866-1-ju.o@free.fr>
 <20260307180711.1025866-3-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260307180711.1025866-3-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775591879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yL2E4V1ogVKai0FT7VvorRPVkb6/L1cWxs9c2iVpAzw=;
 b=AYpGFqH/p6Hq0atEFvrEUpLNDrpypQbPSAn1n89h9aVF1X5jTjipWrO6ilJ9+0HEunxoQe
 xOwS8UE5z197FTEDeyI75w1HTI/tdWHP7fV1S42yTODHcjICYs4Gl93AjwRkeYi7Y7ggH7
 PIc5PZevZprWNRZ/YtEL9b+ePoZhejNBPcxUGjeY5TweV4D76JWXAQ7CHYW7Tg/3lSu68R
 ipcE4Pb4cSMhW8j0IGk+app0L8XqKqSaHFNm/sLNyAno9bUF9ov2LP3TZq3wJQ6NF7lfhi
 oF/TR1/IUD8LgSViT4TnJefXEr4//oE0cQ3Qxy8sUkqgUVlwRR3C8xvOOojEfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AYpGFqH/
Subject: Re: [Buildroot] [PATCH RFC v2 3/5] Config.in: add
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/03/2026 19:07, Julien Olivain wrote:
> This patch is needed with the current kconfig version in Buildroot.
> If kconfig get updated with the series proposed in:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
> the current patch might not be needed.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  I've squashed this with the preceding patch, there's no reason to split them.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> - changed Kconfig variable from string to bool (Arnout)
> ---
>   Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index d730f2034b..0bfe6d1ab5 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
>   config BR2_BROKEN
>   	bool
>   
> +config BR2_HIDE_SECONDARY_TARGET_OPTIONS
> +	bool
> +	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
> +
>   config BR2_VERSION
>   	string
>   	option env="BR2_VERSION_FULL"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
