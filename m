Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97185C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9A540F93;
	Fri,  4 Jul 2025 16:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KsI1-0Vvrhe; Fri,  4 Jul 2025 16:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08C840F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C08C840F34;
	Fri,  4 Jul 2025 16:52:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C8112E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE90A6161B
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2RTjwawFh-7 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C676B61624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C676B61624
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C676B61624
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:51:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F21CA4C3953
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:51:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47690)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjdk-000000005Rt-0KzX
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:51:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:51:55 +0200
Message-Id: <20250704165155.3639008-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704165155.3639008-1-bernd@kuhls.net>
References: <20250704165155.3639008-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751647916;
 bh=P0t4aF2Yh1QgsLSHD3WRz4wUikxX88YSjLHRpq7NqUw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mcSTgQ9Bq5OYduhab5LZo34ufZItKb0Neq+NRs5tM4fy7Z8BGVektYXdcWc2S/Lnn
 sy+5sC0DijZLo151Q/TGVSoPyVMQl7RprM9BVH2eci105P91p0jEzQZ3IjXqPldHjK
 4F4GhSAo5Kw9sRwnEE5uckfUyDBe/Sso0gMe6VTaUjpl+Jp/FBoO/pn665uGt9GSk2
 AcGNY3ksHp8JCy4QJL2RSIlC0VI4gI5NCIZE+urZNpKvlEyFuFUOgxr+hR7Co2kX5Z
 6a4O2vcESTxIhU7A5qPTsT0Fwd1QR8ytD3RcJYuSr1E5p8FQtTgvkUXguMeOKepZgt
 3d6azOVMerxvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=mcSTgQ9B
Subject: [Buildroot] [PATCH 3/3] package/intel-vpl-gpu-rt: bump version to
 25.2.6
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
index a07cb80b73..16a67d732d 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b37ed5f019d722551b5b5c7a31fa2af3ed0287338fd5c8c18b3a41dac0d4eae  intel-vpl-gpu-rt-25.2.5.tar.gz
+sha256  d236ede2ab87063d0d8d52932779ff446a885b8dc4ef840d1a756c6776ef6fef  intel-vpl-gpu-rt-25.2.6.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index dbb28d2b80..50aca58526 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.2.5
+INTEL_VPL_GPU_RT_VERSION = 25.2.6
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
