Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA01C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B2E884198;
	Fri, 12 Jul 2024 19:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dnl5soO1nRE; Fri, 12 Jul 2024 19:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB2B84050
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB2B84050;
	Fri, 12 Jul 2024 19:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2A4D1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF2441A19
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erMDJDnPHG_U for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D91A41986
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D91A41986
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D91A41986
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:42:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so15467635e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813343; x=1721418143;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jp8BOIgOztCYBT6Ak3w4V4h1Ug+VQCahA6QfZINz8e4=;
 b=WanEjFO4ZC4PqLE8uQWcnme13hr4xTQljxDnWR6T4+/uGpTN1KyiJCKVZ+EXTiVd/l
 apFg+Lna716LgeWiNOKyP9DwpIpmbCF9Q9EdPLlskEWLYn7TdRDXGvUkC/qTRHpk7/zM
 tHelB1epjMW4H3JRmsBtDCGjGwfcJGL6Lidm5kUFcvhvFbp9Bghy3it29ZDGwMZrPYiQ
 MJrKm/N8GkqU2E0MAsZYEcNS6XE3D+OkOYbEHXheVyk08TSDK0PEgSuvCN/lsmTRD/03
 CtVhEsvjNFQDb9ngPJAzOyguh6qkldeKSbo86cXBYnSeZFgKHv2wJi/JJNaxueCuLGxw
 ectw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzJbkc5uOGHR6nCt+zdYs7jdxT8P8Xkfc0IsKwzARJ9jcKe2UUfiqtRkhsVl/JczfdatD4jihXOvpkaywMI530qXGU2W5iKg==
X-Gm-Message-State: AOJu0Yz9NpnJXVY7N4cnYHimwwZjG9bq0ufIbuwXq/zJzE55RXyYUrkI
 lEhUBG8DFoT7wdiC5fPJtH9QDSUdOfAn4Dhz/kcAa8Cpeq7gDV1zmtxEFC/hRWI=
X-Google-Smtp-Source: AGHT+IE/aHlum/J2qSisxf3uvBRXbf7eKFN0F7QE6lHf9exkX4wKuVhmipX5XpY8hUFFgFyFdnJA3w==
X-Received: by 2002:adf:a1cf:0:b0:367:8e18:535c with SMTP id
 ffacd0b85a97d-367ceacb57fmr8957800f8f.43.1720813343272; 
 Fri, 12 Jul 2024 12:42:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde84907sm10925452f8f.43.2024.07.12.12.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:42:22 -0700 (PDT)
Message-ID: <6fc86e43-ce9a-463f-85e8-1bc1aab2ee48@mind.be>
Date: Fri, 12 Jul 2024 21:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230808200546.21420-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20230808200546.21420-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720813343; x=1721418143; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jp8BOIgOztCYBT6Ak3w4V4h1Ug+VQCahA6QfZINz8e4=;
 b=JA38hECXZLBRMBAh+GF0h5BEHC/0iby9zCE9v8wvx+oeI3EdjhDp67y4mkyG4I6B3W
 qcYKPCRJT9/rjl9j87jUIJ9qutaEdln46wlnCkSVfDhlallnlkYWhylF6vqVfBDMfYof
 zjq3AsH78KydDf6WiTF9CBVdy3Fk72wtP8f8jh95RBPHcwnX7hXlkTB0Bo2sNsX+V2ZE
 ecdC5da9CQnL9JpPf3OeolHlyMsUQUlEIRRAzm2x5ZsT5Up9+3LNDylFzcEsKHHGbNh1
 /r13LqK/aplXzglVeU8tl2bg5vykf2X5gzRP9S1Lx0SHyBZUT+WP3WvybqNuUOIkTxwd
 SG2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JA38hECX
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: fix RISC-V hang when
 BR2_SHARED_LIBS=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/08/2023 22:05, Julien Olivain wrote:
> When BR2_SHARED_LIBS=y (shared libraries only) and BR2_PIC_PIE=y
> (Build code with PIC/PIE), the toolchain-wrapper will try to enable
> position-independent code/executables. See [1]. This configuration
> is a common default.
> 
> Xvisor was likely tested only with RISC-V gcc from [2], which will
> not enable PIE by default. Since Xvisor is a Type 1 hypervisor, it
> needs the same kind of special treatment as U-Boot or Kernel.
> 
> This commit adds a patch to explicitly force static linking and
> disable PIE for RISC-V architecture.
> 
> [1] https://git.buildroot.org/buildroot/tree/toolchain/toolchain-wrapper.c?h=2023.05.1#n392
> [2] https://github.com/riscv-collab/riscv-gnu-toolchain
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Note: I have a runtime test available for riscv64 xvisor, but Docker
> image does not contain qemu-system-riscv64 yet. See:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230808195753.19748-1-ju.o@free.fr/
> ---
>   ...-pie-code-generation-and-static-link.patch | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch
> 
> diff --git a/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch b/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch
> new file mode 100644
> index 0000000000..7c9ae92509
> --- /dev/null
> +++ b/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch
> @@ -0,0 +1,46 @@
> +From 8491908238c4b3397571e9cff55765d59da03a45 Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Wed, 2 Aug 2023 23:57:17 +0200
> +Subject: [PATCH] RISC-V: Force no-pie code generation and static link
> +
> +Some toolchains are now enabling PIE for security reasons by default.
> +When XVisor is built with such a RISC-V toolchain, it is crashing
> +just after OpenSBI, in early Xvisor startup (before any message is
> +printed on the console).
> +
> +Hangs looks like those described in:
> +
> +https://github.com/xvisor/xvisor/issues/144
> +https://github.com/xvisor/xvisor/issues/159
> +
> +Forcing -fno-pie code generation and -static link will explicitly disable
> +PIE with those toolchains, hence fixing those issues.
> +
> +This issue was observed while using a riscv64 gcc toolchain from:
> +https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2022.08-1.tar.bz2
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +Upstream: Proposed: https://github.com/xvisor/xvisor/pull/170
> +---
> + arch/riscv/cpu/generic/objects.mk | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/arch/riscv/cpu/generic/objects.mk b/arch/riscv/cpu/generic/objects.mk
> +index 230da2a1..576603f6 100644
> +--- a/arch/riscv/cpu/generic/objects.mk
> ++++ b/arch/riscv/cpu/generic/objects.mk
> +@@ -67,6 +67,11 @@ cpu-cflags += -fno-strict-aliasing -O2
> + cpu-asflags += $(arch-cflags-y) -march=$(march-nonld-isa-y)
> + cpu-ldflags += $(arch-ldflags-y) -march=$(march-ld-isa-y)
> +
> ++cpu-cflags += -fno-pie
> ++cpu-asflags += -fno-pie
> ++cpu-ldflags += -static
> ++cpu-mergeflags += -static
> ++
> + cpu-objs-y+= cpu_entry.o
> + cpu-objs-y+= cpu_proc.o
> + cpu-objs-y+= cpu_tlb.o
> +--
> +2.41.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
