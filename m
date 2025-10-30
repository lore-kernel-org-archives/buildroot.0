Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F383CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A4E83BB5;
	Thu, 30 Oct 2025 08:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVFo7h8IO17T; Thu, 30 Oct 2025 08:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C14583B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C14583B99;
	Thu, 30 Oct 2025 08:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAE2B160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00D581544
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S-DIgcVbDw3 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADD698153D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD698153D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADD698153D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so768314f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812640; x=1762417440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYX32lpT4SUqhNDXsCnhaxp8Nj0C/9jCiyhM+GTl7n0=;
 b=QSJgHXyT3D8sIQqUIBcbCyBKPvMphgFX7y0DjMGglSSYEHFR1nm/NKlHww52aT/HlU
 uBT+sxkjkBz0BSbPv1Le1Rd8cWLmcWMS1PPj5ZdBtWWV2PlXe81ZDqijZT67KIK/TVcB
 hA3GcII1JSh+rMyhVXkR9UAilfP3ltvb8xjkIkNgpNaLnFR2DGgWV1UblElcSxXkNH2h
 dfmf4XbkY4aeyuoDHrvt705oJxWkWs3lzlKELgAgJPpx3E1sUNwXuL94qBTh4Gfadjoe
 AEmOEEOuSCygPoI/XCeuDm7VsMDc46Zyvibf/b+jlfir/TxFe45byvcWYgjWFe5Zvceu
 0n0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYCO7SfvawcikxUaPFlaij3pq8DAOKpPOphFe1Jy8Uy8xOKRTWC8He5CH8Q9A56gKRDzBTX6bk/eQ=@buildroot.org
X-Gm-Message-State: AOJu0YwKiN9mS+ZuQPwCzhnVqdueNPFtdb/lzo9tx0VTniEtXKkJRA4h
 SZqpNOh1s7hYS0Rq9s9ip7QA9A1RMZW5/tT8xlXuvEOA/hw0n5jg4xgqWwMxUeG+IeY=
X-Gm-Gg: ASbGncsQGK0kV3hSH+kewtDlw5yrpKqKfQ+atpwJ84MTIvqkRukDe+mgMlYqw6WI3uM
 PVbYcvdCjb1WpshiSnNbS1q48s46jMiOQQj70lcrlTCkFIXDYZefONAwML08jt2JS2JI4CanZSB
 peCt8bXacG2eqbmk4l2xy3quQhH5KO3a+uLOpepw6NxXelECAMH2HxwndxIWZQQTHVj425WFNWr
 7nfDCsG7ZASD76zyIN3xNqWanYnFh09xBFPtHLpp58LAO896kAxqi6P1AaIY/7rf0nHpWHYsC1J
 /LDmTu/9Vj/vDu8F1laus3V/LThsN1Xam5sC26K/0/8s9wrpXZTCs1pgONDRJc5CBgowZrwqBmR
 VDllweOZ4gYPNSuhEqWCQqCQG5M4N5kotuCCj+BgP17IyPibWqYknr5qdlc6jDJpXk9K4EvoBRd
 oRnhNtvGcorsjrEW7s0rBHHiODL5wV7Ocf2M4l
X-Google-Smtp-Source: AGHT+IHf0SAEH44tvIZPkga3vNy02jD5loQO20fWYK6/Po7ncP1EwTiHZJ42SizOphsUMSDxD0orew==
X-Received: by 2002:a05:6000:2c04:b0:427:7ad:cdac with SMTP id
 ffacd0b85a97d-429b4c89fc8mr1957171f8f.20.1761812639639; 
 Thu, 30 Oct 2025 01:23:59 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm30933523f8f.6.2025.10.30.01.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:59 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:58 +0100
Message-ID: <20251030082358.35663-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026082757.252631-1-bernd@kuhls.net>
References: <20251026082757.252631-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812640; x=1762417440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYX32lpT4SUqhNDXsCnhaxp8Nj0C/9jCiyhM+GTl7n0=;
 b=MsJDd6XjCCPzuHdH0nkPfVfdqlle9JUfzqyGlsDNXZwy8O5+WELj+shnK4TfaYzl0w
 hPkg5aU950EGMLDimy173Cuc80HpGLKxPkuPZTQKHoJclHdXDlWAD2V3TsmG8YPwu6RH
 2kbMp65G/dD52qZEBanUM389AiJDQRv2mRq2L3ltYuLM+hEFe4agqPQEr6HJwnTQLIg7
 Xx5FBhaqcTqRcQNlbRDgOYWz7520Hib9lpAB4JN8EAaUWsKFUIkcyKbjNWIFmYY/uT0i
 tAgOaoj/D1Y2rRdkMvasCCxvbW1Iag0lABVTshEvrVXUGOaPVYcNk4j85iDDKG4GJ6wI
 /Hbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MsJDd6Xj
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libsolv: add upstream patch
 to fix musl build
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
> After the introduction of qsort_r in musl, building libsolv with musl fails with
> unmatched qsort_r function signature. The commit adds the recently upstreamed
> patch to fix it.
> 
> Original PR: https://github.com/openSUSE/libsolv/pull/600
> 
> Fixes: http://autobuild.buildroot.org/results/ab06e97bef898b2c53b906afb2a4b8ee6841bacb
> 
> Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
> v2: added Upstream: tag in patch file
> 
>  ..._r-preprocessor-for-musl-and-FreeBSD.patch | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
> 
> diff --git a/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
> new file mode 100644
> index 0000000000..04a4312db4
> --- /dev/null
> +++ b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
> @@ -0,0 +1,83 @@
> +From 2d0718a4f2001c857d9af24398c68d676a98a3ca Mon Sep 17 00:00:00 2001
> +From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
> +Date: Wed, 22 Oct 2025 18:14:30 +0800
> +Subject: [PATCH] Fix qsort_r preprocessor for musl and FreeBSD
> +
> +The original mentioned qsort_r signature difference now only exists in DragonFly
> +BSD & MacOS. However, the preprocessor also broke the compliation on musl+linux
> +and FreeBSD, leading the compilation error on buildroot.
> +
> +musl: https://git.musl-libc.org/cgit/musl/commit/?id=b76f37fd5625d038141b52184956fb4b7838e9a5
> +freebsd, dragonfly, macos: QSORT(3)
> +
> +FreeBSD and musl use the same GNU-like signature.
> +
> +Upstream: https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d676a98a3ca
> +
> +Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
> +[Bernd: added Upstream: tag]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/util.c | 35 +++++++++++++++++++----------------
> + 1 file changed, 19 insertions(+), 16 deletions(-)
> +
> +diff --git a/src/util.c b/src/util.c
> +index 72426e09..a60ed3da 100644
> +--- a/src/util.c
> ++++ b/src/util.c
> +@@ -154,26 +154,14 @@ solv_setcloexec(int fd, int state)
> +   #endif
> + }
> + 
> +-/* bsd's qsort_r has different arguments, so we define our
> ++#if defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R)
> ++#if (defined(__APPLE__) || defined(__DragonFly__)) && defined(HAVE_QSORT_R)
> ++
> ++/* MacOS and DragonFly have qsort_r with different arguments, so we define our
> +    own version in case we need to do some clever mapping
> + 
> +    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
> +  */
> +-#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
> +-
> +-void
> +-solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
> +-{
> +-# if defined(HAVE_QSORT_R)
> +-  qsort_r(base, nmemb, size, compar, compard);
> +-# else
> +-  /* backported for SLE10-SP2 */
> +-  __qsort_r(base, nmemb, size, compar, compard);
> +-# endif
> +-
> +-}
> +-
> +-#elif defined(HAVE_QSORT_R) /* not glibc, but has qsort_r() */
> + 
> + struct solv_sort_data {
> +   int (*compar)(const void *, const void *, void *);
> +@@ -196,6 +184,21 @@ solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, con
> +   qsort_r(base, nmemb, size, &d, solv_sort_helper);
> + }
> + 
> ++#else
> ++
> ++void
> ++solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
> ++{
> ++# if defined(HAVE_QSORT_R)
> ++  qsort_r(base, nmemb, size, compar, compard);
> ++# else
> ++  /* backported for SLE10-SP2 */
> ++  __qsort_r(base, nmemb, size, compar, compard);
> ++# endif
> ++
> ++}
> ++
> ++#endif
> + #else /* not glibc and no qsort_r() */
> + /* use own version of qsort if none available */
> + #include "qsort_r.c"
> +-- 
> +2.47.3
> +
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
