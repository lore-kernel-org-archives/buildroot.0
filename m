Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6028C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B75928086A;
	Sun,  3 Mar 2024 16:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ayOS8o4rUcB; Sun,  3 Mar 2024 16:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC05381EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC05381EDA;
	Sun,  3 Mar 2024 16:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 793E81BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7238C40135
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPLClvkC9LKE for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD9F1400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD9F1400E5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD9F1400E5
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:49:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412e0e897aeso2783195e9.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484566; x=1710089366;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOCUUpj71kDF8bFLRAcf7cNO74g+qlV/vOn7HJHUqos=;
 b=bp7DsELkexStAFQLPRGjQQljKaE/AaMR6FtFkDMr7fWOypMiEouowSpMM1SxFGwvO+
 d1RsJJKjNUZ3UL/Eezj2QN1X3HfwAPJj74MaDrKGR4yxgTMx0f7R3jRsS/rtsMw/kEVR
 tXFjTmSu1TofYRPUA/f0IrsACeFVNQVTInuc+InWtYlZWKw/dMbZBtSnFUz5BcH8hLsW
 d7XCG8AUf21/er1soWp+ElNbnEtC+jkiyXIaISScgmonUfNhFGDK+RTc+MfL4DkFBv/1
 ubNJc6dib3NQZ+532rrjzK6e6mWg3Y/5JVhKt+wwtMCxO5ZyyAPLVk+81E8obVCTDdHI
 kZJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsGvFGlUiIxdXftrFby1RJrxlN58aA2qPaPOmI1P+1KAx4AVu36IKrMHqknzGsTAuxxprsYKF7XDZllwzT5k1fTrSoO82shA==
X-Gm-Message-State: AOJu0YzRtR6zwTxIVJsB/lDPrCK1qUdgUU5mS/4C24YK+QEWpeyxdmHc
 VUtEyO1Q5a0P+OC/tthx6GbGHj5tGSDcdcJUXkky0j9V+QJTGdpbxAEkaAyvhna+pAmFzX1RlH4
 z
X-Google-Smtp-Source: AGHT+IFE6IYPMf8gGWCYIKemhk1M9PlvWGuTSvinkJ6qKYw/FjbOeuyozQEr9h/O0XzxxF30SylN0g==
X-Received: by 2002:a05:600c:4f4f:b0:412:b62f:2c3 with SMTP id
 m15-20020a05600c4f4f00b00412b62f02c3mr6533442wmq.21.1709484565647; 
 Sun, 03 Mar 2024 08:49:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b00412e38ad377sm425458wmb.15.2024.03.03.08.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:49:25 -0800 (PST)
Message-ID: <8761e0f8-c8b2-4427-b70c-463d77daa044@mind.be>
Date: Sun, 3 Mar 2024 17:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240216211813.1846842-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240216211813.1846842-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484566; x=1710089366; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOCUUpj71kDF8bFLRAcf7cNO74g+qlV/vOn7HJHUqos=;
 b=DR3vaKz66Vg0cL1hY02bovTig5IUDRvBcLYotRi6K3HVDw4WLW5ppC6A+z7YirhkuK
 EV7mKBVZShN/l+has7mWNIbaDAL4SOuBtBneUMuDdu0NMKkNpGchJFlry8dgxPhv9PYT
 N0fUN4n4mVeE/3WyP1CBqso0x9MsRgLwnRvQVZPmo5enZL53G6WZQTyVp2PlPKs8Iw4m
 bIqv5Y/HhNe89WpVDFwyAXoPnwxm6xRgoMglFcvnB2OzfSI1aTnJRpPt/gNM039U7ZvF
 X+jclJlg5XE4EB4ZqKzLdCelGGqTq5rN5dq6g+HBaT/KH9I8VrC3gNnn/LyMYNOb8hrW
 BeFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DR3vaKz6
Subject: Re: [Buildroot] [PATCH 1/1] package/liburing: fix uclibc build
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



On 16/02/2024 22:18, Fabrice Fontaine wrote:
> Fix the following build failure with uclibc-ng raised since bump to
> version 2.4 in commit 3cc1b539e7e9fd49f571441e395e7daa8597dbec and
> https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
> 
> In file included from lib.h:12,
>                   from setup.c:4:
> arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
>      7 | #include <sys/auxv.h>
>        |          ^~~~~~~~~~~~
> 
> Fixes: 3cc1b539e7e9fd49f571441e395e7daa8597dbec
>   - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...01-src-arch-aarch64-fix-uclibc-build.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
> 
> diff --git a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
> new file mode 100644
> index 0000000000..4468105e4f
> --- /dev/null
> +++ b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
> @@ -0,0 +1,39 @@
> +From f03f8da34fe96ac35a916ca3058b0f41971eae3b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 16 Feb 2024 18:59:42 +0100
> +Subject: [PATCH] src/arch/aarch64: fix uclibc build
> +
> +Fix the following build failure with uclibc-ng raised since version 2.3
> +and
> +https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
> +
> +In file included from lib.h:12,
> +                 from setup.c:4:
> +arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
> +    7 | #include <sys/auxv.h>
> +      |          ^~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/axboe/liburing/commit/32f9c27a76c43627f79bb77469d2da8583e4d3df
> +---
> + src/arch/aarch64/lib.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/arch/aarch64/lib.h b/src/arch/aarch64/lib.h
> +index 3b701b1..41bcfc9 100644
> +--- a/src/arch/aarch64/lib.h
> ++++ b/src/arch/aarch64/lib.h
> +@@ -4,7 +4,6 @@
> + #define LIBURING_ARCH_AARCH64_LIB_H
> +
> + #include <elf.h>
> +-#include <sys/auxv.h>
> + #include "../../syscall.h"
> +
> + static inline long __get_page_size(void)
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
