Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C31C5516F
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 07:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C88240812;
	Sat,  1 Aug 2026 07:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCbP9DcOCg5h; Sat,  1 Aug 2026 07:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE8140818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785570436;
	bh=T4XZwzXQnMf2LP18qPxtMtxuUK9BrTIzYDJNSFqsqj8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3QTS/YIX2ZBQs708hz3fgZJMchBtBR4KEdlRFYSQgKkAiQSLwIlsIBhxF5CzaFYA
	 rsECwWt7CD5lsa87cVxXj0Lt8fM7XWZ1zZmeWXquu/lt6fpcYKJKCoPw1Y6EVfaGd5
	 gi6B2sGo2ezfUugM9/w/iSmEg+YZRXGyhd3SIYAzgVSoOEnazjRb37Th/Rb8qrD3Yi
	 Zl2HJJlYGWghQzO8117t1RsQuSqHmMiYcziE0cwrPA1Zza+rot8oysFlTHrBqLdM2H
	 HcqMU5YoGG6cupg9uHcVJLrJzpZyZjzCYraeo10g3pT+vnRJIee5vkrfyRvfyPd8Fb
	 XkniCJW0n8bcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE8140818;
	Sat,  1 Aug 2026 07:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38E5536E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F5424008E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMuh42jumKuu for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 07:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1A174004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A174004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1A174004E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ddb.dip0.t-ipconnect.de [91.58.13.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3648A4C4513
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33948)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wq4Qq-0000000036W-3SL5
 for buildroot@buildroot.org; Sat, 01 Aug 2026 07:46:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Aug 2026 09:46:56 +0200
Message-ID: <20260801074656.34834-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801074656.34834-1-bernd@kuhls.net>
References: <20260801074656.34834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785570417;
 bh=w5+tfBGEjjdiO3xAnz+GD2gf94/U0LWgsrAZ3kJSmqU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ov5rJTunyN1VbjsvwcwrFlFMgzimtbCHoaAvE1ORPWrhdUFLBOGHc9HRia+XrYL4+
 fGF9UNNqWsEknrpm4EY2Y/PAVP1qUN1aI9ar57FFANfk/FkaZWSwipyfkI7/A7P9hk
 ubuy0ZyfhKIoS1DlofBxe207LeBpo1/7AkWpkBzT88LpzcVfnjsxqdJtk6u2z9S/30
 hqN9d2CldkK8ONTRWGlkq6OOkTUoaY+D9O8pqGKDI3Nzwt8rzDWz463lv1aBngAidZ
 aCMW2oFEteFco8/q2xOetjF9Vu6g/Pz74mAyEB2GRkUxFKvTB0WWPevYPea0icCpjf
 Bp3iy6wB1kS1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ov5rJTun
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.3.1
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ab45336cf45b323ccd333339d629d8b81552258a

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 0cbfda2361..82043b23f5 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  205f96adb1ace4e853d576eca462d4cbd62b9c65883493d2cd0ec33d484c0120  intel-vpl-gpu-rt-26.3.0.tar.gz
+sha256  56f4494b5cd408ec245aee6107c3bb93565218c24fe466940d1d1a89c4045053  intel-vpl-gpu-rt-26.3.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index de2e9380e9..4dc062acbe 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.0
+INTEL_VPL_GPU_RT_VERSION = 26.3.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
