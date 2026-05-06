Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F8CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABA4582354;
	Wed,  6 May 2026 12:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILZd4bkMWanf; Wed,  6 May 2026 12:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE0582328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778072028;
	bh=QWCRnTqRPDcBPcI/6UeAjomkA5uimX8YTm/vNUt6/2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aQbHqfbWOGx5dYstNPQmRY+tNm7O1H5DzmrB0rM2OLBn4P8o86+UJJbl8wN11iHBl
	 5YgN1WuJEcFYef6J/KJOH0zZyc/0VuEVyhz5clK9YeUDztDGQw9CjInaDwJrdionCL
	 UpLAygIXY4lIntxv8+j3zwcBnemDxEcYJmCmv3s80nIgvT0TtM/W7JKTy9+DTCerDe
	 E0lxIyw4zuyh5lMd+4iF73VYrfUlKp5R2MRmndmc28rF33O85OG0C5gli9Tzw6WzqI
	 dSh3jqNmgcsGVAyr2c9d5key5fOvI6aGMgB8lGNg+eQI08KKx0luw25ACtPA6yAV+8
	 4mA9XZXh5IqtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE0582328;
	Wed,  6 May 2026 12:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4044511B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321784058F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOvl5pn6LrV7 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67939403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67939403DA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67939403DA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:53:46 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 090342C84123
 for <buildroot@buildroot.org>; Wed, 06 May 2026 14:53:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 14:53:40 +0200
Message-ID: <20260506125341.559160-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778072024; bh=nXO8nebpOcUHofwkGxxvlNN2of1mpVLTUTWL6eDzVZ0=;
 h=From:To:Subject:Date;
 b=TlViKvRbNonWcudGb8GSYaKe2yM2eHjXn48h21akbQecVvqY+jVzlSMaRX5S4/mp1
 Nsvu84iTfyXqsp8yGxZoHEzkpcjePu+U6n1TEqGoWtQK/bMzrTShmFDyNvK+TVBwMm
 37y72MxUvRW5eIobFEfjNEvPAwF+SECr5kOoM2b/d/qpYkRsO72eZWJfXBiu4wq3GL
 3PVXirg8CnOaqV+5HB42jl9CZOy1Uqf45Pz8Ws9MLaEg22IGH3AjDQVmgQOxRGnkuo
 Auz+uGTX5xBy0Twd5zODEp6p7Nz0NExSTK6bLScqvrytvUFD+nKh3JI2MRiqhHxot/
 hvnFwnLPGwICg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=TlViKvRb
Subject: [Buildroot] [PATCH] package/libnl: bump to 3.12.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/thom311/libnl/compare/libnl3_11_0...libnl3_12_0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index caf75616fe..c5a5712145 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz.sha256sum
-sha256  2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d  libnl-3.11.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_12_0/libnl-3.12.0.tar.gz.sha256sum
+sha256  fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18  libnl-3.12.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index b1254d2ba0..2dcb594141 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.11.0
+LIBNL_VERSION = 3.12.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
