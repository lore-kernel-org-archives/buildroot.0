Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9895E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 998D340836;
	Sun,  1 Feb 2026 18:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5yLK8gn9VWn; Sun,  1 Feb 2026 18:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4829C40766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971258;
	bh=c10sN5a+8uthUaHz/wNC/4lQhAYcf5BLUztqmmoa+FY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KgzEH1DLIFzJ5xzMNEviDIEUz324QDKvbXXbMOR0SvMfgE/FOOWsQt7BU7A4pOe/u
	 NkOzLC6bN8yKv8piL5rhne0QCpMSK+hVONjsraZXRLikK3SInI7WaeCw6UA4Ol8wax
	 P2EAyKXSN4fKJX3T9LQ5Mq6wfYRz0C7/A37TE8WALGoFEZmXY1fqNORlu1X1ScKqYr
	 X9qR1fHi8lk/lbHwj2heAcNm05PfhVqhFthCE70tSGMOUyaxfv4yBMKriULyN4NxP4
	 kZxaaoOIsK/GhH5th5tYCjPBHYU2jDwJulSp1zMWbXR9NhehFF+xw4trYPICaoxX0J
	 vNiE7MseopXcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4829C40766;
	Sun,  1 Feb 2026 18:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 100401E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E827C4004E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otTxL5GQfeyA for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9D5040022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D5040022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9D5040022
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E716A4C55A2
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:40:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55310)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcNC-000000007eO-2CZj
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:40:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:40:38 +0100
Message-ID: <20260201184038.3445579-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260201184038.3445579-1-bernd@kuhls.net>
References: <20260201184038.3445579-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971238;
 bh=BYwgwU6uIqUYBgr7z1A+N5ur6j4Xim1/r41XzvkzHeI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=X0nqgEcsoDGvvrJ8L7V2jghT/EImAZVCIGRP7hmPdBLxcwitXfx2KWagrNivX7JMb
 qr/KwICinExDGG2/+BxPJM92nSrBsMUAo0L7dEFkl52x9XN74mbqBqDKj0nJW9DAoz
 FvzCEBPl6cZzaCZ57bIF2AXi4Cub6SWOcp4cRox288y+Lu1xJ7muyM0bQNtxKZsNWb
 ThaDsKBKsjChf/xGlNJvhDXhdzXIaytUYniKO5hGMK34CYhDqD8O5y9RgeWHkMFhv8
 tRLnd8ATsoSw1IFZyuZ5IwqkDSQJ8Bdo9crgdKptPx127Kv+v3MEfK0rHvVBXnA4dM
 4XFIk3Q/S+asg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=X0nqgEcs
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.1
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 6bbade9327..7497d862db 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  876c76714e891a44b1da7aad122318059bfedd17a5f4d2b3123efeca35aa0144  intel-vpl-gpu-rt-26.1.0.tar.gz
+sha256  67fd57d1c5709b58bb6406d60e3f2c4e0b47bd38c4a82c4c46619b78f6c23e72  intel-vpl-gpu-rt-26.1.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index c41b7eb051..54921be12d 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.0
+INTEL_VPL_GPU_RT_VERSION = 26.1.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
