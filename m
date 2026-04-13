Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C5EBFD16
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8182C42633;
	Mon, 13 Apr 2026 08:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgORDEBH_ONQ; Mon, 13 Apr 2026 08:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBDB742616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068822;
	bh=eyUm8lj5qi9CSvwBoakn0d4oXxZayhDPgz8GI1q+myQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQr0EjPjO7ERvSFeKP+OpCZTU8Wsdb2hAHmt9S9I217R0MFrMMkYfFwj1zU3+x5e2
	 0OsYLh+wvxyorhYDRVo/YTnMMVyliFVBDSLsZ8YKFDamEv9h8S7LFMq7ezTMNI5IJG
	 m2cL53ruy6MtIZgPp/+ROF0tAHEoOnunIiIi3cqBBXPHBWMK6iv01PhgcNA+/UCYAd
	 rsOU7ost+tqeCJhvwusdW5bPEOeMdmWSEGdVDYsO69kepTuqymVSlquP0ayQLsIKYd
	 l06rQwbzHTEWsbdXq+BSh39dSzVaWIWN5CGlQWspu/WsvfHvHCGqb1A0Bhe2SqHlHN
	 pVFlOEbafw9IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDB742616;
	Mon, 13 Apr 2026 08:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6378F237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495B140071
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA7v9uez5trr for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34EBE4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EBE4002D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34EBE4002D
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:26:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE318A4C169E
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:26:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36914)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCd0-000000008JL-2dv7
 for buildroot@buildroot.org; Mon, 13 Apr 2026 08:26:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:26:42 +0200
Message-ID: <20260413082642.3553355-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413082642.3553355-1-bernd@kuhls.net>
References: <20260413082642.3553355-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068803;
 bh=Ja6HgkOeOxgM/3m/hxJ/63T5SaNMLYlPClj+jJFehH0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lJLIusgmi9w80pyTVTyFXImPnTvuGsPUlr9W7sQqawVkUj6FKqNWZ2Mtfap+g1dCn
 LH4uHk6BhATE2Juo9ZBssHgpS4+2eC/ixh6GTdwalcVmLQyDEnfQoVduNDt3CyhL98
 4RVqapfk9rAuz6b9VYo5/shqvT3UeKSZWYOfabfou220VlDZ+C4YndGf23gaOdF+oI
 u6825e15w5uaI6/vw6fVjzhrCDPIfJa0og67p7WxTfCBtFfpFkqKpHX1O5TZ2SdUVN
 mGfUtB/t7DA1lWQ7extKC+Xx1CWaxtTRIDl9xMOcS82bDCgWisZipXDUGU+jCx+KeP
 iFSMmDivFO2wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lJLIusgm
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.6
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 3043ae6df0..ae00cb8fba 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d2f297dc03d4e5585bee75ce3bafc5c8a35b30ac60ff7d6b49c1ed6f6b8152a3  intel-vpl-gpu-rt-26.1.5.tar.gz
+sha256  41456ec8bff819b29a69601aeaffec72fd408ea6c79ab0e4184cc11b6b04f1ba  intel-vpl-gpu-rt-26.1.6.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 2c496ad220..973ba6299b 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.5
+INTEL_VPL_GPU_RT_VERSION = 26.1.6
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
