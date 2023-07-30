Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9EEC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 12:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA9E41690;
	Sun, 30 Jul 2023 12:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA9E41690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMKimfdk0UpC; Sun, 30 Jul 2023 12:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3240641680;
	Sun, 30 Jul 2023 12:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3240641680
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35D321BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F7AD60BA7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7AD60BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f619Mkgkz-h4 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352D360B9C
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352D360B9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2407C83C67; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 14:40:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9f5e15305e38bbdc211e807bff1a44d0732110
X-Git-Newrev: 50d081916e57c132ad726743ff3e664d2ced7235
X-Patchwork-Hint: ignore
Message-Id: <20230730124111.2407C83C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-timidity: fix
 build with gcc-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=50d081916e57c132ad726743ff3e664d2ced7235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-MidiScan-include-missing-cstdint.patch    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch b/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch
new file mode 100644
index 0000000000..a0fb586e44
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch
@@ -0,0 +1,29 @@
+From 0d4d3fcf5c58dd16b3e9a7337189141b839e4ace Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 15 Apr 2023 07:41:15 +1000
+Subject: [PATCH] MidiScan: include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Upstream: https://github.com/xbmc/audiodecoder.timidity/commit/0d4d3fcf5c58dd16b3e9a7337189141b839e4ace
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/MidiScan.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/MidiScan.h b/src/MidiScan.h
+index 9c19bdf..ac959e0 100644
+--- a/src/MidiScan.h
++++ b/src/MidiScan.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
