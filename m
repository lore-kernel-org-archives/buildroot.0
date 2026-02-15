Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F1DEF586E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFC482532;
	Sun, 15 Feb 2026 14:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0xDot6AfAzL; Sun, 15 Feb 2026 14:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496F581B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771164816;
	bh=uuJn6Lr0jNSVZ1YbMK9tENvNfVOQz54JorR5NBj7btM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mdjBdO2aoccuIske5L/r2ZfvQV2qfc4tzCPOjZgcQu8R1bpPPTotbRfoFLSWwp28H
	 95KdyQYV3oTZLrhwAlX0TZHCxQ/3+L3sl5xRasRXvGRrlmPSM0PgYclolbGyk8ebIw
	 V7rnAfeDUANDec6LB/ANAPcbo9bUy4Ww1Ncj9Fpy4AcRXGRhTPW3hyd59VdWhY8GzD
	 HM2yNxHS2+pW5uWeMsEijYjGnBcKD99LqWpvf8DuvRzTjdsfeJLxpvHP+YNmvEhWF3
	 /nyUD1M7Rdkege8egcoBRB6p3dD8XX9EUW3yMWJOO56u+6foECEVfcmj5YBfzbgiK2
	 QC53+XBFRulUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496F581B70;
	Sun, 15 Feb 2026 14:13:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A599235B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93934409AE
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlLXYYh_WN5x for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0673140980
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0673140980
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0673140980
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F6EFA4C0EDD
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:13:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50924)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrcs9-000000005iw-2Lwc
 for buildroot@buildroot.org; Sun, 15 Feb 2026 14:13:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 15:13:17 +0100
Message-ID: <20260215141317.503620-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215141317.503620-1-bernd@kuhls.net>
References: <20260215141317.503620-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771164798;
 bh=6eXDL4PWJ552jR1L/Sd7W6lUtOxi8vM7p/qA0HH1MDU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=D1Q5VnrNkQ14admTkXBP0HIt/l3FqTcE9l/gfN35fiuTr2vS256hEsXYOW9iFXhrI
 JP4CxRD0i3RZcMLO3WwT7TiF3zBXskfbwNF0ahxqZryWgBPWKYdoWgrerIqcsc8U2n
 czCnK+0CJ/Ltpt1HxzN6jJaOwd9ucvzhuOzGtFM5cPGdUInCVz0L57gLT4aLLqtcQc
 Pe7YFbJ1vOeV3OFggyVuomQoJEXfo5Sd3odq4jucKirBUX700mgBs9Q57CMiuhvBWp
 Obbkm5I5/bjvso+nfIiqnaWTQiZLkzMCMBABpXWhj4KapjDf2gmv1PeJH5mWQ6zG0I
 zIFycRtCfp/dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=D1Q5VnrN
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.2
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 7497d862db..9cd12ae9c1 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67fd57d1c5709b58bb6406d60e3f2c4e0b47bd38c4a82c4c46619b78f6c23e72  intel-vpl-gpu-rt-26.1.1.tar.gz
+sha256  1f0b4a81b206253d315d795e5c075312f6b20e0110c7cf9bc83d24bd548fc015  intel-vpl-gpu-rt-26.1.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 54921be12d..6468462fc2 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.1
+INTEL_VPL_GPU_RT_VERSION = 26.1.2
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
