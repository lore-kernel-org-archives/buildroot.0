Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B19C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 08:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B31415E5;
	Wed, 14 Feb 2024 08:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id benxMorqeJIC; Wed, 14 Feb 2024 08:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB75415DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB75415DE;
	Wed, 14 Feb 2024 08:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6685F1BF304
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 08:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6024241723
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 08:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8MSd-AxYkCV for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 08:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EB8F40B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB8F40B0C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB8F40B0C
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 08:20:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-410c804e933so23932165e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 00:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707898799; x=1708503599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/6Qv38guj0s+veEmbQEKhrmRvYEmdHiFlimKbhhCpfg=;
 b=syTUKTZTYxGAtXyNCQ3fbrfaojGcI2oAPYX8Fgzs/EgSA5JtgLyKt9NZJOoRX7XmsZ
 M65OlT0V0UAuuDELhZze60gP5WI8/45UkytKZIDy/Z1nUmqt31iAT8ttGFN4MyDcCZQZ
 asfGFqwausJaihTu6WE14PdgGJDgeNO7NWJ7xPNWUE4uvgyI5PVVJM2SlWNN/z9X1/8W
 sxIxsryMU5zSzbl5x15k+5S4lOJ2OA+atN2GVsnzQVjtkIXT25Ot9uNwnjfv8LnXmjgW
 7Sn/1k53FMbpk7Bv+DLRXH0wm/mtm4VQClDNkPowkrLYC+5P1Lf0U7GOo4En7pZ6FNxX
 cI+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWK+eK92l4hCAPbnn02N69TmTzgtGWgwb//cVWwG0jcMCdyeAYK9QUzWOZuIOfGyrPbV40o6KE1z7WBQ3qYVTQjSC+9PfJNQ==
X-Gm-Message-State: AOJu0Yyb5gpTevfuJaSbBbFGqvjsQgYlM9LawGrAiO5GZji/hvonW9md
 njK8p3zzRfvaF2ndU2IvM7QaHV6UzI62unMN5UvPAFcirw7v1vcIsB/Heu9b3VU=
X-Google-Smtp-Source: AGHT+IFv2WWipdGJoztJCPzHpC6m2zi5B5D7bwR7o3vygOkoKBwkEWZbyXwmCeG9eLIFFiTuOSn0kg==
X-Received: by 2002:a05:600c:458c:b0:411:d672:38d9 with SMTP id
 r12-20020a05600c458c00b00411d67238d9mr1667605wmo.19.1707898798904; 
 Wed, 14 Feb 2024 00:19:58 -0800 (PST)
Received: from [192.168.43.18] ([109.139.41.245])
 by smtp.gmail.com with ESMTPSA id
 jp24-20020a05600c559800b0040fb44a9288sm1135821wmb.48.2024.02.14.00.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 00:19:57 -0800 (PST)
Message-ID: <d4e6d31d-ee36-4dec-8357-e9312e9fa271@mind.be>
Date: Wed, 14 Feb 2024 09:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20240214071908.297656-1-yegorslists@googlemail.com>
In-Reply-To: <20240214071908.297656-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707898799; x=1708503599; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/6Qv38guj0s+veEmbQEKhrmRvYEmdHiFlimKbhhCpfg=;
 b=iEY0idQDHWb/KYc0LyVlxn7VTEbtWcsy84lKEAPlyW1ES2G/gxnv9Wc0bk59VoddLd
 wOMoHrBD4lpAKPX1M5LFLqc6z3Y+6WA8geP8dlnyMvTgp7NnZ5WpABNBkT3EoD5vYU2W
 1CD3IDXpc1EGtZmPdP+mR+4iLO0pQ3kRmXj9S8wIYMqpFOyzdj1z7q2OirDLEVf/lD0Z
 Eqnx6YIL5BSDHzWM0Dt/FiE9KWiPtDVeAMgZSLkVaYgqiIWsPX/dK7gmSdonGctzX4lL
 1A8mCjtEqBfyV4DK3liKYDg7GuagLJpsbRZVDrLEZVGuDzMXbFCjB7TsT7HK6EfANwI+
 vl4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iEY0idQD
Subject: Re: [Buildroot] [PATCH v3] Create a .gitignore file in the
 CANONICAL_O directory
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2024 08:19, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This .gitignore file ignores all files in an output directory and
> hence doesn't change the git status.
> 
> The .gitignore file will be only created if $(O) is a subdirectory
> of $(CANONICAL_CURDIR) (aka TOPDIR, but it's only defined later).
> 
> Remove "/output" entry from the main .gitignore file as it is already
> handled by this general approach.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>      - create .gitignore only if $(O) is a subfolder of $(TOPDIR) (Yann
>        E. MORIN)

  I like to create my output directories as subfolders of my BR2_EXTERNAL. 
Currently I have them in the .gitignore of the BR2_EXTERNAL itself, of course, 
but it would be convenient if they got ignored automatically.

  In other words, I'd like to go back to v1 of this patch. There's no reason, 
ever, to not want an output directory to be gitignored.

  Since two maintainers are disagreeing about this, I guess it's up to the other 
maintainers to pipe up and take a decision?


  Regards,
  Arnout

> Changes v2 -> v3:
>      - also support nested subdirectories (Yann E. MORIN)
> 
>   .gitignore | 1 -
>   Makefile   | 7 +++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f572..14b7ca5040 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,3 @@
> -/output
>   /dl
>   /.auto.deps
>   /.config.cmd
> diff --git a/Makefile b/Makefile
> index ac625152c6..aea6abb4d3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -65,6 +65,13 @@ endif
> 
>   CANONICAL_CURDIR = $(realpath $(CURDIR))
> 
> +# Create a default .gitignore file that ignores everything and doesn't make git
> +# repository "dirty". Perform this action only if $(O) is a subdirectory of
> +# $(CANONICAL_CURDIR) (aka TOPDIR, but it's only defined later).
> +ifeq ($(filter-out $(CANONICAL_CURDIR)/%,$(CANONICAL_O)),)
> +$(file >$(CANONICAL_O)/.gitignore,*)
> +endif
> +
>   REQ_UMASK = 0022
> 
>   # Make sure O= is passed (with its absolute canonical path) everywhere the
> --
> 2.34.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
