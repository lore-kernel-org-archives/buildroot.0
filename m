Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5506C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 22:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 607EB6105A;
	Sun, 17 Apr 2022 22:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHRLJKFWk-Pa; Sun, 17 Apr 2022 22:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B166101B;
	Sun, 17 Apr 2022 22:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B88641BF3C5
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 22:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD4D2410E3
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 22:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2mz64hksjj3 for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 22:35:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33604410DE
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 22:35:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.82.161])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gDUBnDSgozjCEgDUBn4gde; Mon, 18 Apr 2022 00:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1650234915; bh=7qMigi6KDR46V7KckcEfUdByQgCpN5JJ8jniNUMO86c=;
 h=From:To:Subject:Date:MIME-Version;
 b=hKje8BtZ+FpJYh9B0BFnhzNi+S7cbi3a6BHH/In7/KY4D1Strj1zXdJPRa3StWtGH
 bmATRrF+gMAgbpjjY5Zi2BA9HT6DGXCnBII+szl5eerrdhRQ3SIy/JJazdT4zTO1s+
 gC1KwQ6/53BHD85qVRvenVOTd6Iv3PdBjv43mW9PQK7Qte5Hm8njkkLmFLHmr16/5Z
 M7m784wis6dZVxh/MrdjpJ4lPZ2bpErngl6VhkViZQNHlESnNwCDC0vo98pBR2Znfk
 VHmrbTE13UVueOHUgmQkv+8pNeLawTBzZokt64MRc2ZvDb5aOb6zJ+biOKEI9Ej0Dc
 436f35DvcG7zg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 00:35:14 +0200
Message-Id: <20220417223514.3080791-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHoy2Ewvsk2ug/86llLEpgHNS2k4Hpya6yhcGFuM9V6u2PT7/z5ntirI9qRebKUQKBjXRRpQ9D0TZ1wlhxBvGAaWW3fjkmMcP9AfdUL89rQuepSv8fnc
 qviz7rGeC8BB7dLUNM6yTpcQb2gMsfGFFYOGKARBXmsElCU2+4nyLLgp9CdzChE5z2nYnxGdcitbuyLieuKms7RWrX5EClQjys+ObTcXT0hlE0bBQA4P0gKV
 xaz4rK7MrnOzOg0j6HQZhtKjpKcJLO/rMFELl67fu+I9LfASHKjhuIFyoCF3wzIS
Subject: [Buildroot] [PATCH] package/libnspr: fix build failure on mips with
 musl libc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch that uses Linux <asm/sgidefs.h> instead of libc <sgidefs.h> since
musl doesn't provide it.

Patch is pending upstream here:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Fixes:
http://autobuild.buildroot.net/results/61743bf5ad9ddc69786ae854ed4ab58c59f64dd0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-1765100-fix-build-on-mips-musl-libc.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch

diff --git a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
new file mode 100644
index 0000000000..10bf74130c
--- /dev/null
+++ b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
@@ -0,0 +1,33 @@
+From 00e5b818f2d9f3264107801fc2fcff33a9355a78 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 17 Apr 2022 23:55:26 +0200
+Subject: [PATCH] Bug 1765100 - fix build on mips+musl libc
+
+This patch fix build failure on mips with musl libc by using Linux
+<asm/sgidefs.h> instead of the one provided by libc since musl doesn't
+provide <sgidefs.h>.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+This patch is pending upstream:
+https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
+---
+ nspr/pr/include/md/_linux.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nspr/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 23b160fd..dbc0d40e 100644
+--- a/nspr/pr/include/md/_linux.cfg
++++ b/nspr/pr/include/md/_linux.cfg
+@@ -499,7 +499,7 @@
+ #elif defined(__mips__)
+ 
+ /* For _ABI64 */
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ 
+ #ifdef __MIPSEB__
+ #define IS_BIG_ENDIAN 1
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
