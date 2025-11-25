Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29213D10366
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF87410D6;
	Tue, 25 Nov 2025 22:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzTtAckT6xFA; Tue, 25 Nov 2025 22:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C744F41094
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C744F41094;
	Tue, 25 Nov 2025 22:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6822A9
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6064B83DF0
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5Px6k51xq5c for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 22:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CD4483DEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD4483DEE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CD4483DEE
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:03:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59A15A4C74B2
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 23:03:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44162)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vO18c-000000003X6-4B5e
 for buildroot@buildroot.org; Tue, 25 Nov 2025 22:03:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 25 Nov 2025 23:03:54 +0100
Message-ID: <20251125220354.851214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764108235;
 bh=8NEFl3BN3vhDgmUPwgFgxpAe/XQysnGD0vER4PyJ+NM=;
 h=From:To:Subject:Date:From;
 b=oXA6/6y+6ofLdhLskydtjMV+FiT8IxP8/ToLoKHp+6JQmQr5c0uFM+gF67uRHgPGl
 +mWlLPQY7y45ZULURlBPfbn2j5iaLBrYY2G5tb4jbf+el331VQOevnIVJH3iStNOgw
 ks86iaRzIHb751RYXPcKEPcpbZnjlAd3EXMQeU2ElgDzhuOnzQnH/cRb82g5pyLHH6
 zOtmODMDrJJZ7wXoS+4Pna1XhwF15wmfn8TV1bCjcjG//4ZTCNc5ZWFauVzglB7Cfr
 +HMQsUqrekwibgvvQI0+rNC9v5H+aC1fo1/uoN0lLcFu0woZbYV144p7rNjSoOQoAd
 mE+gdWP83qcHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=oXA6/6y+
Subject: [Buildroot] [PATCH 1/1] package/lmbench: fix build with newer gcc
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

Fixes:
https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b/

Sent patch to active fork:
https://sourceforge.net/p/lmbench/patches/3/#4472

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0009-src-bench.h-include-string.h.patch   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/lmbench/0009-src-bench.h-include-string.h.patch

diff --git a/package/lmbench/0009-src-bench.h-include-string.h.patch b/package/lmbench/0009-src-bench.h-include-string.h.patch
new file mode 100644
index 0000000000..0c82a58b59
--- /dev/null
+++ b/package/lmbench/0009-src-bench.h-include-string.h.patch
@@ -0,0 +1,36 @@
+From 30a95099f4711d7c5a59526a84e2c73701af3c3c Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 25 Nov 2025 22:57:21 +0100
+Subject: [PATCH] src/bench.h: include string.h
+
+Fixes build error with newer gcc, detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b//build-end.log
+
+lib_unix.c: In function 'unix_server':
+lib_unix.c:29:9: error: implicit declaration of function 'strcpy' [-Wimplicit-function-declaration]
+   29 |         strcpy(s.sun_path, path);
+      |         ^~~~~~
+lib_unix.c:10:1: note: include '<string.h>' or provide a declaration of 'strcpy'
+
+Upstream: https://github.com/intel/lmbench/pull/41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/bench.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bench.h b/src/bench.h
+index 3b25a47..f0fd6b7 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -27,6 +27,7 @@ typedef unsigned char bool_t;
+ #ifndef WIN32
+ #include        <strings.h>
+ #endif
++#include        <string.h>
+ #include        <sys/types.h>
+ #ifndef WIN32
+ #include        <sys/mman.h>
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
