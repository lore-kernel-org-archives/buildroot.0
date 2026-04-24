Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F5AFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C69BF4296C;
	Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqqaRoncgY_h; Fri, 24 Apr 2026 16:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B615F42974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048045;
	bh=fR8CSJKlouv6NW37iC7akYwwWavu1ya80rmfAn8MPt0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YKBcEy+nKf2HG/xyIa6A0ZzSRBeHGUV8iEC/FjBnC0qlIFNChda5rrTMybKppJFGW
	 y1xSM8zgN54g84khVjZTorI8LwB3c6OIRuaApFo0hLkOMMYTNwk2L+7rwSKcknruMX
	 OOJVjUSy7d6+1pnWLdCqb+gLDRf2lu/xBCPXHuLG6kwGXiR+fAiApsCv4Sdj/iDleP
	 xOjWIK2HxAkjWgjt0cU9NvXNzAXl4e9aqgdVR+T5yGu2OABDzuhK57dYiwudiIQ9od
	 Ry/NFw8NNz5Qw7SK48wccZTo8P5ppNJDdAlqF3NHjvs2N3dr2DooLNSbsrnCbH7QGk
	 iq6nBI1VwVbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B615F42974;
	Fri, 24 Apr 2026 16:27:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFA0206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 000DE42963
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT3OV_jW7LBR for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C14D14295A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14D14295A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14D14295A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso110116325e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048039; x=1777652839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TBmY3PHVm1p9lxDxPXq4P1sF7iKNNVtqHdJxMtHZ9As=;
 b=S5UcB0jicQgdR5yoF7tTK+VEpN6NMaMTGmVjjdavGU97GgiZkcp7AXnbyzCeCEBUVe
 OF6h1OUrt1YtHQzsKhhI8PuNSGQr/R6Mya+qyTu9DsKY7TYxTzyEsbn2QzrhCSbsVByr
 /RBv0EVqiXzTYLwJe1jndTWUgDVVTioXW06Z2DZSyJaR72ZQ4biXqCsPtA0UKG8OwIj6
 B9Bk6CYPSpkLmKW0zuiIggJiYUmie3L5ZtGGSFEw6J+7aHBhaJ15ZggnbxqfVpESeXff
 ZlsfxJFoU8DYo3YaGTrsZuleYWXceC4PcWZjNxN4j4sj0GHoSMugQcWMbiJFwKwHrDjk
 G1kA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mwD0u7z1X8XcXjo1Yq8r+O5oSTBv7uvC4wI2qJ9fU1QsISQs5TwjguX2cwkSDv6Ggyy075mUyQ60=@buildroot.org
X-Gm-Message-State: AOJu0YyGq+lxdzOYFm1xgV3VnaSwV1SHdO3hOfYc9VZyRtO6u3Yz99IK
 RRhETfsPHVuORxLjVrHy+0ilTIf5OCLYNMy9Br1BUoIT27UMbVwlrr0UUtYcWM61w2M=
X-Gm-Gg: AeBDietJ0G5gp8YatLyMx+JKJUUr2s4nJ73KoOvYSS8OvFVaBblHW8qYGr/FloXhT3h
 W232UeUzykHa28e3ALa2v8Ebypr/l4zTQvbKZ3ej/8y52pB1hNaD3PWrZJNiRJAkiZsgbXMVl2S
 SZqp84UTGY9KF2Nv24Qw51FvCFrDpEtTU9pCN8aVWfb0vA0DQBvzL0zoyih9Y6LxsHOiaDxgvmy
 6MzLq3xKkG3FNP5NOOdZUANkBmmmNBA1Y5q2zp7PzszVnpWQEDNfkGUXP9NxQHPN0sDU2V664iZ
 qIg6fVsPoiF9hk4E4eafWwWqYnchypULpncODv2HBu95OGy8HkcnNsVsmZsBnq9/VUYIOSTzAuS
 VjRIyP4tTT1A9Xxsw3nHIsxE6t6arB2H4QwVGHSrmGmFSZgcj6hTrEq9o+SK6B6DehyD5AN87zI
 cdWsVUnyh5+fPn6iKuAnfHW9YI/6pq++erVNZF
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-488fb73aa3bmr475901515e9.3.1777048038591; 
 Fri, 24 Apr 2026 09:27:18 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cc7b2efsm229249465e9.0.2026.04.24.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:18 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:17 +0200
Message-ID: <20260424162717.161779-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414160708.2041081-4-bernd@kuhls.net>
References: <20260414160708.2041081-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048039; x=1777652839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBmY3PHVm1p9lxDxPXq4P1sF7iKNNVtqHdJxMtHZ9As=;
 b=hzQq9sYLFlJwHRD8JZlpb5+aPh/N9JPHMF8hoZzuUgWTs1IT8YD43iaWJIH159UaLL
 yKG5LW9rqavREsQOlkgCcaFe9ok6r2H9gHiUp492/QDrKZZd+nF91Z3p0rof6vPd6L8r
 iKdpJ2Nvm2gEex/qa3P5WViG24aqP+oBadyg1AM1fyhNUJFFw+SP3NN48T4FB4cWhfx5
 j4J/7Nu1qukQ3S/s3RbiHj2H9FJ76dmWWMm/nHkOmgDp27/+L3ddnGcGaQ6wdiDcsrEj
 05Cica85cmKCNn7zneOU132z5uVXnz/etsqZqCOmQsdA2gyjwY5W40XwyyT8H1EPssyL
 dm3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hzQq9sYL
Subject: Re: [Buildroot] [PATCH 4/5] package/wolfssl: fix build with libcurl
 >= 8.19.0
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
> wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
> ("package/libcurl: security bump to version 8.19.0") removed
> SIZEOF_LONG_LONG definitions from libcurl autotools build system,
> breaking build with wolfssl.
> 
> Fixes:
> https://autobuild.buildroot.net/results/baa/baa74a47464ed3e21d0adad64dd0c7c708c9ef85/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...TS_H-in-options.h-rather-than-config.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> 
> diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> new file mode 100644
> index 0000000000..67f9672c2a
> --- /dev/null
> +++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> @@ -0,0 +1,60 @@
> +From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
> +From: Kareem <kareem@wolfssl.com>
> +Date: Fri, 27 Mar 2026 17:01:02 -0700
> +Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
> + types.h depends on this definition and config.h isn't consistently available
> + at runtime. Fixes #9936.
> +
> +Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
> +
> +[Bernd: rebased for 5.7.2]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + cmake/config.in    | 3 ---
> + cmake/options.h.in | 3 +++
> + configure.ac       | 4 +++-
> + 3 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/cmake/config.in b/cmake/config.in
> +index f2524e41e43..6054b6dbe7b 100644
> +--- a/cmake/config.in
> ++++ b/cmake/config.in
> +@@ -19,9 +19,6 @@
> + /* Define to 1 if you have the `gmtime_r' function. */
> + #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
> + 
> +-/* Define to 1 if you have the <limits.h> header file. */
> +-#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> +-
> + /* Define to 1 if you have the <pcap/pcap.h> header file. */
> + #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
> + 
> +diff --git a/cmake/options.h.in b/cmake/options.h.in
> +index 985b54241d6..c46ada8045d 100644
> +--- a/cmake/options.h.in
> ++++ b/cmake/options.h.in
> +@@ -31,6 +31,9 @@ extern "C" {
> + #endif
> + 
> + #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
> ++/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
> ++#undef HAVE_LIMITS_H
> ++#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> + #undef _GNU_SOURCE
> + #cmakedefine _GNU_SOURCE
> + #undef _POSIX_THREADS
> +diff --git a/configure.ac b/configure.ac
> +index bce600f2ecc..c5cf9f320c7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -116,7 +116,9 @@
> +     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
> + fi
> + 
> +-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> ++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> ++# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
> ++AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
> + AC_CHECK_LIB([network],[socket])
> + AC_C_BIGENDIAN
> + AC_C___ATOMIC
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
