Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E1D216AE
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65ED24092C;
	Thu,  4 Dec 2025 16:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c48tuaY_loza; Thu,  4 Dec 2025 16:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB85407F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764866030;
	bh=yKF7nhUwykBHGkQr0UYuj9kfBr5q5Y4XFHB9VhQs79U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFrwYS8xuAWv2GcP1p4g45QQVVq62OnTdNRJrmVuO1woMT8yRSzqIOCyxjfbN4kex
	 ZE0GUA/dV/O3O0Kx68HenboT79YczBtz0cMot7N/MootfjMG8eWT0W0bBSb907Rj53
	 lhJN9mWv3DXmuMXlwkPrrnH5d9uqcXz+OMubUE4NY3f9J23JfSCocOYwVpbtnw5+MD
	 KORPmTnVmVsVeEO984ApjAWKN7WefHWWkhDOTMR6YjW6g37gic0CrVrsHbyRg2DaIu
	 KZvCgZ+UldiPJzyT85WnLgs2qVqkoZfvhd0o2/f/Ce3CcywAMonMkNVo6waCHiF05W
	 3bhWDNqcy0Lhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB85407F1;
	Thu,  4 Dec 2025 16:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07788D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED10960AE1
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf5N2xody7jc for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E655A60887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E655A60887
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E655A60887
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C2EBA4C796E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 17:33:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47642)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRCGm-000000008Sp-41nq
 for buildroot@buildroot.org; Thu, 04 Dec 2025 16:33:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Dec 2025 17:33:29 +0100
Message-ID: <20251204163329.1313311-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204163329.1313311-1-bernd@kuhls.net>
References: <20251204163329.1313311-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764866010;
 bh=NGsr3lReHWWvIyvzPktvUWQ4d9n0WcNDa49+qu7AtdU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mAsGnDsW7WkEw3lj23BPjXCgCSn0KmobaslcWU/1+pQA22zS8gsiddJJtqai6Zajl
 ojq4mShvPM509XBqWh3przyeIdrf4wE6NgbgbdfyYxgo9fVatGUI9rhYlHPh/A8GJX
 W90YxnXjBr+/1M2cFbBSPzjcZWR2dzdUeYiR+JT/kcpjqGLXoPTLEQFEDomkdK+4OO
 9z2EMJdrxdC1XPHu704gpHhOTRCqIdTmHBz6kQJ21Ups5R6TACLRe7p+LWZ1+iGegd
 aa1KlzTrf4BLA9cLimxVLxMU8yoMZBnEU/2n261bv08fRffHOcC6JUn+S6iPffEpEM
 uFckawWIZ0hqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mAsGnDsW
Subject: [Buildroot] [PATCH/next 2/2] package/intel-vpl-gpu-rt: bump version
 to 25.4.5
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

For release notes, see:
https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-25.4.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 7c3aa1ec37..89c7099b45 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  028837bf8d756d5e74dbca4218b4ef5b853b923b6d2361ecc02270fbc63c15e8  intel-vpl-gpu-rt-25.4.4.tar.gz
+sha256  c1c779e86f147495e50a83feeeee290526d0cd46329f05772fae97eb271a8ef6  intel-vpl-gpu-rt-25.4.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index acb942da73..d149d58a77 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.4
+INTEL_VPL_GPU_RT_VERSION = 25.4.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
