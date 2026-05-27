Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6A2CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 19:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93E441DF3;
	Wed, 27 May 2026 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuu_YQipBk-W; Wed, 27 May 2026 19:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 253C041DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779911799;
	bh=mi+JNBPu0vb4mGj7sSGBjMZ2k0v4JU8o+hJ3vlI8X4U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b0EylU00ayt+FqyBv4iLOalUqMWywv6Xr5NHjvuUg8hUqNGWcOglNjjln5sRVOoA/
	 Ffxz+KUknXwKsJdOLg6xK2EMQJKNSVI3YDtHw5rLxWKzngoO6f3V5RdXTLVFFffDVm
	 ZvtrKVZR5XFBQON1hTzFHTkjpRfiRf8oWGXG27nzljO2pDUCAfmAztnLtrLNIwBX0X
	 ddB5OCWdfYdFiQfjd2JqUBFS2GzC2LuxN4i8x0RzDYEZYKT4o9UHfgjrEvfKqoC/lb
	 rtdL/r4+d6uYhC/Y7TnMbV8wRH32E9b3gaAoY1r26r4/Vg618Kj+pzufYlXfS/H39V
	 QUlpJUOyCs5Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 253C041DDD;
	Wed, 27 May 2026 19:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAD9288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B70843FC
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ30Nk0HgznF for <buildroot@buildroot.org>;
 Wed, 27 May 2026 19:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3B22843F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B22843F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3B22843F5
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:56:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE20BA4C2118
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:56:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39932)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSKMi-000000002Z6-3saw
 for buildroot@buildroot.org; Wed, 27 May 2026 19:56:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 21:56:33 +0200
Message-ID: <20260527195633.3540374-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779911793;
 bh=sqMTMMR/ESIFCXU+bKOrY1w6CMeVG493GLV2FpP969c=;
 h=From:To:Subject:Date:From;
 b=pg1ZrsJdOo56wwgSMCCdBzosCb8fgHO+z5X2xbvDtYDJePX1Bu+pYbw/WClSd8GE6
 jNcOTkX87hw6mKhaFTjctFUppIctKaCzr6azItAy6tTYbxpu3Ezqr9k8vT7OXbhZ1r
 hDctlM71GjCQKHzvLJbPB84TuaG5grEB0tZWxV5OLytA+Eg3Cg9AQdvtOcItTAwhYt
 JUgvipLRl+SuUae8GaLfIFn69deXHO8gBE5ehHt5X2+6HHCLfFM37++ft2vJK88csX
 /POBlm2eSdsskZhn9DeGa6VksgDaTxbxpuEpnEmLNB9z23+vGOEh3N3FDMwFo6cOTw
 JNrAYiySiQIuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pg1ZrsJd
Subject: [Buildroot] [PATCH v2 1/1] package/vorbis-tools: Fix build with gcc
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

Added upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/

The build error can be reproduced by this minimal defconfig:
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PACKAGE_VORBIS_TOOLS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: replaced backported patch from Fabrice with upstream commit
    added result of Gitlab pipeline:
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2556996655

 ...r-charset.h-to-find-charset_convert-.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch

diff --git a/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
new file mode 100644
index 0000000000..3e97976fd8
--- /dev/null
+++ b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
@@ -0,0 +1,32 @@
+From 5155bf98a5b10fdf950dfa8f6edad624c0db7030 Mon Sep 17 00:00:00 2001
+From: Petter Reinholdtsen <pere@debian.org>
+Date: Sun, 22 Feb 2026 23:33:59 +0100
+Subject: [PATCH] Added include for "charset.h" to find charset_convert()
+ prototype with gcc >= 14.
+
+Patch from Bernd Kuhls.
+
+Fixes #2334.
+
+Upstream: https://github.com/xiph/vorbis-tools/commit/5155bf98a5b10fdf950dfa8f6edad624c0db7030
+
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
