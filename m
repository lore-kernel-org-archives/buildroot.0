Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FFC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F58840175;
	Thu, 25 Jul 2024 21:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2LuW8P4yiB1; Thu, 25 Jul 2024 21:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A0A8404DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0A8404DB;
	Thu, 25 Jul 2024 21:28:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27F1E1BF2B1
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 21:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D7C60A9F
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 21:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGzftadDt7V7 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 21:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5926E60757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5926E60757
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5926E60757
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 21:28:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c1e9.dip0.t-ipconnect.de [79.214.193.233])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E0FCA4C10F9;
 Thu, 25 Jul 2024 23:28:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41690)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX60K-0000000075H-1x8F;
 Thu, 25 Jul 2024 21:28:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 23:28:04 +0200
Message-Id: <20240725212804.1039110-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240725212804.1039110-1-bernd@kuhls.net>
References: <20240725212804.1039110-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721942885;
 bh=wLbSNsiQvTahKSn6qhpdXQKqJjpX/P2M/rG4crHZM1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=haWTRVJujlcH8+yWj11XtWu7JEBjx50PvoC6ElPN+5GQFvLkqt2cciDew3OvvCv+n
 qN4f1Wmh/yg6L3px+B/eBzGfEj3QUiQ16CQfQ0d32uQr31sAqP+tVZoubs509XWMra
 pEzZ3gOfQmeyB0/XELMwKjh2lRGaguELvpEbHp8A2eQGGDq2k66+zZqMIkRLUEgEC6
 tU22pfB/iRlTea64tytZsYWyNKJxB+8cqppex5n80AWpZRDBsFsDE7YLUmRVOmL2UC
 lmL1r4qnRLvhd6Esrz/JVm/kcJTROzGY+cv4sTLspLO6OhSpdd7Ujgh4l94/QCVVj2
 xFsy3I/wSQ/Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=haWTRVJu
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 24.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 9c9f6e720d..2b42c7b050 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ccb76812642d84d4d8a56d28df60ef6d450cbb09969a59ee6c4a819098617b5d  intel-vpl-gpu-rt-24.2.5.tar.gz
+sha256  02b01dd73f7c5a4a46860ec01470b484286709cc13f9333a34a089d7e457295e  intel-vpl-gpu-rt-24.3.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index a4daa8d29c..1566b87b49 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 24.2.5
+INTEL_VPL_GPU_RT_VERSION = 24.3.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
