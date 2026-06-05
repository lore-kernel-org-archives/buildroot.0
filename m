Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F13CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3989E41E76;
	Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmC0uJ5H2SHU; Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541574125F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663765;
	bh=Cx1wNxlMOIFGptnmG9VoxFea1YW7iZEYNHM0k+4Jbps=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kuixhq2rd9S6EkJ+ZkSJqeDIKTQDh6ItNXZvIafTqscnAXlzLut4fwklrPbj+O0Ls
	 7PnC4l5dz3issGVQnoqBvYGVZY4vCb3xPBP5rwB8hmuCox6rJiWnth6yPUA5gC56x1
	 uS0YZI/Gui+K2TRuv5yUTP6gPXsQOjCTC0/1cD2x+/GeDkTrnUY6VouGy/Zc2ZsheM
	 LMcPbQ/CcJHxw7RG/HQuU8CRx+6VBbNYLc7UnNBzxWNIZ6DHBg7vpgl+NkiRlxrcoz
	 ZSpnBmcK2i3NUrpf3CqBnxMv1S8x71RJ7XUDJoVKQqvx2/ydFuxX6vD2eNyLLdLqMq
	 3BYmMLlTyjxhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541574125F;
	Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F69F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45AE260F82
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANYgO1JJ2dSK for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11B7660B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B7660B53
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B7660B53
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so23292855e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663757; x=1781268557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hc+yD3YMOBIVKXWetZ7wK0F5AFOkfkmDRwJ9zsjfDhs=;
 b=IO3WaiXNunzuhcpMYtDYYyUwZfx19bNkRnanmCr0A/L09HMR4ECO+xvtj2C7FM/yjV
 W+nk4zaLzEOAKIbjo77jDTzbZHMhVFIr6+4LH1hClbov+AGgp/Wx4Woa2LNSt5jQ5D9u
 BuQMRkvedS/EEMr7k74koEcBRqt60K1TPqOgkIS3U9ngg6xcWGL5CB5XBTZIL52SpjXp
 V50QsH3ZuoA62RT6i28EZrDjAXCcMl+ZaAvQ2Ym7vtpQ5qs0VABBM17hcTlIReUKrbzc
 xZzORzBedv+s0zGCuLQ/C2G23Aca0Lkidw6vr6iKSPCAsHDWHuSy3z4Qun+z1w/Vdpa2
 osxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9OE26UWILd25kUhqPLo/58t4YpV3B54J2ZS9TLkgbAYD1YYaxa7txTm+8ENfcbnwwwzoxvT7FxfvU=@buildroot.org
X-Gm-Message-State: AOJu0Yw0peTZGqMPBk8Yv9EMHyHcul7G3JszAeKuxlm/VE9U0kcQSH5x
 BVhMt3kPvGebJRslPKBPAwiZ20z4+ko0sdAg3GbZ6l4Hn+CxbR7PEytdFEG38JTQC5U=
X-Gm-Gg: Acq92OE8sJXFVF0yVnWbHLn1JG3k2PQpO5hUCRvTm4SWndxU2jFQNgTG1+7fRS+zS+2
 4t43nOVHmyzUCCp0k3X62bb9PwSbgFCerC/EJs40LYSMUGO5gDWcpNNaMMkf5bw0NqodKZDbmod
 7kZMDo+nuoYObLFw3lSJCQ30uH6/idIFtfSznd/BtIF8WERNpDkxu4sYrjJwWhpreE6TejRxhfX
 d/BxvqmmwuUNPWrgqIYeniQzpTkZy8oeWd1w6H5VQAxzJFy1jwfp9pLibTkmSz4wjdLYpKnVyHi
 tH3mfxlCxssUUfyNWp14vYvLmdKHkbXTayOhugLZ7L757pmwtz88haKVCbVxg3SSf3tsUpErOTK
 Da8Pyefcy2A3imfDvw1hRuSSuJjtfiim3kBKDU5nudzN3ZoGpcmnFr7uoQbJfw7+CpaC+9CtVas
 S+sE3przeM+hzZ95B3WwTn3xPOWA==
X-Received: by 2002:a05:600c:524a:b0:490:b11f:2560 with SMTP id
 5b1f17b1804b1-490c256f131mr61774185e9.9.1780663756963; 
 Fri, 05 Jun 2026 05:49:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fd663sm172591015e9.10.2026.06.05.05.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:16 -0700 (PDT)
To: Vincent Cruz <mooz@blockos.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:16 +0200
Message-ID: <20260605124916.270695-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260218124726.120001-1-mooz@blockos.org>
References: <20260218124726.120001-1-mooz@blockos.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663757; x=1781268557; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hc+yD3YMOBIVKXWetZ7wK0F5AFOkfkmDRwJ9zsjfDhs=;
 b=X1pakL//UNAZqR88etVN6vg6aayeQiAu7Gzlxy0ume/0ri14VZlyG2ebitdIfP/t4i
 kWEZu7B4QlNn4TiSASp7jM2t022a5bKDHAOXZqegGKacwEwV11cjI1HVz02K9dr5jcuf
 gD46SxGuPjfrFo9ifJLUaKkgNCtT3K49GLwtkdRkpJs96s8WutYuQ+dcaVEHl2LjIaa0
 VsxjM67IhX15MbKjscfYlJUExVTeLR6WJnjprEu63nc8jcbcsfhipervtru5v4DQbeYf
 YeOHUp38ZfVhXpZpolokp9oabQcOMOQgx4xurScxoDE2/XD619J6WJ52fAu7syFrRdFl
 p1vA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X1pakL//
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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
> Fixes:
>   https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log
> 
> Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Applied to 2026.02.x. Thanks

> ---
> Tested with Buildroot gitlab CI:
>   https://gitlab.com/v_cz/buildroot/-/pipelines/2331736795
> 
>  ...-sr_cond_futex-only-if-SYS_futex-sys.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
> 
> diff --git a/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
> new file mode 100644
> index 0000000000..d1d2eac758
> --- /dev/null
> +++ b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
> @@ -0,0 +1,33 @@
> +From 6917e00fb6c99a97dacdae7040e5c4c53752b10f Mon Sep 17 00:00:00 2001
> +From: Vincent Cruz <mooz@blockos.org>
> +Date: Tue, 17 Feb 2026 14:14:06 +0100
> +Subject: [PATCH 1/1] cmake UPDATE use sr_cond_futex only if SYS_futex syscall
> + is available
> +
> +Some architectures (for ex. riscv32) may not support SYS_futex system
> +call, even though linux/futex.h include file is present.
> +
> +Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
> +
> +Signed-off-by: Vincent Cruz <mooz@blockos.org>
> +---
> + CMakeLists.txt | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9b36de44..e1b39c8c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -163,7 +163,8 @@ set(NACM_SRMON_DATA_PERM "600" CACHE STRING "NACM modules ietf-netconf-acm and s
> + # sr_cond implementation
> + if(NOT SR_COND_IMPL)
> +     check_include_file("linux/futex.h" HAS_FUTEX)
> +-    if(HAS_FUTEX)
> ++    check_symbol_exists(SYS_futex "sys/syscall.h" HAS_SYS_FUTEX)
> ++    if(HAS_FUTEX AND HAS_SYS_FUTEX)
> +         set(SR_COND_IMPL "sr_cond_futex")
> +     else()
> +         set(SR_COND_IMPL "sr_cond_pthread")
> +-- 
> +2.51.0
> +
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
