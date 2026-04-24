Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3137EFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0876E84E51;
	Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLf3IRP7FGpC; Fri, 24 Apr 2026 16:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C988F84E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048043;
	bh=sG9vLU4SaLMII7d8b1ERdgnfJgPT0kEuhNoYRN4ovN4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cDLUz3niYjebrbizKUagXxZpaFdNgiQOIfgRNMeSJJ+WlqGGRZ7PC0cWQaisawZxo
	 u8cUN3T5cJLD7FLRUgtL6z3gcEYyXdJAkTCj733+XwsyT/pFpH/pVY+uUIbJaoufP7
	 EVGWEuZSMLrLvqS2ZWZIA/IlpIvyF+TDTRllDECHypYQsyI8frPpLhxZdJW5QRohCm
	 ip8xCYbOZj5zI7GpfGCmM2D/t4yiN3AGcvC3OrNOk0vU9tLewruwqqb44xFAc43G1n
	 KlPsXBrxVgSP+zITQy4iDuHbKWssOR52enFc+sV1e8Srs5EezNvebOps+Lac4ylO8p
	 sKGdEHVTKS8Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C988F84E8B;
	Fri, 24 Apr 2026 16:27:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD676194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC464295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJDKcIM3hiGz for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B5644295A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5644295A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B5644295A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so61810705e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048037; x=1777652837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Stfuxl63e94cGUEVjA4v1ZpSzlwR99QNK1L2Dryh4hQ=;
 b=az9pUkXYOEMQ7ebOmV91++n+eDPz3ecuWPF5yKsVgdZ9dO0lxeZTqd2fitNDBwDq4x
 ZtNL8bLhNJ5apFVR3UXve+stbtaBFlQPptBMmoBBSyVDzSzbP/ggSweTCSfst0SMAVDu
 hRIlWrMWCzskGwXuXraF0EFNHUF0/MG9Yn8uaok2qMo2KaQz8AzFBETU8aZVKpBd0tpC
 CzNx+EPEiAStM0bLHO4osnlEyzXAjbnji27b1ObTHw/BbwZfUJSYnohxq1fgphNXetqi
 jBB8/2d8ublphF9w75oLPPSkC4PuIxSKZpEQXdT9byZnHaeebrH2dX8T/BR9AkQCCBeB
 NaiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PPbOZOEUiO/kSdX1CUN2aV1iECKL7yaCxFGxoPvItxEdM/UzgyILxsOfRpjpIict7tamboxwtwig=@buildroot.org
X-Gm-Message-State: AOJu0YyMt78qsiu4ab40d1z+fDctmKRYRYkrQyIiLZaeXiBlsBSFuAIy
 rjdAgqUPxph25llvfw14ZcJsN3Upg7IFUfaKFjPPvouD56tpvDnGlFNiDupS7aCShVgO8WvhgIp
 KvI94
X-Gm-Gg: AeBDievDWzowxn/x5fgoRulBvkGKW6dI1XF6fbKwOsvOtHJN0HyLJuIjsbnxjDzpXRe
 SCDfKBDPAQyIXZ6o4lq8X2WY89rzq7tPECXd39oW4cHmxP0EPZ7p8ZQZKY5W5Vh3VIYw9p4K2C8
 r75n16K7BDGT0sMXNdB+MVkyepZib+O7c852qp7o8kYyOF61u4Jk1CNyOc6crNS6myjSJy/Ifis
 kwcMYhvAGSGykw166ABxBGCY3QlhdfiVWezwmbB3itQ2xt//ZINI7a06ofMbuHOE+xOoephYAeo
 f3YW6AyLmFGKszq90YZ0OgyFq8T9GpgKrr+gWyU8i6SBDgRct5209D9hb1pua3W/DRS5Mp7cO/C
 ZlIAiNL6biBQxdjcuiY8LmLWB2kEXb7KYjTeRC+i0eK50pXTVgP20O7H6ZfnXgF8e2ChvSNzDEe
 nLhptsQLGsaFgfs0oyz1xNCrY3Wg==
X-Received: by 2002:a05:600c:a416:b0:488:e7e4:8425 with SMTP id
 5b1f17b1804b1-488fb787674mr370709135e9.23.1777048037471; 
 Fri, 24 Apr 2026 09:27:17 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-489fec8f7cbsm318752965e9.11.2026.04.24.09.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:16 +0200
Message-ID: <20260424162716.161698-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414160708.2041081-1-bernd@kuhls.net>
References: <20260414160708.2041081-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048037; x=1777652837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Stfuxl63e94cGUEVjA4v1ZpSzlwR99QNK1L2Dryh4hQ=;
 b=aMEQc8eeaoM0bGObvXdRETURjQYNR3WZC2GgHLaVa+L+MuTX83z2KFHfZV6luTiUuh
 4eso8MCuBDZSbs/lUEia5RPuNS2b7O6WEpYNilpWp6UsOMi1Uin7qXgxU4KV5mvpEQTX
 afVv1qE6oL/tOptbFV3pHg3sD6kSP+v/7u/lGa8e6ldX3kyDtK/Mj9v/BMwqCMv/20jv
 9+T45MwSmZixCq43zks9tJJ7NmhZLUe5v9yvOkiKIbmEuWN+66v3i/XsUGFBiwXNDjCV
 q+nDirAy/N/KBUJHRcWhITwk6ybvAl0fhhA7oCstfvfqdnWcuJi67UwROl6bLFU8GgIy
 N+Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aMEQc8ee
Subject: Re: [Buildroot] [PATCH 1/5] package/strongswan: remove unneeded
 wolfSSL fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Using this defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_STRONGSWAN=y
> BR2_PACKAGE_STRONGSWAN_WOLFSSL=y
> 
> applied after 'git reset 10a70b1af67cf79986c2e401f7a54aa850ea82d6 --hard'
> 
> replicates the build error
> http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246
> 
> which was fixed in 2024 by
> https://gitlab.com/buildroot.org/buildroot/-/commit/89d512729cfa5b2ef5c5165492789ba4441add19
> 
> Note: The git tree was reset to the commit right before the fix.
> 
> Instead of using the fix mentioned above the build error is also fixed
> when the buildroot commit 6c183754342e6bb73aeab3c8731789c73fcae4ad is
> cherry-picked onto 10a70b1af67cf79986c2e401f7a54aa850ea82d6.
> 
> This means the build error mentioned above is really fixed by enabling
> BR2_PACKAGE_WOLFSSL_ALL. Therefore we can remove the content of commit
> 89d512729cfa5b2ef5c5165492789ba4441add19.
> 
> This commit also prevents a build error in strongswan
> 
> wolfssl_rsa_private_key.c: In function 'create_empty':
> wolfssl_rsa_private_key.c:450:18: error: 'RsaKey' has no member named 'rng'
>   450 |         this->rsa.rng = &this->rng;
> 
> caused by the upcoming bump of wolfSSL from 5.7.2 to 5.9.1 due to
> upstream commit
> https://github.com/wolfSSL/wolfssl/commit/cd88a8ae88bac13019689c087755d826145811bb
> which was first included in wolfSSL 5.9.0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/strongswan/strongswan.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index fd46445df3..bb5fd2d217 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -101,11 +101,6 @@ STRONGSWAN_DEPENDENCIES += \
>  	$(if $(BR2_PACKAGE_MARIADB),mariadb)
>  endif
>  
> -# https://github.com/strongswan/strongswan/issues/2410
> -ifeq ($(BR2_PACKAGE_STRONGSWAN_WOLFSSL),y)
> -STRONGSWAN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DWC_NO_RNG"
> -endif
> -
>  # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
>  # problem exist since linux 4.5 header changes
>  STRONGSWAN_CONF_OPTS += \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
