Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B0FC9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 11:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE654170B;
	Sun, 18 Jan 2026 11:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhiHmiVP6o0W; Sun, 18 Jan 2026 11:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9111541711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768734492;
	bh=DjEkZfyGRrCbiGD8eOElzULbMM8TwL3zRoACBk9GXKk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s4IGYN5G8OacoZEcJbQjtkKf+PwQOsKh9+AsmipCKm8IcdmKhXPDF/TqRPTVRRr0g
	 QmyCfHbf6+fQ0M7GXTEV6k5gUj1f6/0qyWy8cZasb/av6fTnnQ1HCM5xuU+TYlxuZf
	 hfDQxerlBmqGfYXX8UeWko/JDhflzOwqEt4yXo2R6FTE/SnTBCfwm/WjbsVbF+o5IN
	 jtJV38AxHE+j6jaNJeHwVLGXFDuNg0HRc+5q4YkUQVjHzBxCiSz9k4Mj7W2NjqfbPr
	 xK0BiE4tCaTYU+74gG2MSEvmb15FRRKJmmklZQBWSGmXsBunjaSOg0jI9BKN42nE5I
	 Xg4mdJMfgfqhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9111541711;
	Sun, 18 Jan 2026 11:08:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 012D52A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7E74143D
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VTPERm7qplO for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 11:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E15E340025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15E340025
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E15E340025
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:08:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84C0EA4C4747
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 12:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhQdZ-000000005th-2vRx
 for buildroot@buildroot.org; Sun, 18 Jan 2026 11:08:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 12:08:06 +0100
Message-ID: <20260118110806.947687-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768734486;
 bh=bWQacyjZ66mNNMPClq0r0FROPFNJEPXMwphNGTv64Wc=;
 h=From:To:Subject:Date:From;
 b=Ai8UCIc8Z+/OkEDnxz2G67WWLKamMRxk6x+t9s4b5MSUQsdzngaqKQLikwkTMBhNR
 Mh2RWPLLnDVYUBFMYaNApaDb0N6UReMrjiFrDuX7htTl/0Auqv1G6BleDfsiLN11hi
 3j78htbhvCBZFVfo37Owtzhh+W3Q08LfNvHXY7Cfokaido9M79NdDUXMJqDKyKov/U
 GTBmpdrihN0g6gaBH597Iy3s7W752EYBzNkYmh9BAD4Z8ROgTgrUqLuFc4kxs7ABv7
 Ns2aEZGVg15oq0F+Ln7F1jcwLbuhFTVa/7bGvFlfAfxIixAKW5/dKvpw0WzuDKRIWB
 keawTLfusQQGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Ai8UCIc8
Subject: [Buildroot] [PATCH v3 1/1] package/vorbis-tools: Fix build with gcc
 14.x
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

Buildroot commit ce5d1735710d11b135fc6cb235e976b306833e7d removed
0001-fix-build-with-gcc-14.patch which the version bump to 1.4.3.

The patch originally not only fixed share/utf8.c but also
ogginfo/codec_skeleton.c. Upstream only applied the fix for
ogginfo/codec_skeleton.c:
https://github.com/xiph/vorbis-tools/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
so the build still fails:

utf8.c: In function 'convert_buffer':
utf8.c:271:9: error: implicit declaration of function 'charset_convert'
 [-Wimplicit-function-declaration]
  271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);

Upstream was notified:
https://github.com/xiph/vorbis-tools/pull/48#issuecomment-3765168005

Fixes:
https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/

The build error can be reproduced by this minimal defconfig:
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PACKAGE_VORBIS_TOOLS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: rebased original patch from Fabrice
v2: added minimal defconfig (Thomas)

 .../0001-fix-build-with-gcc-14.patch          | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/vorbis-tools/0001-fix-build-with-gcc-14.patch

diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..763a2cef87
--- /dev/null
+++ b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
@@ -0,0 +1,39 @@
+From 48aa869f3ece8cd0dc161d454198a4db6dc7e419 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 21:57:38 +0200
+Subject: [PATCH] fix build with gcc >= 14
+
+Add missing includes to avoid the following build failure with gcc >=
+14:
+
+codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
+codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
+  119 |     if (utf8_decode(header, &decoded) < 0) {
+      |         ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/xiph/vorbis-tools/pull/48
+[Bernd: rebased for 1.4.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ share/utf8.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/share/utf8.c b/share/utf8.c
+index e1199bc..1e6965f 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
