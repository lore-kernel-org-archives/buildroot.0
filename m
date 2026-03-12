Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C140106ACC9
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D788684D5B;
	Thu, 12 Mar 2026 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u3seuCfCJRC; Thu, 12 Mar 2026 16:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D898491A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333465;
	bh=FtvSFE07oS6zCcfrhtC5xNkYNjI+o9Vq8dS7rHJ4jgQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jk6PbSKt2gQxp8MZ+xzeTqlnTrxOplaCWBCACXoVXcDOfNbyB3GqTne8o/MCezHe/
	 dS+Bo8wy6jKehtJ61eBxKVzYxH6dwxYbshcKCu6By1XIvsqdAq2fHd3gvSBVdJn8Sb
	 sGr9EahxBJ+tpYjQNZXmEvLa4UCblOaCieNUwHna99RenL7d4EI1I1NixzobU4PFuO
	 VPH9m03iEs31NAZwLQHXaUd/nNoDKjxxXCv4BXqin5hZ5pQBZDA1ep6SuqDtW9Vksg
	 E3+sz4Snp3AFNBD0dlRaHntZVcLvXxWRwty2Rt5mjTKO/KmqttAMqRMQ3G9bc4yqbf
	 xl+g0m+ZAxq/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D898491A;
	Thu, 12 Mar 2026 16:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 313DD282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16B2760BF0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twBOjDj0wQPP for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A301060BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A301060BA9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A301060BA9
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE411A4C0ED9
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37448)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j2X-000000002wq-3MyL
 for buildroot@buildroot.org; Thu, 12 Mar 2026 16:37:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:37:37 +0100
Message-ID: <20260312163737.3178306-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312163737.3178306-1-bernd@kuhls.net>
References: <20260312163737.3178306-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333457;
 bh=TZA3Qfurt//OS1pt5UjVOMS3CYEcw+9EhdfUZQCnunE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=XKykmhnG35jyBUlVQyi3qqbPStk2stv9TIikIoq1bw1iIVwKo4KNzqC5PtU0Mr/SE
 h2/unZl/9GvVZ6dkAgEwQqmtKCfJe1pLau1a1KsIdYRgT0ihYPocjFSlSMSt3W3bWL
 3Pb6ihaySt3F/jUJqpnl7os4UKlQ5220ZtNtRptSHf7CsiAK0nNx4/MELUjLF+4Err
 eZt0mkOnjcGkp+gNGBDW0NcPRvDJfFkuGvBAqGhBKQ3/hMu2D7FoC/9rG690KA9gZs
 dH1lEmXyrPXIymxcNgWlS2K3vd7C3tTfV7YfCLcTpsDG0oM8SuBFvm7jHOGidAAaUw
 +y3XNpcSgXzvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XKykmhnG
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.1.4
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 5c02ee24ea..38e8c14064 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  27354264bc3a60faa89478e555b382bf359989c7f3ac7b8fad2c4447474170d9  intel-vpl-gpu-rt-26.1.3.tar.gz
+sha256  1d567932451ed179a7f146677a48219cdc241787dcc72528e7ae8bff2804b8a1  intel-vpl-gpu-rt-26.1.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index f73b6d9508..bb0a83f730 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.3
+INTEL_VPL_GPU_RT_VERSION = 26.1.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
