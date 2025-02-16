Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26850C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D116340BA1;
	Sun, 16 Feb 2025 13:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pols8xnluNIr; Sun, 16 Feb 2025 13:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E3640D3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E3640D3B;
	Sun, 16 Feb 2025 13:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 136F5DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6DFF40E46
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGro-yImGbKF for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE4BF40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4BF40291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE4BF40291
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b112.dip0.t-ipconnect.de [84.161.177.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2840EA4C1559
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:50:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47800)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tjf2Z-000000000g8-03xm
 for buildroot@buildroot.org; Sun, 16 Feb 2025 13:50:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 14:50:34 +0100
Message-Id: <20250216135034.2068766-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739713835;
 bh=HUILiACIUTZN9xsZ2PJXZw23XNLcIi6ZJG6cM69FYy0=;
 h=From:To:Subject:Date:From;
 b=BfSqRR5k6icVPyYVQabaD7Zm7wHAautj8nFMJxhqDUf0rm8rSt70zjftEbjdAxxnk
 13XAIpcYX56fQjyEe452ty8hz+VZDSQ+E3jsIrlOwEKgMW5ZNDawjemFMubb+3m43k
 IxEkz4BKvhlHpE1b+4v5ueo6y/1b/72CGgEDU9RyYkod+j6bLQSEHDyI0FrGKAOC8f
 2VeuhdftqdbCm39psKstXJNv7teyZSgF0D+ZWW0KDOi4371VVZpQSyoXjZXhdDZeYN
 XjoDRUhUaOKoMaMes9EHFnlylduaUN1Zuh0yE4UIfPcOWG36fQ5F6q4rpmJLWu3KmX
 6xwpHj84Wbb8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=BfSqRR5k
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250211
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
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250211

CVE-2024-31068:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01166.html

CVE-2024-36293
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01213.html

CVE-2023-43758, CVE-2023-34440, CVE-2024-24582, CVE-2024-29214,
CVE-2024-28127, CVE-2024-39279, CVE-2024-31157 & CVE-2024-28047:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01139.html

CVE-2024-39355:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01228.html

CVE-2024-37020:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01194.html
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 81a4573110..9721a15976 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37246208ef68039be752438c72400a688a2238df13a7f5282497c80be2d8366d  intel-microcode-20241112.tar.gz
+sha256  1da88b51953c9da2e20b5c94b3d7270cf87ea5babcaa56e3d6a5c9eaf11694b3  intel-microcode-20250211.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 17f25edc83..db3e690ec7 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20241112
+INTEL_MICROCODE_VERSION = 20250211
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
