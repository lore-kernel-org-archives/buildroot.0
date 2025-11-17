Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763DCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54BD40BFD;
	Mon, 17 Nov 2025 19:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H2CG_SFiAes; Mon, 17 Nov 2025 19:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB27340E31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB27340E31;
	Mon, 17 Nov 2025 19:19:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 465B2158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43995406DD;
 Mon, 17 Nov 2025 19:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGeuaAf9qjkf; Mon, 17 Nov 2025 19:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1914C406A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1914C406A8
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1914C406A8
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:19:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso38788505e9.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 11:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763407176; x=1764011976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ft6fGkW4uGymK9JzmDxkL50JR5kIoh0YbeJ3kn+xrXk=;
 b=bXX5+CHswXLzyDsQe66H1MMZtPKfuib+sjmAFEaRXehIsiZWghxTdrWjmA4f94wgR+
 F+Fzk5EZj38SBA1+JZx7Sf5TW1xlrcb3O52ou0pmBnfrzK62NWl987oyU9/wlSIpoeox
 y+tcfXxFRQ9mJ9o/bi5FdWOqvl8RRiI6oMsm6ZXuShjsPqEMhhX0hZA8GM9Wfoh4VJr5
 OahnPxy29/OQJzvKx8g/KkmdNfV9RkwxTW+9HqymslTgh6KCz0a7rbVGrSPRAs2OeBlF
 C/Hjhi+QjEXzfeqdjbE3zIfcIUoRN0OrY2qcQ5etTPPBrpjm01RjJTTlcHiDbmNQXHDn
 +xcQ==
X-Gm-Message-State: AOJu0YwmGRthy6EW2B5hejazdhzM9ZF+3v7eOA1sPj1xskBq6283LAzy
 ddUOqnzb0DPBW2y5Yy3lzekjrRb1Rwz12OxjxF/zoGCjlWMGyChDYHLW0KYdyQ==
X-Gm-Gg: ASbGnctdo+snpAPNxy2K7zHnm5oJdd0OsMl9gcuFJWQ5DMl4WZYzLCugRtt+vvlkrn5
 KKha2MTEs62vRRMEJwq8+hY+mKmqSWfQoOzO54pH0dhpZjIQu/dfJgH83MAdrY4U08YDDR+3DeS
 VXs0M/+y4RvtuD3fX1xn+QKv/4Hq3Kf+6IdwtFutWvDu3dDtz8N+VJu5sixq0HpnPM3/fJBDb6J
 FM0hcXvOKF08/qMhiyTGpP7hEjL6AKzXu3dYVGEVOhvOHIQArSNiCR0peKQaSDMkgLs6/IaJpfF
 fJ93HVOzHiznZPa8bO4RhOFctxu1wxoB9i7eRnHeReg5Rb+98wmhmAZvhoGhm9o1FzY0mTydgVf
 Qymt46ZQCI5dKZZscDheUU6TWMhXyHQVy6dV9lnHt/IAIvOV56llJmfedwTBbwY1b93OEykV3Gi
 f5W8KEjY9CpBMsu+IHPvjDTYxlmusPUhz0
X-Google-Smtp-Source: AGHT+IFLD+aWaS3pqwxVvJQRML5E8dQyzO0PhfbT8PeiRiQq3qgF5vtv9iTbxVm9D/kTFGuE7CS1iw==
X-Received: by 2002:a05:600c:524e:b0:475:dadd:c474 with SMTP id
 5b1f17b1804b1-477a94e88bcmr5423605e9.10.1763407175769; 
 Mon, 17 Nov 2025 11:19:35 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779f44a0e4sm106079125e9.15.2025.11.17.11.19.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 11:19:35 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Nov 2025 20:19:34 +0100
Date: Mon, 17 Nov 2025 20:19:34 +0100
To: buildroot@buildroot.org
Message-ID: <aRt1RqKmwVREhyar@landeda>
References: <20251117191814.2160335-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117191814.2160335-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763407176; x=1764011976; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ft6fGkW4uGymK9JzmDxkL50JR5kIoh0YbeJ3kn+xrXk=;
 b=gSFP/pX/FT90+vqwmYEuq9NySrXT2MMvrHYoKqvD/HzyWGTmqu1WY6AqZ2K47cHF+N
 Kq8BMat2gu31J/CFIlpUA9xDa8WXLN7GIgCIGIHrWxUdwsaXmfr+kp4IAbOLeJ1ZqWCx
 hXUM0i8kWr7pdNfkD1LotXEq28d41/2Q8hrEac2KxlvJtxoKL6n4K+AdexEB8x/pVbUd
 iXm1YSMhwxOlPCgmWIVpYidnbBIWm3tZilAnbv6U1NvJqBVKsezBtfqdHFjgS2/2JvOo
 ziEEx8qqUEhBhpemjcrUNU/EUddgzaOdW+XMVs/WofwWUEcIfjamLj1FpdnTG49jj9tO
 miwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gSFP/pX/
Subject: Re: [Buildroot] [PATCH] package/distribution-registry: fix build on
 i386
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2025-11-17 20:18 +0100, Yann E. MORIN spake thusly:
> The S3 storage drivers defines the maximum size of a chunk to a value
> thqt does not fit in the native integer on 32-bit architectures. This
> causes build failures:
> 
>     registry/storage/driver/s3-aws/s3.go:312:99: cannot use maxChunkSize
>     (untyped int constant 5368709120) as int value in argument to
>     getParameterAsInteger (overflows)
> 
> Ideally, we'd like to use a build tag that refers to whether the
> architecture is 32- or 64-bit, but there is no such flag. Sigh...
> 
> Instead, backport a patch from upstream that papers over the issue, by
> usig the i386 build tag (of course, that still misses other 32-bit
> archs, but are they really relevant in this case?).

Damned, I forgot to mention:

Fixes: https://autobuild.buildroot.org/results/8fa9c5f63f690b27336051be5178f0516e0c54d4/

Regards,
Yann E. MORIN.

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  .../0001-s3-aws-fix-build-for-386.patch       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> 
> diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> new file mode 100644
> index 0000000000..a725ab8e92
> --- /dev/null
> +++ b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> @@ -0,0 +1,45 @@
> +From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 29 May 2025 11:28:38 +0800
> +Subject: [PATCH] s3-aws: fix build for 386
> +
> +When building for 386, we got the following build error:
> +
> +  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
> +  maxChunkSize (untyped int constant 5368709120) as int value
> +  in argument to getParameterAsInteger (overflows)
> +
> +This is because the s3_64bit.go is used. Adjust the build tag matching
> +in s3_32bit.go and s3_64bit.go to fix this issue.
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +---
> + registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
> + registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
> +index 218e3eab..84161fcb 100644
> +--- a/registry/storage/driver/s3-aws/s3_32bit.go
> ++++ b/registry/storage/driver/s3-aws/s3_32bit.go
> +@@ -1,4 +1,4 @@
> +-//go:build arm
> ++//go:build arm || 386
> + 
> + package s3
> + 
> +diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
> +index 55254e49..2ed1f92f 100644
> +--- a/registry/storage/driver/s3-aws/s3_64bit.go
> ++++ b/registry/storage/driver/s3-aws/s3_64bit.go
> +@@ -1,4 +1,4 @@
> +-//go:build !arm
> ++//go:build !arm && !386
> + 
> + package s3
> + 
> +-- 
> +2.51.1
> +
> -- 
> 2.51.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
