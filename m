Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D453C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D50584BED;
	Sat, 23 Jul 2022 16:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D50584BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_0Gqj_sm8qn; Sat, 23 Jul 2022 16:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160AF84BC8;
	Sat, 23 Jul 2022 16:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 160AF84BC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E04061BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA1EF60ECE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1EF60ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmDhiGr4fVOv for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF5860BD8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EF5860BD8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:55:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v5so4430058wmj.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ER/thj8/7V33nYswZ4VR8eK4Y/nUeKluqfse+OlJJL0=;
 b=aIRuTg2MfqFIII2MuANk3Ar0seM6sjSpr6ENQBd5RCM6DAqZU33FhclKjHrEN6jBW2
 gJlc/c6UBq3WrHbgv3k/C+ksLHBpV8orAA3OOcganKKv1zppToOgd9iVibfAPctTD5Jc
 EgidcL9CyeIPiHmaIi2evhKfsAXhddLppYlBL/YM0tBVPvzu40VghJOf1occ+XHTs4x4
 BHcc74tJ23YM4AUbSMYX3gJ04HYlrkwzOY3+lj+Shh809qbiA829ZaONhb/+iKiEZVTv
 FTEUBs3NFkLRSglWC9VxR3WoaVSOP9/3VFEsDnjHhzbFfSlFUEtbTeAsuB5yjZxZmJQI
 OAUg==
X-Gm-Message-State: AJIora/gHcTulPVqDkO4jth/tw18ZWejt/CdO9BAtBxRCrUBLeDSyJfx
 4MpTeMoZ44yGahH4hR450+2FVA==
X-Google-Smtp-Source: AGRyM1tdvo7OariMSXtT+6udUZE+Pf+MlvDcfjXR9AKATRm/6h8ZPrQjBhWli/3JPEuP0FCVAJLUtQ==
X-Received: by 2002:a1c:730c:0:b0:3a2:fd70:ee3 with SMTP id
 d12-20020a1c730c000000b003a2fd700ee3mr3363858wmb.168.1658595334814; 
 Sat, 23 Jul 2022 09:55:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c48a600b003a2f6367049sm8048706wmp.48.2022.07.23.09.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:55:34 -0700 (PDT)
Message-ID: <4bafe35d-6f7f-b3ba-c6d5-fe3d099de8b2@mind.be>
Date: Sat, 23 Jul 2022 18:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220607173137.911359-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607173137.911359-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ER/thj8/7V33nYswZ4VR8eK4Y/nUeKluqfse+OlJJL0=;
 b=QUS2UQF6rS12V8ysmk9FkIrPmdBdPbANrUTd5x7Tz/ON6ytPoh9vz9gwXe/hFVqGCu
 kU39y/CHcpmmPFxD5D66RZbomGPt4ta+J5EVjfVUPisd4088nMZNr7nEMJLLMM0o0PHD
 BJ0IzS0svQBGIGtOm3K9SHVahxzfyTbusHLmElSyAAkxBJUrt4rf3qi+4G7v/AXU0YSx
 Qrac2eMCjGtNiqaKl+SRfrFIdURUDBcAITw3Ks9lfvyoBBgHyaZk6EFO5dvvj9XYFBDv
 Amo75fr4RQnFEtRUl+iPLkbmbdbpnGlIjUQIK59XivItGPRFq04r1B5YULjBmzgVL2X/
 oGYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QUS2UQF6
Subject: Re: [Buildroot] [PATCH 1/1] package/libbsd: fix sh4aeb build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2022 19:31, Fabrice Fontaine wrote:
> Fix the following sh4aeb build failure:
> 
> In file included from nlist.c:44:
> nlist.c: In function '__elf_is_okay__':
> local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
>    223 | #define ELF_TARG_DATA   ELFDATA2LMSB
>        |                         ^~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...01-src-local-elf.h-fix-big-endian-sh.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
> 
> diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
> new file mode 100644
> index 0000000000..8612d268f8
> --- /dev/null
> +++ b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
> @@ -0,0 +1,39 @@
> +From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 7 Jun 2022 19:27:13 +0200
> +Subject: [PATCH] src/local-elf.h: fix big endian sh
> +
> +Fix the following build failure with big endian sh (e.g. sh4aeb):
> +
> +In file included from nlist.c:44:
> +nlist.c: In function '__elf_is_okay__':
> +local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
> +  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
> +      |                         ^~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
> +---
> + src/local-elf.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/local-elf.h b/src/local-elf.h
> +index 1dd3b42..8c4794f 100644
> +--- a/src/local-elf.h
> ++++ b/src/local-elf.h
> +@@ -230,7 +230,7 @@
> + #if defined(__LITTLE_ENDIAN__)
> + #define ELF_TARG_DATA	ELFDATA2LSB
> + #elif defined(__BIG_ENDIAN__)
> +-#define ELF_TARG_DATA	ELFDATA2LMSB
> ++#define ELF_TARG_DATA	ELFDATA2MSB
> + #else
> + #error Unknown SH endianness
> + #endif
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
