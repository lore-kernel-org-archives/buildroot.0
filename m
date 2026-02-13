Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EEFEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3831A849D0;
	Fri, 13 Feb 2026 19:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cZnDEvtmrZG; Fri, 13 Feb 2026 19:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886A6849CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011628;
	bh=Nq0Nd8aMXcQZdHSGbqCkj3B+jt1nkM5FfJzuKD9rFak=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M4rDI9xkJL1nDSoc4ffHQr/wo2jp4O/3rbSfA7SBWqjyTl/RH9i8KyajRWIRStFPH
	 hAP0HzPuo2/4115res2lkzyXJEk1VvxaXyAqfUCI7jYsp9+NCcxxMqaf6WCncGzs9Y
	 6mE853rHrCrJKs2edl8gm6syCRnkS7LE3/bkdmXzvJOmfDAtTdXUKiSqWDKQ+2EmBm
	 CGY2jZ+RATnZpDxv0rL/BLmyjnPbpFBykC3uxbZg86cmcTw9taBKBT+YfZoY8W36wY
	 W66gEiS5O5QevvyiyB6wm+j61ndiAY4BIB0Ajpno7ReKlCK8nFyPhBSi6ciXsXKMau
	 gX+/9JvDIZnfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886A6849CC;
	Fri, 13 Feb 2026 19:40:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E3B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67DF3412D6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGIMiSlCA4ST for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30F7C4035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F7C4035F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30F7C4035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso9830125e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011497; x=1771616297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHGd0cPzLO6TcV4+4l40T1hb2u2eX8R13Nhd6nj+hic=;
 b=VJWmZvVq+IBqoVszk+KEzGmiihJiHHgpZCTrNkucN+49vgxHvq/mhO76VmDHI7NxlG
 F/g58zt17I6ETW73TTlaZWYcApXYO3KXIbZCjj9RwjrBibAmJa5AKuvsGWddGn62Zk+d
 EVmlmiDoUGpjHpxx7nqlwsV4EF2pYfnyn9314QrnKNUyWwCPWqTsywDvFsudWXEhz5Ow
 jAR8hJcNC5ewYtOExI5NWPFCRnC6Tz7QaQy+FFTJQOursk2ZTF0GIcpzGtZUgP8OiL2S
 MXLAPzMYEYekGggOBRnKo79faUimZC9wul8fkkExyYEv5PM5dkyO2mYKFBInVhbk3muM
 CTUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcVQBWgfR7MoR1Vc4BqCeqeYy35+2Lar3DAPxo3g81ujSMzEU/a66Pb0MZCstGlSF+NH92wOHx3Oo=@buildroot.org
X-Gm-Message-State: AOJu0YyqVNIhifqXnfX7RmfFn+/tX2mn0yA1ZcybCwJMtGcVsuNby0Ab
 8ayqQwUUJu00HyWmzv8mEWbX2VUxdVCFiDJOYoiAQj6uq4iq9taY2G+4Kyu8YYGSmdM=
X-Gm-Gg: AZuq6aJCTMjApttNzX5zKvtBYOU46NWsJS7ZT/RjS8SLcJKoWxDqep4OE+UTdiSUAls
 WCoqWkvmhStoXFbAf23rUk/dMTC+ZliJwtyf5rQOC2VObBmhgFOl8niYeK30rVOke9ZtOFGt1fD
 qb0anvVo1IfMr05/baFBa42ECkVxG1fmyHShAMrrXHsuhzf3lCpbtD9CZa02Dm9USdx5xgevQmZ
 xlO2QyMsosOOSUKo/jEymh+yLUpizS/A9U1olwpdHg+NNNxmmSmeBZrfR1DczTxtkKNgOKF7l5q
 Yxv+UFMCBFwlmF9D1D3deHz9Bu3cs8yoHwmATy8F+gnRgvS74Iwb2JZlEeFIE5G19UgtgG+8r9a
 R4JimXZ0whLrHRTuBUp7+ns34h1SADxRUCv5vTVVKskHiuXoH+zXCnGwmPzqAfjy7//tEuwbop+
 G/9FUXWizbAGohoPHTyuERMCQyBA==
X-Received: by 2002:a05:600c:8b26:b0:480:6ab1:ed0d with SMTP id
 5b1f17b1804b1-48373a1acb0mr48124065e9.9.1771011497135; 
 Fri, 13 Feb 2026 11:38:17 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad015bsm7480259f8f.38.2026.02.13.11.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:16 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 13 Feb 2026 20:38:16 +0100
Message-ID: <20260213193816.41931-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-6-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-6-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011497; x=1771616297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHGd0cPzLO6TcV4+4l40T1hb2u2eX8R13Nhd6nj+hic=;
 b=WdVKyQCoyXUzN4+0zcMGJLoyePFDa8iXi1KG+apLVpaKqlygeHkgl6CBupgaFbeZJc
 JQ3zmhca6oEm3tAXyTFrb47e+kUKH+qgnC/Mw2WPBPXl52zf/NvBJcvMXEX21Vl3Dp96
 KACvoMzdvxHe/yJfaIpXThkJ+223GcSvlA2YRbb4jcFEQZBu/hTBOoZpvtC+7R+Penn/
 krZmjIQfO+I8p5gjvNQdERQwYEheaT8LTb+u3W7VchVvB8Ct+/R8HBKfvGoJVz0F9N6v
 LEoRwR4YkKE0zKLd4CtsfM9Rpic9ym7/80nprc/1k+PQHBKtxbUhkklAG7LfztV65Ka2
 8TKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WdVKyQCo
Subject: Re: [Buildroot] [PATCH 5/5] support/config-fragments/autobuild: add
 a really old toolchain
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
> Testing with a really old toolchain is helpful to catch issues related
> to kernel headers version issues, gcc version issues, etc. We chose a
> glibc toolchain though as old musl or uClibc-ng versions tend to lack
> a number of features that are needed by modern software.
> 
> This toolchain is placed near the top of toolchain-configs.csv, so
> that it is used as part of the "base" set of toolchain that test-pkg
> uses, even without the -a option.
> 
> test-pkg takes the 6 first toolchains of this CSV file for its base
> test, and actually the comment in toolchain-configs.csv was wrong
> since commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511, which removed a
> toolchain from the base set, but not realizing that test-pkg would
> anyway continue to test the first 6 toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../autobuild/bootlin-aarch64-glibc-old.config           | 9 +++++++++
>  support/config-fragments/autobuild/toolchain-configs.csv | 3 +++
>  2 files changed, 12 insertions(+)
>  create mode 100644 support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> 
> diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> new file mode 100644
> index 0000000000..1b811f267a
> --- /dev/null
> +++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> @@ -0,0 +1,9 @@
> +BR2_aarch64=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 3ea05775f8..7103d903c9 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -18,6 +18,9 @@ support/config-fragments/autobuild/bootlin-x86-64-musl.config,x86_64
>  # Test a MMU toolchain without dynamic library support
>  support/config-fragments/autobuild/br-arm-full-static.config,x86_64
>  
> +# Test a really old toolchain (gcc 6.x, headers 4.9)
> +support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config,x86_64
> +
>  # Toolchains used by test-pkg only when the '-a' option is passed:
>  support/config-fragments/autobuild/arm-aarch64.config,x86_64
>  support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
