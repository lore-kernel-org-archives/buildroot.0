Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B00CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5E280E41;
	Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENmKztenrRBZ; Thu, 14 Aug 2025 20:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B1780E47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B1780E47;
	Thu, 14 Aug 2025 20:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F4F93E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CDB740459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j2ccXgdIrYt for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48FF2402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FF2402F5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48FF2402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso6654705e9.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203514; x=1755808314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTdTB2yjC9f+lGIV3nXpF0V2uMu2JB8nTwfv948Vqtw=;
 b=Ulo2aiUVYA3LO8/d1RtFU7ao+2+QOz8I3nv/Jgt8kv8QU3JDbdCEdMBFdUxuph00l+
 ZRsEtenSplBx/J99OMpnD6ys0zfoJryvpz1g8ZmbFSscOqC902RB4kkUP0TYz4eG92CW
 z7+kWT4t71IpMLKwIHz+p1vscaOW7MWgDk7imrlVX1wgOmBbzi6G1LFqH2WqyB8ZhDRG
 P6hLrNQFaH5/6l1IS6xgjz06mEC+7iO99Dq0AJMw/TKPUBGg+AVVaqEqrA2GmQFoKvTX
 9LrZKjRAGHwFUtxtYOIxetoN5kXvtJI1Mq2l2LDxurYXUbOVallUWLcUgIs9WwVHCAPI
 P7SA==
X-Gm-Message-State: AOJu0Yw5D79+FXnzeF0RyM41vnXfQ2ffzAMnty5tpDqzEZK/FqF1QduT
 R2n63KvP1PTfOesvev9ruxdvm0Y4Efmn+K+CdaWqq1lDEnqApkeLDTEur0RDabs8PMk=
X-Gm-Gg: ASbGncteIdc9kbO3pFwyh3Tb9qYY0GkehIa2JjwAJxCIv4R/nUinROtB1n9vIMHesWw
 FtDUIl/CHLzjzfKwsvujNWnr/WVvqRoeqs4V0tGnulC+syBlHmprQO+QNvahbAdGiTnT9eDDKhH
 8OQM59q5GLJQLGF6ULVCZBMTxjIJ6WXIb51+uLxsX4S9fInUzHMr9ib2t2tl9dg5mPXR6ID98FR
 hmTbBVbnF1VhP8W4ZkPEA9uceBt+9ISqOwXAVxhOub8ydH8L6PffUeizwaf5LxDRarFLEZdNDl2
 HGqin50D2O9EdP+LSNVRTZET1C8GDnwsjOMhIhpfNDIGwN5nPlEXaAKRN8SUfd4uG7UNGmCoLRX
 Q4aJ4iFNjSV5AJA==
X-Google-Smtp-Source: AGHT+IG6mT9BIzL8dG9Kd1c+aDA1b5VCglfALHvbo5ZANL/4V7m9BZDB82R5hK2vf5VUN1JM95uB8w==
X-Received: by 2002:a05:600c:4708:b0:459:db80:c29f with SMTP id
 5b1f17b1804b1-45a20bc8b73mr2673685e9.1.1755203514271; 
 Thu, 14 Aug 2025 13:31:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e04c7407sm42552657f8f.13.2025.08.14.13.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:54 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:53 +0200
Message-ID: <20250814203153.2815832-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731165700.1426768-1-thomas.perale@mind.be>
References: <20250731165700.1426768-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203514; x=1755808314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTdTB2yjC9f+lGIV3nXpF0V2uMu2JB8nTwfv948Vqtw=;
 b=VsDextDfKnsbkwP3A8QIa/rh6RC4400DK619cbjh/JaB6hPxrQvjfMtNL4AZb+lf0K
 PGMgxL0WXOO89ERofvGrmGoptNe9qvN46A6xl4EugXzXLcJI+7wx5sjHnbhVG3vKowBo
 zU0u5jkVk5QUMQ7GxXm1t2PbkTd1LiZzLj6k9Xkrao5xvFwPS6B3hiQDL8LsW7Qb8+m4
 RaLsHznaTh34bZuODoIwfIfi3rjqGay8ZuV1RQVX+15D1PGtzk8nc6e7SnIqBDQv2Utb
 OPdXNx1Bc/WcUoMBJByc2Cfs9P3gj2AgIrW3B4Lu3+6rqtEjX01kpldwL+LhLuhUFcYP
 LZcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VsDextDf
Subject: Re: [Buildroot] [PATCH 1/1] package/janet: fix build w/ musl
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
> Since the commit [1] the janet package started failing on the
> autobuilder when using musl libc:
> 
> ```
> [50/56] Compiling C object libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
> FAILED: libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
> /workdir/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -Ilibjanet.so.1.35.2.p -I. -I.. -I../src/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c99 -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g3 -fPIC -pthread -fvisibility=hidden -MD -MQ libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -MF libjanet.so.1.35.2.p/meson-generated_.._janet.c.o.d -o libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -c janet.c
> src/core/util.c: In function 'janet_strerror':
> src/core/util.c:977:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
> [51/56] Compiling C object janet-native.p/meson-generated_.._janet.c.o
> ```
> 
> The commit [2] introduced the issue in v1.35.0, the `strerror` function
> has different definition on glibc compared to musl. This issue has been
> addressed in commit [3]. This patch add the upstream commit [3].
> 
> [1] 31212c4c58 package/janet: bump to version 1.35.2
> [2] https://github.com/janet-lang/janet/commit/8334504f4e5aa253502a45db3eeb4db265490b4e
> [3] https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
> 
> Fixes: https://autobuild.buildroot.org/results/ff1/ff1d6063c1a79d17cfa9910cca824e704a4a0c67/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...heck-for-glibc-instead-of-gnu-source.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
> 
> diff --git a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
> new file mode 100644
> index 0000000000..5ee021e658
> --- /dev/null
> +++ b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
> @@ -0,0 +1,26 @@
> +From a5d6b2283834422a9fa9e79b5c7ad9b932b52568 Mon Sep 17 00:00:00 2001
> +From: Calvin Rose <calsrose@gmail.com>
> +Date: Fri, 21 Jun 2024 17:17:22 -0500
> +Subject: [PATCH] Check for __GLIBC__ instead of _GNU_SOURCE
> +
> +musl doesn't obey this behavior.
> +
> +Upstream: https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/core/util.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/core/util.c b/src/core/util.c
> +index 4bb37abc5..6cb5676e0 100644
> +--- a/src/core/util.c
> ++++ b/src/core/util.c
> +@@ -972,7 +972,7 @@ const char *janet_strerror(int e) {
> + #ifdef JANET_WINDOWS
> +     /* Microsoft strerror seems sane here and is thread safe by default */
> +     return strerror(e);
> +-#elif defined(_GNU_SOURCE)
> ++#elif defined(__GLIBC__)
> +     /* See https://linux.die.net/man/3/strerror_r */
> +     return strerror_r(e, janet_vm.strerror_buf, sizeof(janet_vm.strerror_buf));
> + #else
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
