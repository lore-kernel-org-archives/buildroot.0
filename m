Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A20CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3572B824EF;
	Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gle9maJH87bd; Fri,  5 Jun 2026 12:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CEC824DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663770;
	bh=gDY+nRs/ksukFzIlx+xVMZuxK6Q8QZlSeAegRmFIv+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y/5+kQW/Rz32gm+UR0cKFRke7QA3oO3NFAfVHOnSEulFOMZFYUVuqo7ohr8BqQDnh
	 5D/o0CxVPL3nv1e/b7UUSCJUM66NZBCysWy7YtCqOHYZC2J/2THbwbZjjGwVDB6VwE
	 Ndd+O26A4SoJIsh1+d3UHkYks4Lf/BWkRLf50a3HFuEFqBfVZUPTPB3A60GKz+wRQ9
	 +DG1Bg/yTu0X4TSKJXrMIxkLMvW8MH1lTUj+jj9NIkBsaYmGAZrP0JIDiG6DtQPBWL
	 qrRXTQIdReVVwQSGw0Cig7loIPZsgrj/kL8DRB037z+JBqvAM6gJWnRuzTJue8sR6m
	 iw+zDWAGE72uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CEC824DC;
	Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFFC6388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D150282076
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epjjYs1vwLxS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A67C280CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67C280CDA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A67C280CDA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4905529b933so18922055e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663764; x=1781268564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MAXGgGE2ENojpTfx815M0KOGYahS/r/GrW0VmpMtzYQ=;
 b=lSJo8QNmcCu/LPz89rLh+C3gAjCMwkdw3LecctgEFryMl6XiNr9U8vM2b1M1I4JBDD
 tQk0ohov0ymeMD6CNfL8caG2SkPIC2tYiNaf4oMrbhzUadv9ZCSUueEQofhalxPrvj5o
 wQtR5adfzqX8v3xDrcMpFsQcNmD3nWQWeTB0rsvIELZMQZWxpL/uonTK5jfStgx8h2VM
 cHcg5/QwWlB5Uqwh/AJLNMFXSAECeK/OuQF7/yztBlsEJ5HncuTQ9b7RD/lDw9PfwvcR
 ezmb3osYxlfn5clfm+jFndU+TbohaN+IMdTJs2z/CQ366TkwOUM2Zd1/L/Ta8klrX8cr
 YqQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/WZDVyMPREe8TF+NCMJLWJRz+Jd8CtFyuiLgth5eRQiZ/r+3vuU0J8LVKJIVk+Y5dhymIWKnmM/bc=@buildroot.org
X-Gm-Message-State: AOJu0YzfAaQiJr9D0wSfUpFcIboVml3F+44yFGPf3Lxp6vLHBjdLE2p9
 rzq/L7mvNAT/4ZQCzKySM73LRnfiyB6PcFoV2pZgkpiYszWCUHKVTzZbgw+uSxUajkE=
X-Gm-Gg: Acq92OFhWoEQDf8SPR7ABF4vDLAOVuWZ5BNh47wfXs0S5d2LSUtAabtvIgIx0UwMp2l
 EaGtOx5p7KbI3PYcXLIp6Kq0+jKG0uQ6ZtUX77cmau9Dp7g3AKwuyfcn0yC/dy0EwNFbsBEfl6i
 V/yc/LwZpMd6CQgE2Mluml98FPMf4gVgbw2eFyzdaw43ZEsqfL8FGn++C1FpoLRiFuX19CJ075W
 yxy6NVJdRym/bXe3G9oIFUNpyCiU4ZNHFrjI73UG099kbYklCRErDsjZllx1EfWpqRm3ai6CTL0
 yY/bqV6IUFXlmu8XMHwz5KrKzKY7AM3zrbb6HyGgM760hxFBT7PtHrA5aCWQocPrviBUVphp4ZE
 O694zPFQKbVRstB9VrnKnKP0Ju8La18DM1+r5Zstg0UKM2eXlkCvJDbDhSL7miwBQGaL6RX2Dd5
 uU5IjyrBmRjAds7FZw2+U2zHii2g==
X-Received: by 2002:a05:600c:8b0c:b0:490:ba61:7981 with SMTP id
 5b1f17b1804b1-490c25c1e4amr51620785e9.23.1780663763762; 
 Fri, 05 Jun 2026 05:49:23 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d2f22fsm23262855e9.1.2026.06.05.05.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:23 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:22 +0200
Message-ID: <20260605124922.271054-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-4-bernd@kuhls.net>
References: <20260425211641.479665-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663764; x=1781268564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAXGgGE2ENojpTfx815M0KOGYahS/r/GrW0VmpMtzYQ=;
 b=MXXNSdzfzumV7sv6EMPfd4elnlV9JF8uOpVPIX6lRcQTRiNY33FDZOn9zHsWDh1JoY
 i17C1CSqCb9lHsnntbmiknKT4N6voM7cCzFlRI0OQslQzaW8Oio94eGPcHGdSsSEGzH0
 qLeJZSNPwSzR/45MUS2xwlE7w/wef9BmcbnrdN/5U25iXmrSliJ3kijDsvP8536iWpqI
 lxERpYJ1aKfsP9oFnS28zvHUFf+QzA2wDBKDdsk5WicfowOKkEQYNEOVuFPdHDN98SLy
 3Ug+9eLbJHVu5t79+LTqSu8IbV9RqttX2rOrlIvR6/Apf1pZlBZ04qkG32XlXMmtKGxJ
 xvgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MXXNSdzf
Subject: Re: [Buildroot] [PATCH 4/8] package/libbpf: fix bpftrace build with
 kernel headers 5.{9, 10}
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
> Buildroot added the bpftrace package in 2024 with commit
> 338acb27ff3e07560290085d7c6a2feab633c869
> which initially provided version 0.19.1.
> 
> This release includes upstream commit
> https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
> which was added to version 0.17.0 in 2022 and makes use of certain
> variables of struct bpf_btf_info which were added to the linux kernel in
> 2020 with version 5.11:
> https://github.com/torvalds/linux/commit/5329722057d41aebc31e391907a501feaa42f7d9
> 
> +	__aligned_u64 name;
> +	__u32 name_len;
> +	__u32 kernel_btf;
> 
> The libbpf package updates toolchain headers with its bundled version
> only when the toolchain headers are version 5.8 or older, this condition
> is part of the initial version of the package added in 2020 with
> buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83. This version
> limit should have been raised when the bpftrace package was added to
> avoid build errors when the toolchain contains header versions 5.9 or
> 5.10.
> 
> This situation caused build errors in the autobuilder, the last one in
> February 2025:
> 
> /home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:
>  In member function 'bool bpftrace::BPFfeature::has_module_btf()':
> /home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:573:8:
>  error: 'struct bpf_btf_info' has no member named 'name'
>   573 |   info.name = (__u64)name;
>       |        ^~~~
> /home/autobuild/autobuild/instance-18/output-1/build/bpftrace-0.19.1/src/bpffeature.cpp:574:8:
>  error: 'struct bpf_btf_info' has no member named 'name_len'
>   574 |   info.name_len = sizeof(name);
> 
> The problem disappeared from the autobuilders due to newer headers
> versions used for the buildroot toolchain or other build errors occuring
> earlier, like llvm version mismatches.
> 
> The build error can today still be reproduced with this defconfig
> 
> BR2_aarch64=y
> BR2_KERNEL_HEADERS_5_10=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_BPFTRACE=y
> 
> on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.
> 
> To fix the problem we raise the BR2_TOOLCHAIN_HEADERS_AT_LEAST_ version
> number.
> 
> Fixes:
> https://autobuild.buildroot.net/results/dbe/dbecf88c7edba357cee8fea31294ddb9f4d188ad/
> https://autobuild.buildroot.net/results/df5/df59e038de47f63d14e1be7bd12dd16a69636f79/
> https://autobuild.buildroot.net/results/359/3595d39dd53a686bbf996dd4e532ced44906b9e3/
> https://autobuild.buildroot.net/results/e4f/e4f95a5f30a605eadb81802075ea6bb1e2880684/
> https://autobuild.buildroot.net/results/bd0/bd075cb8c55f9f8a017711dc804b8d81ae89b4c5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/libbpf/libbpf.mk | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 65061a82bc..cded3734b4 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -18,13 +18,14 @@ define LIBBPF_BUILD_CMDS
>  		-C $(@D)/src
>  endef
>  
> -# bpf/bpf.h installed by libbpf uses bpf_iter_link_info that was added since
> -# kernel 5.9, so we need to update some uapi headers in STAGING_DIR if the
> -# toolchain is build with linux-headers < 5.9.
> -# Otherwise bpf/bpf.h is broken due to out of date linux/bpf.h installed by the
> -# toolchain.
> -# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
> +# bpftrace uses variables from bpf_btf_info that were added since kernel
> +# 5.11, so we need to update some uapi headers in STAGING_DIR if the
> +# toolchain is build with linux-headers < 5.11.
> +# Otherwise bpftrace is broken due to out of date linux/bpf.h installed
> +# by the toolchain.
> +# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5329722057d41aebc31e391907a501feaa42f7d9
> +# https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11),)
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
