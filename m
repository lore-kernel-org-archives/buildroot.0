Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D5CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DAC40998;
	Sun,  7 Apr 2024 15:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mc_gCm7A_cr9; Sun,  7 Apr 2024 15:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926B8409A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 926B8409A3;
	Sun,  7 Apr 2024 15:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5021BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88CC060ACF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrWq4CXMWGR2 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EB0060ACA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB0060ACA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EB0060ACA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:57:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41551639550so25705085e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505435; x=1713110235;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x46BMVe+N+NAmDBypQWaHI1aAM1aG7dEj9f94NJEp0w=;
 b=MoypETHzuXbu/CLOC6fsY2DU4kYGdVQdOKRCuGtwhbAe25S18oVnqkl/Gcq5EFph20
 dvs5vp/8kQAnU41NBzl6QDWBQBW/nlMZsdJEWF91VQ5bAndAuNyxnaeVImPHV3NH0l34
 zIQH9vTHq+oTZX1WwOWD37fpQIdlZhN3mJCV1loAVkxDQWl+hxOlfk9U3+cxxGJKL1Vw
 8dEYq7hXNY+a4kXzuqM5Xm+90ApLMh4Dn1QkTn5XT7OC2QTqXM/JK9OYB49+6v5dg2Q5
 1OBpYz/+cOKpEVfJWcgBJqJh7Wcb90nesWh/5uytfQRuul7y8wNp+7MQtRde8/op+liz
 uqNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ABj9mrNGUzrKDctUKSgi9ONiwyau725imDCzjwGop/OlddB6hcIvKuS2Ct8EJrOElPEoGkE68io/mQ8LYM+4UvN1JharYg==
X-Gm-Message-State: AOJu0YwAnS2KFwMyuSSUE8w979z7BtcDuJG2Vj6+2fO3Ukkwy/Bn+pWh
 jlfkTBSCdFDbnXyKF7DqDyLL9ubeieIoVFHQUg63cnm8w4S5zloSdG7zVjklTx8D+MUacwSDkjj
 s
X-Google-Smtp-Source: AGHT+IGT8VV7uKIjrqxHiuaIB4MubD5liafTKKDFckehSxcL0SNOie9D1K0v8YET/FRVhX0x27w3Tw==
X-Received: by 2002:a05:600c:190d:b0:416:5cf2:bc13 with SMTP id
 j13-20020a05600c190d00b004165cf2bc13mr1409911wmq.14.1712505435141; 
 Sun, 07 Apr 2024 08:57:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004163321790esm7503642wms.19.2024.04.07.08.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:57:14 -0700 (PDT)
Message-ID: <38d2c054-189d-4312-ae18-bc4c28304086@mind.be>
Date: Sun, 7 Apr 2024 17:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240301213722.91942-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240301213722.91942-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505435; x=1713110235; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x46BMVe+N+NAmDBypQWaHI1aAM1aG7dEj9f94NJEp0w=;
 b=Q+FROeG08djRI9EUYGxLnSTYezDZaMvhhkQisBzHnrM6YeCZ5z73f0LdyQ9e1353z7
 mDfi4np4TsUpRYJSIpaJXx5XEkfDNi49viWFyYZC9WtygyDGPzrJVc+MGxamXlDgWB2A
 JDGNpitZ9UYymtwnIBTwQgqxiDfJ7/VuR3rlDI8gumPUHCfcOlsAOCrbMF+6MpPVKOZC
 ZSJ0YObkj8mFJyuUUnRDKyHY0QlaI0Z4/WuIKFEx2Zs8jy4IFLLCXoCcvTRzvTNe4oX0
 5IpCvBb8ujm2hPpHS8AUTBx6cZ+qIsQilPCRLX6pU46oRNyrgUp5BjFYCf9jwdLBoDzc
 Orhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q+FROeG0
Subject: Re: [Buildroot] [PATCH 1/1] package/tcf-agent: fix x86 build
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/03/2024 22:37, Fabrice Fontaine wrote:
> Fix the following x86 build failure raised since bump to version 1.8.0
> in commit 81802e263a12e173e0e1028449d1e1e11b2e5974 and
> https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
> /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
>   2079 |         if (info->type == STT_ARM_16BIT) {
>        |                           ^~~~~~~~~~~~~
> /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
> /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
> /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
>   2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
>        |                                                                              ^~~~~~~~~~~~~
> 
> Fixes: 81802e263a12e173e0e1028449d1e1e11b2e5974
>   - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...tcf-services-tcf_elf.c-fix-x86-build.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> 
> diff --git a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> new file mode 100644
> index 0000000000..5f08fa485e
> --- /dev/null
> +++ b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> @@ -0,0 +1,60 @@
> +From 0a847ca035113540ee44d17f364bf4701fe78355 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 1 Mar 2024 22:31:05 +0100
> +Subject: [PATCH] agent/tcf/services/tcf_elf.c: fix x86 build
> +
> +Fix the following x86 build failure raised since version 1.8.0 and
> +https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
> +
> +/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
> +/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
> + 2079 |         if (info->type == STT_ARM_16BIT) {
> +      |                           ^~~~~~~~~~~~~
> +/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
> +/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
> +/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
> + 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
> +      |                                                                              ^~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/1
> +---
> + agent/tcf/services/tcf_elf.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/agent/tcf/services/tcf_elf.c b/agent/tcf/services/tcf_elf.c
> +index 1b3900ec..b0b948e4 100644
> +--- a/agent/tcf/services/tcf_elf.c
> ++++ b/agent/tcf/services/tcf_elf.c
> +@@ -2076,10 +2076,12 @@ void unpack_elf_symbol_info(ELF_Section * sym_sec, U4_T index, ELF_SymbolInfo *
> +     }
> +
> +     if (file->machine == EM_ARM) {
> ++#ifdef STT_ARM_16BIT
> +         if (info->type == STT_ARM_16BIT) {
> +             info->type = STT_OBJECT;
> +             info->type16bit = 1;
> +         }
> ++#endif
> +         if (info->type == STT_ARM_TFUNC) {
> +             info->type = STT_FUNC;
> +             info->type16bit = 1;
> +@@ -2225,7 +2227,11 @@ static void create_symbol_addr_search_index(ELF_Section * sec) {
> +                 }
> +                 add = add && type != STT_GNU_IFUNC;
> +                 if (add && file->machine == EM_ARM) {
> +-                    if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
> ++                    if (type == STT_FUNC || type == STT_ARM_TFUNC
> ++#ifdef STT_ARM_16BIT
> ++                     || type == STT_ARM_16BIT
> ++#endif
> ++                     ) {
> +                         addr = addr & ~(U8_T)1;
> +                     }
> +                 }
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
