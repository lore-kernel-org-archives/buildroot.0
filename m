Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D233DC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68AF640004;
	Sun, 24 Mar 2024 15:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsaN48_XyDR3; Sun, 24 Mar 2024 15:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB924023B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB924023B;
	Sun, 24 Mar 2024 15:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F27A1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0173606D4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVagqSe2PKPb for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 983B260646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 983B260646
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 983B260646
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:44:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41488eb6f9fso701935e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711295049; x=1711899849;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LafLSJ9SHuv/baYKwkYHLRbocN8niAZT63J34Lagfhw=;
 b=ej+Vgh/Td5ehT5xsiSlLG3wYcBPPTN4Bn9k8BYWHiNG0PrSctNtP+Ml1DNnyaS4wgW
 B6D5G2E6Ykve9gxDan7uQ30F6sgtCSbQN3HyfiLj/yiA8W1YhBy+XytYgdulEDXxALLu
 SynRQyaQVgkqqNgTHyCy/2ytf6Wqcxna0jL0AH/YDNdEVjrfIHuaz5yB9r46pn/AXGI9
 Jwx9EYzdxByqm5rl4T+7mMcosmobxA0OPkr9bAKtP7JadaEkB9Ywj9caSd7mmKpGZbIB
 BcAanj1AXKpFqXx0l+4A9IDhvR9xkxT+xkOFLj0Gfd2ZZia5MAwKfjeb70t+ETth+0yy
 KJdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdJ8Om6HXaVnbThcJ2wpTXXzwzEoTboh1Cjm0VHEgLvqDxpUHL8ytEiv6noHxMOJNIEt7RNzakWYe2S5oztdfahrx5f5ESPw==
X-Gm-Message-State: AOJu0YwSR0Bm+4hQXcJQebs6iLs9sYwJmH1GrDti3gmFuekfIp6ZS3cs
 OCSvYrrVTdshhk6UHf3gv5cIeW9l3PC4BqwfcoSUhBJUuGUDrKrbnEKGTYxbNXGL3bKXrgSaitm
 A
X-Google-Smtp-Source: AGHT+IEaZcpm40Ny5YkRF82jIu7pCtvYjxwSjtsP9N0slgacXUSZGI5FNm1tfzw3wmqh7hBMdkxYbA==
X-Received: by 2002:a05:600c:3c88:b0:414:5ed4:6ee0 with SMTP id
 bg8-20020a05600c3c8800b004145ed46ee0mr3214108wmb.29.1711295049113; 
 Sun, 24 Mar 2024 08:44:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b004148843e3dcsm1846048wmq.12.2024.03.24.08.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:44:08 -0700 (PDT)
Message-ID: <23ce7e31-9cf5-416b-a90b-a495718c0669@mind.be>
Date: Sun, 24 Mar 2024 16:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240312190954.71227-1-brandon.maier@collins.com>
 <20240315234316.17513-1-brandon.maier@collins.com>
In-Reply-To: <20240315234316.17513-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711295049; x=1711899849; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LafLSJ9SHuv/baYKwkYHLRbocN8niAZT63J34Lagfhw=;
 b=FQl/OfeE8cOQBXup17C2uh3FlVz0zr7NO+wfaxsS8Hz/hrFQVcjbtQH4j6b4FpohLx
 DP4HmjDAbt+9d9+u4yg/i6iCmHjWHL1OSVEWnw2qc7T6Wgbxc7GfG3/XRhCl6mrdZZsh
 zMq4L03TAeiEsuWmxp/zakFvyjip1opGyevgZ8wnhku5LFSyLVklAxCoagBztdl6JqLI
 R1zXn8QFsEpIs/SBL5x8vf0FxLbZGelhWYpCxY78qlmPffQU47SMm9zhrxWY1QhgBE/f
 xiNdwryWVUigN8TJ9vDhVC29Ae8J0E8Iv95lbzPoKNS3TQLs2/tJ6fLDJ32CiMhnQKdJ
 aJ7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FQl/OfeE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gmp: fix target build with
 host gcc 4.9
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

  Hi Brandon,

On 16/03/2024 00:43, Brandon Maier wrote:
> GMP does not build if the host gcc is v4.9 due to the following error
> 
>    gen-sieve.c: In function 'setmask':
>    gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
>       for (unsigned i = 0; i < 2 * a * b; ++i)
>       ^
>    gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
> 
> The gen-sieve utility was added in GMP v6.3.0. It is built using
> CC_FOR_BUILD (host compiler) during cross compilation as it generates
> build files. Autoconf does not have a macro for add -std=c99 to
> CC_FOR_BUILD, so it must be set manually.

  I've added the explanation you gave why this is not needed for the target.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240312190954.71227-1-brandon.maier@collins.com/
> 
> v2:
> - remove unnecessary comment and ifdef check
> ---
>   package/gmp/gmp.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index bd401c6a80..7e8da9025c 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -14,6 +14,8 @@ GMP_CPE_ID_VENDOR = gmplib
>   GMP_DEPENDENCIES = host-m4
>   HOST_GMP_DEPENDENCIES = host-m4
>   
> +GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
> +
>   # GMP doesn't support assembly for coldfire or mips r6 ISA yet
>   # Disable for ARM v7m since it has different asm constraints
>   ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
