Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EACD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846C960F88;
	Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3l83Dz0956v9; Fri,  5 Jun 2026 12:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9C460F91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663772;
	bh=so/tkw9wBE8hv2951KXnFTXs8m2W8iUWEqBONzCJf0U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qiZeyHVYL40Tqwcr8fN9EeMlgVpEk4Gr5IOj2PmVwNvCte+omV2q1jswMKdAGSJ/5
	 W3xeAmXQiUQUbFT3Hlsa1RrSDkbZWgpii12+Va6dlfRjJ4MDlIbTRHHDYwLjnVLXl2
	 AVTHY4d9fkJWgeZnhWRruCXnPFh0v2YxfVqp3VsNtbBncNiV3GBeGerDOLqQ1w9S5P
	 mQNA+7p/rERqO2AUZticiyn6etSUht1xi+JQTx5lNiTNqYWwxDUmB62RXtAAxkd+G9
	 uEregzGnZcZpivIbboU1SIxlctuS4aemIOEPW3kNT/VpxAQsUzvIfLttv691q+RXZQ
	 aGjYAuFvan4Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9C460F91;
	Fri,  5 Jun 2026 12:49:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 690FCF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA77040381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxNAJp9-GUUq for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D29F14037F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29F14037F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D29F14037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490c0c92cffso10348935e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663765; x=1781268565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C6N/LMHoiv3C0Zw5FMCWAiO/CPYNWMhjuRF210vE5Bs=;
 b=NpxlDq/UyVX9e1XPAtL2XGnBNpr32ksr/oAySsaumNY6A+OPPXR9gMdYxBG5Gntpni
 OQs5s7CAflihigVmsBVDu9j5QAnBiS7hqyWr1xJFxH495uuYk3hS4fHMSiaJM+UrjPGj
 BG+YmeBvChazxKfcHs4NyYsDUlD9cFk0ty/tX2I5eyXRs5eQosg6PUHzrl5mxIdvIhG8
 x9rd+QZhBHbVoZLgJ/WNb2NQMHmVB8ieAiKw2znTyF7biX7ocuer6D55hf/GY/kXmosD
 BBn9a5LqTonQb0IG34cKeJ0HUpwo3ZONkDMiNNw+TIxl2esXoS7HHS3tlRu/DJQ8c8Ef
 sSIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BmzKgv6eu8CM4Q7fLtTOGoMFJaECHfRx2EX4lHZHeLeu2eK0oSXrGcxNVLwOwUjQB5Z96RYPta2U=@buildroot.org
X-Gm-Message-State: AOJu0Yxz4P32oAyZhYM/YpGoWewoO9JMm8BpHQb6WPOuyEHQb3lujmBp
 E2G9NidCis6IILpRFfSHWxp4GdW7GClZQvTykpfjCMfGngScOKfBlHZXA7HbyLpTECk=
X-Gm-Gg: Acq92OFEG1QxuzEicUn/yYArnSFMzPD3ka6vI4DnNTGM73JoBuc5f0BKXTzApIYGA4M
 FQtgyAwAL18hsR6VQhrf5NzSVjfabkFlNqnChxJncQ+0qV9tyfx5NcL66hk4RGR4rSWenpkK4dr
 oWcMVyLgNjYUic9Zd0v+uCjeU2Io7S+qtnbnu5PlIb9kqXxuL1s1nJKrRSzd2sYyh2GEsAZFQGI
 6WZtMkdMXa+A2/qLKaJgOX/tuiwHWKOs4ibQqBcbfs9SXGrPxVQWoqR9G3siAse8DRfCBt25MrY
 XhnDX7VeLbnY6QrEIjmjLSc47L/UozkO8t+/+jbM3+7HxxTNiXI5ddH6zG+XWojeCs6KwejNIgk
 K7UOj+fLDydyafGZDJXY2Q0LIQfb7Q+ANgvg7ruGdOUFftx7TMQevoWo6yFHMDtINhMIMpXt+5m
 WlNGlQrf7b0MS1dB35JqZBwE72kw==
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1e5 with SMTP id
 5b1f17b1804b1-490c2607c39mr53160405e9.31.1780663764634; 
 Fri, 05 Jun 2026 05:49:24 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39def5sm145073785e9.5.2026.06.05.05.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:24 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:23 +0200
Message-ID: <20260605124923.271132-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-6-bernd@kuhls.net>
References: <20260425211641.479665-6-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663765; x=1781268565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6N/LMHoiv3C0Zw5FMCWAiO/CPYNWMhjuRF210vE5Bs=;
 b=BirqlqPR8he5E69dUmwUsj5O0z2pGM5xpyMMV4tnb39ceuspx8DFqQUCXHpIdvPazZ
 mscmLXUuG8Ju4Tp4EjMiDcWvJgijmGSOyJ3k4h+383M0jTsIUwQK4uBv1BogENtvTnKi
 +JBfyPhAP3ZD7TK68dc75kebU65JYOdi0oFweXGPiZ05K8TK0ijmVlXzuHDWi+RcDRUu
 iJoDF6LF0Fgkb06wZDbmpmkDNS6CkE5RXndJtqBuWH9k6X04mgKNbXlZfZqo/iygN1vA
 yVZQK3bus/AZ2HAWEljuPPNhqndYk611Fs4KbR0pwWpwVCITaMXfgXYTtzIc6k64t4R6
 DlTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BirqlqPR
Subject: Re: [Buildroot] [PATCH 6/8] package/libbpf: fix bpftrace build with
 kernel headers 6.0
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
> Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped
> bpftrace from 0.23.3 to 0.24.2.
> 
> This release includes upstream commit
> https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
> which was added to version 0.24.0 and makes use of
> bpf_iter_link_info.task that was added to the linux kernel in version
> 6.1:
> https://github.com/torvalds/linux/commit/f0d74c4da1f060d2a66976193712a5e6abd361f5
> 
> causing build errors when the toolchain contains kernel headers version
> 6.0 because the libbpf package does not update their headers:
> 
> output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
>  function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
>  bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
>  const bpftrace::BpfProgram&, std::optional<int>)':
> output/build/bpftrace-0.24.2/src/attached_probe.cpp:1437:11: error:
>  'union bpf_iter_link_info' has no member named 'task'
>  1437 |     linfo.task.pid = *pid;
> 
> The build error can be reproduced with this defconfig
> 
> BR2_aarch64=y
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="6.0.19"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_BPFTRACE=y
> 
> on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/146/14671c54fdf0a2e44bcce7ff61ca9b89a925eca9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/libbpf/libbpf.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index c441522266..d405767988 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -18,14 +18,14 @@ define LIBBPF_BUILD_CMDS
>  		-C $(@D)/src
>  endef
>  
> -# bpftrace uses btf_enum64 that was added since kernel 6.0 so we need to
> -# update some uapi headers in STAGING_DIR if the toolchain is build with
> -# linux-headers < 6.0.
> +# bpftrace uses bpf_iter_link_info.task that was added since kernel 6.1
> +# so we need to update some uapi headers in STAGING_DIR if the toolchain
> +# is build with linux-headers < 6.1.
>  # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
>  # by the toolchain.
> -# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
> -# https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0),)
> +# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f0d74c4da1f060d2a66976193712a5e6abd361f5
> +# https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1),)
>  LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
>  LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
>  endif
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
