Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C392CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F81D61CD0;
	Thu, 21 Aug 2025 19:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaiDZrGlgxBl; Thu, 21 Aug 2025 19:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60AB61CAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60AB61CAC;
	Thu, 21 Aug 2025 19:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 406A31C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2777284761
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iSNeQNPYLYb for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B38CB8476F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B38CB8476F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B38CB8476F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso10710915e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804089; x=1756408889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNZzdsfFNM7W4ugbxVytm5EzKn6NnYd17cfUjnM3bc4=;
 b=kiaw0+P6rkIfDSKgOMVYHHhEVidj5O2OL01d3DD1F0k920iWlGBL7MC/vv7kXRNs9m
 fv/pVMkQ1MN9mkGy9Hfze4rD1ij7XpWhE90l2nhKF+Z5tW9/iEpRSSc8hchQ2ON3xvaB
 teTKeN2Gnc/w2QnQsra4axHOc5CmNagCvDpWuFyfwhtDf6ODYQQuL7Dun1ABz2ZM4/W3
 bhpbSWXDvu0kxwvrLefIVRBs7hk1hYq/i9w1hiE1Rw4d87UyJaCIJ5GAVorsOTqpNK3f
 zSZoDZUtUq0ssGwJciWo+kOa8zyHwcE78WYte5HmDWxnB1K4XSLQMAQDK7GQVhKTQZ74
 E2OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVadmy+8c/vTKj9xI/0LenFhsjIu4U5SWvC9Soujd3G+kqJ1QjAymAqmrPuln7SP1yEyD65HfyHUkM=@buildroot.org
X-Gm-Message-State: AOJu0Yx7yPc7FUpStnCqcOLiCH2pd7V4sMbH7XJQVRludvFVlg2VvSoq
 aegG3i5AUapVEHmAIqtIn1/lO756KQHM7NNs5DXB5q8ykkD14n1mniA8cMEhm8BWimvZjGOHXBp
 oCEwVv3c=
X-Gm-Gg: ASbGncvi4tXh95X9M8RQdTXZ0TRjVAgNlokujRpCW3sugwPYqivyCE4MxDnbJiCHNWW
 JTkr93RSzTrEDU4iVSlfbcLKvP55o2KhIqZxaRsWkIkNnE3muLyqCOioBR+Fps11Xvzd0seKENe
 r5jpYSuKHQZrfhAiiocPlclpTh2wKg/Td4mU53JDlOn220mcRMVq5FyKZJeeEAMpryGT7CmTDJZ
 iVOl2ObCo3GvSgn1UjrLuMJBL7Xq57o1j3sp2Av9rXvbm0dTXpObDyv+lfCfo8qpssf3aQlMM+9
 tDYDrLbFO7vVi2iHQqeuOaxjpBBSPEghz/TsGI1N21HxDMhkuBFJ1F7/0mri/LIAWOIibeV6mC2
 H6byJoBiJUHSXlJlg+uCiw9T6
X-Google-Smtp-Source: AGHT+IENqO4GoLAciKmUjJAyqiDW55I4o0B5zyAGO2yJb92FTIpY6OvBnrF0jV76etnHs2By6TsacA==
X-Received: by 2002:a05:600c:4511:b0:456:1156:e5f5 with SMTP id
 5b1f17b1804b1-45b517d27f6mr2069375e9.31.1755804088773; 
 Thu, 21 Aug 2025 12:21:28 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c07487986fsm13882391f8f.1.2025.08.21.12.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:28 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:28 +0200
Message-ID: <20250821192128.24816-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818083826.2770186-1-thomas.petazzoni@bootlin.com>
References: <20250818083826.2770186-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804089; x=1756408889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNZzdsfFNM7W4ugbxVytm5EzKn6NnYd17cfUjnM3bc4=;
 b=fC2FLOpcZU82rRnVYwWbskBT6NtArEpQLjfuGAMhlbz0TaXF97Rji9BE9+Db1Ba2Iu
 UtHk3mHZJYQYsmfy47vIKiRPc2MPpr9fTsrsD2L8BnxU5SSK2CEVFFPFNXBvRXNDuBmx
 Ojgjjzc18pofu2G3nm1WRTwG9PbWoT41QMuUYNAUKdKse1Ewvta62+EPQKY4PFJKSt2V
 P6s3HEdZzFjAXiKUNuKBdowv8Pj2+mJrMWLyRc2Pf+Y0XGS6SMc930cg8p2hjI/fbaFw
 XePMyrNuhCf0EoFO+0s3AfgR6HBnuMt5ds+iuICTGsaio1xBsqSVFlntqBCml0mlbNk1
 ja8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fC2FLOpc
Subject: Re: [Buildroot] [PATCH] package/elfutils: fix build after 0.193
 version bump
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
> The 0.193 version bump done in commit
> c7508a23242aae7a80f22acc4473da25f7f9e96d broke the build on numerous
> CPU architectures. Let's take a patch from upstream's main branch to
> fix the issue.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/3b005f7afec386f6fa4237f427f73367d55bb211/ (sparc64)
>   https://autobuild.buildroot.net/results/a6b1d5078abdd6c8def93aaffa2e67573250da3e/ (m68k)
>   https://autobuild.buildroot.net/results/45305cc2be3b255740808ee1f3486d1a10abfbb4/ (microblaze)
>   and a bunch more
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...ckends-guard-asm-perf_regs.h-include.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
> 
> diff --git a/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
> new file mode 100644
> index 0000000000..76c604510b
> --- /dev/null
> +++ b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
> @@ -0,0 +1,53 @@
> +From d05241ce690018548857199bd34d7734c7164679 Mon Sep 17 00:00:00 2001
> +From: Serhei Makarov <serhei@serhei.io>
> +Date: Mon, 5 May 2025 12:08:55 -0400
> +Subject: [PATCH] PR32930 backends/: guard asm/perf_regs.h include
> +
> +asm/perf_regs.h is an arch-specific linux include, not present on
> +architectures like hppa and m68k that lack perf_events support.
> +
> +Only one place we need to fix; others already guard the include by
> +architecture, or use architecture-independent headers (e.g.
> +linux/perf_events.h).
> +
> +* backends/libebl_PERF_FLAGS.h: Only include asm/perf_regs.h on
> +  architectures where we use it.
> +
> +Signed-off-by: Serhei Makarov <serhei@serhei.io>
> +Upstream: d05241ce690018548857199bd34d7734c7164679
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + backends/libebl_PERF_FLAGS.h | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/backends/libebl_PERF_FLAGS.h b/backends/libebl_PERF_FLAGS.h
> +index 2ed45f0f..51c20ea6 100644
> +--- a/backends/libebl_PERF_FLAGS.h
> ++++ b/backends/libebl_PERF_FLAGS.h
> +@@ -32,8 +32,12 @@
> + #define _LIBEBL_PERF_FLAGS_H 1
> + 
> + #if defined(__linux__)
> ++/* XXX Need to exclude __linux__ arches without perf_regs.h. */
> ++#if defined(__x86_64__) || defined(__i386__)
> ++/* || defined(other_architecture)... */
> + # include <asm/perf_regs.h>
> + #endif
> ++#endif
> + 
> + #if defined(_ASM_X86_PERF_REGS_H)
> + /* See the code in x86_initreg_sample.c for list of required regs and
> +@@ -49,8 +53,8 @@
> +    see the code in tools/perf/util/intel-pt.c intel_pt_add_gp_regs()
> +    and note how regs are added in the same order as the perf_regs.h enum.  */
> + #else
> +-/* Since asm/perf_regs.h gives the register layout for a different arch,
> +-   we can't unwind x86_64 frames.  */
> ++/* Since asm/perf_regs.h is absent, or gives the register layout for a
> ++   different arch, we can't unwind i386 and x86_64 frames. */
> + #define PERF_FRAME_REGISTERS_I386 0
> + #define PERF_FRAME_REGISTERS_X86_64 0
> + #endif
> +-- 
> +2.50.1
> +
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
