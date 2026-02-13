Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A6FEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1031182813;
	Fri, 13 Feb 2026 19:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBK-PXqUIiej; Fri, 13 Feb 2026 19:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE0B848A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011592;
	bh=EqyDqxuswcHXibWY8oZKElpL/trx+hVDu93YeDOsSw0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qEd31ocYy8E6fv2yfUCG/3lg2L8nL+HWZZjKgQ8r1k2tNujGk5I06DH2VQOrMKI+e
	 KrFZW8t9FUIz4KEkftLVuZ+CTff8VAbHDUcsr3VTIvbXr2Aqpf259VCKEevisSHCUo
	 ME2SXQys6eNGGm93vsXwGBKlAbn+IGPTvsJDhmFoV7JV3eoNhFrpDa/0Mjv3duUN3t
	 B3CWu+HNVxCTOpt412yxmfDuvDExKeU9rgm5Fg9RYPXrQHGoC6Q62a81YMs4UOEXuH
	 GxQZdTfaiddaxWMnRP5Z20IZdQKCU3Uacy8erEjqQ5SnKRz3M3CqCIDUwt16Djo9rV
	 GzKmiEJeVPEaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE0B848A6;
	Fri, 13 Feb 2026 19:39:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A81EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE931847C3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTriaLCi1nZX for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99BF2847B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99BF2847B7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99BF2847B7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so2259171f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011502; x=1771616302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GmHuT9Mz1gqP3kbGjifJ5rfIKZr9ivG8DfBytJEVDrg=;
 b=CcOvlwS8MxLS5V88yzs1O3eelHtzbS1Kl0K2LYx1R7DJSQTYg6L3rbptHlDJH+Mvdf
 0MA/S0qVjsuxn644k7IjRGFduUJRZhJTOsM5m7amY2u74krsXBq4+cNv4P0g9yvQ+9ZK
 o7sJeKHYnRwOAVfJ1rdSA4edqeDQooJQl51HTdP+ioGSjeyspO0zZnWcrGb1XRj23EXI
 Mzyhma6WNxp+0aADN2THDPIMWdvJINzT2wMX5a1fWPJdYwA/y+7pFWepzmmvXnxOvJ5l
 ZTOg2OOHMIsKPBCA707iYks5U+pXylpy1aDsmH0/4fgZuqaX8ri/oCs/EweEaNJ8iiNh
 1T8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs9uYz6lySpFIhS/v4Q92Qpb4mRRXT8NoWmqeA13HoEusg5tOLD73fDAOHo+o3F9E95mA4c7OVzvE=@buildroot.org
X-Gm-Message-State: AOJu0YxU6dqabynFHTujS3FEZ3lZI0QX5sZM2Uka/5PLgfw+puotpCC4
 vqBYD3G72AEYGrhuCYLGOoxxyN7jA0/odS5ly9I0G0m4igC2K0q5inaUvOJKvNUBEHM=
X-Gm-Gg: AZuq6aKnKS0gvC8S/b15wYD8yMozbz0RXESdUqSgbueXV54Ne7NA9OyTi5TsCslqnQa
 cdbd28X43M7xYRalEBXACA+3HSmHMD+lLlIcH2cmARgawQy+UmXBXbWEdUYXSfkdYWtVnoMOtLc
 EWir79GFsQC5cKVmPkng4K9HX4fs2f7Yeb7fBGvBEVtXeYqD83kvbl7mEuldTyzGEeO4vHX85K2
 1qnbqzI4oa6JLNW321lIvNDWE9LgqqqJ1PeyMcjOc5epaSYTb71/c0VhxyghkhGtXcnYSJnRVej
 kzRGrB1IvbU+DxqS4QEPI3VtF9rKZeJO1Vex/hMPTVX2UiiRMJs/6bYYcfJ8HOl1QYIqcXvIIK0
 pvBblMfGv13q0dgfWfB8CrZvQlZmKiAnjYYI8vVwNlSoRbEOut3G4jORPj4iuQgHvgBebVRfpox
 n0b40PuzEgvBPyMms=
X-Received: by 2002:a05:6000:2681:b0:436:e875:7911 with SMTP id
 ffacd0b85a97d-4379d5daa51mr2327700f8f.4.1771011501658; 
 Fri, 13 Feb 2026 11:38:21 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad112bsm7718697f8f.36.2026.02.13.11.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:21 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 13 Feb 2026 20:38:20 +0100
Message-ID: <20260213193820.42128-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-5-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-5-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011502; x=1771616302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmHuT9Mz1gqP3kbGjifJ5rfIKZr9ivG8DfBytJEVDrg=;
 b=dJugHMyUAivCjzrv+xk5z30+QfTUioCiG43boPzvZh/BTyfwCHzqCAXI51Uqr8kpMh
 idhy2vc9TEnx38p+ymGUG3LBo6sqHfzuwQuDWCurXHAn6c3ZQLPNi0mHu2tilQjy/S1M
 KxdvK7xr9Ifk93y4mdVfOvwU6yVLCgT47b4v6VE6C1axP1Apgmwzs5h1zKzZjzhuWiRZ
 3qsIhxBfclxsftVkfrUJgtLj1/X3ahhJDjSY3aNgo3SRSqOfXI9y8XbK6jU2e8XWk6qm
 2DUIDl2VhinWF44X7F8wohIOW55p+7ODBQr+h3hgfVRARFhsUNJBKid2p2aIEMNR6NZp
 +aXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dJugHMyU
Subject: Re: [Buildroot] [PATCH 4/5] support/config-fragments/autobuild:
 replace MIPS64 toolchains
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
> The prebuilt MIPS64 toolchains are very old, causing build issues (for
> example recently with the systemd v258 update). Replace them both a
> single toolchain configuration that uses one of the mips64el Bootlin
> toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../autobuild/bootlin-mips64el-glibc.config          |  4 ++++
>  .../autobuild/br-mips64-n64-full.config              | 10 ----------
>  .../autobuild/br-mips64r6-el-hf-glibc.config         | 12 ------------
>  .../config-fragments/autobuild/toolchain-configs.csv |  3 +--
>  4 files changed, 5 insertions(+), 24 deletions(-)
>  create mode 100644 support/config-fragments/autobuild/bootlin-mips64el-glibc.config
>  delete mode 100644 support/config-fragments/autobuild/br-mips64-n64-full.config
>  delete mode 100644 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
> 
> diff --git a/support/config-fragments/autobuild/bootlin-mips64el-glibc.config b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
> new file mode 100644
> index 0000000000..d8bebd5d70
> --- /dev/null
> +++ b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
> @@ -0,0 +1,4 @@
> +BR2_mips64el=y
> +# BR2_MIPS_SOFT_FLOAT is not set
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
> diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
> deleted file mode 100644
> index b89b74e76f..0000000000
> --- a/support/config-fragments/autobuild/br-mips64-n64-full.config
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -BR2_mips64el=y
> -BR2_MIPS_NABI64=y
> -# BR2_MIPS_SOFT_FLOAT is not set
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2020.11.2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
> deleted file mode 100644
> index edf04c356f..0000000000
> --- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -BR2_mips64el=y
> -BR2_mips_64r6=y
> -BR2_MIPS_NABI64=y
> -# BR2_MIPS_SOFT_FLOAT is not set
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2020.11.2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index ff8927eb37..3ea05775f8 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -28,6 +28,7 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
> +support/config-fragments/autobuild/bootlin-mips64el-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
> @@ -47,5 +48,3 @@ support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
>  support/config-fragments/autobuild/br-arm-internal-glibc.config,any
>  support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
>  support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
> -support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
> -support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
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
