Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B32DCD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 05:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30ADF406E2;
	Mon, 15 Jun 2026 05:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEjtKZa4tO_5; Mon, 15 Jun 2026 05:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D070B4036A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781501764;
	bh=z88SgANfrWBacIsah3RmaHCLatw87yTUcftNVgvZZic=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGttE8pCzmR7iP5B2V0DHH4FOXEzXHTjndExgHEcpl9lsUxT/3YchuJxropIA9v/y
	 96vGNtTSXwzRUhgAlaKWTQsWeaPLLkz2wVKjR2VpsJLjae48atcdVn8pfYKP4ds6sf
	 QL46pgyGhbbgypkFFbDaOOID6CxeTGqh4Q0PKyAkImdYERpm78nUUbJC43Vz0sQzZV
	 DjCfHKcMPWFRMxXeel+KbMgaRB/4SEVNXFCRdsL9ZQ9NOtIBpFYdBAD2sWSXyBm4xK
	 l5hg2U6sSha0hPSufTj92KaohUbhPz5Ed0sszXV5DCKpVRUY603lNin7YGxss4zp7O
	 S5hoeX0RfZHlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D070B4036A;
	Mon, 15 Jun 2026 05:36:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E35CC169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9AA540DB0
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhIiIWDULLX4 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 05:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15A9240D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A9240D83
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15A9240D83
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:35:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64576A4C3045
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 07:35:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wYzzH-00000000516-3xJk
 for buildroot@buildroot.org; Mon, 15 Jun 2026 05:35:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 07:35:55 +0200
Message-ID: <20260615053555.1112644-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615053555.1112644-1-bernd@kuhls.net>
References: <20260615053555.1112644-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781501756;
 bh=Hj4wr1RucUShwicllMe5sIN4SdmLPgLaUeuM/uCikPk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pxCGjM38KYHF7OGQBZ98Z07S493xBJpTiKwP6UO3qj3Fd0CUApuFEf+b4DRi9KPkH
 WCy2h5e/V9lWigKV+Q994i5BP49Ps9YVE2fNG4A/FJlzPeHN1ZdlMxW3oqpaP/TLIr
 MunZDur9Pp/8lKvFgh4WZmS0WHOJdoOxrx1TZyJ5apFvt3/CYFwcPVa9iUUaYGV762
 mDDgFBPOHOJ3frtKP+HsAi+V40hm6Yjpkbb/ZL3fmzbaGDZMPSWGmsvmY6QbPsObJy
 6Qzx8436mQgwJYscG3OgOQ7oizmrAup0WFq8D8q8uHUlECVPOakxjQGBvwXW2L5JJv
 l0SSwipvFGw0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pxCGjM38
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.2.2
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed for the series:
https://gitlab.com/bkuhls/buildroot/-/commits/76453eef54ad48a74e9a80efc05fa023f04bca35

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index d1e4c58fda..8ef29d2654 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b9a84d5d2255cbea8586019a3bd03165f0269e06dba03e9c6f6cdf363b6b2fab  intel-vpl-gpu-rt-26.2.1.tar.gz
+sha256  b2ae63ae7a26a59c8be0651b638ca1c1221fbf35768c485a240ddcdd9d353735  intel-vpl-gpu-rt-26.2.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index e812ca31cf..9a2f819982 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.1
+INTEL_VPL_GPU_RT_VERSION = 26.2.2
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
