Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6FBCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C81E4035D;
	Sun,  7 Apr 2024 19:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9GhfT3cM704; Sun,  7 Apr 2024 19:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CEAB404B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CEAB404B4;
	Sun,  7 Apr 2024 19:36:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABB01BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 249864043A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JC0m_1OWpajK for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE1994035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE1994035D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE1994035D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:36:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41551639550so26432705e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518559; x=1713123359;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXiQSdavUqjSHtLbyLqUqwZovO35u6pTxWA42TpQnhs=;
 b=We8rtkbgnlLs0I72P1+ow1nboG++op3uiX0euDGGDqpqYlQtG1Wlp68f2WQRTp1O3Z
 mb9UmrRAPRD9vy00icS2bEqD3Yxf/7boQ/83FrrD2pQHR6pzjOh4eI6FvZWnyoE1zljO
 U5g00Ru4UOEfOVs4uJ6xYdmYfRDbfOgAb0oL6w9l7EWLjgKig1JmjnOjVrRMD/X/qB2x
 DRsojLYmAmeQfUPd0GslfV3Fp7MbuPjzzZbZ3HA92iWCU0ucXQgpZS32dVEk2U1uCYQw
 TX/AkC7RBLC0GZGu9+M9RcCjoCqi5e9ByPbWghYDsAHLkC8g3wKyFhRK9moAoMaAMf1Y
 h1Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW1oE8mEh4a9mhi7twP/1yB4JYeXBsOz01VjVweEuas3ZHZVwPqi1GmARa2JrYgNy/NQkGcXfOcHqfPych8fE1OQewdgbJ3g==
X-Gm-Message-State: AOJu0YyW2tkl9+F9D9DJZ2Fmg/PIR+Q+mFsNIHC6bmEEFZhJmvtlWjxg
 zk3FcMNnp0YnVTphL1D3Dzyymc9jt1m78YcxKUD5Y21dn+dyTQWnEQvBp9OOEY4=
X-Google-Smtp-Source: AGHT+IFsJW0daYZY30ika0JkuN2RCobsv1Lpm3pT7eVIBaoq9R5zfv/1loBwdtzLe+GNcvxHwVI2hg==
X-Received: by 2002:a05:600c:4e8b:b0:416:7082:ec01 with SMTP id
 f11-20020a05600c4e8b00b004167082ec01mr626863wmq.22.1712518558887; 
 Sun, 07 Apr 2024 12:35:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b0041627ab1554sm14211245wms.22.2024.04.07.12.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:35:58 -0700 (PDT)
Message-ID: <27972c9d-63a4-43b6-ac55-aa5c0139c9c8@mind.be>
Date: Sun, 7 Apr 2024 21:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407153417.2030051-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407153417.2030051-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518559; x=1713123359; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXiQSdavUqjSHtLbyLqUqwZovO35u6pTxWA42TpQnhs=;
 b=ISH2T020sPtRTq307xklnBmmj6Eicy7wHGY93XAXSDPtYLTYj5+OZKZcbe2bZK/LLf
 8+HUhFuLa15QHSWsKLclFgq62r0QRAG1bzNki+asGGbg6EJsCNWq7JfWTa9H3JprJnBE
 vya0sqwnGbjWRKSlf1YOYyRXUshh02dQ4so2WKUJRnGP/6sWwdATo8XyW98XQzBWemLU
 HZo4JZabS0GlBw8iIzqzqbDkh8C1wE3PACZ4SA+VZ9TvxJqGaFIzELegTM2bPhqCEIlk
 9nVXNWJN1Q/K7brsQCqcwdp/plvlI3Hoy7V0jYZNXmpqQq2vmtAiZ1JaSja8ynkqcAhl
 832Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ISH2T020
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix build
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 17:34, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.3.27 in
> commit 59b48b5cff057f2429b1143d6f50c39d93ca8ef3:
> 
> /bin/sh: ./xccblat3_3m: No such file or directory
> 
> Fixes: 59b48b5cff057f2429b1143d6f50c39d93ca8ef3
>   - http://autobuild.buildroot.org/results/52acc2d95bbc07155b9d446ab8625f9c9eb81b52
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-should-not-be-run-in-cross-compiles.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
> 
> diff --git a/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
> new file mode 100644
> index 0000000000..44883b2c26
> --- /dev/null
> +++ b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
> @@ -0,0 +1,33 @@
> +From 48e017de095018c60d83355804a3075658b4970c Mon Sep 17 00:00:00 2001
> +From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
> +Date: Fri, 5 Apr 2024 22:54:34 +0200
> +Subject: [PATCH] fix position of endif - gemm3m tests should not be run in
> + cross-compiles
> +
> +Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/48e017de095018c60d83355804a3075658b4970c
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ctest/Makefile | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/ctest/Makefile b/ctest/Makefile
> +index bbaf96f8ed..6c7cc1ed56 100644
> +--- a/ctest/Makefile
> ++++ b/ctest/Makefile
> +@@ -203,7 +203,6 @@ ifeq ($(BUILD_COMPLEX16),1)
> + 	OPENBLAS_NUM_THREADS=2 ./xzcblat3 < zin3
> + endif
> + endif
> +-endif
> +
> + ifeq ($(SUPPORT_GEMM3M),1)
> + ifeq ($(USE_OPENMP), 1)
> +@@ -222,7 +221,7 @@ ifeq ($(BUILD_COMPLEX16),1)
> + endif
> + endif
> + endif
> +-
> ++endif
> +
> +
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
