Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C29C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 14:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3EE40469;
	Wed, 23 Apr 2025 14:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZyKcRjL8OxE; Wed, 23 Apr 2025 14:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED93840657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED93840657;
	Wed, 23 Apr 2025 14:22:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1994419F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 14:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B457402F7
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 14:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuLuV9fm6Z5G for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 14:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CE1440135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE1440135
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CE1440135
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 14:22:06 +0000 (UTC)
Received: from localhost.localdomain ([151.79.164.54])
 by Aruba SMTP with ESMTPSA
 id 7azEuENeStfOn7azEuDQuW; Wed, 23 Apr 2025 16:22:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Apr 2025 16:22:03 +0200
Message-Id: <20250423142203.2815631-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHUYGXXEXoq/3BFyAMjZklnEjFNhbWICts6m4jiQrov66OO/0bS663aGxU29dWXm049A/hHi/sehkWyA5TaP1YErSa3VelSU8LvOafvl7IAV9GpCShz0
 /yJfWC/usOlLKAPqWF+YG3TvBNgaPJeHcYD+9chORm8aB85DAHF9Az8LxxwenzDo7BBzZkeENgFnnvcxJYAVTZlTMUxN2zn/lXZWBxkqP0jh2k/nnnGk1aKo
 2itdJg3Xon8NgwfsOejVkPCyPE7fnjRsW1/72A/rsTDK7TvgAG6TWP6Hpvoqh+W4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745418124; bh=/kocCaUgRRpyCjMlFNrZHGmx53WOG/4v2XlIN1zewVo=;
 h=From:To:Subject:Date:MIME-Version;
 b=cHKk9A+RtTzwq11AXAXmMYMvwX/ACtGdC1K1E/7mO/g2AEVNT9SvRgu1zQ18eREG+
 JQzB9YdZxn3In3yt+K3arrlwK4liTyLeJbPdZSGD92pl5iECFsOe77yE8wijCpu6VJ
 ODX19Cd3IV7+1vGtsCFuxXl0Z70EZwgbBo0JS9q2pbzUEJwG4d+Z0b0tC3U4ktqpTD
 QTfKvi4zCKxqIJAJAWRDB8Mv7KVpJa91i+yLpIZ4gSCAEgt8DzjTxJzuK7fop5Bvnv
 VTnMBmhZGZ0DsDwpPFBjlf5l5j/Jci877rQEYbZEs0+qX+OptvNtIfC6vhYiQzpjkk
 SQLEs5ozgxiSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cHKk9A+R
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.1.0
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

Release notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.1.0

Since the major release changed all the packages that have direct
dependency to harfbuzz have been successfully built:
- efl
- libass
- mupdf
- pango
- qt5base
- qt5webengine
- qt6base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index abe7440259..ea899b91c4 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  480b6d25014169300669aa1fc39fb356c142d5028324ea52b3a27648b9beaad8  harfbuzz-10.4.0.tar.xz
+sha256  477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969  harfbuzz-11.1.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 45168a0e02..6bd01d6e44 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 10.4.0
+HARFBUZZ_VERSION = 11.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
