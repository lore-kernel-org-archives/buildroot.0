Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0699C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62ACB60B56;
	Sun, 13 Feb 2022 15:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzQwpFfAyFPX; Sun, 13 Feb 2022 15:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967CC60AC0;
	Sun, 13 Feb 2022 15:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A36A31BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9262981250
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpDYicAQknhf for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA11180F16
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:23:39 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w10so4994906edd.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FQKJJZoXEX8N8dlbsQXebeSLvCAHYcSzmaMA2EB/jb0=;
 b=eOgvlfYodlXjr24pP2Ftyq07DD8DOJYKjXdazzmVZAsPU5yrMAh6VL70tqc5ppH18w
 YE75yxnyEfxTLSUY//tMnwxloVkTl3Yha5Ub32fd1VsRR6Gp/Dm87vGHNgck3+bfKi1t
 D7YtwrnEj2kwQ/agnK3UwvESTGynkOFHC5IQlVzyL7vuaGCD3YkpUbgeOHHIoudZlLns
 IhffdxfzBJpekRsNeENCi4jNMf1zUxioh1YRgAQLAAyerUgzvdmK2KEQijDGtTD+WJTA
 kEYLby/D735Ha1yjqUKa8FwXyVvhNkIPttHpXhJ4ld7YkJLhckdg1B/6Qc9E/nwNreGf
 AaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FQKJJZoXEX8N8dlbsQXebeSLvCAHYcSzmaMA2EB/jb0=;
 b=Rty2gF310cY838gYgvt8BAC/nCp+9+EYLYp+2pusBFg9+70crSGAosIeourMEgUHQZ
 5OpcMLr9jvGdvPQAi8KbKk818XjsVCfWFlKaj4KICJBRuAjlzttwvoJtoz76LVM3Y6aP
 vjA7BffFrP0teDYwuBtSDNBj161fGDAANUZUgbMaV/EJgtVIHMD0o4JDwcgE8gg+kqQA
 ilMJdN0KZ7firdluBqQVF1OzH98fB5DM/zunJKccxDehnQ83C9ofdBu/9EzgKBEVHODU
 9zuO8sS5RzHNsU4d5plmO3Za2Db5eeccLMHKKEg9cX5jJmV4mwseYr114XsFpkx3fTpY
 02QA==
X-Gm-Message-State: AOAM530R0EP6Qc2he5u4JpA3Gdi/ktLk3n4DGC68TzGtTwGnPP9OX1x5
 kOIc6kOeWFdF9LlGhAv+5LirMg==
X-Google-Smtp-Source: ABdhPJzA5JJeYB8PpPErymNTpgeMxDsKP0BOZT3LWDiqhLPdp8Ax+Ycs+Q9f25xP+xhoeZZEEQ+dIw==
X-Received: by 2002:a05:6402:2989:: with SMTP id
 eq9mr11269942edb.51.1644765817938; 
 Sun, 13 Feb 2022 07:23:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c11sm14547969edx.42.2022.02.13.07.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:23:37 -0800 (PST)
Message-ID: <734ec41c-a138-e7b4-eeba-7db667e226f1@mind.be>
Date: Sun, 13 Feb 2022 16:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220205135806.312865-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220205135806.312865-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: disable altivec if
 needed
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
Cc: Julian Scheel <julian@jusst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2022 14:58, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> bf4cf9de833e2d571d98d1ca935ea08a3468e463:
> 
> blake2s_simd.cpp:715:8: error: 'uint32x4_p' does not name a type; did you mean 'uint32_t'?
>    715 | inline uint32x4_p VecLoad32(const T* p)
>        |        ^~~~~~~~~~
>        |        uint32_t
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9e9f8559b12b8e2cf99cfab435fa7dd5796bbcd5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cryptopp/cryptopp.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index 4353e35e0a..87d6fba237 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -47,6 +47,10 @@ ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
>   CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
>   endif
>   
> +ifneq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
> +CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ALTIVEC
> +endif
> +
>   ifneq ($(BR2_ARM_CPU_HAS_NEON),y)
>   CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ARM_NEON
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
