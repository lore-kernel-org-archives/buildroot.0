Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A66E7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 149F86084A;
	Wed,  4 Dec 2024 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJqytr27clBT; Wed,  4 Dec 2024 21:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97D060B7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97D060B7B;
	Wed,  4 Dec 2024 21:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2B1AE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED1C60B7B
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PTxMzAtwMyd for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0BB26084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0BB26084A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0BB26084A
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434acf1f9abso2365065e9.2
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733348288; x=1733953088;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ra3IcJz7AC19NHYH05AWYXdClhqP5m+8XmCcPCVRYlI=;
 b=Xm1O/QlVtRfTs7+/vjfWfNOE0B9iHLJ6qrWlz09U3GBbxvfGTN4/ao492l2aIJmcxm
 KlAGtBs/5s0Z1YU/3HFltvkALaXibIj9MPj+sB2cqEpy5XQ+FDcElseNXgwmbAPi9kVI
 BPOWnF9Bmp2VdYQNfOVzXrlsFcO1kAmH4Jr9ZPZbj2zFqGSt3krUjcSr1hKUYwgWjTY6
 fsNXECCsxyxNn44eRQAZwrep9OvTwBORksPVXFGNBsDMkXpDFAg/p/jTfjWZaidC2ocN
 kyCvS/+gtQg/9vOvrJyEz/9M/Sed56Lu0zctfxp7feVfaFdYR8GaVR3f7bbM05vffdGg
 A+vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7cFbxZ7DuhfAH+0RlAOQmJdy50BEhElGBSUF5A47dSvpTkEyam56wi2t0yloyGMU7dhnH52689Tg=@buildroot.org
X-Gm-Message-State: AOJu0Ywc04oV4zNK19B2M+8TdOWAmolRAI4tnLtF/Jn1ffMx1BrU0Pku
 WKOSNSP3TUl20ZgttZnT9IaTfZyXc+SiPP6zWJm/foVezjluyyCKY8zJdPrVGxX0pQ7O4GEDa3j
 f
X-Gm-Gg: ASbGncto1fQmU0NLsnGNil8p6sgP/lLbrCLL5uObesfJonhm9zSRyBxvN0rejEnBpED
 tqsNwqRV6wg+Aok7cSoLsTjmwtVNbHr/t7gEOaaS9brQ9j0mFbBXH9omsgZFsLvxEke2ulK3V2M
 TyuaD/GfjBCw+eJYj0XbBub326UY3gxGuKO0db1W9knyoXnceDCYoKNVBm/EYc2cW9+QY3irkzX
 sHFa8XfzHDzzT55tjRR097V8PDJoXImEIuu2L3gFe4zczLmzcjDFKMZBg7uiiqv42NBgG9sk5Jc
 wweaLsq4EiCtBRsE32hgJMmu1K2eos+tl4f1+KG6HVy+p0bIao1f7ZopKudNHerNOGtYY5QzE6U
 pqQq5
X-Google-Smtp-Source: AGHT+IFgJXQZRwTdtE+hpT0ycJR6SamERqI1xz948OfEf/u9GPGpkaDhZRwdiZN0Eg4BNUERW8jTKQ==
X-Received: by 2002:a5d:648f:0:b0:385:e13c:5409 with SMTP id
 ffacd0b85a97d-385fd3c68d2mr6824891f8f.5.1733348288523; 
 Wed, 04 Dec 2024 13:38:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f59cc7asm78191f8f.26.2024.12.04.13.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:38:08 -0800 (PST)
Message-ID: <853eef5b-4151-4de0-b5a9-e60c58250cfb@mind.be>
Date: Wed, 4 Dec 2024 22:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <aa990b09bff81339550d51568972acee3f46bcf4.1732873686.git.baruch@tkos.co.il>
Content-Language: en-GB
In-Reply-To: <aa990b09bff81339550d51568972acee3f46bcf4.1732873686.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733348288; x=1733953088; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ra3IcJz7AC19NHYH05AWYXdClhqP5m+8XmCcPCVRYlI=;
 b=K4PYX0JtdKD8yzUJP4+UR1fypaGkNeo6xgqEj+wr0eOezfo3/dBBYFAGzTD32a6xGA
 tghL80amKWtZ2wJU2N5hbEd2eNiAk3OTP7vVvknoACqjxZwcjuuFCZZHhRWa7ShuCDxy
 6ywgwW709BhFDRYICCMccncdX0eIkAuxKwEmHPfiFxI2WOomhlBsqj53lg2WVLnyZTbB
 j9gZOlVr1eWmXmv8DjPfRMOs9p4lPOqJSLSDR3bqS6mrPQ0O3ZJMdJH3Md3V63nL5m51
 NMdx4EiQWsSwW0JMlxtNJf4J4ig2ZBJQOPABQp/6Xq6Roe0DZOOY7sOPBaqQjlySSzY9
 VMSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K4PYX0Jt
Subject: Re: [Buildroot] [PATCH] package/sexpect: fix build with GCC 14 and
 uClibc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/11/2024 10:48, Baruch Siach via buildroot wrote:
> GCC 14 makes implicit declaration an error by default, which breaks
> build with uClibc when _GNU_SOURCE is not defined. Add a patch adding
> _GNU_SOURCE for uClibc build.
> 
> Fixes:
> https://autobuild.buildroot.org/results/2c284d800e59e41669a5da85ca23e2923eea7997/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...1-Unconditionally-define-_GNU_SOURCE.patch | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
> 
> diff --git a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
> new file mode 100644
> index 000000000000..bb8b60f0c0d9
> --- /dev/null
> +++ b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
> @@ -0,0 +1,69 @@
> +From 7ef4ef027c5064502bba23869aed9d1595a4e301 Mon Sep 17 00:00:00 2001
> +Message-ID: <7ef4ef027c5064502bba23869aed9d1595a4e301.1732873390.git.baruch@tkos.co.il>
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Fri, 29 Nov 2024 11:36:16 +0200
> +Subject: [PATCH] Unconditionally define _GNU_SOURCE
> +
> +uClibc also uses _GNU_SOURCE to expose glibc compatible API extensions.
> +But toolchain built with uClibc don't define __gnu_linux__. This leads
> +to implicit declaration warnings at build time. With GCC 14 these
> +warnings become errors by default.
> +
> +For example:
> +
> +.../sexpect-2.3.14/server.c: In function 'expect_exact':
> +.../sexpect-2.3.14/server.c:630:17: error: implicit declaration of function 'strcasestr'; did you mean 'strcasecmp'?
> +  [-Wimplicit-function-declaration]
> +  630 |         found = strcasestr(g.expbuf, g.conn.pass.pattern);
> +      |                 ^~~~~~~~~~
> +      |                 strcasecmp
> +
> +Define _GNU_SOURCE unconditionally to fix the build.
> +
> +Upstream: https://github.com/clarkwang/sexpect/pull/40
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> + main.c   | 2 --
> + pty.c    | 2 --
> + server.c | 2 --
> + 3 files changed, 6 deletions(-)
> +
> +diff --git a/main.c b/main.c
> +index 886050a887c1..2bc7c867e297 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -1,7 +1,5 @@
> +
> +-#if defined(__gnu_linux__) || defined(__CYGWIN__)
> + #define _GNU_SOURCE
> +-#endif
> +
> + #include <fcntl.h>
> + #include <limits.h>
> +diff --git a/pty.c b/pty.c
> +index bf4f6e99805e..f90325d87c77 100644
> +--- a/pty.c
> ++++ b/pty.c
> +@@ -1,7 +1,5 @@
> +
> +-#if defined(__gnu_linux__) || defined(__CYGWIN__)
> + #define _GNU_SOURCE
> +-#endif
> +
> + #include <string.h>
> + #include <stdio.h>
> +diff --git a/server.c b/server.c
> +index c7e41e0a7dc4..308852f08089 100644
> +--- a/server.c
> ++++ b/server.c
> +@@ -1,7 +1,5 @@
> +
> +-#if defined(__gnu_linux__) || defined(__CYGWIN__)
> + #define _GNU_SOURCE
> +-#endif
> +
> + #include <assert.h>
> + #include <fcntl.h>
> +--
> +2.45.2
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
