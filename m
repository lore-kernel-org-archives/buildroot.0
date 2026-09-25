Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE5DC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576EB60D5E;
	Fri, 25 Sep 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaPbSi0G_lz7; Fri, 25 Sep 2026 14:46:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D0FB60DE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347603;
	b=GRYb/j9l+bHhT0OuMfz0/ht+e1TCbCZtCNfhb7vmmvB1tGUvh9RHj8BOnnnKinwuSGEk
	 4Pa7po+glYic8uGtBBQulZCljsG14ChNyWttxgUjwTqMk1QM/VwQ6PQsPZcrBrWL61r6U
	 btyV8vifLXJHfvCao39GRfz8Apj1IuiKIV1H5dS2ufLh5pLft6VkZMk+jFF7irKUXPPOo
	 vJZS3rNfux51s1/CSV0n9mUbOVzm4d0C+HrshibL0L1cXyY0lQt3N8s17AtYjHNaXVub/
	 wAUmkugRFt/KumiwpC+1m7xVzSryqCijzXW/o6xoYVbE4PppDOs0eae/B2eeKf+kmnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fbg3c48l9y92XoRHzv3/ExKforZGrH4kBQORNy9va8U=;
	b=UyzKQjA++LIDhrhO/PA9YXwGHb6wz3+7s5BQnVIvN36eTq+2w/DtKBm4HZjQevOodX9H
	 LE5eWCugiwqg3jWCtyOjzBnKbfotCj0Ra6AY2pxjf246RohmEmyVQT5z9u1eyyN69OqCG
	 9ppB5bzNY1DAb/ms7RUEPyJTgUmwaUEVtV/ek7xkeHRoj2C9gc7TltXZk2Y82Th0OYclE
	 x9/GAinR/jFeSUCIyt9xytPSGy6Kq55808Hfj6I1m+nbLyjQ9Xc0hLpSCvUP1VC9XOBA3
	 wh0hln7TmyO1E9SctjwwDSjH1+4UENFgu+HHF2RDq6i7GB/x0gNy9PQw82CAKEjFXEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347603;
	bh=Fbg3c48l9y92XoRHzv3/ExKforZGrH4kBQORNy9va8U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fpdeVL8CumxsIOM5kJnCjydCC+7er+pAktOA53bbz5W3P2AqXJ/V+oMa4gKkwuNSy
	 3jQkoYI8PXkjxq2cQ4yAVoNCvIZErKczUHl+rWU9IV1enlTkmY20AxkzToHVu/Y0vB
	 oe7uPwvc7RMqgq8Q0Z7JWxqU9JLbD2ci9CZA4vHZOJ0VoZJKfHkgi0yA5FpXOX8amY
	 LicBjYczwXX9p6WpRnX4zW8X9lV1GkjGouL3XFbCWLckLUdbO4hpTbsTg9YMPxvwlU
	 dGVhwwLf34Fc2TK9n8aceSOyGImEWxOlFDMi/OxwGZ/JZXMbZ6IkyhfkzHl60ViCns
	 q2U4o7+1+PyEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0FB60DE1;
	Fri, 25 Sep 2026 14:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9A6332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E182381361
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsB-3Zuz4VF6 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECA8A81401
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347600;
 b=lFKvC7DwlJsgcv+56b6XE6L+dgrtZjXHhAkR+9/0AQ6MY187rdZLVY5rXbG7S5XUdLU0
 Ypn91oxHC6T/+jbzbwB9fCY0QVHHGhLSVUU4BsqlIFXYkTg3fvQ1nA2t6JHC4MrQIp/uR
 lHRcusAkkBnB0VgW6vLnh37Fqb4lC+eib4h52QieZRPw6/ujSh04D2FQIhJ7sW8Hdiy2P
 U2cQHAXdQOBizHpk4jarNkgVhXcuXpaiXwWwrwjmW9ABB70uK5+VBJid3hw9N9R+o/sHL
 6NUW1KHwWFI5/e+0C/m+n4wQKEKXe42YG6FrebN9Pvp5QZVy+mEH9gHh6sbnumO41PQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347600;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=imOnxfTBOlSWIK+QxeNW3KKRWgI+Sed7+CQMBkY8wyU=;
 b=ELBDYP0ZYkxhSxV9axGNLxexlZ4gODW6mp9XUAv466QRoitkZCLuoN+pNHhUyiS5oGML
 J79+soFIlnY+4mUD9/kZTxIA1ZZ7JFlJCMZ3awLFUG9K2CAvDIvnH51tSwblNv/orjjFk
 CCRopNZkTI2Ah40ujtAHJTGroC+45uVdpHlj/VZmW/0Z1HY5injNdGF5E+2PWorg4SPbP
 Xqi37ghQqzyLtrZ2MZHdnEGqAfRZ8+UTrebpqJwG6/0piU754g4zABC8jUos72zkg7kyS
 Zyx2VI0ccctMXL9++U+gPq3V79Jmxl15wpUg149uUKGcdkPepLE25GFJ1zFEYMVr92Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KsDeksnR; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECA8A81401
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:39 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so7353615e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347598; x=1790952398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=imOnxfTBOlSWIK+QxeNW3KKRWgI+Sed7+CQMBkY8wyU=;
 b=ZWywueFUByFU6CZIKPp/qiUBLdZ5N6NU3ngyLYPbEh5JHguCjRq5gqQvvy0OF85ynH
 4Z31CqJXFZ9MWrbgxTl7eQ27FHTm1wa1ulJ+VaHLy0TjpSbl0u6CXN9dDmAtXOoYPRZA
 XARM2Gd1FNI3VKQi9Fik2VRIsBPXAcWSwGDicel2avQGgxjzmJHObpAYKC/exeuFLSlq
 WCjmK1lwd+PJ5pJpEgs0zDR/ijHWAz24HiUk0u2LzOoEZNl1ggWhcw39yL88dUiSSHYd
 xoZC+NsGnWHyDItZnHOxxd4HRr8rX9hJ0hA2WXqJbnUW9MYqx6XlnOSnS49oJxao6peN
 sq8A==
X-Gm-Message-State: AFuF++lpmflfzy+Mn/J9+xCQkoamgV0DeJy9Abi9YsSuCwJYMmddrHC/
 4OSR1R7wuwJww559RusAsisvRJi2E2dqobRj9FBdUHN5aiEAt78ssGRRB1D6Ce94mEZVF6I0SqL
 3WzuWXH4o5w==
X-Gm-Gg: AYBFou2Qlr6PR6SNmJS9lbhsQWFxu6zBti0mYq0vsMuEN1/5VTkvqKPS5SVRerOoHg8
 uFMR6D7HmXu1DqcTnLr+8vo+tJwJp2Cj0vX753qDr509D8Hyb36DciJ8wc2y+OoGoL3bM2AAqg2
 xOtVqlyoMKLUaecMSWWjQnkW2PZgRxTxZ2Ubj1x/6VzxtZ9UlHm8GSCWvmimXX2a1lxuRv1AfMq
 udocI9WyKGnUMdH574+3dEZrNPnYCL5ZBSMwy+O4O0YLEKfzL7vSvAwr/DVkUg9zYYOCu51eKwM
 3iq06U5r0jUOZddE2v9EfKS3blUPtc3c3z7fuATyEcNPhcAzM+GXpGb8AA2dAovezut+VibgopH
 EUaiJ2iwRO/4ufpgFOeolotAy4qOSksrPP+mcVr4cf87zToJi8FUE9/4JiBL2fQQmtUIl+Xt1x7
 Dc/sFHRq0GITHCd8F4qrOzJ6AQ70JKLV3vZluesYuFK3q6HI9gi776OA7Q1O+Bv3d6p0xBHN/Q9
 NWR0A8BqK/vlKx1Rqdpn5GsGtWqwI2sFW9D413bUg==
X-Received: by 2002:a05:600c:4ec6:b0:49d:1a02:4797 with SMTP id
 5b1f17b1804b1-49fe66d828fmr107499775e9.17.1790347597722; 
 Fri, 25 Sep 2026 07:46:37 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4271sm228420055e9.5.2026.09.25.07.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:37 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:35 +0200
Message-ID: <20260925144636.4099697-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917075326.1256294-3-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] arch/Config.in.x86: add
 BR2_X86_CPU_HAS_XOP
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The AMD Bulldozer family (bdver1 to bdver4, i.e. bulldozer, piledriver,
> steamroller and excavator) is the only x86 family implementing the XOP
> instruction set, together with the equally Bulldozer-specific FMA4 and
> LWP extensions, and TBM starting with bdver2. All of them were dropped
> again with Zen.
> 
> This can be verified with:
> 
>   $ gcc -march=bdver1 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
>     -mfma4      [enabled]
>     -mlwp       [enabled]
>     -mtbm       [disabled]
>     -mxop       [enabled]
> 
>   $ gcc -march=bdver2 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
>     -mfma4      [enabled]
>     -mlwp       [enabled]
>     -mtbm       [enabled]
>     -mxop       [enabled]
> 
> with bdver3 and bdver4 behaving like bdver2.
> 
> Add a hidden BR2_X86_CPU_HAS_XOP capability symbol and select it from
> those four CPU variants, so that packages which cannot cope with this
> instruction set can depend on it, instead of listing the CPU variants
> one by one. The first user is host-qemu, whose TCG engine does not
> implement XOP.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  arch/Config.in.x86 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 3c4a725360..51b157409f 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -20,6 +20,14 @@ config BR2_X86_CPU_HAS_AVX
>  config BR2_X86_CPU_HAS_AVX2
>  	bool
>  
> +# BR2_X86_CPU_HAS_XOP is selected by the AMD Bulldozer family (bdver1
> +# to bdver4), which is the only family implementing XOP. On those CPUs,
> +# gcc also enables the equally Bulldozer-specific FMA4 and LWP
> +# extensions (and TBM starting with bdver2). Those extensions were
> +# dropped again with Zen.
> +config BR2_X86_CPU_HAS_XOP
> +	bool
> +
>  # BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
>  #   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
>  # This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and
> @@ -604,6 +612,7 @@ config BR2_x86_bulldozer
>  	select BR2_X86_CPU_HAS_SSSE3
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_X86_CPU_HAS_XOP
>  config BR2_x86_piledriver
>  	bool "piledriver"
>  	select BR2_X86_CPU_HAS_MMX
> @@ -613,6 +622,7 @@ config BR2_x86_piledriver
>  	select BR2_X86_CPU_HAS_SSSE3
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_X86_CPU_HAS_XOP
>  config BR2_x86_steamroller
>  	bool "steamroller"
>  	select BR2_X86_CPU_HAS_MMX
> @@ -622,6 +632,7 @@ config BR2_x86_steamroller
>  	select BR2_X86_CPU_HAS_SSSE3
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_X86_CPU_HAS_XOP
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  config BR2_x86_excavator
>  	bool "excavator"
> @@ -634,6 +645,7 @@ config BR2_x86_excavator
>  	select BR2_X86_CPU_HAS_SSE42
>  	select BR2_X86_CPU_HAS_AVX
>  	select BR2_X86_CPU_HAS_AVX2
> +	select BR2_X86_CPU_HAS_XOP
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  config BR2_x86_zen
>  	bool "zen"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
