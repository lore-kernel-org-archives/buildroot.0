Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82876C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F3A4077B;
	Tue, 18 Mar 2025 16:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWSMOiv-IJ7T; Tue, 18 Mar 2025 16:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3134077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3134077D;
	Tue, 18 Mar 2025 16:07:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40411D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2497340777
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTKEJu9ZmFeE for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D1A540779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D1A540779
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D1A540779
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 517F5A4C340C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 17:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48368)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tuZT4-0000000012I-1qZm
 for buildroot@buildroot.org; Tue, 18 Mar 2025 16:07:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 17:07:01 +0100
Message-Id: <20250318160701.25265-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318160701.25265-1-bernd@kuhls.net>
References: <20250318160701.25265-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742314022;
 bh=XBoDaM4w+p6KO+cOVHX+JTWm0h5cocHKA5W9YE8kQP0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ew2vvXDC4IGBev0uEyUsZc4BgL9pFCvnyh2hODs7yw6Kn7F/eND7a7xsk53JsQ8Zi
 tRw7l3kIesi+4mUmRw9nYWLHBgqpJ8TcpA+SlyfKVcYFleZc/kQ4oorbxGZ/5XmLrj
 JJJb1xoxbnBVUYFdPl/ln9URcFZ3OFWcru9Mw8qmMozhX51ka7hiX0wuousqvrf3NW
 kXQtsWMJnKp0k3GVQZofyJGvZzgFBPisqnkV90o5cMn52AstMRQuap/tIfzCF7udMk
 0cRTqeKGmaP/sWH2jYUL3x+VGlEd+jfQmcur/VF2g1WshGaLS+RMMvxiHLIDIq7P1l
 ndSQVcIcdHSHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Ew2vvXDC
Subject: [Buildroot] [PATCH 3/3] package/intel-vpl-gpu-rt: bump version to
 25.1.3
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
index 22c48df729..1fc4d44a8c 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02a9e9ddc9dd75e87ac3902a7c987b49eff6afe59531bf7ebb90cfcd9a2d7ee3  intel-vpl-gpu-rt-25.1.2.tar.gz
+sha256  28b1ec37cc747db296e0a8bdd824206aa26d14623737bcd94d245009976cc552  intel-vpl-gpu-rt-25.1.3.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index a7cc5ef2c0..4bb98c6d2f 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.1.2
+INTEL_VPL_GPU_RT_VERSION = 25.1.3
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
