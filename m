Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9B3CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 11:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4110260586;
	Thu, 21 Aug 2025 11:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E5bVGjKuaLX; Thu, 21 Aug 2025 11:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749C5614B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749C5614B9;
	Thu, 21 Aug 2025 11:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89EF97AD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 11:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 743EA826A8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 11:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyWGJvTIGL4g for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 11:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 689E982605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689E982605
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689E982605
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 11:48:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1049908869; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 11:48:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1up3lx-00G5Tv-29;
 Thu, 21 Aug 2025 13:48:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 13:48:00 +0200
Message-Id: <20250821114800.3834308-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bZDCbhPDu+0HW8tXJvVM8VlbFHndzyvAl1PkYXZtVDqWQsHMXv+BKaBD3me42n89iFxaud/PYOZ8R1Oy3bjd1sT/OWcBQq5heHx8dPpMez/jwNS0iNe6mp7vQgLg9kB5E3Nh9sKihhKDEaOsdM2x5zIEx8ifzikGK/K0pGdwCitG7mSisibcy7Kqe8nT7oGoM6KMdQThlkWNBT8Uj2DWKfpRgvoUybIEcyPkyyG85meIZCpX7qywTroeHzdnGTMRdoELT2+QheugOFcms1vVVSypfxJYKMeU4zy7gQbgAqz7ZhJTAsAuAFtOMjIrZwjOEyno7cG3hlNfG4fJPm5Yfw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=8NDqIdJ4eR8pCinpIJ6qQoKSh7oEcCmAKo0G2x1TXko=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bZDCbhPD
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/dump1090: fix build w/ gcc-15
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

Fixes https://autobuild.buildroot.org/results/dbf55d0fd8d779f408e7ccca4c2a9083e7a11f6a/

GCC-15 has gained a new warning about non-NUL terminated strings and
dump1090 is built with -Werror leading to build errors like:

interactive.c:143:23: error: initializer-string for array of 'char' truncates
 NUL terminator but destination lacks 'nonstring' attribute (5 chars into 4
 available) [-Werror=unterminated-string-initialization]
  143 |     char spinner[4] = "|/-\\";

Add a patch from an upstream pull request to fix this by zero terminating
the strings.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-compilation-with-GCC15.patch     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/dump1090/0002-Fix-compilation-with-GCC15.patch

diff --git a/package/dump1090/0002-Fix-compilation-with-GCC15.patch b/package/dump1090/0002-Fix-compilation-with-GCC15.patch
new file mode 100644
index 0000000000..6361dbc907
--- /dev/null
+++ b/package/dump1090/0002-Fix-compilation-with-GCC15.patch
@@ -0,0 +1,50 @@
+From 93be1da123215e8ac15a0deaffedd480e8899f77 Mon Sep 17 00:00:00 2001
+From: Conrad Kostecki <conrad@kostecki.com>
+Date: Tue, 22 Apr 2025 00:41:31 +0200
+Subject: [PATCH] Fix compilation with GCC15
+
+Upstream: https://github.com/flightaware/dump1090/pull/261
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ais_charset.c | 2 +-
+ ais_charset.h | 2 +-
+ interactive.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ais_charset.c b/ais_charset.c
+index a487e3c..0d3af03 100644
+--- a/ais_charset.c
++++ b/ais_charset.c
+@@ -1,3 +1,3 @@
+ #include "ais_charset.h"
+ 
+-char ais_charset[64] = "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_ !\"#$%&'()*+,-./0123456789:;<=>?";
++char ais_charset[65] = "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_ !\"#$%&'()*+,-./0123456789:;<=>?";
+diff --git a/ais_charset.h b/ais_charset.h
+index 93d4a72..95ef373 100644
+--- a/ais_charset.h
++++ b/ais_charset.h
+@@ -1,6 +1,6 @@
+ #ifndef AIS_CHARSET_H
+ #define AIS_CHARSET_H
+ 
+-extern char ais_charset[64];
++extern char ais_charset[65];
+ 
+ #endif
+diff --git a/interactive.c b/interactive.c
+index 8761c95..75775ad 100644
+--- a/interactive.c
++++ b/interactive.c
+@@ -140,7 +140,7 @@ void interactiveShowData(void) {
+     static bool need_clear = true;
+     uint64_t now = mstime();
+     char progress;
+-    char spinner[4] = "|/-\\";
++    char spinner[5] = "|/-\\";
+     int valid = 0;
+     double signalMax = -100.0;
+     double signalMin = +100.0;
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
