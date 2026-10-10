Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2900CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1117A60703;
	Sat, 10 Oct 2026 20:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smu_JHLVqUkG; Sat, 10 Oct 2026 20:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0FA2606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663347;
	b=Ybc05ZJUyhRqqjriEvZzovpp9m3VldVUkLpw0HGjE5DuF47+wvizXo2b7DRFfSsISWgg
	 I1QqtKJWpxjtb7PU6eE7aptduMg2OmuEEpX1NEIDEaOgZ6rakfg72fx1fsLdFVHbyNnMS
	 7y1AXGoq0HW54tXHESa/hqC012/jdxXWifKoYaaW+rQNf3viGulpeMAs6PGzL6OONUxOd
	 7/fMA4ZxRNYH0PIxhMO4TtWgGoz7hWf4rsC/4NmFFbC/jdV/9FddXb5YK8Djvzo9KmLX8
	 6hFCvUbZW2le3zBn4M0kkUFuG1BnUZRlQOpvumfO4qw3OjwGjO0eMuvD56YmOJYCA0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RsJzpX6kuy4hRmvwJOZoEWw/0TpP993TTYVoa44MjMw=;
	b=Imw1KV4zqhDOfu2wgt2WSxGhZ87Z8P8tcqrRKBKVqJuT5faA4d3CwYsIul+Hnxqu6bbU
	 qKbTQLBBOaU4G0V7oA2n351XST6STIhk5nCVBcz7VtllLYGW2VSzVSxrW61cpjC46Vt9H
	 8bUZxHGi4ideHU7/JaEy3bYRSz3etx05ufrq5JcvnzTCIs0q3wG1gUuI058axm/fRlCFl
	 8jQoxltO794wiBokSYG0envdfW3Y+03NXQlJsgUSeKj+3+K5LPVcQdIQKxUOIzGT3fljh
	 FX1l9ImraNItl0LF2IeMvgMSt314/5WTLtgoRos72NG1VXMFHCUfRhhgaC1BRXV/dTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663346;
	bh=RsJzpX6kuy4hRmvwJOZoEWw/0TpP993TTYVoa44MjMw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dfSUyGXrLgaiPmxE1Z+kV8YdVmjI96gf6np1Vy1J7vu8fwdFOorzky6061NUWfRba
	 WtDzD7S+9VcaXaapU3uGLRJnD4hVm4PXOkl0r684786aciWSpoLje/P5lWGyQhoNe7
	 Unu08QQ/Nqg73WdVaH6RH7DAKkL1hMJpbaDEgITjT6O1R4KcrYLeP0MfNoN7VwBpXa
	 csY+Emljiq8k+njZcCRhhSz7CHL4ykkYSIbovE1I92YIYdm+e1QEKottrUFiX2MxWE
	 tw3LRZBDwF6zFdDlc+kiVlfWCCixs+rbbFF8dQSXFUS+lhYSoBUo4LanGPMlLW9p1W
	 r79AGVuh2onbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0FA2606D6;
	Sat, 10 Oct 2026 20:15:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 793DC105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B0EF8108D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrrvS0srl8IR for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4705A8108E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663339;
 b=KmaiCqXEWu5aWAglbYnUG+8RLSH9IXp4/e+YJ9RQCU67LO3s9fg7Kq0F+07yC2GWQL41
 br8fEjjfRSd5Bq8BlG0ZKvPLc67Atcx/RXGhOv8RuP8JaDvZu1HE/w7rxzlVanga5UX5q
 nhS/F/Aohh6YODJUePL1pPBQ6I1dtXGK1zEcMH/a7taPMbdYCyqmtjJcaoVZ8YQi7cO7W
 Qk0pDkFMVsCSvL/vpE+vM8OI8HbxblWnyXQPFZxPuzboohBbY/AjNiVCzGNZXYWgnS064
 P2SaUPs3ASoMnzdcUnxn34A5d2Gkv1Xg34OLiD7Ks2RcccDalOSAD3LjMpwilo6oo0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663339;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=UoL/4BYLxyGiLFcVXRGfxURI/KRW9QK2cQfFGDUeGbU=;
 b=Ur9cDyHrg/N1TzV9/RFZYmbZ0WANSSUZnlM3kHCmoUh5yLnhGWX6SHvCxVfjf3piujAL
 d1tHt+b6njdhMEQjZBY2OLGxkiQNdW9UnEvB41FS/TNN8AgXNRc9Py8Gb9RYiSSJBts7t
 q8o7VBuVYLem1qt2pFl3qrhnwLmAWzox7UhEzHbmSFfn47DPOOPafP7Wfxdvmad+5KzDQ
 7rvJ5CFDW/ZBp7tI/+HX+6z2K1bnyUmT2+OxhaCP5w61Qn8J4axP4jj2E/+97qL/qiF3K
 jaLTBGQMUSKsZ51BtYfFm/p4P5/JBZ1o9oblkFyKN75xtFs8oIEAElRzJqbDynRqPbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VQFoQFyP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4705A8108E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48c4207ac26so733495f8f.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791663337; x=1792268137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UoL/4BYLxyGiLFcVXRGfxURI/KRW9QK2cQfFGDUeGbU=;
 b=A+jVxEJH2OJTy+4bx+/H/BuHZDE/ghF9BALbkvbU9wkr0i4QaENyMTvglit0abVXl0
 ses29lehKzjW0/B3u92hDpdUFtCr1xEq/mK3ouQM+8xgpFBlTrYoYHwNx8XPA3ASLLz5
 YiU9u2azj8bj/umGZGv+33Txl7NswBEZCAnfnGkUt0wpmSdKKHwppuYddKapQIvlCHT6
 s3dh7ZSACldtaoCgcFRv5rMwcELKxKGugZqoU/iFcY/+VmeLNSYQUoGeI1rqINMOtG1g
 nRRPt2O5Eof+xX5MxF60UxQXbvg3t0Z4JB4sYFQBvOglvtlTdhocDZ6fbf7Yg6OX7DCS
 jjjA==
X-Gm-Message-State: AFq9FYJEqch6JgvxL0tCBUUuw8uhraCS2rDIL1wlzcftSkO/4PWs7ed8
 Qmkh8FHNb+MtGCL+kg1djvA7jU9XMdX95eCTU/fZm7BTadlJogT0AaNvA+rCXsIlI99yAWYwub1
 Xr69upMc=
X-Gm-Gg: AYBFou0OJKkyPF/63PsWsegH5rv2HPmxawfXKcgmJYgSoA69y2/GvhDPBGLYcl8TzYv
 0xY9SrAgXtYeXBkkYABmwGc0XF/apnIwTOsekOs5FR+0bkWqVGP2ms7lEM0BHIAU7L5aAEXLgdT
 nl6C1lypyCpoYAGrlK3A+hh/zGHWs5ZYEkVP0bKVCdsaKBT8uBtsIC5bxjCGuf0rneLO/7N4+lA
 98BNqQKRRiJzbWeHnX6cEtDdw8/AHF+eFMrNSHlUG2MQNkMKvtMHqPiftq3zIYZL8LHncqfq1QS
 y6PcfarWB5cUXoOrWgah51sbiYwIRepcVM4ChFGGfCW6XAinoKpa2WCGHcRnYqedNMVHE19jGkT
 nKXSeJL/ZXWxH2N8QNDfYLTcZcKXTfAoNfYwKPtlvGpKYOjYxBEFuQXiRh0lH2VQlXPWAeWXxAK
 LFcaG2T5Kkg7DbDdb1uR3YpYgaLbUr5Bz26/AlEUMoMFx541UFpzWdeu1moWmO9vbzY/R4wr9gw
 Q4Y8Mv3eYWMsUaseJqvRWa8h8w06QxPCbk8QNKSxFRqRmji3K3D1tQPEwdrrtFl3EKCx89CaQ==
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id
 ffacd0b85a97d-48dbaae9e03mr8487944f8f.28.1791663336424; 
 Sat, 10 Oct 2026 13:15:36 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db99b800asm10225432f8f.22.2026.10.10.13.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 13:15:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:15:07 +0200
Message-ID: <20261010201508.963412-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010201508.963412-1-titouan.christophe@mind.be>
References: <20261010201508.963412-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] linux: add first-class support for all
 upstream linux versions
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: ju.o@free.fr, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 git@jdknight.me, thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new KConfig symbols for all actively supported longterm versions of the
Linux kernel. This makes it easier for individual configs to follow updates
of their kernels, without having to frequently update them. This should
generally improve the security of the target systems, which receive frequent
security updates while preserving a stable feature set.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 49 ++++++++++++++++++++++++++--
 linux/linux.mk                       |  2 +-
 package/linux-headers/Config.in.host |  4 +--
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3521fe5cd5..717c964dcd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,15 +32,53 @@ config BR2_LINUX_NEEDS_MODULES
 choice
 	prompt "Kernel version"
 
+config BR2_LINUX_KERNEL_LATEST_SERIES
+	# Helper symbol to indicate if one of the "latest" kernel
+	# (either the very latest one or from a longterm supported series)
+	# has been selected
+	bool
+
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (7.2)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_18
+	bool "Long term 6.18"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_12
+	bool "Long term 6.12"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_6
+	bool "Long term 6.6"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_6_1
+	bool "Long term 6.1"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_5_15
+	bool "Long term 5.15"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+
+config BR2_LINUX_KERNEL_LATEST_5_10
+	bool "Long term 5.10"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.254-cip72)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -63,6 +101,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -144,6 +183,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.55" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.222" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.271" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
@@ -189,9 +234,7 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# requires host-openssl, so select it for the latest kernel
 	# version and the latest CIP version.
 	# This is mainly needed to fix autobuilder testing.
-	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION || \
-	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
diff --git a/linux/linux.mk b/linux/linux.mk
index cd80904113..75294cff18 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -45,7 +45,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
+ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_SERIES),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b11db18379..3cf2cdd4f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -118,9 +118,7 @@ endif
 choice
 	bool "Custom kernel headers series"
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_SERIES || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
