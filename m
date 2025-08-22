Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB20CA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CFC83BBA;
	Fri, 22 Aug 2025 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snWa13bropvL; Fri, 22 Aug 2025 20:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E346C83BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E346C83BB1;
	Fri, 22 Aug 2025 20:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A3F42E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B08EB40CB5
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJqwwT866F9T for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 20:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A59640CF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A59640CF3
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:08:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0492F8777A; Fri, 22 Aug 2025 20:08:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Aug 2025 22:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13e778fcf14949a45c64803d5fd5ee8061a518d4
X-Git-Newrev: b73853cf7fedb42d686732c20b5c5a440c3f269b
X-Patchwork-Hint: ignore
Message-Id: <20250822200813.0492F8777A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: fix build w/ gcc-15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b73853cf7fedb42d686732c20b5c5a440c3f269b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../dump1090/0002-Fix-compilation-with-GCC15.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
