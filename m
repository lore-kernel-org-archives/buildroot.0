Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D3DC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226EE408C0;
	Wed,  9 Aug 2023 21:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226EE408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bKvD-0Clki7; Wed,  9 Aug 2023 21:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11F57408B5;
	Wed,  9 Aug 2023 21:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F57408B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB65A1BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C43CD408B5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43CD408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTy8UTaK8YTi for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:19:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A812B408A1
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A812B408A1
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D612DA4C00C2
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 23:19:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52966)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqad-0002CR-23
 for buildroot@buildroot.org; Wed, 09 Aug 2023 23:19:35 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:19:35 +0200
Message-Id: <20230809211935.3589420-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615975;
 bh=FxHeahTVImVyvW7el4+x1fG24/b8z6m0MMejBMT/5Y4=;
 h=From:To:Subject:Date:From;
 b=BUG+quSan+6RMGvk1qfWpZqzCOKFVzjJNDCVGOb429AfiwsXGjhCmrPZqqrwfzKOH
 X3XLR5RA494rdCKK5Gqf++/fwfsCs9EJTMu62rJwzB0o9zz0wrOr8fJa/AP/3Wvp9y
 47eSZ6SRbi+wNx4ZDlxVY+ZICDSjtsb/RQtJRbuVvdYCju12s2N9ypbec2ty9WHoGg
 8glkNxhY1VQouwTv3yt91kRvmveVWpzPDeF4uF00YoardHchojqK43mq0TtPKUsJKK
 gdqJTGH6159/K6/ywfl8xRFFoNeUQ9K1tFdXPo8Lrs/RSBYz3NJwn4dZGF5EYUIrVi
 uHzlZdJ5f3LiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BUG+quSa
Subject: [Buildroot] [PATCH 1/1] package/kodi-imagedecoder-heif: fix build
 with gcc-13
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...de-missing-cstdint-to-support-gcc-13.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch

diff --git a/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
new file mode 100644
index 0000000000..bd431545e1
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
@@ -0,0 +1,31 @@
+From 47dcb3843e02abb69c52d6f0021bd2816b8317a5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 27 Apr 2023 02:46:59 +1000
+Subject: [PATCH] include missing <cstdint> to support gcc-13
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/xbmc/imagedecoder.heif/commit/47dcb3843e02abb69c52d6f0021bd2816b8317a5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/TinyEXIF/TinyEXIF.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/TinyEXIF/TinyEXIF.h b/lib/TinyEXIF/TinyEXIF.h
+index 56354aa..b03d36b 100644
+--- a/lib/TinyEXIF/TinyEXIF.h
++++ b/lib/TinyEXIF/TinyEXIF.h
+@@ -34,6 +34,7 @@
+ #ifndef __TINYEXIF_H__
+ #define __TINYEXIF_H__
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
