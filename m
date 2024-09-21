Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1FBCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 17:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D2A40232;
	Sat, 21 Sep 2024 17:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wXkgLgLDVWl; Sat, 21 Sep 2024 17:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C68402F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C68402F3;
	Sat, 21 Sep 2024 17:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFDBC1BF479
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E33A402B1
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUohR1xHZFYv for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 17:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8205740279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8205740279
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8205740279
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:27:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0be.dip0.t-ipconnect.de [84.161.176.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C1D9A4C2641;
 Sat, 21 Sep 2024 19:27:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43696)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss3t1-0000000048F-1Flz;
 Sat, 21 Sep 2024 17:27:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:27:10 +0200
Message-Id: <20240921172711.3642889-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240921172711.3642889-1-bernd@kuhls.net>
References: <20240921172711.3642889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726939631;
 bh=ma0mzxv0T3iKIHWiYtydyyjQdnrKqPqpyoG2YuR+lZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BTxIHEJQjJO5jC8G8dXzuSAkFrx0lJ9WUpiwXEGi7G4ztQNN02hdV08fYzaudZhS7
 gRR7oCYIlvSMN+K+ysTKGC2RFccd5YPsiUhpbD0TD08UVNJJupC4unhAFYoAIULXCA
 PMdzITd49sImGUVG1YoH66ikXrgH+pnvqSdead5h4mW3IvuGQSMrzuDeXdN1lLFMH7
 cfdmnH55X4ykiaCnQmf46aNdBMAX2sathIAJbgbB/qpJK0pOj6JJWAXr2DcJF6oHc3
 WLyTwk67lScIvURfmhQ8efhGpE+S/5ALGADM4/Pl3s8/PKaLK8GmAAjgnhTnY2o8C4
 /Bgzbe1E31KJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=BTxIHEJQ
Subject: [Buildroot] [PATCH 2/3] package/intel-vpl-gpu-rt: bump version to
 24.3.4
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
index e962af7258..a58ba30331 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a6afafc126210e03f41eea582049bfd629cbb985687db3f5c5a35150b9e0f5b4  intel-vpl-gpu-rt-24.3.3.tar.gz
+sha256  978672104e6767223fbfb34fa9a0c0d954dcff9109891dc4911413dbc553ed71  intel-vpl-gpu-rt-24.3.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 9b3136ccbf..1a80af62e9 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 24.3.3
+INTEL_VPL_GPU_RT_VERSION = 24.3.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
