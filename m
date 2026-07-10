Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C49C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C915F812CA;
	Fri, 10 Jul 2026 07:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8a_HEoGpHIs; Fri, 10 Jul 2026 07:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D042812C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668023;
	bh=yhDkHiNxlJf4LiSJWThxVDIQrgwkCCDVxykKqK8S678=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVzb65t1LF1kKA5PeOdrvqDh/rRj9sFgmv650Ml1ZFg4LKxPdSzw/sRal8bXe12mS
	 y3iSuxHq5EycFExEDgRoV6NAF/DEzK085gQoekivEQN20h37TvSy+qDteY+CPGreNj
	 1Yd3lLyyjdqF7YkPmKs0AVmYk317q7kqxHlvbBjLBpxM5rjY4jH3BhoePUeFtZV8Gt
	 337c56cYdo+JhRsKs0cCf5zbgFaM2C71vrjW+M2BMlt7pt0m/zgSNlDBaQgUjj6ywo
	 tlH18n2Wchmb3PegT9t8CcJXZxfl85cnqdlAiR9FHAmpq7CXaGLBmPEyM2LQ/2DXwS
	 e+YozESNvF/MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D042812C0;
	Fri, 10 Jul 2026 07:20:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D08320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93D9812C0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHtzU6jTm5XF for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82C16812BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C16812BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C16812BF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADB83A4C328A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 09:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wi5Wl-000000008GF-34G2
 for buildroot@buildroot.org; Fri, 10 Jul 2026 07:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 09:20:03 +0200
Message-ID: <20260710072003.160464-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710072003.160464-1-bernd@kuhls.net>
References: <20260710072003.160464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783668004;
 bh=+YVL1eCeu5dbZjLh/nscsf2JSxTjJ7PybpsMYLwhJXg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OEoJNVpEesteJViEtdPdRDe12OseEeAFWEn4KcGPMafH9NcKAegKKWabE0T4aXn7V
 NbjPf8+sWGxnMcw7ijG/NbNIqBIqeQeKaDUPOtF5F+20GsGKDBKOGJkcPEDAywAifh
 P4UIr1FQHSYTGu9WfqtqvWmoVjChpSpCDadYYj8AUdfIFbpqMqC7csFBxUSX4rfcAZ
 MXMyA9FgVvwzGH3DTUu0T6anfRm+tPDMzpYV/PadCuCXO58cKHtl6dbgLRE75xpdW5
 vP/enpoh+mLOfZKQk8M1Sis/cj//PF8ElEEo7phrdr/foxux5mm/nKMbpeNxADPrjN
 7isT2M6XtrHmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OEoJNVpE
Subject: [Buildroot] [PATCH 5/5] package/intel-vpl-gpu-rt: bump version to
 26.2.4
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/668fc1fd6c25e7abbad7dbfe140e34c7187e1f75

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 325ceff9ff..ab25475be0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7cb0ce0c3b22e7f370053db5c363244feb8900fbd63da84f1e13f82776f8fddb  intel-vpl-gpu-rt-26.2.3.tar.gz
+sha256  c103d936d708a3910ef8572e9403aabf423197cfce6c8a6fcf870072b6564ada  intel-vpl-gpu-rt-26.2.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index b2bef9c6dd..3cdcb40d9a 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.3
+INTEL_VPL_GPU_RT_VERSION = 26.2.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
