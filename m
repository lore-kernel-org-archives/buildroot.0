Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C8CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C13C14035D;
	Sun,  7 Apr 2024 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAF12W3LDVkQ; Sun,  7 Apr 2024 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C815F4043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C815F4043A;
	Sun,  7 Apr 2024 19:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5F61BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 976CD4077C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvzfbC2TKKie for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CC8D40784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC8D40784
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CC8D40784
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:35:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343bccc0b2cso2712915f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518518; x=1713123318;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYgDZc3MW/H3MVMHrVGlKFgiMWqPA8hdZeSCMbzy4NM=;
 b=Pz0ygipKoc/MGJTIwLYmu/T0DvsaA6edLwv0CE/+8q9mK5ldLbWgpJliR2UOIpxRvo
 ng0hUQEF+zqcF/TZya7qcMNYbic/LYowA2FDjxO7jPKiupVKe8UGP+gH68DQ4CkNTWZB
 a6HSXxxbu3jOlAVi6kpSH/Jrhd+pfLclVQnHgOvazTwuc2TCMFilT3fm4TcDtFsw6yaR
 8oFRdVurZLdIBf+XNaFRFKKFG7iQhMP9Wn92Onq/u1JnEsu9uCckVP1RetdJ/ZaulLNx
 jEPt7NQlRyM4jd5n2SppO+juvlx2aConZyBQIt1gl/xtVcxfYtBsQds601BkWrFTS1+L
 1wUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWspG//skP6YN+3Syb7rrrRrdje+MTRpXlA9mZKz3lzP3o1Y9ltiYoaDS/Mv7ANyqHaZYna6KDa2WspimqC6T7IaBBDInUjaA==
X-Gm-Message-State: AOJu0Yw+3rDv5jSenmi5MfIYYN1N+VqdotupNSAmK4r59MCS6ZVp1Qwu
 Mg6bM4TnO9oE2MWvSrtU3OFEc2J1TAEHAuRkISMX2kpZXHMWqXw7zaDzBiGrg/U=
X-Google-Smtp-Source: AGHT+IE5gcMaLOY6gANg1wfeBh5HUH5BXmO0ahMpe5xs3q1oUDPuo1eeGex0RwpbNiW/EQZPPHhdmg==
X-Received: by 2002:adf:f8cf:0:b0:343:7cef:993d with SMTP id
 f15-20020adff8cf000000b003437cef993dmr4995102wrq.61.1712518518220; 
 Sun, 07 Apr 2024 12:35:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adff88a000000b00343e01d3f6dsm7183348wrp.3.2024.04.07.12.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:35:17 -0700 (PDT)
Message-ID: <23fedd3b-defc-402a-b654-8238027bd5c4@mind.be>
Date: Sun, 7 Apr 2024 21:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407131649.1416942-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407131649.1416942-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518518; x=1713123318; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bYgDZc3MW/H3MVMHrVGlKFgiMWqPA8hdZeSCMbzy4NM=;
 b=Fdyas6O2J2Y8YiFqZc4wPl0dH4JJZCRq1kpTJgF4z558a+HkDWzdcC3b3jU6AaBfqv
 kp79J9VP4PEiXi/yj+ukN6JseX0WkyfMb/6u3swBi200M4puGLs8vo++ZooG1KfM618f
 6o6SARTtzypQbvkGMEDR92KpAtcF8STs9hIC1NOxF8pBnizRzYiGtkeSvChOnHCTh+KG
 PpQ+jc3aijSUOLSa0hE4EXi/f2gpuWVXmISCZuz4r0Jqr6ouPdG6aA3exY31H8gH2E9F
 uVqCzxQRXWfoXl5pbqYowUFISs9r+YutT2GOa75JTS4dm7D4XgK9owl/dqYzcsb0u23T
 tZfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fdyas6O2
Subject: Re: [Buildroot] [PATCH 1/1] package/inih: bump to version 58
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



On 07/04/2024 15:16, Fabrice Fontaine wrote:
> This bump will fix the following build failure with gcc 5 raised since
> bump to version 57 in commit 65c8a9b6626de83365865dea6fff1749466a36aa
> thanks to
> https://github.com/benhoyt/inih/commit/4e618f77d4bae216865c5abd972d99b1ba5031e2:
> 
> In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/cstdint:35:0,
>                   from ../cpp/INIReader.h:17,
>                   from ../cpp/INIReader.cpp:16:
> /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
>   #error This file requires compiler and library support for the \
>    ^
> 
> https://github.com/benhoyt/inih/releases/tag/r58
> 
> Fixes: 65c8a9b6626de83365865dea6fff1749466a36aa
>   - http://autobuild.buildroot.org/results/7a5ba516cde536e103669a0422d336dd8a3b1dbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/inih/inih.hash | 2 +-
>   package/inih/inih.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/inih/inih.hash b/package/inih/inih.hash
> index 476b544ce6..f20d7ac0b6 100644
> --- a/package/inih/inih.hash
> +++ b/package/inih/inih.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3  inih-57.tar.gz
> +sha256  e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7  inih-58.tar.gz
>   sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
> diff --git a/package/inih/inih.mk b/package/inih/inih.mk
> index 93032f1ed5..80cde0942b 100644
> --- a/package/inih/inih.mk
> +++ b/package/inih/inih.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INIH_VERSION = 57
> +INIH_VERSION = 58
>   INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
>   INIH_INSTALL_STAGING = YES
>   INIH_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
