Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F4CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2843B84C35;
	Sun,  2 Nov 2025 11:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlUEOADN1KY7; Sun,  2 Nov 2025 11:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1B184C3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C1B184C3B;
	Sun,  2 Nov 2025 11:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9D0222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9914C42489
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUblc-XV6aKN for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF9EC42475
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9EC42475
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF9EC42475
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:54:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70A2AA4C5EED
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:54:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFWfN-000000000re-20RP
 for buildroot@buildroot.org; Sun, 02 Nov 2025 11:54:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 12:54:36 +0100
Message-ID: <20251102115436.1399397-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762084477;
 bh=5AtlHWJBdVcJ9QnZgtFexu5XFzIgxCvceET2HzJPUj4=;
 h=From:To:Subject:Date:From;
 b=ojmUsvqv23Ce1szI7QHplxj23jdpee9vobdK36ixrMd1isoKQ3LTQgKUUQ1ZqyO6Q
 0Dr/AEPwvCNs3q3e5vk039neqtHyZZtwIKqNH/+B0oJ2OEzUJ4p5K2PyiMYbJnDbGJ
 owephteYYsPTE8TCMs26mdtmv0DRm3lSo4cQMBSgdeSdzI1mRvBbtyyvUYa8B0d2KT
 petoi5XJybtuzVsdimQetkpg2IBR9istA5nk4o+RXfUDqg8oNWzwRIhAv4H8Z+aRv4
 foWeLz6orLrOD1xDwQ1JTCl+9n8+xYH2Fy8iaFTi0KC+WlfjplnxVgNs/8Tnj3lqiZ
 7cIVdzlsEIRlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ojmUsvqv
Subject: [Buildroot] [PATCH 1/1] package/vorbis-tools: Fix build with gcc
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
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
