Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E97C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03134608CD;
	Wed, 22 Jul 2026 22:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJyG7g9GTrf0; Wed, 22 Jul 2026 22:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F5A608BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784757670;
	bh=HvKjVroFRRizR9mlAlLnOtIoEqE72nfVkVU/LtvJoL0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEQ7YSAHO8RmhmTJIvnr3lunbmz+hohaDRBy9vvY0C9CDrl7VJra3Yv8bpilCZZ/Q
	 LrVl5irOq/t5zVN+PSUKRa3i/VBxuL4lNpmTfpboyNBqbre4TZS0f8cclTSO/EfHzN
	 8cpp6ItlgbrSUT5OVPS7JBpMzuy6vQhys6EEzXTG2+tUTFNBsCeibv7x2keXbHcBJi
	 zeAPUZLQeUnQ86V0Gwl5CDyoZkBMRCYplqdJuQK4FAKD4mhu/bhgTkp/x/UAOPqtNO
	 qeMeGpzcFBXIpJAMRETIOLqpjV07H0szdLZs01Wwaw5RUu3gUQIx1FPDkQmznvyqnl
	 H+D2Y68Q7ec9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F5A608BF;
	Wed, 22 Jul 2026 22:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 872BA390
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCAC608B7
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSjSzW0fGoMo for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 22:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9D66608BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9D66608BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9D66608BF
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:01:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0aa1.dip0.t-ipconnect.de [91.58.10.161])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C46AA4C0534
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 00:00:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60818)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmezi-000000000Av-1EkU
 for buildroot@buildroot.org; Wed, 22 Jul 2026 22:00:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 00:00:49 +0200
Message-ID: <20260722220049.3618182-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722220049.3618182-1-bernd@kuhls.net>
References: <20260722220049.3618182-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784757650;
 bh=YvUSgXhFsmtIrRH/rrXbGlVLlgx/jCRfacHrncflxP0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MRWtjMJOUYT5c6gnA36ll8f3JGVspAsbAo8UEpi/MgTWMa71jPFCuW50y4vFen9eV
 5tY9TTuIvXEWa0EgSenhU7WMcn2Mr1YAMRE44uBhVnHtCRymLKfXMrjWkeTSFMZs8X
 HiotNw2NeVb7C6fzuNRrrHM9n3eoCveB0oeusCHoFpTUk4dLV6odiKD3i/LgNqPKEa
 4SYYXmPfo+a3ZpTlXKd0QxpvspuLXh1ZEBspegLiHQI+OPPy0oxFqb0ZbqV67j67DB
 cUCrrFviSR4N9p/TOZWop7D9pULITZBiYWFhMxAmHkBV2xkCDv9Tet3oD95Tnw7ue/
 /LyU8uvwRE9MQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MRWtjMJO
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.3.0
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/bbc3d4fbe215d8c1b372591da5bd624d28cc1963

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index ab25475be0..0cbfda2361 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c103d936d708a3910ef8572e9403aabf423197cfce6c8a6fcf870072b6564ada  intel-vpl-gpu-rt-26.2.4.tar.gz
+sha256  205f96adb1ace4e853d576eca462d4cbd62b9c65883493d2cd0ec33d484c0120  intel-vpl-gpu-rt-26.3.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 3cdcb40d9a..de2e9380e9 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.4
+INTEL_VPL_GPU_RT_VERSION = 26.3.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
