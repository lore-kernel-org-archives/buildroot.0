Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A8EC2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB3A4055F;
	Sat, 22 Jun 2024 08:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra8g0gPSEYvL; Sat, 22 Jun 2024 08:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C844404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C844404D8;
	Sat, 22 Jun 2024 08:42:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 535951BF865
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A2B86067D
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3y3h1LGaY0nR for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B587760628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B587760628
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B587760628
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:42:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4791DA4C078B;
 Sat, 22 Jun 2024 10:42:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43162)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwK9-000000001ar-3N7F;
 Sat, 22 Jun 2024 08:42:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:42:15 +0200
Message-Id: <20240622084217.10423-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622084217.10423-1-bernd@kuhls.net>
References: <20240622084217.10423-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045738;
 bh=Ggk4lqzjgz7Vv+/6lnFZkKIpqA76vNRxVsPzdNT+uCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dvc8WvMszqsxAQUZWxwRyxtycB1toVul2pToBqVK8SR3XiB3yzU4bGr4g6D3Pcl6N
 H205uYl+R71fNw+/ruXvgJ6IS/j6CK2uNjc0Dmq2Z5/zXaAAIEpuEqTOpQDUrRNm1r
 ACRzZmNbsaDUAjqYkbJEE3Cn1U034YzRommdG95ZTVF4oAslDwyfKUlIgmffSMfaF6
 Z11ROeH71/1wLWHToXcjzCuCmZPJfO0uQpn7UP4sJJB0DOzKxPbr9E9LG+ZEURjEql
 Qw+p0r8dvNRAkKiA38ExoEcVDhrgGynBV0iopw9mqDGmXR2rksKCBvakqjQxXMGRDw
 qRZCMefaHEy9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=dvc8WvMs
Subject: [Buildroot] [PATCH 2/4] package/intel-vpl-gpu-rt: bump version to
 24.2.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
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
index 6b57b4674c..9c9f6e720d 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b261d87d91a56a6a462f6a129ddd97945a49637995ee6aa67ebd9b26c0a3c1a0  intel-vpl-gpu-rt-24.2.1.tar.gz
+sha256  ccb76812642d84d4d8a56d28df60ef6d450cbb09969a59ee6c4a819098617b5d  intel-vpl-gpu-rt-24.2.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index e3ca68926e..a4daa8d29c 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 24.2.1
+INTEL_VPL_GPU_RT_VERSION = 24.2.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
