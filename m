Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB60CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696F440AD8;
	Fri, 16 Oct 2026 15:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koDlniOhsnQD; Fri, 16 Oct 2026 15:05:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88A47409F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163108;
	b=rGZfh3Jf7zfhhAgBWSlf4j4vye7tj5onyU4FH2v1Vpots7R/9q4rtQsPOca/bWlVQCGP
	 /bSyew70uW0dAyu+OdkNrhs/7oDmDQGhL2MDoNhTEysQWxrmGK53O00WdrJBfzqJj3Nyo
	 mLOxdiL2ENfEFZ3kz2SpsAgYfWc8KSQiqo+u0uCjx4sq6ep4q0nF8R3j5jIhpEslrkxYy
	 +larMpZgQ8eIqAmws4mO2QcB/Hf3jnC82M0h93yKzMjU602yTHPACMQS5E/suluNSxrsc
	 mJKyC30K8gL7f35HTaqedjyDLspzbCXrmSnI39a8HG+r4BYI3Tty8xFfJ4pQFmXQjWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HkG9Ls78M7O+WvubfQVhu1BcjmxzOsbN+s3K+pSlAvM=;
	b=QxlfZIW9izXS0/qWAmdVDLyG2lZFoUFo2vItkDErS6eWor4n7poOpZpvfQja+sS9rvVJ
	 Ml72l5D2Hlv1eH8Ii6FKGVbLAfH9W9YI7iBNo1N8ss538d9UPf1kO8zy1t9a7/t9HmauF
	 TXkcHKb1P+dui3YdeBEwezzJDmGCeOJEuuQDRIuLh7XxXGSjCcW6B1w2JYXvVWK1860rn
	 pjpEHpySupEhAGPp4qJI5yUHb1bC70SGCV/xu3gFaovYesNORa2aMYCVz3G4jf/3CsMqK
	 I0lg7jcEL6uthNmZCouvIVmpg7CvYuuofkUvKxNiaiuQL9kNDN1Zvo+NWDrSCmkvmIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163108;
	bh=HkG9Ls78M7O+WvubfQVhu1BcjmxzOsbN+s3K+pSlAvM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gDE9qnX9xreLcEp0+snQ5lQBWr/K9jX/Hmul+iCP1HHt4pZLKXukICeGHHzArRDFB
	 h6rl3i4Yb0TOh28cmiPGC/H6aLosWDl7ImGWU8JRWN5fqHVc1oqs3u8hyiKDS92gFC
	 zhfW0bhfF0DE1S5/oNGGxZZDf81cIroffFokVDRUwV6h8a/yNze3AD9wOG/Z+YQoIh
	 yRYanb+o0tdmpdTkr1H+/4+h0J3z5HJ7/QU+MmieweBBxCVnJ8rL1NVMI4eVb0y4FH
	 Aut+1zhMHiLUZgO2UITZ6ZeIobYyf/TkUuKYoyEjM+rYX7Le3hPC4TwHCPeQTJWrOG
	 jzc4JvKlBxqBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A47409F8;
	Fri, 16 Oct 2026 15:05:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF62F255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC7C8409F8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfqz85D0YUSk for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D622340AC7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163106;
 b=XlmVzToqSP37WxsR4h5cxgXjsOXdAfDioUPs8diUDQIisI5wIwLIIBro7m0LPVjMm00R
 McjUma2jXzhSy/tsZ15HcRpG8qsw2sxr7inJkRf8rLBjnLc4Q1gUqzTggRO+o7ZRyYlm2
 xyW6hrfuYCxKD5aL7zzRn2rlbNM3jNJh8/ahhM5XUX20Bo7B/XY3DuWNDNvUTm0S8oVNm
 BNKh2vnESccX1PlnKOSegR+IBmk1TOz30y8El2qgJ2aPm5j9t8V23xDWen+di3c/lLGlz
 8du7N+Qwacr/F2kZGLKvBZ9kFOjyBgY8GX4i0jCmIfK7WDHO5zt+Niqty/mpOJbEefw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163106;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xv1p1Nv9SGg3vLytGHpb1T1EPtV0+yU7l2OmrPABzVQ=;
 b=r9YRp17sx0F4wg9WesV25IcJWezd7qjKblIVeJtGtNDtWXmredMT3Rik7jrBXbMhueX9
 nBnYYYsRonXZUSyZpSmIdaaF1idvAWsFzCE08oS1BJgklvdKDPx0jT0GbJp1NGVmp4hfs
 OuRbxsPesCQnLBAoksfcUy0EnYX4QuMSbEGxn97J3+mD7ANaWswCF3EUYFt2hXmozgpTh
 m4V8X2yRXMFTwx7/LhcUszhRqCZtq4s+2+bz9BX0p2qR/tMB7JaBbYSlUcgNXBOMb0oWD
 hHj+QIn40DTTLy8Eqhlkky9X3Wgg6NdwqBj2zXexd4ijKUyeq4ykjPUB2fLjtXk6L2A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Cl5yQH5b; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D622340AC7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so655945e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163104; x=1792767904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xv1p1Nv9SGg3vLytGHpb1T1EPtV0+yU7l2OmrPABzVQ=;
 b=Gzujj/ggdZSV4R5M8+5O01aalSr31VsaJ993DGzSd4H6SlWYV4Hu43KtqfTq7HanIU
 LCBPw0/mrtLS+wW0H1AOSnRok9Ef7HNNjMp0qzocPn2SJRnQMmpAxnrXrzW50cjxhJte
 Vrn4GtMvrAJMEqFRwgCCbj9rS8pp1Lf/OBt9QKZhJmdrI+r+hxuTZQAL9qLMVCHAjsWv
 95a8orQGlgE0PxYJQpO5ojOZUxIkpQPBxs6EJisCN7H7BHAsUntV2a3O09FLmAOA1Tsk
 WIpkxgN4k3lDV79byg4aSCNDfI3k7E/DcYpOQngaRjyS2kDWYCdReYK2mrIFxU1a8Vja
 Pq6A==
X-Gm-Message-State: AFq9FYJt8vm4jh9PWOihdAuOr+iMCh1tKuq9vPBLlyWFNRpBejLYNpaV
 bMZd3LTn95quZQ/ieBXNyKXfUWdin1RKv2dYfNObjFElkkHSyFAvuynDp677rndU9a5pXqR1gpv
 JcocJgDQ=
X-Gm-Gg: AYBFou0iKT17uQ3W9oJQSKBOwUuQNjIneVh4KzodqSM1DuZK8lvLUqwvTX7XP4iu/QD
 adqsGh1A/lZzfasj9Lc/i+m1ukRH4OPYtkvmiM8u9Brofl+vMpoHpcDzjVBgPfwbexkyG8EyG+b
 h2VoMHd3y3e16tl67NCqiq0HhX9Fu0PUXJBOd+ED/tyusJTnPCgeeW4OV/5UluHi4hvXqwspB2t
 wy1ghTWqpuAmEG2QU/ER5/kiPL4Y+TyqGeMLTIO7esQvUu6eTWbDe0zVQwjVpeg970X1daykLx2
 9nzQJow/nus1dSFlaaoqw73KwGUnfzFVKG8mW9zSvMGjLHlNn+HB/CX3baxu3Gu/Uj+I7UCr5+2
 FR1N4FaA1v1ZDCOuGzhc1qags11n9fSEdCkNUJHlRbauD48Fzh0SmrU+0EQQKX5l8UsDUpEDYiJ
 BILvw6qdh5CQI1EBzRMlhU9mOBvCHeWzPX4iu+rfbCnXpveHBZsJeqRcpvkfCSmucC8cq5AVI9B
 Vq4sOCMAJD0rf4kRN5rXGX/kOOv0qc3ojDPS38BWQ==
X-Received: by 2002:a05:600c:4e50:b0:4a0:1ea2:10c6 with SMTP id
 5b1f17b1804b1-4a1d7600357mr2109805e9.17.1792163103787; 
 Fri, 16 Oct 2026 08:05:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cdf2f0d1sm29143485e9.2.2026.10.16.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:02 -0700 (PDT)
To: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:59 +0200
Message-ID: <20261016150501.73073-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004213116.39415-1-maxime.chevallier@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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
> Since v6.7 [1], the KHDR_DIR variable isn't used anymore by the kernel
> selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
> is used to specify their location. It was only available between v6.5
> and v6.7.
> 
> Keep KHDR_DIR for compatibility with v6.5 to v6.7 kernels, while
> KHDR_INCLUDES is used by both pre 6.5 and post 6.7 kernels.
> 
> Let's pass it with the "-isystem" flag, as is done in the default values
> used in the selftest makefiles.
> 
> [1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> index db7e4fa1a3..032a71e320 100644
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -24,7 +24,8 @@ SELFTESTS_DEPENDENCIES = \
>  SELFTESTS_MAKE_FLAGS = \
>  	$(LINUX_MAKE_FLAGS) \
>  	ARCH=$(SELFTESTS_ARCH) \
> -	KHDR_DIR=$(LINUX_DIR)/usr/include
> +	KHDR_DIR=$(LINUX_DIR)/usr/include \
> +	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
>  
>  LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
>  	/usr/lib/kselftests/tc-testing/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
