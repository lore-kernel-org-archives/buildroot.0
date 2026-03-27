Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEEF10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FE9416B6;
	Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J_3F5Q9_fuo; Fri, 27 Mar 2026 10:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8007416DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605764;
	bh=4tShOLq8hp6hLH3Rv54buItw0pHeFXWl3YgUqOEXwH4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZBbRqI06W+X6j/nzbvAG5Hy1ZxvrTd0PSj0j92v68ZanGZrRi4wgrhxS/laGZlkPz
	 Mh4qDTtSMR3QgYYR1IJasWiTNGQJyOR3vWHGbR9EsklW06Q/VhC1Mc2zqUPbdLGfZr
	 TFhB19Fp3jqwwKvxvaK4GZVVM67GTcJDjszzZOeKJlHWmbWfXtcVTePWGkyKLiTV8a
	 dHK2iRjR3JKG31PNeFLDDYMUeA4k4I2NkWox/MK7uomis+aAf1T3LkCfkVQkfqMYue
	 zWrilPnT6pCx2RPbpndc72slnkG7BRpZq8e2hlWqG54M1/B2bo0zDdizZqBSREbd9v
	 JIcXUPlFtRDvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8007416DB;
	Fri, 27 Mar 2026 10:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 226B2249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 064DF613F3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7JmguIv9ENZ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C73EC612F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73EC612F4
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C73EC612F4
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso2032009f8f.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605759; x=1775210559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dWaQk2NcPSaH99mVG3MxYM2t85xoh8xoOmti5az48b8=;
 b=Xt909q0onAT45kTTa57oZ3JMQWVQ3Xxy4rEQjXLUf50dVY07lL06NLjQNOfO4LpJ5l
 eEQLwN5MiCdVAuL3wnXMSmXpx4QVwugDnsihA4/zpSSPanetiLcYkPRZIAoiasS6Sm64
 D8c2pdc6O6qUxgyUxc6SF4qvdOFc+IxwkWt1cfYRbD7YPS7EM6IHEu88GCw/CaI1blAA
 Hry9RLXGMBvv8pSkd7VfYVOPZx8eIgFcQthN75cPzb/oTKp13HsubA4pAKdpwlEbZAMD
 +4IyIUy85nuun9K7AvgfjdGZjbbeb0nDYT5DpcsqxSoNZ5e+LFMmkUBz9pO9CEHExb3a
 k8GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9I4jaGgCaDv7BvQbuP+o21PTXT0HX4pAbnXbCvZ+ZGethjCnC2F+D+KOlkN2/aDwfThCTjhyNLms=@buildroot.org
X-Gm-Message-State: AOJu0YzAqgVPdOARV5MDrVEDE98Hgp4Ji8YGPzrg2irFsrZxAh6yK5bq
 PfA2r+TAl2vOhok9IzbGvaJBmaboCGvir3gaSt3/lccj5RdgkdyG7nuFmSDlzO63UKc=
X-Gm-Gg: ATEYQzyANtEyNTTPq/jG0VtudtCNfuktWaK+1UDhoXbTr2r9J/+glbOz5YJDAFSf8uV
 OQQhmiG8FYePEudSfacAxKHIUbg7URDMla/UJNYyjImJrTM+oJ/obEzc3IdKoILD5SLxvwCMQU6
 I5nK3oxtsYUMval7hWkGhyL0A/b/WCpBEa83b/IMyNA4vCmozbQy+NOEdNSqx8dp9w54XUhI5zM
 1YR9oOkGQddAtB7JQ9eLTA4CJTKpN4xyUhZvUw5UocMnFM+QXau8NMf67V73OwMvc1f9xOuPJn+
 gFakkU9T54BB5jRkJvhCOzr4hHu+JQSyVB9gf4MDW91/GBpOoNSL3oFCAGKv6myBAvpzksz5ihY
 gw2IZYk0LCTnI5kDQPqsYUizCQl7PTAji7ODAN4BOBpPQ2Qo0CpFn7nigVWAZFBY9EmA21FeU+5
 ehUeV7JuBTT5y7aVpy
X-Received: by 2002:a05:6000:2505:b0:439:be78:e1e9 with SMTP id
 ffacd0b85a97d-43b9ea34773mr2819204f8f.14.1774605758524; 
 Fri, 27 Mar 2026 03:02:38 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9194311asm15421563f8f.10.2026.03.27.03.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:37 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:37 +0100
Message-ID: <20260327100237.46205-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605759; x=1775210559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWaQk2NcPSaH99mVG3MxYM2t85xoh8xoOmti5az48b8=;
 b=LyYSCxAK+qoT20s6bFsTZanvKP3sFh2zR8l2/XzN2SnXqwZLSICRCo81m2EDJDSkr9
 Mw1e2nMspx5pTFM4nUPx/9DdwHY15X69ibScGMkDqJFdaUS2UBp0zhIVTkkMBSfuA7W5
 Gsd5ea5OpjFCWvdyI7+4i35nqSEosCAcTyYVv2z6ijrjUZJi4pS3soMpcMMEEDEq4mFn
 kYJTRMFz8jVNuaGY3zTTRh6xp3ro9IKLEiLVTtCuRZ8ty2jNwJBU24OE93ZSyXRL6LhP
 J1HRfxbTK8bWcs21PNhl/gZkPb59w4vd5BAgBO3IvhNGSGFbedcSUU1+VH1cFRzzh8rn
 l6Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LyYSCxAK
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Following changes made it into the release:
> 
> Joris van Rantwijk (1):
>       Fix adjtimex() with TIME64
> 
> Waldemar Brodkorb (8):
>       sys/stat.h: remove _STAT_VER/_MKNOD_VER
>       fix gettid() declaration
>       add statx syscall wrapper
>       sparc: add optimize build support for leon3
>       sparc: sync with Linux kernel definition, fixes gdb compile
>       fix compile error on earlier Kernels predating statx
>       select: fix compilation failure with very old kernel
>       bump version for 1.0.57 release
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  package/uclibc/uclibc.hash | 4 ++--
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 6a96e57069..e0dba1b6b4 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
> -sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.57/uClibc-ng-1.0.57.tar.xz.sha256
> +sha256  8bc734b584e23ff6ae3d0ebb4c0fb1d1d814c58c82822b93130d436afa7ace8b  uClibc-ng-1.0.57.tar.xz
>  # Locally calculated
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 69eb73510e..0c91a176fa 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_VERSION = 1.0.56
> +UCLIBC_VERSION = 1.0.57
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
