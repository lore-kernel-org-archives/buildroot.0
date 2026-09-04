Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A41DC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4DE060C23;
	Fri,  4 Sep 2026 12:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnLx8KAy_q4z; Fri,  4 Sep 2026 12:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 280BE60C0D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524238;
	b=gxQEpW1qBRqgIIAHsIChOh8NJclzD67OHnDQI2wOCZILN6Ikx9qbIiU7OeEswemPtv/T
	 4Qc8pu6WDj05ZkRkRdzE6oY/i8a2/1u71IW9vSL4FAMWoHmIJ4oE5Ir1F2ykiPldJeE5X
	 1Cx6KUFFvjJMcRDXxZaShzsiPDxu4Wpoml7kT/yEKGis8ATX15GjsFUPJpQyCAcSg41PV
	 Patdjf306bl4jihQ10pPJkqQ+3Ty+VoF1+pxNwFiB3YrRzIWHL/mcWE1K6l6+2RWpOfBV
	 ms5vcxtlGeV2DGDaItXy4D3jbh0rnqnuDsydyceXFdfLRz8sBeXRWj0MlbFJDdg+WLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IwnkP8UcrBZrqB7RAnB4haFN0CTaUD0pZmFz0EXsDB0=;
	b=lN5ck/KoCvm2qLDyyia7IINPRESrznH8dseNGtyRS419CaE+983ws7zVY+wQGvBRQNtn
	 WkB+H9pb3e064hrFf08sNznwvx7/fcotliEC/oQkq6bCaZYu2V7+oiq+9VhHT2jh+PCon
	 gJ9R17pfgxvgIGYqcVydO2f4dQaBnfdSxbrexZ9UZY1u1U2/c2BlBqNne0zo4uUS6Wlpl
	 Quw4bkPPb1zigspLEbqu+PXCb1uWuE7Rx4Uc+FUxDsi5WeoJ5yRvFD+3mLj+rellu8Gp3
	 Vt2Qi8dLqbI84TnXYGlvf6KIEANg9p5a/O+7/8oYzTtzW/Fa44SOfTryMxH+V78b7gQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524238;
	bh=IwnkP8UcrBZrqB7RAnB4haFN0CTaUD0pZmFz0EXsDB0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L13S2ACCb5LRUbOqE7EoykMkipJ2qHjXJf68ooq5m+lVR+eDbxaioFTzoeyp9aj/P
	 fLAj5b94wkt4uvgjj74NN3dXNg3+t7rGFn/CjJFA1jJCea4KC297IwDsemF9vit11X
	 vTuuvvXPo53TM9i9SCFCklw3yb3nr9yPy3n9sTSzzQJf43CSXVx0XfE9yARykUeanN
	 ZInSkBpqQ5yuWtRRkI/ZCYt0MN2VQ1SSAr0Y9L9wUiP0WO/itxEuB3RKVYdsvBFMGb
	 mJDb0vBqN0YzKxqNb2LCTENd3WakpRccj8fsJqpV2LpU1qxQ9DO2CWoai43w6o2OSr
	 jelEmObU508Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280BE60C0D;
	Fri,  4 Sep 2026 12:17:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E6D10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0451081174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQneiYlh88EM for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D535A81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524235;
 b=fE1qgSjU0fFGrFSk4CvvQ1Sh0BufOeOKDPX4btmeh7c4fdUfR8v1LC7wXqqrzXbSkqhV
 CPGdTCE91nLheRIwpSl/qgUnjmjVqvWTzvG28E19mZ8vanKpeSnANeIc2UQbAtlMc6ufo
 xfFCrN+mzjC6BQa0uYq3D06YbOy7M2edgahUR/ggQMmO+iljw24Q4MPOEpNZ4viSRdexZ
 y8pa258SxXEMQ1VY2ElVDyyaDvqaiAuTAnhQEby9sGnQGDuDJ90/28l8APalu8m9F66kY
 LtvabQ6bxmuHWpJBc5z/Ig42/lGmeebLHbDpYGEP4y+EjZRHHk4fW4RdiTbr1YWBgPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524235;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Kb0QWJpmrEl2hDDl7QekB99VKbKZBlaNFmVdW/vn5Nk=;
 b=GYKm8tuvwOyW1pkH8Dl498bIj1AFw28SF905i/JejfdhJFp4kI6rVqBuZZT2XK1X2Baq
 BYT9P1TbEafThHpiTeva3zhvhnn8D+cnzRL/KSSc3KKWjshg7Btwrp38xzYZJoJlYrLOz
 vXyUqSulVlkoKjA/kbKUNRRtZLwJQgkMnc9N4N17KBxKrvVHhIFA1UYLZhcVz5L8Qrfxn
 dQIszm+ZzXKV/2eoRIS5PTCmVu6PGry3+YFptoluHvJnpdDoXPPBbaDaeIho9HfbbMGAw
 XexsiRNQ6eFVrvMzeWW60rDyP/nRuKLYHfoTmcfm7n2Qlus7inoGwTH8MJQ7LmueIxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HHxJrj5R; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D535A81172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b96837ca3so6390845e9.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524232; x=1789129032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Kb0QWJpmrEl2hDDl7QekB99VKbKZBlaNFmVdW/vn5Nk=;
 b=IDjpjTtEgi+gCvYcgU6kkPov5FCsg/USnXB4NHxx0pRo9qyUGkcSB57fIlsSmeXSLU
 bR0J5bJqfWzlKZXSAhPCdJ7HbjKeqefY83P4Xk3pkA58Zn7u4ksCn9pGzPV3srJiZ+Ur
 GSb7oIqdaVHlHgf4Djglw4PXkGaRTzjEIEwcDewXcAZrp9BCsgbPaiCYOSWnKq6MYW1W
 0pYK2lSYRhDkeG4DZ6IPT5jfLzoOPhIdFBZjVc7iNMg88w46jIPn6UgHuZ1h1CtRfsLb
 22QAiySEO2bHkgNiDpxilThgT7qmRLnc3WvaZnQaZ/KndnfLjveeuiwzCaJRZKERXwE8
 1+Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuyMB7P7oq+FqRwKfDHlxT0UuxmMQTpdEyhoJq/bEJeq2N2YzABJglXXWG2vP6D2Iu8eJPaxOyOR4=@buildroot.org
X-Gm-Message-State: AFuF++kA6NAq0aTMOMysAvzGjgpZywHvAEcNiikxrZLzSBTQzJU+Kbhv
 r4ygDr4borRA7UxBcoaWt/66tYaaz9UgOmKL9Q9woawX13sd09MlUb/HUmEK14SCcKhmvDOF4b/
 S+7nx
X-Gm-Gg: AYBFou1O9FOYhU353t9cNaPzdAawpPV0G8iW991OmtZ1jpqCcmPxQA5+s5u6BhDP/KS
 2+tNfdfjOAEWsE0yJeHzQwnolbCS3GhmHRmbi2BLPDhZdjroBAVWmG7+xXrfaerEO7CMu8osPVU
 rLVisX2Rgumgsx8AroMD1E1EcK/bm8+RCekVbIoDlsx6Mhiv8S3aVw86mcQFjTCp4s/Dv5MfAMv
 EmaO1SLdRGGvNUpOGd0JZq03fwz7dvHdg5uGWhSg7RB0LVKmBG3N5SF3X2uo1+7LHE6eSF/4JG8
 3AuN/7g0uBiW5jP1uxPuZISgr+VMDAF/OTmIRLF4qQQwq4IZv5ek13mA6S3VrNbOc+KDsRBmNT5
 KQS9M8u/NvD4ZHeUATHcIONZlj+0fjSR0E8a0Vq7FSyT79m5TapK4vjONYli6gj2Kw7apPLZ563
 za/UvVESwfRGjTykZjXTNWe+DzxqT9PLpWeaiyHrCE5Z3cePHSbPLnsQ==
X-Received: by 2002:a05:600c:8b76:b0:49c:f4e1:3135 with SMTP id
 5b1f17b1804b1-49cf8259953mr61400855e9.14.1788524232169; 
 Fri, 04 Sep 2026 05:17:12 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm6183275f8f.35.2026.09.04.05.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:11 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:10 +0200
Message-ID: <20260904121710.403485-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902123817.192274-1-titouan.christophe@mind.be>
References: <20260902123817.192274-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 for 2025.02.x] package/{glibc,
 localedef}: security bump to v2.41-159
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
> This fixes the following known vulnerabilities:
> - CVE-2026-5435
> - CVE-2026-6238
> - CVE-2026-6791
> - CVE-2026-6368
> - CVE-2026-19499
> - CVE-2026-77117
> - CVE-2026-80489
> 
> (alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
> Changes v1-v2:
>     - Also bump version in localedef (forgotten in v1)
> ---
>  package/glibc/glibc.hash       |  2 +-
>  package/glibc/glibc.mk         | 24 +++++++++++++++++++++++-
>  package/localedef/localedef.mk |  2 +-
>  3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 03e8722057..87dd8b67ac 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
> +sha256  e3550f6d074325ad8ee75fff96f16a967055e88f69e1455333ace515b8ac2067  glibc-2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 7c64fea4a2..65a99b4a68 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
> +GLIBC_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -66,6 +66,28 @@ GLIBC_IGNORE_CVES += CVE-2026-5928
>  # Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
>  GLIBC_IGNORE_CVES += CVE-2026-5450
>  
> +# Fixed by glibc-2.41-149-g0e8c56b386d72ba2ddf15784423f2e894c63a241
> +GLIBC_IGNORE_CVES += CVE-2026-5435
> +
> +# Fixed by glibc-2.41-150-g05e1eaea619072a92ff1f5fefe1ac2dd5758829c
> +GLIBC_IGNORE_CVES += CVE-2026-6238
> +
> +# Fixed by glibc-2.41-152-g965b580070b8184b0dd390800d9194291a600e67
> +GLIBC_IGNORE_CVES += CVE-2026-6791
> +
> +# Fixed by glibc-2.41-153-gdfc8ef388ef7856f318ade7dec501f92ce54f9e3
> +GLIBC_IGNORE_CVES += CVE-2026-6368
> +
> +# Fixed by glibc-2.41-156-g5256941bc811248670eda4636dccd0a390d34dec
> +GLIBC_IGNORE_CVES += CVE-2026-19499
> +
> +# Fixed by glibc-2.41-157-ge43e46f94398b3de446fec11da1e7633ea5202ec
> +GLIBC_IGNORE_CVES += CVE-2026-77117
> +
> +# Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
> +GLIBC_IGNORE_CVES += CVE-2026-80489
> +
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 2549aaaf99..9a19ebc4aa 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
> +LOCALEDEF_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
