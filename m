Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98BEC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D6B418D2;
	Wed,  9 Aug 2023 21:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D6B418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDDQkn8gciwq; Wed,  9 Aug 2023 21:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B78E418AC;
	Wed,  9 Aug 2023 21:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B78E418AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0E41BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 562BD4089F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562BD4089F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXCDeBXAtGSw for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5805240673
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5805240673
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A648541D; Wed,  9 Aug 2023 21:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cebd9c7c04e355b8996d601c63602512106ca631
X-Git-Newrev: 7b0565fc9d2ee8c9cf0a493712886c24f9cdc8dd
X-Patchwork-Hint: ignore
Message-Id: <20230809214330.43A648541D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-heif: fix build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b0565fc9d2ee8c9cf0a493712886c24f9cdc8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
