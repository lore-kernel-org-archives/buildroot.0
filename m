Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEB0C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 745DD81098;
	Sun, 14 Jul 2024 09:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W840YVNXSDl7; Sun, 14 Jul 2024 09:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B6C80F60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B6C80F60;
	Sun, 14 Jul 2024 09:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 212A91BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C530403E6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3saeNC0DfmR for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7257E403C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7257E403C7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7257E403C7
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:13:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427aeebaecdso122905e9.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 02:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720948421; x=1721553221;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0M41dZjuPeQOGamSZ/U8EPfcRHfQbCwf0Ps+R8PsuI=;
 b=C9/qdEvu80yGEe0sqyp/9QpcAuLRgIr1YkRvUpt9hE5/aK2fACuJjMue1cTrX8LhuD
 DMkSXEo+5AsW0pon7jA67PpuorMM/PEOsqjhpp7mviCmygGgZHzVPFE6kKBpS8UrUmit
 hyufeACGM3Aa5p/58636ezjZefpUcWDE0dPpF6ufWSIdTfmvX2EeSyiC/Bpv0ob8DXxM
 aJ6CariQ2tfEYTOuXZ/80gkfdwxpcQWHL6ZH8tmrYdhpZyUJIZlUNwALct/qJCI4K+QU
 RHT36KRtWwBdsRJ1aXlj2EwJC/naU4d8YfguLXG4OWqzaNZvt8QS+Oo2a+UWG1LOkoqw
 FOYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ0Y6YRb063VPlX3u05ilrdA69H3pwPAIDOoXdGNiygJvrhmccU5AyhI6NJErFM592wvTruiJh3YulZtPfnWWHLWhAs+vdmg==
X-Gm-Message-State: AOJu0YzBkAnxBtxk/bYBuPzEWF/A32ocKh4jDqhEvBau43GkBMHj5YoR
 f46ndts6Wvfb6xJYZhnQtzbyhUME1L2ceBC8Ie34/A1N8zKLnldeGaSgPBqgk10=
X-Google-Smtp-Source: AGHT+IEb/JJdvUcjTD1JH56z70F3WKwNlDdwUrL5p9J8XWKj+NFTBniKG30s0p7s35JO/kI/WgBniA==
X-Received: by 2002:a05:600c:48a7:b0:426:6158:9b54 with SMTP id
 5b1f17b1804b1-426707cc018mr103104745e9.6.1720948421314; 
 Sun, 14 Jul 2024 02:13:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db049f6sm3324488f8f.113.2024.07.14.02.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 02:13:40 -0700 (PDT)
Message-ID: <abf6ecc6-89fc-4d01-a4da-871d70515bf6@mind.be>
Date: Sun, 14 Jul 2024 11:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <d8f5c789cd2d7cc87dbda9cbf827c01756476d18.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <d8f5c789cd2d7cc87dbda9cbf827c01756476d18.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720948421; x=1721553221; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G0M41dZjuPeQOGamSZ/U8EPfcRHfQbCwf0Ps+R8PsuI=;
 b=TV9+ZuahFENaauSdEsP2myc4a+3mwtXOBPI/vXRRSDcmg8pt2J5We9afEzlXNRh23o
 EOQobh3VrxDEKy41xi+2ZWLE/FOSX9iX/IJ94N8cuzjVDWt2CBwucGUDuAc3BC3ksKhI
 XF5dyWeAI1YklS46c8KKYo6tYu/6SgPdUjs6m775Sx9MAO9bU19EgGug+oZLovJwNVBU
 58qM5sGj2yl3gz5wsGuh8ahJTwDxxOEnEJCvC710VSWObX/uUrQa2Ri/ll0Vl5IXifIE
 hQFHeGik43ymSAgeTIRTrJMxWed6mjIMFqsJeN5zBLsVmlHXFOqqOoXg4QN05N9JesH4
 NwZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TV9+Zuah
Subject: Re: [Buildroot] [PATCH 20/20 v2] RFC: package/anvil: add local
 Cargo.lock
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:06, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[snip]
> diff --git a/package/anvil/anvil.mk b/package/anvil/anvil.mk
> index 7de9f3e06d..46d062e1de 100644
> --- a/package/anvil/anvil.mk
> +++ b/package/anvil/anvil.mk
> @@ -4,13 +4,14 @@
>   #
>   ################################################################################
>   
> -ANVIL_VERSION = fb44b240ea4a3aa39a6b92f5bede23301ab9a26e
> +ANVIL_VERSION = 0afc33267ed17e516ec8db118fbb137c8add9c09

  Not that it's relevant, but it's a bit weird that you update the version in 
the same commit...

>   ANVIL_SITE = https://github.com/Smithay/smithay
>   ANVIL_SITE_METHOD = git
>   
>   # Upstream refuses to lock their package:
>   # https://github.com/Smithay/smithay/issues/496
> -ANVIL_CARGO_LOCKED = NO
> +ANVIL_CARGO_LOCKED = buildroot
> +ANVIL_CARGO_LOCK_VERSION = 0

  The doc says that it should start at 1 :-)

  Regards,
  Arnout

>   
>   ANVIL_SUBDIR = anvil
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
