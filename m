Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3867DC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 076CA810D1;
	Fri, 25 Sep 2026 14:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH4rI0AQS0m4; Fri, 25 Sep 2026 14:44:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1188181327
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347498;
	b=fLUGBh17Xn5IEC6qYr/S0PCyKAYBVGmwjdYIJorcNADEeD9sBRg9I4oPziYMaWspGzqq
	 s8USufF8ZpESS4gmMCPiK1Fs/XCKIfToi8A2em3z/TJnw9uFzW+ZjbEl8gNIHCORqG3kY
	 /dw5LFhGDai+BiSkNRgbC7iyVNSEOatlc3hzipvo0/8Wx73LROYg07NoI/E4y6kr2B0PR
	 a9hcNGjMdJq1PapqGoQOrVPh8DNwQvxd0AkvmI1WVO9jZNz7CgrD0g0HHnAtCUAq/KEBz
	 6hRPvB29Qjg+mZENZOrgII6QUnJC/kkuDlU+N6kD7kU3SKf+2p3qOu/suGbcGJj41sA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aj9I9mczLhx7AGyxF0gFvr393cfdGdCIKW26AxK24pA=;
	b=lTfvfJ1XbwTtSW9OAyMaSAdpNy49osvf4+XR+kvLuFTOe4Olb1bIYfStKbDKtRAecOi5
	 hAlHp0CXgCrTTuliJh2BG8isYls6eHKB52mc7KXtRM7FOGZNgyZ9blZyN+ujEW14bcQkv
	 MU08QudsMTWxyxPJHaNe6ky3fo3QGLCQv2e/JqRRn038tBLC9pQW9lWJGLCqlRdhMG1f2
	 uDN7or7d/yjdpwjjhzXMkTrn9L0fuaACICTK/51sB84AX9UEreHpjfOU4of+iPj9l0PsY
	 +V7HLS6czo+Umpg2dPMHCBM30327ZkaNAhuKsoohHaXpJ/8tsq28YHXs2b5foKGlw+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347498;
	bh=aj9I9mczLhx7AGyxF0gFvr393cfdGdCIKW26AxK24pA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TyGr0yqhgtLPG0thZQZa6rKtlr5UIV9ojn7BpsaGxEuOGcL5vbFw+Qv2fARyetFL8
	 q5xq2UHKwUfLMgPpe/RbEQH6q/3v52mt5ok//lbtGVo1nnSBUMAZaMnL7EWGA3k1jA
	 dRxRHIjhnfNVyX0D/KrVOJmHnEvVVoLKW0qGBcFF1kB7BbJIx1tOZPRGAdv3GKb+54
	 HUO7XYk8lBTaGIk3BvKinhzqnyJOtsmaF+7/JsdxROesZ+FK2WIBe/+L9YODUUPFkM
	 n3aPNK9hmRWGMuAovgJEFBpA9Nyin5AwvzMDKubY0L+wkMmbCsHAxcWcI0eFdJGjoe
	 aEk15/IYEtjkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1188181327;
	Fri, 25 Sep 2026 14:44:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1FBB00
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFBEA811AE
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyiYCjxHTL9C for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90BD481327
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347494;
 b=KBoiUYBmKKuogOdGHa0OtxgNWKSINXwbe9c7AwGvAqwMDpE7yL2f683gTZV5rtf3+eUe
 kX0LnCrpszChxSoqfPj7ux1qQ7i5SFxZl83cPXlxnwNqxdBlVCWN02qki+Ym8WtLbcbXB
 iHDfMYehP4nKiLxcz6ZPR5GDNWl1ptSgFYUHnFe+xZrbYM/KTh1+UvMZ1kJJeL0MoKj2n
 qnZlq9IW9dHDWwpA1mv9ElAHPm6BEoeB0hPoP83X0FcY+cNM7DBx9BJoZPd43tydUL8t+
 KM6R7OijgkmSy1Y36axxVoJvNQiRtFQhLNU0T1hChCSl96ZuJ+UcgLNyDMrr/YQCpIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347494;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=rJUh2iLnQMZNBtbR6zRUCt6NSgf+S0ybrF1M6bmnTOY=;
 b=qn9I8fH0YM2Bp/4oNxjmj5TLHrtb7Noo6ifWfpzRHaFg4723/xD7p0D7D0C+7farxmvf
 Ne7bVhX9GZyz8BuSxF4fMgnLccsQfUfTKQyRlqs1hlJVa1BsmsyaygLPocP8A5PK2X2gl
 lS5ueDegbLZL7/Su6Y+VaLgTuKLbhQ8yHcchXv7Ci7FPHRJRU9vCkRcL5mfi8/IT/hjR+
 Z7Xpwbh2Zwt6PMnaaCUYJTMtJPgFtpyronot5A+fE+Tp1+WVT1a4lGzw3/Tow3n+E+PCV
 izWS4A3oKOXKFUrxgVm5gsP+Dx8OuYOckPyr9CnAXrTSLLWIve8M0bX1etbB5qXG7Tw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fp9QLH2O; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90BD481327
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:53 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e66390995so6115105e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347491; x=1790952291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rJUh2iLnQMZNBtbR6zRUCt6NSgf+S0ybrF1M6bmnTOY=;
 b=iHRP1+0o3Wh2JqHFfKFOdepCYQNcPkQJZTHrJLsSfTIvNQaCGHFck4yGQE0EPgnB6y
 IE7YSCRkKuZNX/SvmQkd/AYnI7kamQKFBV4QdhUhxU0o2861xhn2Q8ITPZTAGN5b+fJM
 Mft5OhLhfjOD9D/G1HuFypA+mzydJORww9EKKx5pEadd/6B36fFI6dnwuuYOQ9lvWTm7
 k5FB+QcVDVlAxFvt3yDctuH0HexWYp9iC6cHqAtx6qu7aOiZnPP79hQPvJyJMfv5z4Dr
 99idowyGuCwNanCBlqa6gZLY8E8vgBckArpHS1wLkSM//l5s0lgo99ps6dLdnklY9yts
 A4+g==
X-Gm-Message-State: AFuF++lJmARdyygRU88qU+zaoGXuxMeVD57os9MECzoX+OykLnzw0oU+
 de5UajjOdSipq8VcAJt1Y41nhRMr27cPGTfvfYpGyMrqLQ1DQ1AFqMz8PMlXduJWX3/vG3Saqxb
 45iLUKBTc+w==
X-Gm-Gg: AYBFou3cLQLFik+UwrE8HKEpzLupYx1MUTOYiC128A6UETfQrwgHyJzqIP8V+yoWACg
 sbRNvMo10LAHWE+Qza8BP4PeLfvMkjb87mURqa5udFLhVKyo7at6SiXBlvH5ULiluyPIDJnw2j/
 zoi+msrt2c3+imS1lY5oP3ykZSR9MkkhFoVNW6jhtaqMPQxTy7O0sQBfTR8qnDWNiufLOh+o3DO
 u7nhSO/uNt0bhApmQyFIzp7fHpmUhsUGMZLu+Mh28CZkT1XT69lTfGqwSDqF4XNtQ2RvODhQt1q
 5hpWXWowkYOEt+FB6AtoWx5ZTtSmn5xm0lwA9rAeKB9RVK71QMwJ3P6d5W+mRgKwtuhpjMKNM06
 akg9S4jDvSeR+myU07Er5vodMKdE7BTa1dUn1XYOake3JDS8p2Es9xvfi+C+DAmFXnumPjrXNvT
 cVYBmHJDr913JaXRTI/ke5ALbcxoOFoGaZtcZEovc4EPHxEPT/WdmzKjEfNlblHplpa0WHRwi2G
 vXjY2dwI4ynJbnD5GyRewsFMcm/AreTySyjFHelsHY=
X-Received: by 2002:a05:600c:19cd:b0:49d:2536:402e with SMTP id
 5b1f17b1804b1-49ff06f7a45mr46625335e9.30.1790347491344; 
 Fri, 25 Sep 2026 07:44:51 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4271sm228281905e9.5.2026.09.25.07.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:50 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:48 +0200
Message-ID: <20260925144450.4096808-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914213922.1847792-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sysprof: propagate ucontext-related
 dependency from libdex
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
> BR2_PACKAGE_SYSPROF selects BR2_PACKAGE_LIBDEX but did not propagate:
> 
> 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> 		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> 
> from libdex. This commit fixes this missing dependency. In terms of
> Config.in comment, we do the same as what libdex is doing: handle it
> as a toolchain dependency (rather than an architecture dependency).
> 
> This was missed in commit a73ef093f7b40297d69c6813c44fd4626883632e,
> which added the ucontext related dependency to libdex, without
> propagating it to sysprof.
> 
> Fixes: a73ef093f7b40297d69c6813c44fd4626883632e ("package/libdex: needs ucontext")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/sysprof/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
> index e89a0e539e..258f549152 100644
> --- a/package/sysprof/Config.in
> +++ b/package/sysprof/Config.in
> @@ -9,6 +9,8 @@ config BR2_PACKAGE_SYSPROF
>  	depends on !BR2_OPTIMIZE_FAST # polkit
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
> +	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # libdex
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_JSON_GLIB
>  	select BR2_PACKAGE_LIBDEX
> @@ -21,13 +23,15 @@ config BR2_PACKAGE_SYSPROF
>  
>  	  http://sysprof.com
>  
> -comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12"
> +comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12, ucontext"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12 || \
> +		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
>  
>  comment "sysprof can't be built with Optimize for fast"
>  	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
