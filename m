Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCFCC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FB08086A;
	Sun,  3 Mar 2024 16:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfIq-BahFS13; Sun,  3 Mar 2024 16:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E7381EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E7381EDA;
	Sun,  3 Mar 2024 16:47:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0E11BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7984140135
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0byDqaEPN09M for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 753C6400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753C6400E5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 753C6400E5
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:47:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412e1b52934so1620945e9.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484441; x=1710089241;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YFo5f8rBM90FpOpzzgs00vLv9Fayim/5wk68b2J026Y=;
 b=XDg1cgLGreNo31FTG5u9oK3BLh/SgTKbRFjBCrohmoRSGj5kAUG0Bt0lcsnt7CvEpR
 TybCU3FEbY6Dm3zL25oQoZvkSYMhL0+gctzaqp6ue1dxHB6le3bWURdLbesoNLbpuPiW
 BmApg/swNl13nJuGJyO2xAva4E04ukPQq2zZy4NJ0Yd7vzR/yj8Dq+XDnJUUibRcASMk
 Oia+29e8LxcVrUXYrSHZDhRV5WkQm7u4ikkxmvvLiQMz5Lgvqb9JbwyCWZZiZJOKCK/A
 EK3hJH32AAN1VJo0rhHgD0n8syx9iAfyMj3ZOlFdh4WtdAc/3N1hnzOMkqhlbUJPZmi7
 VZtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK3x61gED8x2BtxFfSWqfRHbjn4RaZvrux52NnArychNlKYLTWO6BuRcrd85MO1yNsh2fSbV4AcEpEbMA8cW74tCi+SpwOrw==
X-Gm-Message-State: AOJu0Yxs6oWLcS74ojuzzzF/dLbxnVrNn1BoU0mRscmRDKOeuGtvFCZb
 b20K0NhT2+Y71QEe9oSwn6Rg7V2d3gXbTtsljHmRk9tzwcW+EBuGy3eUzFJ3szA=
X-Google-Smtp-Source: AGHT+IGiqklm4nQ//si755i2R+M15FYdn1ikih0Ue3bGD40e7k0Sr3XlShKIDggl4dCVRtEQKM5YKg==
X-Received: by 2002:a05:600c:3b9d:b0:412:e444:133a with SMTP id
 n29-20020a05600c3b9d00b00412e444133amr22763wms.20.1709484441065; 
 Sun, 03 Mar 2024 08:47:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b00412e38ad377sm425458wmb.15.2024.03.03.08.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:47:20 -0800 (PST)
Message-ID: <943a3838-9e77-444e-aac4-1bafccb5b928@mind.be>
Date: Sun, 3 Mar 2024 17:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240216181415.1188314-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240216181415.1188314-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484441; x=1710089241; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YFo5f8rBM90FpOpzzgs00vLv9Fayim/5wk68b2J026Y=;
 b=D03m+b5AeM7D76YeXsgT5ZYAl8Y4IXBcDT0KYgzK81ws/gmtp++ZTZZg31v21NQg0e
 hJ2oEIurMz4i0bGtfBbo/VWekld76kghaOvD3Bo6FpSFp9I+7ePAQFEK0ancsV05NJ2y
 FvUb5AUwPhRwkCNYGDZn948/q0iRDJjwKmJAi36fjAgtYI8ZfR/Cx/gjTw5L7qmYuPC9
 L5fX9/NhGxMez7EI9BEyIu94h+oRoWlSJ8VG7tcD5TJ8BNsh7ch4dc8TquC3bZC3M4uX
 CRVvOhQJsgkVUD31gTT7tN+iIT6e+pByprmabwO0M068ZSdu2OL0hQPM/4KzYbF4wvxp
 gZlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D03m+b5A
Subject: Re: [Buildroot] [PATCH 1/1] package/dash: fix static build
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



On 16/02/2024 19:14, Fabrice Fontaine wrote:
> Drop -Wl,--fatal-warnings with --enable-static to avoid the following
> static build failure:
> 
> configure:4778: checking for strtod
> configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
> /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
> collect2: error: ld returned 1 exit status
> 
> [...]
> 
> In file included from arith_yylex.c:44:
> system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
>   static inline double strtod(const char *nptr, char **endptr)
>                        ^~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
>   - http://autobuild.buildroot.org/results/a4287b86186bf0a1d5370cf53123b324ae65c1da
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Upstream was not enthusiastic about the patch (BTW you never replied to his 
question whether this was a real issue). Still, I don't really see another solution.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-configure.ac-drop-Wl-fatal-warnings.patch | 45 +++++++++++++++++++
>   package/dash/dash.mk                          |  2 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
> 
> diff --git a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
> new file mode 100644
> index 0000000000..eaa5d6cc60
> --- /dev/null
> +++ b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
> @@ -0,0 +1,45 @@
> +From 7d07f683b83ef9fbdf258ce61b022b32f06f253a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 16 Feb 2024 17:26:28 +0100
> +Subject: [PATCH] configure.ac: drop -Wl,--fatal-warnings
> +
> +Drop -Wl,--fatal-warnings with --enable-static to avoid the following
> +static build failure:
> +
> +configure:4778: checking for strtod
> +configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
> +/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
> +collect2: error: ld returned 1 exit status
> +
> +[...]
> +
> +In file included from arith_yylex.c:44:
> +system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
> + static inline double strtod(const char *nptr, char **endptr)
> +                      ^~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://lore.kernel.org/dash/20240216163319.860768-1-fontaine.fabrice@gmail.com
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5524650..6993364 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -34,7 +34,7 @@ fi
> + AC_ARG_ENABLE(static, AS_HELP_STRING(--enable-static, \
> + 				     [Build statical linked program]))
> + if test "$enable_static" = "yes"; then
> +-	export LDFLAGS="-static -Wl,--fatal-warnings"
> ++	export LDFLAGS="-static"
> + fi
> +
> + AC_ARG_ENABLE(fnmatch, AS_HELP_STRING(--disable-fnmatch, \
> +--
> +2.43.0
> +
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 6efc71e568..aebfd28be8 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -8,6 +8,8 @@ DASH_VERSION = 0.5.11.5
>   DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>   DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>   DASH_LICENSE_FILES = COPYING
> +# We're patching configure.ac
> +DASH_AUTORECONF = YES
>   
>   # dash does not build in parallel
>   DASH_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
