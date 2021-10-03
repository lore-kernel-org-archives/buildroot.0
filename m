Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB393C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E7F61AFB
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8E7F61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DEB64017A;
	Sun,  3 Oct 2021 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nSNzQ63k8h3; Sun,  3 Oct 2021 10:14:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A67324020C;
	Sun,  3 Oct 2021 10:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCDA1BF59F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C27F8469C
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkliJ60FIzyK for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 10:14:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04CA884524
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 10:14:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l7so29039663edq.3
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=f2EY+MwFoINAuk2gMP3EEIcvyP1UWizfpn4JY86wvrM=;
 b=RD9jQ25U6l2PIrLJDoAsFNYX24wcpQNSP85V6/9kR3znq6kqaqmK9JPjj9cG6U+3zn
 3OKM4xJeNZi0X/2OL2sGZisMXQeYSuNBsaeTmhB61JWOL4w5MOdSgvOysBFUfZ4OL5J8
 WgJxmif7xWdv1jqhYHMKUyXC17N0JDY28sU5kanBrOs0hakaoT1W0zTA3lzM7oSdzSlL
 BPZgLhASqe91bbxPdB8Zg4w6/bRGBy3EzAGH1rdjK7oIo8RqTdwlLtf59l62QwoYFvrl
 bZ8QMKBnd8U2FSLkUED12JnYtLToBrvIEnRu3quDq0vKPvEWfgKJ5348OGOWh2VRlCkw
 SN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=f2EY+MwFoINAuk2gMP3EEIcvyP1UWizfpn4JY86wvrM=;
 b=Mpz+sq+z9BbaUmN1sqPq9ro5grVsTj4668IoVH5DqQCTGQMQXERNR0wWQpJnXTVjlo
 yIRENaMEcPtbmmhWoIi7N8b5T2Pr5cpSs2sTf+u2JSbYekCdiMpAM0f7kNlfSa1tIlp1
 nlSDCY/+hxGPJS1fiJhM3BZSCjlAIFlLzqlYI5WUHXFj0KXJX1NKV2rUSAKJUAqYqY2Y
 BnbWX9lCGZRq3+7HpM5ZaB4ZTlUAiZLu+m7XZYd+QSp42TPwEV7No76xDt2tJeEzJQvk
 4A7tkdxs7a1S3nVviX7yAC4fMPIyUv65z4tV0y6lDQ25CtNP5RPYwoL/uK4VKt+5K3hF
 9dqQ==
X-Gm-Message-State: AOAM533sTcWKmf0pYxbdogz6oRDoMVq3YpZ6nSwl8VfgB9PHoTtUKcDG
 NfyVWGG1zTQrPaxClWYmg0bQKA==
X-Google-Smtp-Source: ABdhPJzOW4Oke+HG4r66w/J8ThU9XdElItN3swJ0DguGg/6juCvgyAavNJqR+sRT5OacNqi/7lYT0g==
X-Received: by 2002:a17:906:4452:: with SMTP id
 i18mr9280058ejp.374.1633256070018; 
 Sun, 03 Oct 2021 03:14:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l12sm5206817ejo.41.2021.10.03.03.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 03:14:29 -0700 (PDT)
Message-ID: <be59ca6e-1eee-a48b-809b-4dd815a7ac64@mind.be>
Date: Sun, 3 Oct 2021 12:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210929220027.10505-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210929220027.10505-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH RFC] package/binutils: build deterministic
 archives by default
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/09/2021 00:00, Romain Naour wrote:
> The option --enable-deterministic-archives that build deterministic
> archives is supported by binutils since binutils 2.23 [1][2].

  Should we make this dependent on BR2_REPRODUCIBLE? AFAICS it sets the date 
fields in static libraries to zero.

  Is this going to fix a reproducibility issue detected by the autobuilders?

  Regards,
  Arnout

> 
> See "Static libraries" chapter [3].
> https://reproducible-builds.org/docs/archives/
> 
> Enable this option for target and host variant.
> 
> It was added to Yocto Morty (2.2) in 2016 [4].
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2e30cb575a1d2b1eb8f776356ed59b0722a943d1
> [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=9cb80f72d8b8b2f59562692d9385cd5a533e9b3f
> [3] https://reproducible-builds.org/docs/archives
> [4] https://github.com/openembedded/openembedded-core/commit/df0d525c02780b5a0bd7a177a249c55f41797476
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>   package/binutils/binutils.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 8ec76134bc..c5c685ac85 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -57,6 +57,7 @@ BINUTILS_CONF_OPTS = \
>   	--target=$(GNU_TARGET_NAME) \
>   	--enable-install-libiberty \
>   	--enable-build-warnings=no \
> +	--enable-deterministic-archives \
>   	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
>   	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
>   
> @@ -93,6 +94,7 @@ HOST_BINUTILS_CONF_OPTS = \
>   	--disable-shared \
>   	--enable-static \
>   	--with-sysroot=$(STAGING_DIR) \
> +	--enable-deterministic-archives \
>   	--enable-poison-system-directories \
>   	--without-debuginfod \
>   	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
