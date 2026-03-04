Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E905DEFCE3B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD6C6068C;
	Wed,  4 Mar 2026 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUdAd5T4o9Hq; Wed,  4 Mar 2026 18:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9215E60668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772650586;
	bh=ZunzANfc141H2TOjmsrnLb7CylSb+wzz6mr68G11lE8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Za/9n26y3ggw4pf3x/kj0RW7Q0wbMOMVTRe9xxEjgLHXQn3HAicHfvDVepbU4w5LV
	 SdHo5AaLhj23m28hhlOZqTxtOn9MAu+/6WB+kA84xUwdz+/kyhyVCs80Ii/GaN9Sh6
	 q5Oix3IR6BV2k/n3l96CLgrwtP54mX49yT/R9trnx8OFDPVs0F5Vu7SOfln/CLURzt
	 lL1LUrMraWD9Y3AdxOAygURGbe2J/S0H9+08y1ihQdnkFnnXVLUW/k0bc/ppeTatm9
	 J+I5Vh3TmUBTiyJPRzZs+lJM+d7tglrePjDjCPXEScjgtp8yrP8ENRZBTheL7cAFDh
	 EmCDKPVRMs51A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9215E60668;
	Wed,  4 Mar 2026 18:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58031223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49998406DD
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CnXZ6PuGlqo for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0110406DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0110406DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0110406DB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59285A4C3341
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:56:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54776)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrON-000000003Xv-00Km
 for buildroot@buildroot.org; Wed, 04 Mar 2026 18:56:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 19:56:18 +0100
Message-ID: <20260304185618.3474153-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304185618.3474153-1-bernd@kuhls.net>
References: <20260304185618.3474153-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772650579;
 bh=Iz1Tm9Y/9f9Ftx5Nb4tCaX+PjKNgTQtjm6ZZ3gNn8zM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=F7msR2Ey863WlW++wTdFGYUDE1s9eOotUP/2vJwLDSY0GZZvlcGwYbMELJ6FBH9Gc
 w/IKB0F46g4akWc73PCWC7KRjG8mNBEJYVGJW6CAv/DVKzTmTylnup8JvIz/HK2eH/
 aDnxuPPVXzIBg7ttaKos+PNrS4TveptOCfat+R9tbB65nZC0feHF/xbydDRabgKTSD
 FNDAGges8fc7yauQFIP89s1pFNY8UfEHXOYS7TJjjWcjWB4VRAYR9QXEIdcozL5sz7
 x1GIdgu/NtwnCnuZezl9pZR6fij7Mml1S762tB2xoNnkEgFrdhdoX6y6isXUuS9aZ+
 4hia3Z9RHF76g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=F7msR2Ey
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.3
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 9cd12ae9c1..5c02ee24ea 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1f0b4a81b206253d315d795e5c075312f6b20e0110c7cf9bc83d24bd548fc015  intel-vpl-gpu-rt-26.1.2.tar.gz
+sha256  27354264bc3a60faa89478e555b382bf359989c7f3ac7b8fad2c4447474170d9  intel-vpl-gpu-rt-26.1.3.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 6468462fc2..f73b6d9508 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.2
+INTEL_VPL_GPU_RT_VERSION = 26.1.3
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
