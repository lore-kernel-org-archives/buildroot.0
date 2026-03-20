Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB5510987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D1C41E77;
	Fri, 20 Mar 2026 15:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5QR5TZ7Npzp; Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7023341E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022118;
	bh=oTI/bhpYC5pGf1pQe5CR8r/jDi49MkVWXVycA5O/IZI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AQEY7rPa9igJgA9ytnHUlja28t98nz/DY0Srl4LMs26E0ZilGwjko8tIvwJ4pVBQf
	 b9BvSejptNbEBMyP2WYMwoUdrK3xHrVcXWPYb2a7YOH5AEaV+7FEXYBWuIrzWla5JA
	 MKXyyDfH2bLgJquN56PakiSK5BmtY//MnWLl44yV89paC77s2sGp0Do1gKY92MmW87
	 XGLn/C6vet0SOdbRmyugSELG6gD77U7LmlA2RU4viPThQJRqC8tzCWec6dgI3uldZb
	 80xwMa1DP+0McJYNu3r8JBwWBHPoZ9xGlvi0jGRUMbynk6sqT8xRE3PyWJLT+rh66N
	 84TnZT103nptw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7023341E81;
	Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC5501B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC46F40336
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RzX2I0WagHr for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6BB8403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6BB8403A1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6BB8403A1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so6701115e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022109; x=1774626909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9cyPVNSCCgQkT2Fwpl6ESatr0LD8GoHYmErkSsqD90=;
 b=ohEtdJuQONXYs2bZHz9DCs2hmjNaMMoHSh72bFoJoMdsPgSCQUKjlKTATfsg/ycKNI
 R1Pb7jPdE5PAPLj1FhKY8DBjGwdRVsCA2Js3WhS39CyBbKZGFdXnJDrV8uIDXuMZdgXi
 7H+viEI1Nzp9Zs0a1yoHuwMsA0snHTKXI513Qg9O1JMAvd93fvGiDnyKYeHTDgJ7ehA4
 hXCqtV+jJeP5SAWmKdeFWG+NcjvURWz4RWwHR2noyN2RamY/2zDlU6zzWBEx5oYT2H0e
 h1OwBcctMERH5vruj2u965Gt5q104lvnbLwkBR7Ew7eiZIOrzC+qquDR4M2nju+BUjBs
 /i7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5R5vyDBUBTLXiSGQla59bQHSNFuceeZMvxFFWoB/esbxD2bUcxZvUVPmUmj7iVR2WvL+Lbo/Xco=@buildroot.org
X-Gm-Message-State: AOJu0Yy3o/g587qN4rbqhQe5NeLKTGdidaUQAdh42sBDk8XiFiboJWA6
 ib5DAqZbVTH+J7ofKyJIam1QrN1GN7fmerg1EKpSXOh94KWO6NegzqVe1TWTxPKpx/HCiaOGSw4
 QdTxOnWI=
X-Gm-Gg: ATEYQzxkrePkN1K2JvByC52y2JJ5Z/tt7oMhRju0/pKKuk7dhLQzzi/XZgGP4ByqcCf
 51XU5YSZAjS9leBaharwD8cpiGTXYB9cDhbWEOpZh40/SNswiu2gG7rtcJl5Zk8VG7fd+a9nLYi
 DSEQwHKCCWHkeRFEVFHcF07NczNWfKcFc7HAsNBlez/m7kGnM4Bg5WGHMNaU+UNhTtbw2YoyFQd
 EXWhmY4PS3MximtCu2D6RCIq7DSMT4hyGFXw1YTm85JzBYxirTzvrdDZmvEGMyoHTVAS9vr/lXz
 Nn9A7sZBrIfXo4ebg5HG5JU6gcaAJPRSmzO97RKjbhqaZ6Aperl6SKfVHN30HO0tUIn+D0NbYc+
 GKxodNQDB2KJwBxvI8NuXrdqUGx9B3LAjrnRUier53jka2nXJ3Ae36qcZl2OBPSJue/JLsUNGSv
 gf9cMA2bu4oIcrc21L7FRWvEuo5no=
X-Received: by 2002:a05:600c:698e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-486fee1af00mr46177735e9.24.1774022108663; 
 Fri, 20 Mar 2026 08:55:08 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1db3absm17425605e9.36.2026.03.20.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:08 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:07 +0100
Message-ID: <20260320155507.176738-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304213528.1380898-1-romain.naour@smile.fr>
References: <20260304213528.1380898-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022109; x=1774626909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9cyPVNSCCgQkT2Fwpl6ESatr0LD8GoHYmErkSsqD90=;
 b=GrkeSEYIcG7+wen2vGiSQkK9HtmM6kTa7lJO4fd7OYmmt2az+SO5Xn5cZ4M+oEoixs
 /3e6JugsaotCXZPeLOf+0SmhJzZ3EFGh8j8UIJ00uqtCSXYgHCRwi1m7sO5bfjEckTsc
 ZGOGDeQYBcyqHmeoUbg++VcTQfj8ZBVBEbnjy4PNkpwWAqm7igwl5/RSaCX6GGKL7zGw
 ty/WPAs7k/liy9e1xd2faKECvLHOE6Vonxis7o10NHi5hg6/LlN/xKGVudmjAAfadm2L
 ijyHdIsnebiK6q2jFA6oDk32cmeL3Qt031l9Qyyadjf7L2OFdRgZO6eXoUX6FOsQRIEI
 WLmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GrkeSEYI
Subject: Re: [Buildroot] [PATCH 1/3] boot/uboot: improve U-Boot OP-TEE TEE
 format options help text
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
> OP-TEE generates a few binaries that can be used by u-boot on some
> platforms (Rockchip, Texas Instruments K3) using TEE variable.
> 
> Add a link to the OP-TEE documentation were we can find easily the
> desciption for each TEE format that can be used by u-boot.
> 
> For convenience, copy tee.elf and tee.bin description in each option
> choice help text.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  boot/uboot/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 47ce24ee76..17b7f95f50 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -295,15 +295,23 @@ choice
>  	  Since this version, the TEE in binary format must be used as
>  	  it contains important meta-data.
>  
> +	  https://optee.readthedocs.io/en/4.9.0/architecture/porting_guidelines.html#binaries
> +
>  config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
>  	bool "tee.elf"
>  	help
> +	  The main OP-TEE ELF file. All other OP-TEE binaries are
> +	  created with this as input.
> +
>  	  ELF format may be used only for OP-TEE versions before
>  	  3.8.0.
>  
>  config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
>  	bool "tee.bin"
>  	help
> +	  The original OP-TEE binary with a header (v1) and combined
> +	  init, paged, and unpaged parts.
> +
>  	  Binary format must be used for OP-TEE versions since 3.8.0.
>  
>  endchoice
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
