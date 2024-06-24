Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4BFC2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A5980EA1;
	Mon, 24 Jun 2024 13:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Blwct4nDJCFN; Mon, 24 Jun 2024 13:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D911D810C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911D810C5;
	Mon, 24 Jun 2024 13:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E18781BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC5381026
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI4061fTzdmc for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04C8680EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C8680EFD
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04C8680EFD
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:44:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-364cdfdaf91so3243385f8f.1
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719236676; x=1719841476;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukdIpsfFxFgwt13eqLr79i6WOK/4s8XanmQUgyMxxkU=;
 b=m5vfFQ46j+V0Gbo+YV+USM0W+HbRCx7EtQc0wyAfk5BLiwktZoUapUGLeGWdt7J2dj
 XL3wZYg4gaBP4wH67GW5Lp/h2DekWlKm0bfiWih3z/smmtCWFHT7Bxt5D8HQHariiuqM
 S3fwthWxfuHftV1jiA2Jj++87rEzsPGPUDYkPJcWpCZq1i5ypFw7+XhltXKCPkMJs7Xm
 i2FOiHsJYUWqDmZCznkc4dJ+nAXwzUAoOfVbn7Z6apmJ6VLFpjErfAQHn7TEeITcbFeH
 UKu6nuf49IBnjbkbpSSsyvTtNUR2KH/uJF7ZUkX8X7d777SiDFzllYsjrpN8Vb86JrmN
 96+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrj4+/f+XV+Sw8m7Xjym9LeRKVi1/K6RPWuSmKuuY+BamBA1cdtCifvw5ZmsyreKwukjPCdSup01EsBE5EelwbwkH2bgA=
X-Gm-Message-State: AOJu0YzNbfISCy2PB3l84jiOBpVo5NrhmSWGAXg4f/Fx8nrA2MefCbeD
 6u5y87eBQkvskQ0urgtf6eBKovgvKx9/D1nEExM+ilUCAC9igPhz2CVzXl54wuM=
X-Google-Smtp-Source: AGHT+IFSJYjWEgteRYZeNZWow1ct+gmyh1Nkz1XEdGb6mj9VL0ICO61eK/WeWAY2nrFk31I2SmbzKQ==
X-Received: by 2002:a5d:59a8:0:b0:365:aad:2f5f with SMTP id
 ffacd0b85a97d-366e9569f3fmr4591655f8f.29.1719236675845; 
 Mon, 24 Jun 2024 06:44:35 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f68d2sm10237449f8f.4.2024.06.24.06.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:44:35 -0700 (PDT)
Message-ID: <81ac1d88-d5c4-44e5-bf61-4069c7d03b7b@mind.be>
Date: Mon, 24 Jun 2024 15:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-3-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240612135727.11811-3-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719236676; x=1719841476; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukdIpsfFxFgwt13eqLr79i6WOK/4s8XanmQUgyMxxkU=;
 b=dOZF7Lvvs5TnpGsnor6fMrwMF9CshQ9cEyTAfXH8JJvzyuzxRCwRE+aKkBzOU+DxmJ
 BvPkOBZReei0Zb85sFkL8YMW/ISfGJ4l+UKVQ4QGztOlljPS2wR7swSZW8qqBEVkoJzA
 qi6Yw7G2T57ITrd21eYA31ZVqHVGjgEWYfqGCaUWSv422N/YZYjuCkCq2OIT8X6bZzG5
 bgnXav9UHwYDwev/QE2QymF034zgpoMLnn4/ntLaRKa/jlZEgcuE0wi/APwDQJ2DEbqK
 yuxg6OEP9l4isT/RkPn47wqdQOg1NlEgJcAmtWwH15QLaF8CFsBtWDklqUBRLUzPpuld
 1xlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dOZF7Lvv
Subject: Re: [Buildroot] [PATCH v2 3/5] package/xz: determine all autoconf
 options
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> Determine all autoconf options (with default values) with the following
> special cases:
> 
> - sandbox: use 'auto' (which will compile detect landlock in case
>    kernel headers >= 5.13)
> 
> - unaligned-access: use 'auto' (which will default to yes for x86, x86-64,
>    powerpc, powerpc64 and powcerpc64le and use compile detection for arm,
>    aarch64 and riscv, see xz-5.6.0/configure line 21323 ff)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - remove '--enable-ifunc' (upstream removed)
> ---
>   package/xz/xz.mk | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 10590f6be8..e051ad0047 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -13,6 +13,45 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
>   XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
> +XZ_CONF_OPTS = \
> +	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> +	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> +	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
> +	--enable-checks=crc32,crc64,sha256 \
> +	--disable-external-sha256 \
> +	--enable-microlzma \
> +	--enable-lzip-decoder \
> +	--enable-assembler \
> +	--enable-clmul-crc \
> +	--enable-arm64-crc32 \
> +	--disable-small \
> +	--enable-assume-ram=128 \
> +	--enable-xz \
> +	--enable-xzdec \
> +	--enable-lzmadec \
> +	--enable-lzmainfo \
> +	--enable-lzma-links \
> +	--enable-scripts \
> +	--enable-sandbox=auto \
> +	--enable-symbol-versions \
> +	--enable-rpath \
> +	--enable-largfile \
> +	--enable-unaligned-access=auto \
> +	--disable-unsafe-type-punning \
> +	--disable-werror \
> +	--disable-year2038
> +
> +HOST_XZ_CONF_OPTS = \
> +	$(XZ_CONF_OPTS) \

  Since the additional options added below will also be in here, I've moved this 
part down, after setting all the target conf opts. That avoids confusion of 
people thinking that there is no enable-nls or enable-threads in here.


> +	--enable-nls \
> +	--enable-threads
> +
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +XZ_CONF_OPTS += --enable-nls
> +else
> +Z_CONF_OPTS += --disable-nls

  Missing X here (fixed in a later patch).

  Applied to master, thanks.

  Regards,
  Arnout


> +endif
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   XZ_CONF_OPTS += --enable-threads
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
