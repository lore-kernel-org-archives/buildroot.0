Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EE7FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE6F60ADB;
	Tue,  5 May 2026 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOSXXME4K4cJ; Tue,  5 May 2026 19:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C79E60AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778008595;
	bh=0Pz/jEULOjqxjfGsTusxctUOG2WqVDGZG3DuxvSuWaA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YFPdYF7tepulF5CA26OXzfGN0oYefxhGA2BLcmJ1kRqouOle5ouw8wMy3mfUbB597
	 AkM/ZD500Pj2USYYvBTmc+Wx2Wu+HZN0s3Qqop0fcoyPo4A/XfCp4onHrmwFc+g4Nh
	 /tZ9oGsiIMo8oWJMiQQQbud+jEBiFJA0/kJF1Fsy6mjb/8obgz3sa8wrncLxHqEHbD
	 +O7ycHS9ZRxS6u7acVmsoqmIburSPh42ee0p1wNPpE07WiuoD1e9eLi1U9yTqNgKK4
	 +IFkUOKDi/LOoF6vlA7tjcsoHMuroa3XNC0CZ7+lFStKg1izkuVAfLpRYI99HdrYsk
	 6JGu/t+m9IG5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C79E60AD9;
	Tue,  5 May 2026 19:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B100315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30B03819D2
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0tyUJ8h1YtP for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F1E7819CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F1E7819CC
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F1E7819CC
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:16:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id KLFpwWdqQ0dL0KLFpwAgSj; Tue, 05 May 2026 21:16:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  5 May 2026 21:16:25 +0200
Message-ID: <20260505191625.1031165-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFabFWFOJ9wjHnDm+GhPmBYGX1cnrOnVwdmHjwy/eRIeZoSx7044RZqGqkwK2Yb8WiZ5B+qw6X5yDMTikCI0BnysHAMN9ojxF4Q4GQtwPcrVYrQbxVSj
 Cz+jqN3Zml/rrN2QwoS+yGrRTZ6CVgfDrscOYjJXcBko2qKGT63AJbt21sdw82dl71MZeusBhu/gu0gqzQKNJ1Ozw+HUG5Lz/PXDRIx6XtJukGKtTiupHlH5
 9kfD+bQ6UzrOAMUEbzWdGZYfWjfsR0p7w9DQ+ComROvYAD/8vRPARsGHwWwP7ubu1RaQeJgu6ztBHbphxBFYXQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778008586; bh=1RC5QOaL8Dh/PaKjIbKPSccztFdsg7DX69YRJI+SZ5M=;
 h=From:To:Subject:Date:MIME-Version;
 b=L9xhS8SUHXr07jzRi/9TFOdjKg+TQS8RrH4BsXSh+7p491t74tnEC8eA2cEApO+Oa
 0IOZYLy+grau8glI421KnmukbsRzDWe5B4rMXxNMAK1dKrfluEM0qeWcOprgFprp5X
 co8CnzNTwORc6pO0LG0ZolJ0DxS9kNcbnIq7JgerK+0XKKeTm3kjLneVvHdr5AaRX+
 FJo81guA1xnQ2YS9cpiFVG83BZe6S2gDw22ZivcCNM/zPU5LIobneAWpoaIo24bd9k
 JBjXCcTDv5NO/+SeZXv8itl5GpCH7pvDLjhu21YYGzusAqJJAZxYBFl0CCERWuyBCn
 3uU3SNxhaBmKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=L9xhS8SU
Subject: [Buildroot] [PATCH] package/p7zip: bump to version v17.06
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

What's Changed:
  - Fix CVE-2021-3520 affected components Lz4 1.9.3 in p7zip17 (#239)

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/p7zip/p7zip.hash | 2 +-
 package/p7zip/p7zip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index f0b9c27113..d352965950 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6  p7zip-17.05.tar.gz
+sha256  c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1  p7zip-17.06.tar.gz
 sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 803fd38b7f..ee5a7d2e10 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 17.05
+P7ZIP_VERSION = 17.06
 P7ZIP_SITE = $(call github,p7zip-project,p7zip,v$(P7ZIP_VERSION))
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
