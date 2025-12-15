Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF76D59D99
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC13A408DD;
	Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBpDba7APCMz; Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F8F3408F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799002;
	bh=iXHC7vDN939FwlcrKWuDMsjKqojD41uAnllTdl/Yu+0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JitHA8UOlVvqcXlmURQnxZYz8b7hrDAI83rk/oCHFDlpLoBAiZX0jzMsz2eXny4IX
	 +U/FfI4cMQTlD9v5YmFwoiqRe8FCxbHJKlbA3EFSpZIGs0qd+17UM2DehAvYFkK7ZT
	 VgoFlN+m4ASurTpuHJ8pZLJTiY+TJukZ3Hh6jPelPoj6ENom0Ab14m1fR4S+p5sQyi
	 ppKG0AvFVIPSwcXLEmRPAp2ZvrOmNw4Gv1gOgUFqZi/WrH3alMUF1fcGCr8DxqVyuI
	 +UQAB1zuqVWjrsnw+XE198oybXf9+lxMbqW+7YLk0uwx+C9Q94hdclllVTfoZmERlx
	 RR9EX6kcSrizw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F8F3408F2;
	Mon, 15 Dec 2025 11:43:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF1C8117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A58C14077D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6jos5r61kQS for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD9A5406C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9A5406C6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD9A5406C6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779a637712so22417275e9.1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798998; x=1766403798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=hugKTF70DBJ9hkeEw8aB8oXNlseNWr1fFnFS+jLVk51zUx3NZ5fBhDVh8U7L5XA2Aa
 BtK1MnVP5AtYOdKNmc077ebdlZXcu6EWzMLk3dELF4VxZIwpeOfEPR5Z0hG1Tupb+H7m
 bNXXBVPy+WiIwZjfel1ugkjr+xvAbWzUoKb7UvYKNPB1L4kCrsmjkgvDkXDuOD3YIQO/
 tXAWEB5iEn5e9lKnD8OEGxbI2hQzp3NSlBI5GubGMGsEJGojbL+shxa+5FiKa2Thec13
 H0lNFUTYCD6KFOFj06gh8If5WWapSryx+m3z8ZjEC00ky8mXtisbR4521u6IxaxCieSo
 FxSQ==
X-Gm-Message-State: AOJu0YwRlJSHTkRZgdDI0lE68tN994jbDs52P48Og/uWBBXDshGe6SGU
 rjLjhMFvoQPYnKI6V8L9muViSXRP7cp/UV+1Pbj1yHySQ6pNdqvjMAW0FLb7+w==
X-Gm-Gg: AY/fxX4IE/OL+jpLQ7NmlsGj3MkGTfsxc4GRMHfxK7X9/TvE3uSTcd7AOOSysUg9fUZ
 LEZRbKEGwL3IqOjxcDH2ivbYi2lwjxa/9z6HQfNbazOSoA9FE1h0R3TsqO33lngWYetZCrRjs8e
 5T/EFacFh4lAuW1HDZ6Fcl6MSAx2nn9ocIMWavPXOttxtbrLF97mAuLx26LKe1K8RVCbJ+Mg6pa
 5brk6esrnja5rB/9H8pAxMKH8RaSsRvm+tOYLAaeIVxGzoZwc9hDAXSop/OKU3sPALsMSmAv6B0
 fw/WUyl4+guwrsYM90ycxN54ShEWOQbp8Jqs44Bfax2IXPIBISFYjWLTf1iko1XZVF2Lri6/11A
 n9/9EMvk3k6Cnh8HzhSHZUyiwlbfA2/XE8VXCn0S0p4RP3MEnMTCVcvjVakPZfMf9YHO4XS6lpk
 WA+7Y=
X-Google-Smtp-Source: AGHT+IETv9DgyXfDv6/b3rkgLPAKGQfbKKtj068I7O+d5qhsbSNd+iczPFXWFNl23eSPeb/SdcCrQw==
X-Received: by 2002:a05:600c:8718:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47bd2a6f231mr10454605e9.21.1765798997753; 
 Mon, 15 Dec 2025 03:43:17 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:17 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:42:57 +0100
Message-ID: <20251215114302.32596-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798998; x=1766403798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=kTD63lltV+mT8Tv14clGBrEN9Jm2vgZnCiI1p8+4Bi99VdW8aOQnlmLVFZ/SdqeAk3
 hotBvMPtv5xbzirxWRj2CRRDr0osPSkPhWkt1Lwp9KChkHTIZYv/UN2SlOlhbX9sXmvr
 xZbufSb0SIV/NIbVmApwpNcf2yT9G2+DfDkOLIqbRMg7koy7fyLTJ2ud2VjI7wRteS6e
 V8CzpVb3nJKEBZTMQ74rJ06XwwbvwSq61gXGkkMabLkvEW4MFpaNCJi1rCeJUQ/v8huY
 AeHnoie1JAO1ZKC05eEJU/FMd1WNzV4MP/zjAvRCdQ4qqKCBqkq1MBej6SP732WL1Pk7
 +hwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kTD63llt
Subject: [Buildroot] [PATCH v2 2/7] package/dpdk: make drivers selectable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all drivers (-Ddisable_drivers='*/*')
  - list  : pass to -Denable_drivers= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 7d4a002002..9b6b367ee8 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -43,6 +43,27 @@ config BR2_PACKAGE_DPDK_EXAMPLES
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
 
+config BR2_PACKAGE_DPDK_DRIVERS_LIST
+	string "List of enabled drivers"
+	help
+	  Controls which DPDK drivers are built.
+
+	  Values:
+	   (empty): use DPDK defaults
+	   none   : build no drivers
+	   list   : e.g. "net/virtio,net/ixgbe"
+
+	  To list all drivers found in the DPDK source tree:
+	    find drivers -mindepth 2 -maxdepth 2 -type d \
+	    ! -printf '%P\n' | sort
+
+	  Note: providing manually a list of dpdk drivers to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 4843ba2667..829b0cc640 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -47,6 +47,15 @@ else
 DPDK_CONF_OPTS += -Dexamples=
 endif
 
+DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
+ifneq ($(DPDK_DRIVERS),)
+  ifeq ($(DPDK_DRIVERS),none)
+    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'
+  else
+    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
