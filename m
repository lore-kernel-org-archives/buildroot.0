Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B8BCF58E1
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07E16118E;
	Wed, 19 Nov 2025 20:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtPyCh9tERoH; Wed, 19 Nov 2025 20:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D2C60B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D2C60B0B;
	Wed, 19 Nov 2025 20:20:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 952B337D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86CBC40165
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGdXIGfyb21g for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76E0240086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E0240086
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76E0240086
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F55FA4C72B6
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:19:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47924)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLoed-000000005Bb-0SNT
 for buildroot@buildroot.org; Wed, 19 Nov 2025 20:19:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:19:50 +0100
Message-ID: <20251119201950.472729-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251119201950.472729-1-bernd@kuhls.net>
References: <20251119201950.472729-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763583591;
 bh=iS0u9NDaDM+rd7tuOtYbIFY19beTk787Klj12593H8U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QP9+CWEAHimf/QZxkZb5S+ybfCj1ZHiXP5LMcJJKFBSmDx55rmFlRJUm0pGIsm2mK
 hmAMoxQDq3BkYn5V2+5BhV9ZrXI6h8KnGPsS8fcr/KYpCJLsvIuDC9qhceh7nTrFGY
 BKBdu/SVj9HQvLm3+BIXi2zb1T3CW5e2qMLyKOmxM7VjCl6hQaao8XtkwdvcQTO11u
 /avcGUcRxHXkLwiyQj2O3sOGBNqsM5MPMO65CvPQlttEQlQpEz+ml1CBDZaP6O/QQ1
 XynQL+GPYo9R04CIuldB0GcgdDbGAqarLGSiZUIidl3Gq0kMlqdW0I3PNnIOR2Ay6k
 GzX0+uyWj4Rrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=QP9+CWEA
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 25.4.4
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
index 37f167079c..7c3aa1ec37 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7b4cfb2a63f6f43db6d9538d5768d692b91f069e1d9aeb876f8e230f5a04de6  intel-vpl-gpu-rt-25.4.3.tar.gz
+sha256  028837bf8d756d5e74dbca4218b4ef5b853b923b6d2361ecc02270fbc63c15e8  intel-vpl-gpu-rt-25.4.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 72a7341eeb..acb942da73 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.3
+INTEL_VPL_GPU_RT_VERSION = 25.4.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
