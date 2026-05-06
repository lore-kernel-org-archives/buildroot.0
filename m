Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EFFCD3436
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 10:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C7C8231C;
	Wed,  6 May 2026 10:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ32nsomzK4b; Wed,  6 May 2026 10:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D5C82342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778062625;
	bh=Y9TegeQfFHVbWNd4JNTXZDoZDiEndd60ph5uGfx8hws=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=O6ViuPIu/7SiWFL6uCBx1rpT9IS8Gglefki/MlRMbPJgcA+jA+txxUkUv8JtmCX2X
	 y1O5FjIGq2i3Zr2laKviXQKmOsUdc9zYGSGe070/kfqlPx0WxopHM3VPU0xBm3ToXq
	 JGhWnVqY7mJt36N5q1MDxkCe+iPTOGj0sYw7XBoenh22GDRpgB+Q3ZHilcnjh/PLeu
	 FhmH5nEMy2OdT+PhA/DDHv01Q4uqRn1Z6OrXumd2a5smXsAFLPXGsMJUB1132xLaRS
	 iHXxU/+uEkvg1zAzexz0RIQ0zLDyoYxwDMtFYsOL/M/XRSaN/M7Axtdk5KRL+9Zgzy
	 iRgmAN78o5iLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D5C82342;
	Wed,  6 May 2026 10:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B82280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9725940DE2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2peGJb4skLk for <buildroot@buildroot.org>;
 Wed,  6 May 2026 10:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09E4540DCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E4540DCA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09E4540DCA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 10:17:01 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 97A5E2C84123;
 Wed, 06 May 2026 12:16:58 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 12:16:43 +0200
Message-ID: <20260506101646.131940-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778062618; bh=Hhqztfqmb30/q+RzQpgtg3RQfAsOUB5cm/t33LSCPEo=;
 h=From:To:Cc:Subject:Date;
 b=lpIxN71jbrYd62xMbfd3XVWf4hEBPTrpUs0H/XhaqR6lxoBNAZQJdYuBwH6iGKlfH
 d0KLIaF5nPTTY1dlFZWcwHrkqQ5xbxCe+jWydLREnaI7YLCaWouDTfaF9uOGRJpOw8
 fSQLJ04RGvsPXhbQmjGSDsX0AZEJGli3Y92CXbIW+9koDuWjjeUUweOHzz0YYm4PR/
 tnX/K0Iw8BWvKtv2O0MZlmj9d/65V9wZIiqnEWX/dy/6HcYS8PLJ02cBVbrFh4w688
 WggsivrOVG56jGQm13RZxi/m58c8EEvV+reEzjrhqol2UBsthTyKUZ2GnjiHm/TwMU
 54cj/rDcDN9YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=lpIxN71j
Subject: [Buildroot] [PATCH 2025.02.x 1/2] package/gcc: bump 12.x series to
 12.5
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

Changes (linked from https://gcc.gnu.org/gcc-12/changes.html):
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.5

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 ...02-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 0
 .../0003-xtensa-add-.note.GNU-stack-section-on-linux.patch    | 0
 .../0004-Remove-crypt-and-crypt_r-interceptors.patch          | 0
 ...Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 0
 ...libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename package/gcc/{12.4.0 => 12.5.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{12.4.0 => 12.5.0}/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch (100%)
 rename package/gcc/{12.4.0 => 12.5.0}/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch (100%)
 rename package/gcc/{12.4.0 => 12.5.0}/0004-Remove-crypt-and-crypt_r-interceptors.patch (100%)
 rename package/gcc/{12.4.0 => 12.5.0}/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch (100%)
 rename package/gcc/{12.4.0 => 12.5.0}/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)

diff --git a/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
similarity index 100%
rename from package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
rename to package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
diff --git a/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
similarity index 100%
rename from package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
rename to package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
diff --git a/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
similarity index 100%
rename from package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
rename to package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
diff --git a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
similarity index 100%
rename from package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
rename to package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bdf644f527..e6dc4a04ba 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -70,7 +70,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "12.4.0"    if BR2_GCC_VERSION_12_X
+	default "12.5.0"    if BR2_GCC_VERSION_12_X
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 168c6643ce..720bf6595f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
-sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.5.0/sha512.sum
+sha512  c76020e4c844b53485502cb8a4e295221c9d37487d66c9f4559031fb14c85de20602e6387310005386cb0ef25e55067d2cfef141423bb445f3b77e7456a23533  gcc-12.5.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
 sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
