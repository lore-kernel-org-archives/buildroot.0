Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07150E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9EB404ED;
	Sun, 28 Dec 2025 07:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzFq2ZBVEgY1; Sun, 28 Dec 2025 07:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805F34032A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908551;
	bh=jlzcGrrqPl6VwHi2aq1h6ibQlp51pCVnE8kGbtDXNJo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suR17Pa4kVH8rCInNaxve0o4FIrIzcw3lboYMVpU0LXPI0tynkd8/B2Rv/R/GMv7P
	 2+3rM8s6DNtk2PhncNOPRSQm02vsjOmsWXw5rAurq2ObEZtqH5dvsAUvBMZVMklVxj
	 VNcFo1jk/Slkyhc5p0cvPysn5K5lWNxCp7nbmfQyg7KeofK1OeaXmkq/Sqx6BTPrDh
	 GCfMktCKPoJlAbNtBjVyz9ewLIkSYyAUO0K1sAyGH5He7vQ3t4Nrdy6dl43Y7pTx9O
	 LuQHh3jhj5nrsfqDDb8U2YuX/bUbLiHAxsak3Ut0h+wRjDRkAU4tTo1dP5Am35jqIT
	 JkpiXrOFrdlfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805F34032A;
	Sun, 28 Dec 2025 07:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D1D31E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE5980BFE
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kH06dw8dvD3O for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C467D80BC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C467D80BC0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C467D80BC0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:55:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0F9AA4C21E4
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 08:55:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlcw-0000000072p-0hse
 for buildroot@buildroot.org; Sun, 28 Dec 2025 07:55:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 08:55:46 +0100
Message-ID: <20251228075546.3372169-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228075546.3372169-1-bernd@kuhls.net>
References: <20251228075546.3372169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908546;
 bh=h0gpaRVLBwaZTD1fxzr17rSKeaAkrfJwZoXVRsXVnSA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=I3Td8H8iKf9h+yLLn0Cx0DjSLd0FUujVj50O1aTrS80Z/rxzcre0CFXHBV5+eGwP1
 KovRthT2oTt9FFIh1eT7B8pghUF7J7ygz31Qov0zgpVfN/CToREuDBSnjKyUZTKIEi
 MefR8KKURTnaUL5vj8PJlmr6ZUG+w6H9heO3MBqLje1785Cm6fHohLYHsuf24inym+
 QsfK1fe85DplN4bLS57ff1Wk8gvbMn1gCOlNTWe9iU025tv2M0qM2UjGEZotBaa6+Y
 yn+Qd++YMC7o8LrQ51CAbKjP20zi+/dgBxrRlVyLF1D8KmdMm29DBQGlOG/IxS4Buz
 3FyVWlJMZnz+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=I3Td8H8i
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 25.4.6
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
https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-25.4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 89c7099b45..720503317a 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1c779e86f147495e50a83feeeee290526d0cd46329f05772fae97eb271a8ef6  intel-vpl-gpu-rt-25.4.5.tar.gz
+sha256  a4cc2429fba49ee1d5f48883930e2e7325f0af38af83c8048793c8b1d3fa4a8f  intel-vpl-gpu-rt-25.4.6.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index d149d58a77..6f5abaf9b4 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.5
+INTEL_VPL_GPU_RT_VERSION = 25.4.6
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
