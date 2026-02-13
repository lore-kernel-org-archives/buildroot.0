Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E989EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC1C61440;
	Fri, 13 Feb 2026 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKFNhKpFOWfW; Fri, 13 Feb 2026 19:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4FCB6145A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011587;
	bh=D0nFq+QcEFDKwKwiYsi36huT8RG3snWaUi7lf1UebsY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TdQVbHI2UtufVX5m/SySoceOOmOvvelJKg7Gl+mCAWAX+RFlACc5HlfATt+0FHbw/
	 DjCQDGu5z1VxoqrJtVPH0fWLiMhf5LX76KkBh8kuZ3xMEm95h6TlRxph62csz06O8n
	 u6hDvMz+J0NqlxWV8xzZLfXl257JsHV81Tzsc+Wbfw+THn3Kvt0r8NSp4foHtc9Rcp
	 gefJe3dPdHTq72uwv2fe9oMluHA8e8eP4pZ5pj7D1A2E/Q+60mBYOfuaeIVOQ/tMcu
	 /i2YuNBPgO3UwIhTRfzusKSQGiMy++FR0KP8Kg3H9V6jEq4KgUMdKdOkgAIz5svYkt
	 7dBeqS+ufyyBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FCB6145A;
	Fri, 13 Feb 2026 19:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FFB6EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8542A4203C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYAjSZ5d7iRD for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 397F94202A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 397F94202A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 397F94202A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so5485115e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011499; x=1771616299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9F0kVXFjzgBwCVHwkf8gUaR6eXzxNqPbOGgXmtMgmZg=;
 b=qSYiCmxmde2Zll/UiBVgDlQ5vUs6TIFqycsILgXr2xQCNKppz41hsrspq+pG9z5H0z
 00W1VirA6TWRcrI80DxStJUy36tVi1gKXTKaiDqmQGi6K2LD1aDAd0RKAkmL5PKN6qPy
 cXREtegjMdbMkVEZmTc/eOLcYmk5Z6vDTRgRYay/cVDJt731iDJO7CQbXP56rgBWwOBX
 oPt2oDI1gqxuYz/4wGz+zjLrf/k9aZJ7wBILufleY6m7SHJSZ3V7x5+lh3KV6+TrOz3Z
 o1OKAdhqd8frribA0rQ+a2c6Oltr4819S0MvWnrdnqXyiHWgFDq6Me1bQD70/sFMTUZN
 RgeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyO2XlqukfHu8nzKChemhqTq7cv27VbWO4IvkQRZiLbpOXoN08my+Yum10wHeclhyKO18pAB3DMHM=@buildroot.org
X-Gm-Message-State: AOJu0YyVB2KArLyqeovlehHFns0EEPhYyOBw6dg6Swtg6cIbLY8LB97V
 AhHF2omqcJBn4l+3kq6+qgzViZbyIebUHPuRR+pvcoymnVeCBn7w0Vc9raTwMpsDrnI=
X-Gm-Gg: AZuq6aJZpqiIcWWWLMT2otNbM+fSgedrJQKKTBqSzczxiIN4jk9oL+GfVSf2kiD0Fob
 XmNT/1IKdsXBhBH7vIjoPrLhqPf3S3m9IehiS+lbdO/jRs43uHebWKd9O18Lu1gLOp7NVonDtW4
 HMY/a1n/IKm8tf9UZuAeVXtG7OEp5kg9K9XxkXH6CtTYaPh93ECS3etzycXexrNBwLOwR7Y3kr1
 dRiRNvtfPpRD37xwOo/dF2BE/PR9WFiw3ESxYRCKo7stB/BDYWwPXUMJx6EymmKfol8TAzRbjQn
 qvut/MYaFAAd+O4vSzYJ9yHijV6PMTR0rcu1OFNamKm3CmGDNdDXHO4Jt3twJingtnVOVWsBNfr
 w8bOEzWPwaztGzo2DAhmKD8Nk7aQmzEQdGHTQIIUzvgvGNWqdTrOX1MuMZ6BPY3wbzhULmKaUkn
 B3mN/t81M8AdWO8h0=
X-Received: by 2002:a05:600c:37cc:b0:483:702f:4633 with SMTP id
 5b1f17b1804b1-48379b8c016mr6849865e9.4.1771011499200; 
 Fri, 13 Feb 2026 11:38:19 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a4b63dsm23272905e9.32.2026.02.13.11.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:18 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 13 Feb 2026 20:38:18 +0100
Message-ID: <20260213193818.42030-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-4-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011499; x=1771616299; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9F0kVXFjzgBwCVHwkf8gUaR6eXzxNqPbOGgXmtMgmZg=;
 b=JJn2SjddJLkBuqFcCLEwrhiyy8uge2Z7KQ4ZW5LUsaDpKIBpETJ5mKjKnEWJ/558Rk
 amrE6C/N+yGSaVcofgS1WLuiCzf2whnExYOR3fnLXrIJSF+BMFCY7kSAA7YZ9ul7bBEU
 GNJm2exBBIlrIbsmAXQ/F3tlVEpe+43VkpqHFrouaRzwO66BG4djKGAeYSi4GB0MgRUU
 A9FwdZP8KrkpETr3k87w/vC6+yzBgleUts/p0EIKwburEHh3zI/F7SlqswpI2mq+U1WU
 GzNp3W8SYKKBbsOYI15ame9IKC52uP2gvJvdnZBV5sdQ2gPwPfC0ZbBqK02Xc339oFW9
 vCBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JJn2Sjdd
Subject: Re: [Buildroot] [PATCH 3/5] support/config-fragments/autobuild:
 drop somewhat duplicate toolchain configs
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
> - br-i386-pentium4-full.config as an x86 32-bit toolchain test is
>   already reasonably covered by bootlin-x86-i686-musl.config
> 
> - br-microblazeel-full-internal.config as a Microblaze toolchain test is
>   already reasonably covered by bootlin-microblazeel-uclibc.config
> 
> - br-powerpc-internal-full.config and br-powerpc-603e-basic-cpp.config
>   as PowerPC 32-bit toolchain tests are already reasonably covered by
>   bootlin-powerpc-e500mc-uclibc.config
> 
> - br-powerpc64-power7-glibc.config as a PowerPC 64-bit toolchain test
>   is already reasonably covered by
>   bootlin-powerpc64le-power8-glibc.config
> 
> - br-riscv64-full-internal.config as a RISC-V 64-bit toolchain test is
>   already reasonably covered by bootlin-riscv64-glibc.config and
>   bootlin-riscv64-musl.config
> 
> - br-s390x-z13-internal-glibc.config as a s390 toolchain test is
>   already reasonably covered by bootlin-s390x-z13-glibc.config
> 
> - br-xtensa-full-internal.config as an Xtensa toolchain test is
>   already reasonably covered by bootlin-xtensa-uclibc.config
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../autobuild/br-i386-pentium4-full.config             | 10 ----------
>  .../autobuild/br-microblazeel-full-internal.config     |  1 -
>  .../autobuild/br-powerpc-603e-basic-cpp.config         | 10 ----------
>  .../autobuild/br-powerpc-internal-full.config          |  4 ----
>  .../autobuild/br-powerpc64-power7-glibc.config         |  9 ---------
>  .../autobuild/br-riscv64-full-internal.config          |  4 ----
>  .../autobuild/br-s390x-z13-internal-glibc.config       |  4 ----
>  .../autobuild/br-xtensa-full-internal.config           |  3 ---
>  .../config-fragments/autobuild/toolchain-configs.csv   |  8 --------
>  9 files changed, 53 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/br-i386-pentium4-full.config
>  delete mode 100644 support/config-fragments/autobuild/br-microblazeel-full-internal.config
>  delete mode 100644 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
>  delete mode 100644 support/config-fragments/autobuild/br-powerpc-internal-full.config
>  delete mode 100644 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
>  delete mode 100644 support/config-fragments/autobuild/br-riscv64-full-internal.config
>  delete mode 100644 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
>  delete mode 100644 support/config-fragments/autobuild/br-xtensa-full-internal.config
> 
> diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
> deleted file mode 100644
> index c680699288..0000000000
> --- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -BR2_x86_pentium4=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2020.11.2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-microblazeel-full-internal.config b/support/config-fragments/autobuild/br-microblazeel-full-internal.config
> deleted file mode 100644
> index 0d2d7df8f1..0000000000
> --- a/support/config-fragments/autobuild/br-microblazeel-full-internal.config
> +++ /dev/null
> @@ -1 +0,0 @@
> -BR2_microblazeel=y
> diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
> deleted file mode 100644
> index 045428c1de..0000000000
> --- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -BR2_powerpc=y
> -BR2_powerpc_603e=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2020.11.2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc-internal-full.config b/support/config-fragments/autobuild/br-powerpc-internal-full.config
> deleted file mode 100644
> index 61b3e7a966..0000000000
> --- a/support/config-fragments/autobuild/br-powerpc-internal-full.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_powerpc=y
> -BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> -BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
> deleted file mode 100644
> index a80047ea66..0000000000
> --- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -BR2_powerpc64=y
> -BR2_powerpc_power7=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2020.11.2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-riscv64-full-internal.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
> deleted file mode 100644
> index 5c1dfc47e3..0000000000
> --- a/support/config-fragments/autobuild/br-riscv64-full-internal.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_riscv=y
> -BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> -BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config b/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
> deleted file mode 100644
> index 56af5fb1ba..0000000000
> --- a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_s390x=y
> -BR2_s390x_z13=y
> -BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/br-xtensa-full-internal.config b/support/config-fragments/autobuild/br-xtensa-full-internal.config
> deleted file mode 100644
> index 89e81d4c45..0000000000
> --- a/support/config-fragments/autobuild/br-xtensa-full-internal.config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -BR2_xtensa=y
> -BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> -BR2_TOOLCHAIN_BUILDROOT_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 5c9fe660d3..ff8927eb37 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -45,15 +45,7 @@ support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
>  support/config-fragments/autobuild/br-arm-basic.config,x86_64
>  support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
>  support/config-fragments/autobuild/br-arm-internal-glibc.config,any
> -support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
>  support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
>  support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
> -support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
>  support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
>  support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
> -support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
> -support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
> -support/config-fragments/autobuild/br-powerpc-internal-full.config,any
> -support/config-fragments/autobuild/br-riscv64-full-internal.config,any
> -support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
> -support/config-fragments/autobuild/br-xtensa-full-internal.config,any
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
