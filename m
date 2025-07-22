Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242EC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB5FC80973;
	Tue, 22 Jul 2025 22:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jSwyWKWCexR; Tue, 22 Jul 2025 22:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FFE80974
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FFE80974;
	Tue, 22 Jul 2025 22:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8663DA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE2F40AC2
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkzMZNL-SGjd for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 22:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9F32414CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F32414CC
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9F32414CC
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:01:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id eL38uYIkJD5sdeL38uq9sQ; Wed, 23 Jul 2025 00:01:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 22 Jul 2025 23:54:52 +0200
Message-Id: <20250722215452.3241365-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNI2Xp5Blf6M/myE+UqUgdyNY8hwMcWCHUR8JyghODN8TwrKpUF7PwHdi4jWFSPEcfldZiaKUKL8YNGl4OOwUIAcrmTM8pz2b9QNTSLm+DTPqdjh9zRS
 mneOeY9R4b18ed50Qpmvka4wS00D9vAzoeP0hjSd++p5uplLgHz3EalR9vY2mTw5MdbTML5N+89OGWPVqMUNfoTd05VwMcpqKAlIKnQ8/32yhhEJgQBNrKhu
 5FKdjtGgX3IJ2jUKm/qOILphWh69o3qDsUn/wpSse2E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753221686; bh=kDD93/unzg0MpKqHalQPOVFuXVIM3TlweZXtMGKMKF8=;
 h=From:To:Subject:Date:MIME-Version;
 b=XeoFitL7tSeAsnCvzHK3HAEcyZFRvsXlrlUjkLINA4rytf98Ce8shSXb4EVL4KTzc
 0uGq1RRFqQZZcbVUpj6NWmVMwPtvRbx4Tw6XjvmWfHIawQzWeoBBSP2LBgU7uYMY4F
 /TLtOatqgv7pJiZazzpxzigQFYCdJGjzl2wz8wypRBeoYjdOD0PvcZEgoWPTiBzAt+
 /618sSiSYdk7kgzjSL4XoM7VFE2o8v/JO+uXp6subc9U/rsLqXZwlqfG+E++sehiJu
 Zr+AB2XS8YzhHkYlaqh1GHAFgOepPiYo5EIH7ri1Y6EkkYvFqBN2NG5J+MZb+0ISmN
 jkHOTCGJ+mVSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XeoFitL7
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.3.2
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.3.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f38137eb9d..4cb7da9318 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ebf40a47704d529d27a5cdd5468c5172e1a20277a65f161a5af5157b241e1120  harfbuzz-11.3.0.tar.xz
+sha256  d58ada9b2d28821245e8bdb8b94a4e2dad01a08c50d57feb027b32e84c9abfb1  harfbuzz-11.3.2.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 7eb9d697a4..219564b487 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.3.0
+HARFBUZZ_VERSION = 11.3.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
