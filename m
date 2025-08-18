Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A5CA0EF2
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9024848D6;
	Mon, 18 Aug 2025 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_v-myXJEXTA; Mon, 18 Aug 2025 14:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBDF83E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EBDF83E83;
	Mon, 18 Aug 2025 14:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 154F7E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D7460AA1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3EYDowicFqq for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C1966089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1966089D
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C1966089D
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:48:40 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-70a927d4aaaso36537296d6.1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 07:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755528519; x=1756133319;
 h=content-transfer-encoding:thread-topic:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+y+YqOU2Jhf0Nd86eb9zBAwV/hgL+8Y8w43kUdrWzAk=;
 b=nh6SOL7JifqMbi1AsFB4n35P2VMeSc8pRvSlL6xMTGNV2hGzZ1lpzQO7vGNlTpYXuc
 /XJ/fEDxh7ZzfHrBFZrcqQjugLh0gMxZKG6FuGyX5Zesz1tzcUBeriVRGI2lzliT/UqE
 Hdm4dR4tqZBUCHMuEG9ryAZ5Z/yrvGGW9dF1anPQondLaNHP0fUBd6Tu+3NUnh6wzavY
 EhesPByjpm1FYzkg63ua9YYkoF7FjOHeGAhHLJe2TfPtVKMeVxuquiaqt/Hu1dVug14c
 wzVhnx+dvJHoC+++u8ltvoiNJCCizxbMdmUdF8IxDo4LIxegkGMKVWSsub71oEP/H97m
 0yAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDgUVolVmv4EVOu3bP4S7BW6MhpnXCtjCmifLcPFi7+/c53bbolhn5Tl+2lpH7Tikg31/WgL8PyWo=@buildroot.org
X-Gm-Message-State: AOJu0Yzny0/tHtWR3FR8TC0p6/29AosjWfYZ95qQ3JYUWjDzCaCwMTtf
 vsYTBUznJQ5w1FgXzMsEhivsfEQmTCsW51HQ9mfsRS33W+MLmXbbOnh2Yr3yuA==
X-Gm-Gg: ASbGncufwqLtnptCXtpyPTjo+kg2DeF/E+EzlvzvdU9xAjnPZBKI6EOK9ahZD/CLNY8
 dGA0m9QsN0OpjzbUwPWiTohbpKXdQqbMrIh7l9YGNNw9O2TaA0lbdr5v6RRR2zA9r9DZp8Y8mPI
 keEO397lNZPfEGzvhhzNcaVY5gZYe7BwhckXKLT8cb2QmMstW1JmWvGiB+QyL5nPamI9gibAvw+
 8LC6V8E8O4JfmXDp5sy67DB8d035QwQFX0PbxqON+XkOSS/IFa0XkGVNeAwzlA8KiIdmctqzOYm
 6Tfa+W2F9FT9QhAJkRTcCFB/rpVAChYKuzBKiLv39InP2pEd7UZ0QnQvAZYNeeY7NO3t059YQE2
 nV5IBVgEmCwjy3+kxJhbeIkeygGMzAIFqLPIdIJpGaMYyHBApF7tXuJmjX7Uq/ie6qTafb/8c8I
 nEJQ==
X-Google-Smtp-Source: AGHT+IEIpsHR9c/pT4c8qvvapOmQcH24dDy4mKBBSSfZI4H00HQi1vAAyu+JBIGP91d+SLQhD2vFgg==
X-Received: by 2002:a05:6214:2a8a:b0:6fb:25f:ac8c with SMTP id
 6a1803df08f44-70ba7c0b334mr154363906d6.31.1755528518762; 
 Mon, 18 Aug 2025 07:48:38 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70ba9370592sm53689946d6.56.2025.08.18.07.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 07:48:38 -0700 (PDT)
Message-ID: <6278f47a-e07e-45a7-9587-a4bbdd96c634@gmail.com>
Date: Mon, 18 Aug 2025 10:48:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jesse Taube <mr.bossman075@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>
References: <20250507-riscv_isa_extra-v1-1-2cad4c15d2ca@rivosinc.com>
Content-Language: en-US
In-Reply-To: <20250507-riscv_isa_extra-v1-1-2cad4c15d2ca@rivosinc.com>
Thread-Topic: [PATCH] arch: riscv: Add RISCV_ISA_EXTRA config string
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755528519; x=1756133319; darn=buildroot.org;
 h=content-transfer-encoding:thread-topic:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+y+YqOU2Jhf0Nd86eb9zBAwV/hgL+8Y8w43kUdrWzAk=;
 b=CfVJc+OOoBAR8ymtdce6rGhOdRnecZSbTZNgGD8jYMKyXy0aTgz/4nAXp9kcD9b4XE
 uP1D0WdQTobHuRffi5NkFFBX5/DtwkO3Zfp4veVSCeXkwkmS1F+zEEt/8mWqHqqejBN2
 NtGJ07p1LegfkjxljzhSKk500yL3Vm2kyYluf4tcAoVe8vRyIr50tD95hg7wU4iDWKan
 o29XPbgNPD3D84bITwK5gkQaiQfS100UwSButUhrQ6f2CeBrIBXXkNxBekza1IK7Ua2Y
 1V5fHZ/SpF8Uzf32ohCwq6pbDu1ieH5mRiM2+xXqpEL/1oxmIQKPnX0VSg0CSzTo+e3A
 b/GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CfVJc+OO
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 > Adds a new user-configurable string to arch/Config.in.riscv, and in
 > arch/arch.mk.riscv appends it to GCC_TARGET_ARCH.
 >
 > This enables custom extensions/combinations to be easily configured.
 >
 > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Jesse Taube <Mr.Bossman075@gmail.com>

 > ---
 >  arch/Config.in.riscv | 7 +++++++
 >  arch/arch.mk.riscv   | 3 +++
 >  2 files changed, 10 insertions(+)
 >
 >
 > ---
 > base-commit: dd2d62a36e091ad745fbacbef810709b2f597396
 > change-id: 20250507-riscv_isa_extra-769a6078a3ad
 >
 > diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
 > index 
23d095d1a6626d6bfe4a717b1837aec72e67b8db..4f48b6f3cac7ed182c045ded864aaf190144b54e 
100644
 > --- a/arch/Config.in.riscv
 > +++ b/arch/Config.in.riscv
 > @@ -45,6 +45,13 @@ config BR2_RISCV_ISA_RVV
 >  	bool "Vector Instructions (V)"
 >  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 >
 > +config BR2_RISCV_ISA_EXTRA
 > +        string "Append extra RISC-V ISA extensions"
 > +        default ""
 > +	help
 > +	  Extra ISA extensions to append to the ISA extensions string. 
They are
 > +	  underscore-separated.  For example, "zba_zbb_zvl256b".
 > +
 >  choice
 >  	prompt "Target Architecture Size"
 >  	default BR2_RISCV_64
 > diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
 > index 
ee5c434b97115eb0106b87203dc909c0705690eb..3e258b78afb0f4bdb2a456d644489b1673e2df59 
100644
 > --- a/arch/arch.mk.riscv
 > +++ b/arch/arch.mk.riscv
 > @@ -39,4 +39,7 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
 >  GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
 >  endif
 >
 > +ifneq ($(BR2_RISCV_ISA_EXTRA), "")
 > +GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_$(call qstrip, 
$(BR2_RISCV_ISA_EXTRA))
 > +endif
 >  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
