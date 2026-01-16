Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBF0C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCD78043F;
	Fri, 16 Jan 2026 21:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dA7_Kf-J_zl; Fri, 16 Jan 2026 21:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 922B984C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768599257;
	bh=05GwlWnJ0+xtwrVIwtmAKZOHyjLv0TUau7HLfREI+iE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDrOF5jXUY1jGrCzem3BhZ7XjVkmP3M7vtMJ7hmt2s20tHsjgWiIM4h6VPzsqc8WL
	 mOl6LGH1+PM7+dP0+9jKQ8BVgIaDn8+pJmxM5gNPIyr1Y1EYvwDtKDTneCLjYTMPKy
	 9xztDfhNmMZV/ou33HEurAROz6hbh8D6/BSWgo2QHJaLM+px+akJd06M/2J3wHzHtg
	 XqIO2gL1sd/2nXTnM4jRBwiMEewtI03LA83agN6TDPIGo4o89FyVjWrXI8kUs5Nmy2
	 sOJhl7AJxhlrYrZFy7/tXaqGIzok0hMB8/pWtIGW5VMn0OE7LB6Sf9mEID0uEnHEsF
	 e6EAVckNQ1T6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 922B984C11;
	Fri, 16 Jan 2026 21:34:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24645160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D8341BF8
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fsgER00W2y3 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ABF841BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABF841BF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ABF841BF5
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc04.dip0.t-ipconnect.de [84.161.188.4])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30036A4C427E
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 22:34:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50322)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgrSB-000000006Ck-1mKN
 for buildroot@buildroot.org; Fri, 16 Jan 2026 21:33:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:33:59 +0100
Message-ID: <20260116213359.2747785-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116213359.2747785-1-bernd@kuhls.net>
References: <20260116213359.2747785-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768599240;
 bh=OqBScm8v65si1ytMmbbgi5mEURIrmpUsE59qCB8NfGw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Ayl3dG4V8SPinlr4raLNN27ca8Z7/XBcTrNR1/NGjJuAMc7H85ZUDvF758qI72YDE
 wuIc7du+IcY1b0KC6KUROYPN3fVdXJUY9cm6PMSwjqTBe7FeR+UXKLKEdT2zK794Os
 M1OwNEa6slOozIY8UA6WM90EQOY/bwCnehje48IMh9ZKYUb0MoyhowBrNmdTbIb93z
 3Qx+27xr0TIMJlGMhYV4VL8WJjG1W9BJx+DR0tYt99FNjuGs3YEFknCzS2mg9tTx8z
 PyrEFDGCRLBxsNv8Ua230DX4ZT6dblGBbC1myQS3S07ii+KV0GBSb09DHGXXyF6+Hx
 +OuG77qS0OhOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Ayl3dG4V
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.0
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 720503317a..6bbade9327 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4cc2429fba49ee1d5f48883930e2e7325f0af38af83c8048793c8b1d3fa4a8f  intel-vpl-gpu-rt-25.4.6.tar.gz
+sha256  876c76714e891a44b1da7aad122318059bfedd17a5f4d2b3123efeca35aa0144  intel-vpl-gpu-rt-26.1.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 6f5abaf9b4..c41b7eb051 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.6
+INTEL_VPL_GPU_RT_VERSION = 26.1.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
