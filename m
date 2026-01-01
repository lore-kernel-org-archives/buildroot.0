Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9334EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A0E40210;
	Thu,  1 Jan 2026 17:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGSyPDYblZ8Z; Thu,  1 Jan 2026 17:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF27240235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767288971;
	bh=EOIq+knoDs+ya/+Lb0MxmjOrtqUayKxsSxtKVAFdEW4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bYMA3QzhcKmEOJjDos8qPVI3usdCtANBakC2lTBe58tw3+YCnZNwBOT1ktgNapdEf
	 w1DKf7tF6l5QkHpXG7UE0WNV5twtAq3Ta8MlZaNwVrbIawF3Oj/r6SIsPgoOqolNlG
	 4LYEy5DAvIjoNuMJohal/YKXHEkuvUvttHBoqa8EksP0QRe9QipNGd8l/pELbHDoNO
	 fwLKAvSO8fH7x1RwLbHSZR7GGWI4Rv/CamdOVZBrsQaZ+qmbh8GvbdwJ/lyprHbEMs
	 kjAiW8FSpZMJXgPl/936VLG8c0HqUU86iiD5sdynKubwcSMLVJS57f2b6ieF1+5uam
	 ekY1LT/Dr3IMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF27240235;
	Thu,  1 Jan 2026 17:36:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBCF2206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB786605BB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKnLG3FlEJfP for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 285EB60586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285EB60586
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 285EB60586
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A0EDA4C2F95
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:36:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52358)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbMai-00000000128-3Wfu
 for buildroot@buildroot.org; Thu, 01 Jan 2026 17:36:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 18:36:05 +0100
Message-ID: <20260101173605.3921942-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767288965;
 bh=BFNcZqAwxmG7BTxyXnmX/0SOrF01Jy2022SjBOPo114=;
 h=From:To:Subject:Date:From;
 b=iYM4N3hjLhcUHr2aiKEm8QHc1+dlnCEIr+DD1UKl2HHLRV6QkAc2Vq2YJRyZwzxtG
 5SzdTMEoZeGUs38k1DMTOHOo4ZYgRQwyi/0vCqCoxnbJeDL6QTzwIuJ/BmkuVs1PZq
 rlz72sw7l1jQTsuxLtz6Pb/+B2vbuZSy0i4J9K/e1Jk1qX4cKYjlIFODRnRqDWbxEw
 lL4lIL7gqdf/DJ9bVxmkiq1RNg6+WC8+7p+no9qo5jro/VepA33XINMoAE1H7jBJz4
 ODgXlNRGh9L+653gYHQ++va3bQJvjBBgZ0IgOcwIFYQelQ+Ff7oVI2AfXADJbvlx4U
 rjrP2YREDltEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iYM4N3hj
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

Fixes:
https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/

The build error can be reproduced by this minimal defconfig:
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PACKAGE_VORBIS_TOOLS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added minimal defconfig (Thomas)

 .../0001-utf8-Fix-build-with-gcc-14.x.patch   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/vorbis-tools/0001-utf8-Fix-build-with-gcc-14.x.patch

diff --git a/package/vorbis-tools/0001-utf8-Fix-build-with-gcc-14.x.patch b/package/vorbis-tools/0001-utf8-Fix-build-with-gcc-14.x.patch
new file mode 100644
index 0000000000..fa941ab2b4
--- /dev/null
+++ b/package/vorbis-tools/0001-utf8-Fix-build-with-gcc-14.x.patch
@@ -0,0 +1,36 @@
+From c7548e71b6a3b228b83cfbe7cbec6e23c74dbc8f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 2 Nov 2025 10:05:50 +0100
+Subject: [PATCH] utf8: Fix build with gcc 14.x
+
+Build error was detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/
+
+utf8.c: In function 'convert_buffer':
+utf8.c:271:9: error: implicit declaration of function 'charset_convert' [-Wimplicit-function-declaration]
+  271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);
+
+Include charset.h which contains the declaration of charset_convert().
+
+Upstream: https://gitlab.xiph.org/xiph/vorbis-tools/-/issues/2334
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
