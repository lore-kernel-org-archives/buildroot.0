Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B2C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 20:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F394783CDE;
	Sat,  3 Jun 2023 20:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F394783CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFW2vyTaJIx7; Sat,  3 Jun 2023 20:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B55283B23;
	Sat,  3 Jun 2023 20:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B55283B23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EAF91BF3DF
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2277983B23
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2277983B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcnUyB1mNRGe for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 20:49:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA7583B03
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA7583B03
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 20:49:18 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96fab30d1e1so716016666b.0
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 13:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685825356; x=1688417356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QGvVJnhLxPsfWKbm5EsNuZwnNifAoD4uX1PqJEEUIIk=;
 b=XAxGDWufsni3676l88ABDSf7N/sevCkVTRLKw4kmNzaBvFfezPAmREw5ELrg/w83y3
 7G7+qEuRAf7erytdd1PxxPxW7XDTfKw4t/h/0yYtOwzYIjgsKRiorX//cjnlrwuif/VZ
 GUOZ0TscPqokCvoYK1W5pCiEsOjy6758hnuBc6X1rhp+Q3wbW527R37mUBKCgTq9Q6Ic
 kI95JCGz2o+/r8gK8+jVbFYhHi9PfylIzw3c/+8kiq0+/FSxRQntI66nwc6LCwoATgxg
 GFukqBgo024wb/hgiZhQZmYNZw/uNXdVcYrW/VS2E5Y44SElxqekpS7KLo70x+wJUovi
 mkvw==
X-Gm-Message-State: AC+VfDwXRzWObXkASoMtaPo7CuBWtrfSLCMjkWCp39uA+cAOY4iVjH/d
 3m9Y7fcRkeCeQfgw2ITskECzug==
X-Google-Smtp-Source: ACHHUZ5cEaZ7zBHivH96IcrxX9HhDir5Jf9nq5QRS6yU6o60xCT3Tx75kTiOVmUes5TEBaWFXfZUZQ==
X-Received: by 2002:a17:907:72cb:b0:966:1bf2:2af5 with SMTP id
 du11-20020a17090772cb00b009661bf22af5mr1928895ejc.22.1685825356259; 
 Sat, 03 Jun 2023 13:49:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a170906128700b0094f7744d135sm2304260ejb.78.2023.06.03.13.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 13:49:15 -0700 (PDT)
Message-ID: <69492cb3-b861-df1d-fc1d-314f93b076d9@mind.be>
Date: Sat, 3 Jun 2023 22:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230421185003.1221000-1-laurent@vivier.eu>
 <20230421185003.1221000-2-laurent@vivier.eu>
In-Reply-To: <20230421185003.1221000-2-laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685825356; x=1688417356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGvVJnhLxPsfWKbm5EsNuZwnNifAoD4uX1PqJEEUIIk=;
 b=id44PZNM7BJoLLW4WwQu2XOr+1K7ktE9CosdyaM2ajfMHWydopTO8SXVEtJ5KLyqGG
 czHpGW2kEBeG83ecBeAPwqEGiJabASJgqXaCK2MTND4CvF2lEzye/hInpnb0zDQDXIGh
 D5KJqbLO8ILAb18SZiNmxopfqFCtCSi0yU0FfUUUD4EYPuZFU8wXYHCj/wIJ5DhKeIXF
 Upr4RKSkrS2dZ4fqDoSSTvjepFD5le7a0y0RVfAVca7mWGNt3t19DRtF48oUjEPzV18/
 QwN6eRIubmTuv9bPdJs0dzyqOgcvqFjMvJKxzSw/fKJTRHt+OIvT0jmqpShUpLKl58Aw
 ispg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=id44PZNM
Subject: Re: [Buildroot] [PATCH v11 1/5] kexec: fix sys/random.h with uclibc
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/04/2023 20:49, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

  Applied to master, thanks.

  I applied v12, but for some reason I don't have that version in my inbox, so I 
reply to v11.

  I also added a recent autobuild failure in a Fixes tag.

Fixes: 
http://autobuild.buildroot.net/results/b5a/b5a46cc164cb0fe6bf37dacb917b3664d2710a4a

  Regards,
  Arnout

> ---
>   ...1-m68k-fix-getrandom-use-with-uclibc.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
> 
> diff --git a/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
> new file mode 100644
> index 000000000000..d2fc3bc88641
> --- /dev/null
> +++ b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
> @@ -0,0 +1,35 @@
> +From 491439a5c55b18dce96b522f3a603faaf1908ede Mon Sep 17 00:00:00 2001
> +From: Laurent Vivier <laurent@vivier.eu>
> +Date: Fri, 21 Apr 2023 18:22:07 +0200
> +Subject: [PATCH] m68k: fix getrandom() use with uclibc
> +
> +With uclibc, getrandom() is only defined with _GNU_SOURCE, fix that:
> +
> +kexec/arch/m68k/bootinfo.c: In function 'bootinfo_add_rng_seed':
> +kexec/arch/m68k/bootinfo.c:231:13: warning: implicit declaration of function 'getrandom'; did you mean 'srandom'? [-Wimplicit-function-declaration]
> +  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
> +      |             ^~~~~~~~~
> +      |             srandom
> +kexec/arch/m68k/bootinfo.c:231:56: error: 'GRND_NONBLOCK' undeclared (first use in this function)
> +  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
> +      |                                                        ^~~~~~~~~~~~~
> +
> +Fixes:  b9de05184816 ("m68k: pass rng seed via BI_RNG_SEED")
> +Cc: Jason@zx2c4.com
> +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> +---
> + kexec/arch/m68k/bootinfo.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
> +index 086a34bdfdeb..5afd212d9d34 100644
> +--- a/kexec/arch/m68k/bootinfo.c
> ++++ b/kexec/arch/m68k/bootinfo.c
> +@@ -1,3 +1,4 @@
> ++#define _GNU_SOURCE
> +
> + #include <stdio.h>
> + #include <stdlib.h>
> +--
> +2.40.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
