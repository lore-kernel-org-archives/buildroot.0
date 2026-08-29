Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A04C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 610304072F;
	Sat, 29 Aug 2026 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2KeJ-S69xOs; Sat, 29 Aug 2026 18:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788026976;
	bh=dQh3ZRZjzBBUGyLSX8gSjNV6SAIupJ4jk+KWwfN+myQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DU9paQ0hqYe6PWlSuxwebgfJtx8lbWisGcvzzpS/m2V4SyLvkCm4O+PXRxRLbb7g8
	 DWp02qE28kYVtSU0MpoCFPtc08+n8Cg/ufAYpPoU8sO7eB9coDJfUomFXIGB3exsLc
	 LcGLxzkvCN3Sq/yJ3yHqPmvCK9oa4Lz2Lk/zWCnBYqRsOWO+snnuYm5zWKoXDK9MVT
	 QMvSDeshfnOZcszfaqzJXHt5/nq7IVlfjJwpfwo8ESQBZAyoOLkGSLUG3HKDh7GzDb
	 nRSPXv8plMlug75S9xadDOD/WYP6VnMQAxEb67e9gxalox/5eGJYnTTwdrARjWnfrV
	 XG83qlmN50G3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5632140720;
	Sat, 29 Aug 2026 18:09:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C711C14F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B87BC4007E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cZr3KsVndyT for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YHp798fG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBC6440029
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788026970;
 bh=zWJ52Y+5kWntrq8bFBQ9UrCCDZRlDgZVKDH/1Kh3hJA=;
 h=From:To:Subject:Date:From;
 b=YHp798fGPXHOMLZgeVa0DN7xHEY+N+pinb3gETl79O4KCYpJPoSNf7LayMFCGbUNZ
 idAb4pG+t9TQldF1dLZ9Z4SWLgo/jWYui3cCIR8U6xkYJu2SUwikXKl3bytzA0EUKb
 RfBFvej9k5pzEW0KRYJFhR743yoTU8AkEEQkqI6eVUmKdLwdKHANujpROdw9H5CfIe
 MqDaY2NFwDTbwk16R7rztAWmtwuRiwvHL5Pqq0gdwDD6eIAJuP7K3VZMcxtLh7pzE7
 Yu1KzffVgLQpOiCjR3XVsEeipW4vQUCLJ5Kt8jx7cksQ48uymv70yNA/b5heauPgDD
 LHcggHZY3fdLA==
Received: from fli4l.lan.fli4l (p5b3a0f14.dip0.t-ipconnect.de [91.58.15.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7B4FA4C04E1
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:09:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47088)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1x0NUh-000000006nR-0SmI
 for buildroot@buildroot.org; Sat, 29 Aug 2026 18:09:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 20:09:30 +0200
Message-ID: <20260829180930.105786-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.2
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

https://github.com/strukturag/libheif/releases/tag/v1.23.2

Fixes the following CVEs:

(CVE numbers will be added upstream when assigned.)

CVE-2026-XXXXX (GHSA-g89c-p67h-r497)
 Heap buffer overflow in scale_nearest_neighbor() via duplicate alpha
 planes from nested iden/auxl items. (critical)

(GHSA-2jg2-4ch7-h545)
 Out-of-bounds read and write in derived-item and pixel-plane handling.
 Through iden and auxl item chains, a crafted file could attach pixel
 planes whose size differs from the image geometry; crop, scale, and
 plane-extraction code then indexed those planes with the wrong size.
 A working code-execution exploit was confirmed. Plane sizes are now
 validated wherever they are consumed. (critical)

CVE-2026-XXXXX (GHSA-24wx-9w62-c96w)
 brotli/zlib decompression of mime metadata and unci image data had no
 effective output-size limit, so a decompression bomb could exhaust
 memory. Decompressed output is now bounded by the security limits.
 (high)

CVE-2026-XXXXX (GHSA-x8xm-cm2c-cfc8)
 Chains of derived-image references (grid, iovl, iden) bypassed decode
 caching and memory limits, causing CPU and memory amplification. (high)

CVE-2026-XXXXX (GHSA-xw34-mjcp-jqh8)
 Sequence sample-timing initialization could produce non-terminating
 decode loops and unbounded memory, bypassing max_sequence_frames.
 (high)

CVE-2026-XXXXX (GHSA-j264-xvrp-5v7q)
 Out-of-bounds write in the unci encoder when
 heif_context_add_image_tile() is given a tile whose planes do not match
 its declared size. (high)

CVE-2026-XXXXX (GHSA-p58j-h3vm-3fp5)
 Heap out-of-bounds read in the inline-mask region API when
 mask_data_len does not match the region geometry. (medium)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index ff8c05c7e4..31fe79b16e 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.1
-sha256  0de0327f60fcd47de90d5654c6fe152232738d60d84fe084ec3e0f35e03b166a  libheif-1.23.1.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.2
+sha256  8bd5d41d19dc84536d118b04774709f244df6104ef66d623dad5fa4650143405  libheif-1.23.2.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 124dba7c24..755a9909c4 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.1
+LIBHEIF_VERSION = 1.23.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
