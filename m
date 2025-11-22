Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C57CCF64B1
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B1660AB4;
	Sat, 22 Nov 2025 13:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gy9VVmws4mv; Sat, 22 Nov 2025 13:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2C960AB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2C960AB1;
	Sat, 22 Nov 2025 13:08:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF48834E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A187B841F4
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPEJqxRzzbqR for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 973E3841D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973E3841D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 973E3841D2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:08:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F6ADA4C7503
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 14:08:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMnM6-000000002Rw-3rG4
 for buildroot@buildroot.org; Sat, 22 Nov 2025 13:08:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 14:08:47 +0100
Message-ID: <20251122130847.2242703-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763816927;
 bh=KmEh49a/d17xNYrfiE+ms9FexB13rckJ8ktl77RPaGc=;
 h=From:To:Subject:Date:From;
 b=0IKpM8MFyvmXQRI2PvziI7ld6tWmFyOJCnc+KM4XPskcEgbn/XSKmrrvPFk+zCjzd
 FlscjoBH/ZqNhdPWGQgv9wvehzi3MkxrCGooamfxHeWLZsE7GTxSBNxciXB0rBmk/7
 7o/5oRc+Indq2efqphTP7ZNpwlejODvdDTCuo98qZlbEn8IUSFrtEMxfHUKAaICLZL
 q8ouNjrQZzHl1htEsJ2enaWscpyMRR/tKkl8zAWfgkWljPKkW5HWjRwkagNAKwTQAK
 WrjH3VJ4qccqHDYdTricfLIZVQ6NY/hEikfmfHzaIy0FJ0PCPgWwqs3cwIIb7Rp4GV
 e5BBQ06+S8scg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0IKpM8MF
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: fix build with newer gcc
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
 ...tterutils-Explicitly-include-cstdint.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch

diff --git a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
new file mode 100644
index 0000000000..e3dc308a2f
--- /dev/null
+++ b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
@@ -0,0 +1,42 @@
+From 7b469b4220f96fb3d036cf68cd7bd30bd39e61d2 Mon Sep 17 00:00:00 2001
+From: Christopher Fore <csfore@posteo.net>
+Date: Wed, 14 Aug 2024 21:02:32 -0400
+Subject: [PATCH] emitterutils: Explicitly include <cstdint>
+
+GCC 15 will no longer include it by default, resulting in build
+failures in projects that do not explicitly include it.
+
+Error:
+src/emitterutils.cpp:221:11: error: 'uint16_t' was not declared in this scope
+  221 | std::pair<uint16_t, uint16_t> EncodeUTF16SurrogatePair(int codePoint) {
+      |           ^~~~~~~~
+src/emitterutils.cpp:13:1: note: 'uint16_t' is defined in header '<cstdint>';
+this is probably fixable by adding '#include <cstdint>'
+   12 | #include "yaml-cpp/null.h"
+  +++ |+#include <cstdint>
+   13 | #include "yaml-cpp/ostream_wrapper.h"
+
+Tests pass.
+
+Closes: #1307
+See-also: https://gcc.gnu.org/pipermail/gcc-cvs/2024-August/407124.html
+See-also: https://bugs.gentoo.org/937412
+Signed-off-by: Christopher Fore <csfore@posteo.net>
+
+Upstream: https://github.com/jbeder/yaml-cpp/commit/7b469b4220f96fb3d036cf68cd7bd30bd39e61d2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/emitterutils.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/emitterutils.cpp b/src/emitterutils.cpp
+index fc41011a5..f801b1d0c 100644
+--- a/src/emitterutils.cpp
++++ b/src/emitterutils.cpp
+@@ -1,4 +1,5 @@
+ #include <algorithm>
++#include <cstdint>
+ #include <iomanip>
+ #include <sstream>
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
