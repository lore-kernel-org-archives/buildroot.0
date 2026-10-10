Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19912CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7BB60A3C;
	Sat, 10 Oct 2026 09:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Syxn-M0QvK-g; Sat, 10 Oct 2026 09:23:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF9B560A3F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624196;
	b=ZiuXIZ/IZzk1gF2q17FFiNkwTOuoVpNpTWyqu/e30h4iSjWt/dAYCUrcV5sli/JRK8Bd
	 7hto20BebOa6EQU3n9TS2dCDMElFj8NCYTn4HBcSKAeXr5la+aicNt/mEEdo+dvMx3rZl
	 CDzgtihm2XlxU2R80d/sfIWoXp7updH7prptjQjWJ6eo8SDNXtoT498cXI8WzXp1uQI/v
	 Uld6ysO4TjCte1vwXRxvphF4OqxCHDvD/kxceVTN1vM0PRlgF6oqhTXYqzR1xyANS8+EZ
	 Llhxcc799sdK349iG1Yp9GMbr2JlOZAO1jHarCn5RYt07Gpa/yJSZzpB/WahKkwduoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/6eMu65xDWP26FvEGVOVqateQyU4tz+GO535YvPFrgc=;
	b=hHWC95/wLj9YUA6expZDWhbEN8uGB0ypZOR/F2jXFZv8RWXqVW8+RSoiijSzytcv2ILI
	 SUNN922zSTABVVbKu5QQkDMHL7Sbe6e+cgQZ16gFotXjkjKXYQ0CCGsZaJUVHoryMIbjI
	 1gw88vBVf4Jyp6A7g7frcxUjCFELFabsa8TTQBcHtB77qx4YNPZnxZj3lvMG4ImheQ1Tp
	 JyDR5GWS6yFmHnanIRWGJStd2Xh1vCobNXykkpJIsS7RzRmvMDi/NOIrPlo7DVaBMPpSR
	 omvIh0zsOye8t/BAasLYkTwczEHJ1o7fVa6CF3vwd9v/y7XjwJpKN1Ua5PZfYOsoUSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624196;
	bh=/6eMu65xDWP26FvEGVOVqateQyU4tz+GO535YvPFrgc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AK+VlFhhm7Q1TuOfMnhAqMnKwNpT7hpjyx26J8GZH6fVpy6zYECgQm3VLLekmihcC
	 b8BOcZM2bGCReoU3bewnoCisMsK2R5NRmsNZbyqw94gppUH8fTs8aym4THLlcPpU8I
	 m52jpBZPVYAc0/Ti7h6QUjiMlsH4PFiOjaqyMaZ99i52XVcAoO7jGawAEHcM7aOkW6
	 kVGFa9rQLNQS+i+JCME+xpYq0DGmKQYnRTFPNCuMnbTsWbP08TN6RJsU3h7SX1FC0t
	 99tnZABVDeRD5yBz6bSDGD/hClZtncOEU4uZ8obUUQVO4ALmQ/R91OPhEVmU16DfK/
	 OViKfLUhY+D8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF9B560A3F;
	Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC785A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B273860A47
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKW7yyAopdLc for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83FD260656
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624191;
 b=hCPjDt4a2bSuaoKzQqwDuJOBwWoZucYfRtZqejdKkIEUmnZPiPptYllTZAdviPNN3rNJ
 o8Wcdj63YDBC/mLIsjpErG3wWkXhZL+gkc6Tmw5172VBs8a6lk7DsaL2LcXco9f/Vn0Ra
 bcHxYluGjGPb7XvjhRyT8rmBpduTzrGLbQD+63/O6O2bzIGC03trbxEWr9BLO241ULCTG
 K/hA+6j5Qrtm0tKeOBhztad7IOS1EXJP/b/kMsCi357nzT6bDdhyDWc+aFK7XMDh1rsmZ
 GKJX53ebqzXbfjLdfJz+OVJhNSbIGbWVSf9o1zlD0YpYo+ZCHGj9GapcZ8dTKFJbwCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624191;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=FxmIIjamajYuKG1NtLbZWmgfXs5S+bMzoiugjEZH0Xw=;
 b=qY/NHQQqZ1AUcH1gNZBJ8aq9qPurVQaLsssbUE82HngWXZ7dqFgPri7QKg228cHsInul
 LtG8F/ODLQ9HvqR0bpHR3ZHYd0pnfSZTH+QIhzmfgsdKH2S1i/1HfMAGKJHdUBzyYp8e9
 suMy2MfBYA72YVqsBmWyus/9Q1RLdTCqD3IY6DaPoSgsVxzokJ9jDohvRZfLJZN+FIC8X
 Kl1XTdGSgcGhw5yzMR/sWLhQRutFMPHjnReha4NPnUTsVEO2eSDmBDQ6m0+MmgVHcDZzp
 Lg2cw5SPo3cRT8hi4GipsT+Plf54qKS7lZAifDJ4cHZ/D04YtzXTxi+q5UGMNcFP/mw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Jv8wu188; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83FD260656
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso422978f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624189; x=1792228989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FxmIIjamajYuKG1NtLbZWmgfXs5S+bMzoiugjEZH0Xw=;
 b=CNgummKycKe/DHvMCQMXdlmDwSSTsI5qHqrwoy9wMmmVrZkdb1RKSXAaPq30T2IiHD
 Z3l+8Pl3C7kKUKZFVy6b4Xsq+9EoRLbl+w9pInDqpOJf/16TSDhp86rsnGmJQu5fhv/i
 5W8mM4Bj24eIUE/NsLTTf1NGcMzq2va9jY0dbLJv4CzG6zh5N7NcDvsOqDy25H0Q24D7
 mftwb20bIAZf8Y3r+ZTdOwCEzWQzI7iuBX6hCue5BvWKbIulTYYDLZ75YNskfl/0QxZK
 IXDWBiGAIdgKKYHxORgMi0qDlVrzhev2shSjMcGFgYxQmFhDlEh/cHhdfaNzeujXLKxW
 wh8g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvUs3HGpEtSNAdvo3qCdcYRPU2wTdHrwWg7XHqYNAr77xz2WA1q0dwgXncvs4Fu5fPXXpjV2jwNmw=@buildroot.org
X-Gm-Message-State: AFq9FYJNYuxGMVuC8HLyQUVdwwUVtrWsFg8Cqhka1wC1R51m5Od6M5Bl
 q5HOomk1WAMlVUL6ujGeIka5suDcZ/9dipVK5LSWLnW6vOimCQeaIASi326ITq7+xso=
X-Gm-Gg: AYBFou1FfEN3luqt6Af/+gBAUp+pGZN3QHTNluA7gCOJNUYkiiXbbT+9Oz4mku5YgFE
 WNS4DzXJ0V7Zyq4oBNkwPxrIddEQ8xXgjZnzru2Cqq74RKC7y+XNYVWhXetI2XhpvPhbLA/LMqW
 AHy3F8q0P22+YO4JaC0oUaAnArBHsD70E4blXl+f7ochUYdwO5vpwHRkCTJciauDms/6WUOZmLQ
 xeKDISV0PZpe89exa8E0cfLAuWOkxfE/wcr1dXF5VJSmSJHFbDJ1sBOUfHEdvd6BfAn/u+AgWJb
 WgEmRACgwNZ8kSu3c4U1ii/4J+J9/XI9TZUsF1dqssMPe/yF/ZIywKH8AAh9iERNKoRFV+mDPfE
 udOfmVgTxqWpEFKzCmdeDJtwqoqNNw9LacNeNjwmZd5Zu9jOQZ7jYiGS4NNazC7HSos7DulxCdo
 U/IwowYu8Fzx6dSA8dHbIk4SQst2VO1BhofYXXqYO5lhWcPTfyPEXERNOJ+U1ZRPkHN1S0y2uS3
 F1aewVn66gH/u/DjMVd/EBtDuuk2sDrKlREzSjiQlUOJdch+juGQCxo
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id
 5b1f17b1804b1-4a18e48d45cmr89028765e9.16.1791624189180; 
 Sat, 10 Oct 2026 02:23:09 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm122071285e9.4.2026.10.10.02.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:08 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:08 +0200
Message-ID: <20261010092308.139134-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923182403.2143949-1-fiona.klute@gmx.de>
References: <20260923182403.2143949-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: fix license information
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
> Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
> parts are clearly noted, and add the missing LGPL license. Lines in
> GNU_EFI_LICENSE are ordered the same way as the information is given
> in the LICENSE file.
> 
> The license situation of inc/subst/elf.h is curious: The file itself
> is licensed under LGPL-2.1-or-later, and used in gnu-efi under
> LGPL-3.0-or-later (accompanied by the appropriate license files),
> which in turn allows using it for object code under different terms
> with certain conditions (see section 3 of LGPL 3.0, as noted in the
> gnu-efi LICENSE file).
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/gnu-efi/gnu-efi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index f615df91bc..f979b65c31 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -9,8 +9,10 @@ GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
>  GNU_EFI_INSTALL_STAGING = YES
>  
>  GNU_EFI_LICENSE = \
> -	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
> +	BSD-3-Clause or GPL-2.0+ (gnuefi), \
>  	BSD-3-Clause (efilib), \
> +	LGPL-3.0-or-later (inc/subst/elf.h), \
> +	GPL-2.0+ (tests, some IDE & CI files), \
>  	BSD-2-Clause-Patent (EDK2 routines)
>  GNU_EFI_LICENSE_FILES = \
>  	LICENSE \
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
