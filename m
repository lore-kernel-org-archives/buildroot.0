Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609ACD3DEA9
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 19:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7710405C1;
	Fri, 18 Oct 2024 19:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcL-YGjYS4pN; Fri, 18 Oct 2024 19:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB9C406C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAB9C406C3;
	Fri, 18 Oct 2024 19:07:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A31642073
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83B5B40141
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2Rj_EbuE-tC for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 19:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CACF400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CACF400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CACF400B9
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c50d.dip0.t-ipconnect.de [79.214.197.13])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76C6AA4C2342;
 Fri, 18 Oct 2024 21:06:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34292)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t1sJL-000000000JT-02oA;
 Fri, 18 Oct 2024 19:06:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Oct 2024 21:06:53 +0200
Message-Id: <20241018190654.29370-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018190654.29370-1-bernd@kuhls.net>
References: <20241018190654.29370-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729278415;
 bh=OwwzEjauyVdpiR9NhARPR00cYTQrQmRXyHaffAr9cCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKOByFYviFoWsYDnHqz3qsJaMInWS26dc/ke6sCe9q3axO8P8u6P06X9/HtzSYQQJ
 4RWE8zouLRZVKqkrCr4AnQV4gSJzJww/0ZBTlQhLwfHOM0rRLiqDCG2qiAtVQ/LHqk
 mYnI6qv29qvkdqbmTEnHymGDfpW5Xwj5e97UuGpotwjBwJ5mD3Ejm3SQEY4M07DhHQ
 wdt539M7oLtxZ92rPZCW++dtTJr3XYIxc4cWlKiC4zhvNFXybbCZQmEEtqPJRnmRR7
 +Gp9+i3IZYJpVOGf80FbIGRR718sz+h/xitz/rsRdTlbxuM9aXq1xSbNrQsFdPJOo+
 tCMpMZ69ToWPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=qKOByFYv
Subject: [Buildroot] [PATCH 2/3] package/intel-vpl-gpu-rt: bump version to
 24.4.0
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
index e962af7258..d8c611fa13 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a6afafc126210e03f41eea582049bfd629cbb985687db3f5c5a35150b9e0f5b4  intel-vpl-gpu-rt-24.3.3.tar.gz
+sha256  bfbabcf8bcf1b752145dd53127ff075362ff7d13e5733db4bc15c39667b08b38  intel-vpl-gpu-rt-24.4.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 9b3136ccbf..7d314bc875 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 24.3.3
+INTEL_VPL_GPU_RT_VERSION = 24.4.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
