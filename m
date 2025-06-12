Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8592CC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 16:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04860408AF;
	Thu, 12 Jun 2025 16:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1Ku0gVjPLEI; Thu, 12 Jun 2025 16:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 281D340787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 281D340787;
	Thu, 12 Jun 2025 16:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 712F21BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56CD94046D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w15_9kLi15b for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 16:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A579C40456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A579C40456
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A579C40456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:58:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D76AAA4C213B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 18:58:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59452)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlGF-000000003th-2itE
 for buildroot@buildroot.org; Thu, 12 Jun 2025 16:58:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 18:58:42 +0200
Message-Id: <20250612165842.3473916-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612165842.3473916-1-bernd@kuhls.net>
References: <20250612165842.3473916-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749747523;
 bh=h9xRvKY3YDi5auCI1hJOyAVXs4ljrcjF/JyqLRoHF38=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lO8EztuvB79h6uud7mgmSAtHA1DIhAyKhJhRVV80rGOCUk4bzTO55L55LzBhQ9MNb
 PlGi/TfWGjoBlLV2IWHwtkLSzj+u4j0UVeinfXv/5zEAyGTGSHrMEunBlGx71sjyU+
 6n6SQuvbUYdDPBBPSeqgDIN8/L3044+8+7K/6GT7EnuH+AMxRvfbO0ws8yCO3x8YMa
 z8lqC4jr4GcRytZPh3oGCpmNegp83iNmLmIkb68l739F7p9e5jrD4L5fzKhfBZihBM
 G1HDkFOhSsNaJjYDB+nTasubK37xg8GlYW8RpQqTr70Na79hbObl5SwZiKi19eOSe0
 LOBXQ3btgDSew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=lO8Eztuv
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 25.2.4
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
index 4deaffc25d..61dcb38137 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf45c03023e03a1f792a22b3ca16c6e39b4eb8a5cf8b4490aa58869da171b7c2  intel-vpl-gpu-rt-25.2.1.tar.gz
+sha256  88c6740852d69c9584bf9d915f64b503f840175685ba1d8741f8b6928740fab8  intel-vpl-gpu-rt-25.2.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4ae68c69ff..3cd6f2f5e4 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.2.1
+INTEL_VPL_GPU_RT_VERSION = 25.2.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
