Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9155C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73AB840662;
	Sun, 15 Jun 2025 10:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT_eR0Ls8OvR; Sun, 15 Jun 2025 10:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C1E405DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C1E405DF;
	Sun, 15 Jun 2025 10:00:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4607A1A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEE6607D8
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1vprl4XI4Gh for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.53;
 helo=mail-ed1-f53.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D04260740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D04260740
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D04260740
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:00:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-607c5715ef2so5948245a12.0
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 03:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749981620; x=1750586420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1OJ96WiQLgPE8DV/ORH7YKiM8ZJb9OH+mE+dNvtJtk=;
 b=S/I9+0TdTGLzVS185rK89qneZUyGoTJXL4KuqZqIqkjoQ2Xwix6kEDYPEBl4lWz/bc
 tY7cUmevQLqX3eYiZhBUBFEpDM6v6awfdUNMSG8bBt1S9jmVtE5gSbWW/ZucCClvShjt
 E97je2wxeoRE6L6+rRUK284H9dlTu8rEWol35BlRtvpxE9L8xsyC1VdJXFr617Vq+vRp
 NoBbv0wv3PpO55JySIYyxTvIRGcGEnVWfKgkr104wbG8gE+77ZIoxkqRzd5Wa4wpGrqB
 mr6iAqawZp3tUKx8QHevgNO2NR4t/4oUiegZch8h06ZDCKtx7DZ2aryH0j6peWBgEe7I
 8edg==
X-Gm-Message-State: AOJu0YycHh1irH5lh+NBZukqx7nLow32+F5O/gUJ9n9UBl8LxaEqzz0t
 ooLVBFh+z2d2a4kX2XMrDF222BpgIKyhNZHDqQhigXWaCGsBBtA/9gbN
X-Gm-Gg: ASbGncssJhw1L95+I5icFWol/toxLJe9Z8WI5ZeUD5krLoX7+lRSFKSdhdiNCHpWSt1
 n9dEJsnnmlChynIrJchoW0sg75dmRwNgMXnixRdP/GdfSqJ+HK7gg+z7pTHFzONRCyxAwcaOtER
 iILSz8pkpryHyAcp/6iK0cO2y3B7OW4NZDc8vtvJiZjQGbwwVoubW/epAp4k7r9HroEEt49hiM+
 6wa74QWy+FachXm+o/1Y6G+xtwQLimadcRUhGSIZiI5sUeuVEIsjK9k9JR3G0sM3kPbwdkt1hxM
 tY9mtNI8cpoU0PkBVMVlPWnFTFhXGrAik8G7gkgG92RmmdDkBTni6SDlgXYHS07gFLquUPpz19k
 SaCLdwTdmWx43OxjD
X-Google-Smtp-Source: AGHT+IEhBX/T0CxIQkioj91YFbdAV97Ov2Jt72wASfu/x8UbaHge9kW5PC8zfyjhmk7hpZSRRZkf4A==
X-Received: by 2002:a05:6402:2792:b0:5fd:1c90:e5cd with SMTP id
 4fb4d7f45d1cf-608d0948fc9mr4740417a12.20.1749981619707; 
 Sun, 15 Jun 2025 03:00:19 -0700 (PDT)
Received: from tpx1 (ltea-047-064-114-027.pools.arcor-ip.net. [47.64.114.27])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b48f2f8fsm4180115a12.27.2025.06.15.03.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 03:00:19 -0700 (PDT)
Date: Sun, 15 Jun 2025 12:00:17 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: buildroot@buildroot.org, Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <20250615120017.5abb6bc6@tpx1>
In-Reply-To: <20250612003317.324785-1-jesse@rivosinc.com>
References: <20250612003317.324785-1-jesse@rivosinc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: Add RISC-V,
 bump to version 2025-06-05
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 11 Jun 2025 17:33:17 -0700
schrieb Jesse Taube <jesse@rivosinc.com>:

> A new kvm-unit-tests version has recently been tagged, so let's
> update to that version.
> This version also add suport for RISC-V, add RISC-V to Config.in
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  package/kvm-unit-tests/Config.in           | 1 +
>  package/kvm-unit-tests/kvm-unit-tests.hash | 2 +-
>  package/kvm-unit-tests/kvm-unit-tests.mk   | 6 +++++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index 02ea8dd58c..0d66a08dd7 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  		BR2_cortex_a55 || BR2_cortex_a75 || \
>  		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
>  		BR2_cortex_a76_a55)
> +	default y if BR2_riscv
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
>  	default y if BR2_s390x
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
> index d4db9f2b75..ad0922df59 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.hash
> +++ b/package/kvm-unit-tests/kvm-unit-tests.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  8636994e10240705f10a9150ef688ae6832d0ea0dcc8860c826c645ecfc1169f  kvm-unit-tests-v2024-01-08.tar.bz2
> +sha256  60015b023f34261c134d714f4670926ac81483e286a16475eb4a5cedab00eefa  kvm-unit-tests-v2025-06-05.tar.bz2
>  sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index 73d20d6b2e..c40324a9f3 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KVM_UNIT_TESTS_VERSION = 2024-01-08
> +KVM_UNIT_TESTS_VERSION = 2025-06-05
>  KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
>  KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
>  KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
> @@ -18,6 +18,10 @@ else ifeq ($(BR2_i386),y)
>  KVM_UNIT_TESTS_ARCH = i386
>  else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
>  KVM_UNIT_TESTS_ARCH = ppc64
> +else ifeq ($(BR2_RISCV_64),y)
> +KVM_UNIT_TESTS_ARCH = riscv64
> +else ifeq ($(BR2_RISCV_32),y)
> +KVM_UNIT_TESTS_ARCH = riscv32
>  else ifeq ($(BR2_s390x),y)
>  KVM_UNIT_TESTS_ARCH = s390x
>  else ifeq ($(BR2_x86_64),y)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
