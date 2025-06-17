Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9621EC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 21:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694DC6069E;
	Tue, 17 Jun 2025 21:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRslQUOLrNHT; Tue, 17 Jun 2025 21:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A714A61040
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A714A61040;
	Tue, 17 Jun 2025 21:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E576151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648358169A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh0WLrjyPXrY for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 21:03:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D2E1814C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2E1814C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D2E1814C2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:03:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48BB2A4C10CF
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 23:03:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40092)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRdSq-000000002Jc-2lbY
 for buildroot@buildroot.org; Tue, 17 Jun 2025 21:03:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 23:03:28 +0200
Message-Id: <20250617210328.1146510-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617210328.1146510-1-bernd@kuhls.net>
References: <20250617210328.1146510-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750194209;
 bh=UJz/OufoLs17EvyqFajpi4PJZ+UzTsu8ZOM6jlM9MWU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IDEem6TWpTH+/9+HN4DceISrG9TOCjzzR/WBbWrMYOwOv+S3GEZiKxWFOK8hFGrng
 BLDuwToCOO7IpCaUGqUPmmTaYrUqMfEtct/ozHXFGxcNSL0t5wPP0+ahjDGzbOo/oS
 hNzkVjiziCnTY9KU9ND7mbBOY06AudvyCyVVx4qIoSpW3S9qk0BUzJ7aaq2RPttZwJ
 1eMMVPBHQDOU93XUqCVPRAv75ChVLNtAAgJZzPhPUTm5BCKfF3Is+tkFPUXx5QJ1XE
 Fe6mOUd3MVjlXOCMkpcg0MovF7S9wRmnMHWaM4McMqXWgNVCU9ggzpjWYFMeP3z+5h
 /RoDf4Apaj8yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IDEem6TW
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 25.2.5
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 61dcb38137..a07cb80b73 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88c6740852d69c9584bf9d915f64b503f840175685ba1d8741f8b6928740fab8  intel-vpl-gpu-rt-25.2.4.tar.gz
+sha256  8b37ed5f019d722551b5b5c7a31fa2af3ed0287338fd5c8c18b3a41dac0d4eae  intel-vpl-gpu-rt-25.2.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 3cd6f2f5e4..dbb28d2b80 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.2.4
+INTEL_VPL_GPU_RT_VERSION = 25.2.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
