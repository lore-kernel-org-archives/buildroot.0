Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ABBC021A6
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A8160AA6;
	Sun, 16 Feb 2025 13:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17YsDzMJfZf9; Sun, 16 Feb 2025 13:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DDBA6070E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DDBA6070E;
	Sun, 16 Feb 2025 13:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21FABDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EFD81959
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fw-sJo-SIDjC for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B95481B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B95481B72
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B95481B72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:51:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b112.dip0.t-ipconnect.de [84.161.177.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55EBCA4C49BD
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:50:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35518)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tjf2r-000000000jG-0gYc
 for buildroot@buildroot.org; Sun, 16 Feb 2025 13:50:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 14:50:52 +0100
Message-Id: <20250216135052.2068813-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250216135052.2068813-1-bernd@kuhls.net>
References: <20250216135052.2068813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739713853;
 bh=CHWf4i4nhajv5HMUwPNhJlEO32tY3WM6SdXycMSM5fw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WZ4z3tCjABuohiUlXv9IDasJljrPmxXrp21KIC4N+u62mRnk0ws/KIa5xjLcxO43c
 9qg7/DSPZOZ06QSqyuIOXqjwCq4WStjiJPGhQW1MLtchxNSdSWCnQCtx7raZ5BrCa1
 OmQ0X/OWYlunsWkqjPXs6bbQo2QZYVvlxS77MQWsdaiDN5L7iL5v9+GsWYZRLwXSl8
 kZNtMjyprog6WcsPRWR5ddPEqgdQU6EQtGpnxj2gnXIo4dX18JubhcWQSvUDnFrvho
 UaqmjcL13eHuKlA2ZATsIDUjrkWMSQqioQu31fesf24HzlKfxFsXhh8n4JZUyTGi3f
 6U+g6eJAwakxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=WZ4z3tCj
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 25.1.2
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
index c3c59d957d..22c48df729 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4ba550244827d554c8b36032f1535290c816021242153c2b503dfc45219b95f1  intel-vpl-gpu-rt-25.1.1.tar.gz
+sha256  02a9e9ddc9dd75e87ac3902a7c987b49eff6afe59531bf7ebb90cfcd9a2d7ee3  intel-vpl-gpu-rt-25.1.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index ebed6a1081..a7cc5ef2c0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.1.1
+INTEL_VPL_GPU_RT_VERSION = 25.1.2
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
