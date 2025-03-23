Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCB9C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B70280D95;
	Sun, 23 Mar 2025 19:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0C_5yOb_loyk; Sun, 23 Mar 2025 19:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4552810A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4552810A0;
	Sun, 23 Mar 2025 19:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9695FE2
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CCE14026D
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9NrB3RtkpgS for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D37594012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D37594012A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D37594012A
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:06:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3209A4C37D6
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:06:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49542)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQe2-000000000i9-1EVH
 for buildroot@buildroot.org; Sun, 23 Mar 2025 19:06:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 20:06:01 +0100
Message-Id: <20250323190602.3336195-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250323190602.3336195-1-bernd@kuhls.net>
References: <20250323190602.3336195-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756762;
 bh=QlhdcnC1Mcq7NVb2ulZV/tldkixbktCF+D5Ke0Y5Ftg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UHMyd7DaZnlMutqkq2DIyoiNSOz2WKQUNJpOzd22Lcny7yFGQGs3NTE/nkViC8Qvg
 ajc6kit/Y8ShJCyUgOj6r1lmnCxLwEtwccdrM2oMrJ0fmqr6xkm+4oxd/UvWawRnKf
 dg5UfTAArGvuXT6rM7OLgI35GeGRVEZhhP49/vJOgfPNvEP5f1GFDZBWIYoGq53P+H
 RJULP4Ie/snsuFhibewSn5WPgSufWUVpgA5vjyd2wa5ZTi8ahfLftlFiCG4ilsp5cT
 WQ3XBOxRjdtvfNCHDt7pAUnu8LkuShMcPYbSV0I1FeVMxiEclVZ9AL40S7v3xZxfng
 QfgZ1vjvsJo5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=UHMyd7Da
Subject: [Buildroot] [PATCH] package/intel-vpl-gpu-rt: bump version to 25.1.4
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
index 1fc4d44a8c..f49c4730cc 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28b1ec37cc747db296e0a8bdd824206aa26d14623737bcd94d245009976cc552  intel-vpl-gpu-rt-25.1.3.tar.gz
+sha256  2ee59a47c281f402cd77118eed1ec7cef703d25432e9a71b4be6b91e8c304d72  intel-vpl-gpu-rt-25.1.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4bb98c6d2f..42ead61dc2 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.1.3
+INTEL_VPL_GPU_RT_VERSION = 25.1.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
