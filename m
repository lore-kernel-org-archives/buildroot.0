Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3948AC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 18:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 039376084B;
	Fri,  3 Jul 2026 18:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NfI4fCL-ivU; Fri,  3 Jul 2026 18:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258356086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783104853;
	bh=FVv/RtM84z8lNU8WULcJreQLRPKZIOTLilbzWZmapcw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AncjYpK2fRfNz0cuLGklT3BVTuggIc8/ZG0Zf6SGmfSFeXRQRU12kVsEsge+QiOew
	 9+mnGwrari6y9uh8NQAzH8M9TISLUXSi6B6bUa+9FEZXAs/Yo40adpgqeufrI+wze1
	 TmGHpuAt1oG61L05nJ59VoU73R5RCG24SHG7WZnBYtbVKbV4C9TXVrviavgqUSDUsY
	 clDazmmOcp5Jm30uAHFKIntdAGnx5cB3knlto8gEAwqcm2zNDQUNjZdD6dY4/DU0gh
	 g9CzHUYurj/2/YNEkdWZDLdMJpokkNMm/LoVuZpW+HFDBRe87OA3L/TedFkq42THz0
	 R9lCiN0i1fPHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258356086F;
	Fri,  3 Jul 2026 18:54:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF009316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCFF76082A
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDaUFTevCtwE for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 18:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB6BA607E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB6BA607E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB6BA607E8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4074AA4C1075
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 20:54:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47278)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfj1Z-000000001Mz-2A2C
 for buildroot@buildroot.org; Fri, 03 Jul 2026 18:54:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 20:54:05 +0200
Message-ID: <20260703185405.3686443-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703185405.3686443-1-bernd@kuhls.net>
References: <20260703185405.3686443-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783104846;
 bh=iT8bmIC6NWoThKiOnKVsAHgpt73Ywbf+oF66r0sO/Is=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YM2Ru6iOTq1J4iPkEWqFK6zte4o+oNUdApzkmm6uuHJyaF7ipCm877/3J0g/Ggj21
 7cUhrrYnjDedTGVlZooFo13lFvkBHf5ebGfP/tcKc3z3Bs+/LHhtlOg16BSfVD+oT4
 tYDpmHkP5R5PGb9qJxyXg5Z1k+mIMoPNF9SUzx1bmV4mstjoIvDoliRgej0tFnxSh5
 oeeB+k7nR87LnpJbHSuRE5BRTBUGqBxAb0ilVmaiclAG34ntVW+Ifu5RrkbeisURCd
 tKWXbYy+d6Doa/pNBS5jfVS6q3GLwioN7t8fvauxhIggfYhS1IpExywfmcuev2gLIi
 yowTmVOWafKJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YM2Ru6iO
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
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
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/3eae7f4dd008dc8ee96d4b3b0165cb01bd03d588

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
