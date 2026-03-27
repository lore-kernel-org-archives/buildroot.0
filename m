Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE810ED654
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58CF613DC;
	Fri, 27 Mar 2026 10:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl-QTDg6qVKq; Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF7261405
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605772;
	bh=FBa6NaALaoAnsVkhXHodMImrvscrfjNbBHimKUQiNeA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Iz3Bwm5NG2lbFKjOi8+Wu7XV9/5Lq2dIvD023AOzpgEAZqRWezkuGfkslkwQ+TVAd
	 y/Uca+zrfjhAsuZeIXVrsSGDSyUK2UxdAeQfcNglcvfhv9oVSm/Oi7PglIYs5EqHNm
	 kl/ME82V8H1EWO2KV/MA0VGnfAiNnprNiKmBsex+hunE8+HFQr8caUlVbbAbTsZTMo
	 4dPOUhOzYazrtwFTEZZr6J/UiKHDdXdz1pFqLOL/r8AI/1Ek8bylG3NGfJ9Y5Z5TWf
	 1W3DGw0aLs+UefVJwTrvWITGVcmb5s4I7Eq3NuKoCl9o6abTd7/DqdHYruMKOhyrvA
	 w84FRID1JLMNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF7261405;
	Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4104D1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FE7405EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XC1YWKuJHaeJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 181A940087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 181A940087
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 181A940087
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so18149405e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605766; x=1775210566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XEp7oOKTF3uHVWEjAvGUDq9XfiNuGmtQMNpzww5qBFY=;
 b=OoYHpiGEppg0IPkpooGG5Hu9jd1Fv0afaWcsT3+m39mK6I4zOr93ltM36h4MiDrIHP
 t5KZHcGKpYj0lQaurBCCYnFy7raq6OXgRgmqXCGRfV9vKFG12CsedtiYwur9WxtGI6OT
 LP19TQ1WymwOVDdzcdVrviAklUopYnn7t1VrLH+OenILjMjNpnpPwZUmOYV1Dwequ5ey
 BLWmeWT2c92FZmKvmmmfN99eSCj+RP6S9mH1tbDghu3fnDHQUhmFZiJ7gxYKvB59q/In
 nsIMuUE1KIPCYHNNluKdwuqqKf2N7TqCT8F95PnLXAnfWEnZBqBfqfF3zb1/aGg2W6oh
 vwjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfbYsS4Y5Ze0MmWgNz2eDFgxNZWo/afs2ZLSwZYk2UcmoVBVlFJ17utmqq8m2T5g1i8XC4JdGECfs=@buildroot.org
X-Gm-Message-State: AOJu0Yw3OTrOTZE0Y7q+F1/dANKau3lZGDV13Dp0tLN2F8/+KbVHIhsX
 vr5lXpLY9UdFqFPtxXYEIKGVbjNy7AHq1VnYMtRpZqza5+2VKgVKVo5HR1o3FkW2S4o=
X-Gm-Gg: ATEYQzxyhZKWSTACW8kt3rDl57RBcsqDXULeJ6dJBR0D/vrm0J0qFNm2VifvoHRI2yX
 C3v7vrG6xnOwJI8RWbcU89JcIHJ9CX02AKWmwFnNmvAWBsVWhuqfUArwqnupIkxTeQADImXMqFg
 RZg768IIuphfsWZSzCYFRjIXf3cAWbxDwrqWq3LBhjgv0J4PEZpKkj+4Fs4zoBJZn1znC0NIM4W
 QOytEmxoO3OtNaHLz98B/bcBU6/jefi2v0O0f6lV3vw9wpIfTKa4qaEsihi7MJfRopAsaa82mqJ
 H52O9hYUosQvkCKIqmOToYYG3s2h75NAJ9fOb5angexkDxDcFQvJLRVgyzTVzUr338N3iajDvRx
 jX/SLpm25qC9KblcCwnU2r2AIVsk5oaXeqy1LnwEAO5ZH5C/2GUvFdrHxbdJFseTz0i/bMsFp8R
 lbhYc5DpamMehMZwoQMAQ0m8LjD2c=
X-Received: by 2002:a05:600c:4e0d:b0:487:1c2:6a4f with SMTP id
 5b1f17b1804b1-487280c2c50mr30535025e9.31.1774605765798; 
 Fri, 27 Mar 2026 03:02:45 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722be47a4sm127495555e9.0.2026.03.27.03.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:43 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:43 +0100
Message-ID: <20260327100243.46427-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316201420.798780-1-ju.o@free.fr>
References: <20260316201420.798780-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605766; x=1775210566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEp7oOKTF3uHVWEjAvGUDq9XfiNuGmtQMNpzww5qBFY=;
 b=U+5oBslu1eD9bZ63YxEy89JcvMcu32tEOU3M/34cMAYdxi5NDw2s5xam0fNcrAN0+T
 mQRUo++ZaNerC1TizJ6mMCyHPAE4nvN0TFU0a7GBAHDstjjpDdZNY909HN0ugok14chL
 V3HvKlNwrHmjcZ5mUFfsRT9WJ1zo/oaHpZ2vP0pwIoLboJcj7aG+/zVxhEa9teJZf0En
 w8uQsz1qCN9XMM+LPztWtlbad5zUKBQITiY0U2nHchJ2No9da5EkDDTHM0DuT3HB82gA
 mr3mqzobin0/y+M7OwSOemXEDuY1RdboKyeNj1H8G03WATDBtPTpNM8UD99vNOUHzBQN
 MaKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U+5oBslu
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: add patch to fix build
 with uclibc >= 1.0.57
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
> uclibc 1.0.57 added a statx() syscall wrapper in upstream commit [1].
> 
> zfs fail to build with uclibc 1.0.57 (not yet in Buildroot), because:
> 1. uclibc <fcntl.h> internally includes <sys/stat.h>, and
> 2. a zfs test redefines a statx() wrapper with a slightly different
>    prototype.
> 
> In that case, zfs fails to compile with error:
> 
>     tests/zfs-tests/cmd/statx.c:58:1: error: conflicting types for 'statx'; have 'int(int,  const char *, int,  unsigned int,  void *)'
> 
> Issue has been reported upstream at [2].
> 
> This commit adds a package patch to fix that issue.
> 
> [1] https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
> [2] https://github.com/openzfs/zfs/pull/18316
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
> This patch is meant to be applied before updating uclibc:
> https://patchwork.ozlabs.org/project/buildroot/patch/aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de/
> ---
>  ...ts-cmd-statx.c-avoid-statx-conflicts.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> 
> diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> new file mode 100644
> index 0000000000..98f905aa48
> --- /dev/null
> +++ b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
> @@ -0,0 +1,49 @@
> +From d363aafe0a773cd55890a385694cf05cb6225c5a Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Sun, 15 Mar 2026 13:18:07 +0100
> +Subject: [PATCH] tests/zfs-tests/cmd/statx.c: avoid statx() conflicts
> +
> +With some libc, such as uclibc >= 1.0.57, the libc defines the statx()
> +function, while also internally including <sys/stat.h> (from <fcntl.h>
> +from example), which results to a compilation error due to conflicting
> +types.
> +
> +This commit fixes the issue by only defining the statx() prototype only
> +if the libc was detected not to have a working statx() wrapper, and
> +explicitly include the <sys/stat.h> otherwise.
> +
> +Upstream: Discussed in: https://github.com/openzfs/zfs/pull/18316#issuecomment-4062904581
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + tests/zfs-tests/cmd/statx.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/zfs-tests/cmd/statx.c b/tests/zfs-tests/cmd/statx.c
> +index 1acc7e58c..c292fdbdf 100644
> +--- a/tests/zfs-tests/cmd/statx.c
> ++++ b/tests/zfs-tests/cmd/statx.c
> +@@ -34,6 +34,9 @@
> +  * statx() may be available in the kernel, but not in the libc, so we build
> +  * our own wrapper if we can't link one.
> +  */
> ++#ifdef HAVE_STATX
> ++#include <sys/stat.h>
> ++#endif
> + 
> + #ifndef __NR_statx
> + #if defined(__x86_64__)
> +@@ -54,9 +57,11 @@
> + #endif /* __NR_statx */
> + 
> + 
> ++#ifndef HAVE_STATX
> + int
> + statx(int, const char *, int, unsigned int, void *)
> +     __attribute__((weak));
> ++#endif
> + 
> + static inline int
> + _statx(int fd, const char *path, int flags, unsigned int mask, void *stx)
> +-- 
> +2.53.0
> +
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
