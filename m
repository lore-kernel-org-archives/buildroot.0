Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A59BCFC533
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B237842F3;
	Sat, 22 Nov 2025 13:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q73yOpazs3OT; Sat, 22 Nov 2025 13:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AFA842DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AFA842DF;
	Sat, 22 Nov 2025 13:05:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB6B834E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8EE3842D0
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84YWvOxqMb28 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA51F842BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA51F842BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA51F842BF
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:05:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4DF4A4C7503;
 Sat, 22 Nov 2025 14:05:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57024)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMnIX-000000001oo-1g2l;
 Sat, 22 Nov 2025 13:05:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 22 Nov 2025 14:05:05 +0100
Message-ID: <20251122130505.2240518-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763816705;
 bh=I7PjkvIwiX+NGStyeeykLtHFlW/0o+rK+kt7JkodeMk=;
 h=From:To:Cc:Subject:Date:From;
 b=rZ0POwckOFuSakWVvWm39ol5N9gWwwrlygij+H48P+KQAKtWCgEHBOYxKL8xG5YwE
 ozX+IpKBH9HJPZKBIUg4EEECx0C+Wsc5coHc29KYVDTqwJz5z2bRleYBZ1oalPDKm+
 Tj6ubMrYxnxHlG1YiZ2vA48DRCbdEh71jbSjihHe3LtBilNLhWalbD3YEbQpy88IIC
 wGuvs8io7papq5mNhbNCFpTAi0w1rTL8laGm7okXJsrM6ApekwOAor+7Aom0+elDAO
 hHnTCS5f4xqsvrGuMuUFOnNF3u9hrEV4Mrl2XYnZjsu2D5hcwWzEEMc50a1qsJmhko
 yvlIBbtkHQPHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=rZ0POwck
Subject: [Buildroot] [PATCH 1/1] package/woff2: fix build with newer gcc
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

Fixes a build error not yet seen by the autobuilders due to other
packages failing before. Seen with defconfig:
https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...utput.h-add-missing-stdint.h-include.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch

diff --git a/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
new file mode 100644
index 0000000000..a79b414a4c
--- /dev/null
+++ b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
@@ -0,0 +1,41 @@
+From 08ece7871775c0d7bf4fdff64b961cdc256adf6c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:12:03 +0100
+Subject: [PATCH] include/woff2/output.h: add missing <stdint.h> include
+
+Without the change `woff2` build fails on upcoming `gcc-15` as:
+
+    In file included from src/woff2_out.cc:9:
+    include/woff2/output.h:73:25: error: expected ')' before '*' token
+       73 |   WOFF2MemoryOut(uint8_t* buf, size_t buf_size);
+          |                 ~       ^
+          |                         )
+    include/woff2/output.h:79:3: error: 'uint8_t' does not name a type
+       79 |   uint8_t* buf_;
+          |   ^~~~~~~
+    include/woff2/output.h:16:1: note: 'uint8_t' is defined in header '<cstdint>';
+      this is probably fixable by adding '#include <cstdint>'
+       15 | #include <string>
+      +++ |+#include <cstdint>
+       16 |
+
+Upstream: https://github.com/google/woff2/pull/176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/woff2/output.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/woff2/output.h b/include/woff2/output.h
+index dc78ccf..b12d538 100644
+--- a/include/woff2/output.h
++++ b/include/woff2/output.h
+@@ -9,6 +9,8 @@
+ #ifndef WOFF2_WOFF2_OUT_H_
+ #define WOFF2_WOFF2_OUT_H_
+ 
++#include <stdint.h>
++
+ #include <algorithm>
+ #include <cstring>
+ #include <memory>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
