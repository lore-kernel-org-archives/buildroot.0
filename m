Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE90CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 16:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31FA817B1;
	Wed, 20 May 2026 16:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETRHXPo2_jYg; Wed, 20 May 2026 16:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A7B83CF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779294968;
	bh=lIHRj46BvViOVhpctmS94WSkFoG2oAQAE2wc+wrgPEY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nkErQ7KCOOo3Na/tSgFAqDEpwO6cH5ipRvFNJ3LJU5ZtCzZ38P4aXS9fQDXJx3Ppd
	 YprN5JdHZLJGwsK5+fKhfZEN1RvG0ff76jhirk3V7+LD/ChPP9zVGSKuDsQbeISCRD
	 5OJ4eAyTaC8BzHOlctwoF5km/VG+5I51FydalCow6A9RtBW9VTcLEsKqYqmAMeSm7H
	 X2xGZ9LPKXHPRPDZ6IXvgIa/httf+os76wjBXwT+ZC/0o8xgt/Rd4edpVizYYaZDFE
	 uSzEY/fgIqzWVrcKLxMrQ8Iaaep41/lMJWcOOKKLJrdWvHuCGEnPhf6/qkW87ayI7S
	 Qr1VN9cjiox7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A7B83CF9;
	Wed, 20 May 2026 16:36:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B1F265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0319F83CF9
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-kXRAsXQkVb for <buildroot@buildroot.org>;
 Wed, 20 May 2026 16:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CE58817B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CE58817B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CE58817B1
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57399A4C174E
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:35:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42692)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPjta-000000005Pi-3HVt
 for buildroot@buildroot.org; Wed, 20 May 2026 16:35:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 18:35:45 +0200
Message-ID: <20260520163546.1067214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779294947;
 bh=lzqfSmpc2C0Pe5ox5OfnvtKG93K2WhhCskVw2IIr5dU=;
 h=From:To:Subject:Date:From;
 b=HjvPACp7GgmR/W3Ubgue6cPLZhJNJq4t+NJR/p7vFKk4nDxXlBzOMymzk6SbIBQKH
 Mw8ZNaaJIlyIZgP4MFFbXahWu30xyF8GBiiejfk7Q5Gp3kVNg6IfEl7sKtb8ejbcMz
 EE4b1SeL6l7gH6ExinKcNXVqajdWuVNbBze92ehAHaH+LyR/b0Z2uBLHogBoRXPHVf
 L2pCM/UDh5fgQRsFojYNtvl9COG777kORS7X0hKXegKGYqDN9YggiAPgzj/zvLgH+x
 ArW5w1CWPx2maflcUWm7y5cOt3wHY283dsMj/iJ4kGyYOEhHt93ec/eh1d4/sOq9Ki
 PbRjcmdAJctzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HjvPACp7
Subject: [Buildroot] [PATCH 1/2] package/libheif: security bump version to
 1.22.0
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

https://github.com/strukturag/libheif/releases/tag/v1.22.0

Fixes the following CVEs/advisories:

CVE-2026-32738 (GHSA-7f2h-cmpf-v9ww) : Heap OOB Read / SEGV Crash via Zero samples_per_chunk in stsc
CVE-2026-32739 (GHSA-j9g7-q9hv-gq8c) : Infinite Loop DoS in stts Sample Duration Lookup
CVE-2026-32740 (GHSA-frfr-f3vg-2g6j) : Heap-Buffer-Overflow Write in Grid Tile Chroma Compositing
CVE-2026-32741 (GHSA-j3w5-7whq-p37q) : heap buffer overflow in decode_mask_image()
CVE-2026-32814 (GHSA-4m8r-34pg-rvwc) : Uninitialized Heap Memory Information Leak via Failed Grid Tiles
CVE-2026-32882 (GHSA-hg7q-rjr2-8x46) : Heap Buffer OOB Read in overlay compositing due to wrong alpha stride
CVE-2026-41069 (GHSA-p82x-fpmv-576r) : Out-of-bounds vector access leading to invalid dereference
CVE-2026-41071 (GHSA-xj92-xjff-h8w3) : Heap buffer over-read in SampleAuxInfoReader via crafted HEIF sequence file with mismatched saiz sample count
CVE-2026-47178 (GHSA-5x55-x5pf-9c6g) : Heap Out Of Bounds Write in unci subsystem
CVE-2026-47247 (GHSA-2vh6-whr3-cmq3) : Heap Information Disclosure via Grid Image Gap + Uninitialized Pixel Plane Allocation
CVE-2026-47251 (GHSA-p6q9-fhf2-vj9v) : Incomplete fix for CVE-2026-3949: integer overflow bypass in vvdec_push_data2
CVE-2026-47254 (GHSA-wqjg-4x9g-6cvg) : Heap Buffer Overflow in Track::get_next_sample_raw_data() -- OOB Chunk Vector Access
CVE-2026-47709 (GHSA-4h72-vqgp-9376) : NULL pointer dereference in heif_image_handle_get_image_tiling for malformed unci image missing ispe
CVE-2026-47714 (GHSA-h4wm-6wwf-qvhx) : Integer overflow in inline mask size calculation causes undersized buffer allocation
CVE TBD (GHSA-6x5f-qchq-cxqv) : heap OOB read in ImageItem_Grid::decode_grid_tile via irot-induced tile-coordinate underflow
(GHSA-95jx-g5vf-cpp8) : Integer Overflow in SampleAuxInfoReader Offset Calculation
(GHSA-p4r6-6972-g26m) : Incorrect byte-count initialization in BitstreamRange constructor allows container-boundary check bypass
(GHSA-jh2w-m72q-q595) : Out-of-bounds read and assertion-based DoS in EXIF parsing (find_exif_tag / read32) with short EXIF TIFF payload
(GHSA-9h96-c44j-jpq9) : Heap buffer overflow via uint32_t stride overflow in image plane allocation

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 0daabcb5dc..b88784b309 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
-sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.22.0
+sha256  8bd20cfa3201997b8f63266cddfabea2e1481467d7f992e6a2595e0bec691fc2  libheif-1.22.0.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 77435dda5c..e47620b167 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.21.2
+LIBHEIF_VERSION = 1.22.0
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
