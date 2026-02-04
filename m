Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFBBE95372
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF9C60BD9;
	Wed,  4 Feb 2026 10:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ze4FGHUmNUHc; Wed,  4 Feb 2026 10:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8E060A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200088;
	bh=mn96KX+KWkjgr1h1o4y06aC2bJdAT9QEvfN6q2YOb2I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QrzG+zl2h3maiOM3wlWdS/y8friNQw31tLeQHsDZawmEV4bq9ff7NTVnkafUu9WFt
	 OSkRhFKaHmM3Pl6D8GRUYj4npToYttzCA4l1rDXP6TDm8eehlP5rVfhku0R5vPIRn7
	 R6wLvKOCtrT2bKExfCDQBIECI/gVmFfHvGBlHMzslOJ0Xq0EYe76u1dHPM1kzgrBae
	 taxv/1W1slJL7Tfq9ZRdAPUEcdrgsrS/f9uPPphwkAWq6TihLi083E4Vo3MKksfPl+
	 FXGLTtr5vATMESFltpW9euQqsYtsue1i0++YSuRWUOd5nSlf95fpOYJYcdemeIp6cw
	 O/ia48pzVPFDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8E060A89;
	Wed,  4 Feb 2026 10:14:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6303173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5F1B40209
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SSMB0it6ebQ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC1E3405E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC1E3405E0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC1E3405E0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:14:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45AF3B97ADD2; Wed,  4 Feb 2026 11:14:43 +0100 (CET)
Message-ID: <decd3623-dc15-4f0c-97a7-0001c9b2ba42@rnout.be>
Date: Wed, 4 Feb 2026 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>
References: <20250507-riscv_isa_extra-v1-1-2cad4c15d2ca@rivosinc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507-riscv_isa_extra-v1-1-2cad4c15d2ca@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770200083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=s5MSVYwGCnR1iRy4RvU2Z/8G48xJ/qqcpLHPxnU2zEE=;
 b=J1pDI0/fzyczl3bUMZME6MCb297KtdTcADOTHZs+cSTDgfj8xbDc4U2Gunhm6gwPf6kLpW
 RgGPRCdeQKvKQEtDQYYFVngnCWrbFFP4ccgtybi0SlT02pjk4wYfxVVQmGQOoWqLY6KsUd
 c6b/FXWFb+VHgTmFvTw/IX/oZaW1TxhWeT8fNBqgSuwrridjdp/XVO2IUdt2CnnrgrY3sV
 W+1TbLqAU9cFRPXyKsl0WJ6b+WsnyQ0/aadl6emmX5V7zxAYkb8tnzCvpKyO6Y8HGmzdlT
 vDVV/L351ti34u/xAD8tVh+MJ4FV6KtQMcongiPI1WGa1qBj6mwTH1z3GCzWpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=J1pDI0/f
Subject: Re: [Buildroot] [PATCH] arch: riscv: Add RISCV_ISA_EXTRA config
 string
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2025 00:50, Charlie Jenkins wrote:
> Adds a new user-configurable string to arch/Config.in.riscv, and in
> arch/arch.mk.riscv appends it to GCC_TARGET_ARCH.
> 
> This enables custom extensions/combinations to be easily configured.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

  Applied to master with a few changes, see below.

> ---
>   arch/Config.in.riscv | 7 +++++++
>   arch/arch.mk.riscv   | 3 +++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index 23d095d1a6626d6bfe4a717b1837aec72e67b8db..4f48b6f3cac7ed182c045ded864aaf190144b54e 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -45,6 +45,13 @@ config BR2_RISCV_ISA_RVV
>   	bool "Vector Instructions (V)"
>   	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
>   
> +config BR2_RISCV_ISA_EXTRA
> +        string "Append extra RISC-V ISA extensions"
> +        default ""
> +	help
> +	  Extra ISA extensions to append to the ISA extensions string.  They are
> +	  underscore-separated.  For example, "zba_zbb_zvl256b".

  Indentation was a bit messed up here. Please use utils/check-package or `make 
check-package` to verify these things before sending.

> +
>   choice
>   	prompt "Target Architecture Size"
>   	default BR2_RISCV_64
> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
> index ee5c434b97115eb0106b87203dc909c0705690eb..3e258b78afb0f4bdb2a456d644489b1673e2df59 100644
> --- a/arch/arch.mk.riscv
> +++ b/arch/arch.mk.riscv
> @@ -39,4 +39,7 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
>   GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
>   endif
>   
> +ifneq ($(BR2_RISCV_ISA_EXTRA), "")
> +GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_$(call qstrip, $(BR2_RISCV_ISA_EXTRA))
> +endif

  We typically do qstrip before evaluating the condition, so I rewrote it like this:

ARCH_RISV_ISA_EXTRA = $(call qstrip, $(BR2_RISCV_ISA_EXTRA))
ifneq ($(ARCH_RISV_ISA_EXTRA),)
GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_$(ARCH_RISV_ISA_EXTRA)
endif

  Regards,
  Arnout

>   endif
> 
> ---
> base-commit: dd2d62a36e091ad745fbacbef810709b2f597396
> change-id: 20250507-riscv_isa_extra-769a6078a3ad

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
