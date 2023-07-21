Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE40EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 22:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2812D83AA0;
	Fri, 21 Jul 2023 22:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2812D83AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6n4wN1Sha5q8; Fri, 21 Jul 2023 22:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662B383A89;
	Fri, 21 Jul 2023 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662B383A89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5C891BF30D
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 22:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F494013C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 22:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F494013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mX3M9rcnqhRL for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 22:08:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9FCE40128
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 22:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9FCE40128
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CBB0EA4C032D
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 00:08:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36102)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMyIf-0004rg-1s
 for buildroot@buildroot.org; Sat, 22 Jul 2023 00:08:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 00:08:37 +0200
Message-Id: <20230721220837.3289702-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689977317;
 bh=32znutWYam5T7ADMcE+2TvbdRogQIG89rNmi1/BWuNM=;
 h=From:To:Subject:Date:From;
 b=N2H+M+YvqrpDylAkiUS3/L1Gc1XgYDajSvf7A8KEqN3E16pEUSlR4wTKxqtg/LfaQ
 TDmY0ZPZMmHmOJ5yXSWr0r7t0qc2HUBOG8AcIh34eQNRCd1mAe380k8nfRORXMiS75
 xcRkiRrl+4kkdx1zi0mEwfsZS4pFLAlMo6pvPmmo/YkoT4DFSYsIEfjxsbjjtBjYqB
 ziQ2dveqc6CRW+NukMWs/qpPIgIHjaPiVWTwRj9r5guPnI6SpInifYhnJqVUfw1izF
 4MbyBs+KwCW8W71M6xAN5pcUWSFxSCAqhSvN540E2epwy+tsvF2D02CiRPeHkcngRX
 +yK0BC9n82Iwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=N2H+M+Yv
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: enable threads on
 static builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Revert upstream commit as proposed on the upstream bugtracker.

Fixes:
http://autobuild.buildroot.net/results/b8e/b8efae5bf6ac3b51e8443951ef1dd88824af3f2b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0006-Revert-Fix-static-builds.patch       | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libopenssl/0006-Revert-Fix-static-builds.patch

diff --git a/package/libopenssl/0006-Revert-Fix-static-builds.patch b/package/libopenssl/0006-Revert-Fix-static-builds.patch
new file mode 100644
index 0000000000..2bc0b961eb
--- /dev/null
+++ b/package/libopenssl/0006-Revert-Fix-static-builds.patch
@@ -0,0 +1,43 @@
+From 847a7b744e31b9f57d2a3de495187db1dc0ee6d7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 21 Jul 2023 19:30:40 +0200
+Subject: [PATCH] Revert "Fix -static builds"
+
+This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
+
+Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Configure b/Configure
+index 2c17f4186b..94cab4c3c4 100755
+--- a/Configure
++++ b/Configure
+@@ -1438,10 +1438,6 @@ foreach (keys %useradd) {
+ # At this point, we can forget everything about %user and %useradd,
+ # because it's now all been merged into the corresponding $config entry
+ 
+-if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
+-    disable('static', 'pic', 'threads');
+-}
+-
+ # Allow overriding the build file name
+ $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
+ 
+@@ -1728,6 +1724,10 @@ if ($strict_warnings)
+                 }
+         }
+ 
++if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
++    disable('static', 'pic', 'threads');
++}
++
+ $config{CFLAGS} = [ map { $_ eq '--ossl-strict-warnings'
+                               ? @strict_warnings_collection
+                               : ( $_ ) }
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
