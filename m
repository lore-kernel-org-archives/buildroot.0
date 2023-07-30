Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771BDC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3088E60BAE;
	Sun, 30 Jul 2023 11:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3088E60BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpEL1v8wfX7G; Sun, 30 Jul 2023 11:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759B560B16;
	Sun, 30 Jul 2023 11:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759B560B16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA6A1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEEF60B16
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBEEF60B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NldU_wmAGk-0 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:00:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35B460A7E
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 11:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35B460A7E
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 038E4A4C0824
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 13:00:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41542)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ4A3-0001rz-2X
 for buildroot@buildroot.org; Sun, 30 Jul 2023 13:00:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 13:00:31 +0200
Message-Id: <20230730110031.3570266-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690714832;
 bh=n2NBLNa38HTHjvzzgWFjWGYaNN2s04lKur7NiOTY0cc=;
 h=From:To:Subject:Date:From;
 b=Ws8ayhsZ2QFaCtIljTOz7c76je5ma2dGslgLt5AhLOB8L/vU08RkKylPshscRQgba
 guZYAGnce6elSYvwEyhJq6as9w454RthvJOxEx9ZkmAtvLlN09N8GTY061xI6spxX2
 UDxVeGuQg0HNcwhnhBfTOCVI9J1zYZCg2Hpnz3KYw/qJmHPLIjG8FbQdnaxHbyZ2jy
 e+6f6TfHTCqrebBLDIYjpQ5n6SbFjG6Io15diJYPqIzJkzHx8q/1CQ99w/ZHLHi6tq
 FvEiSopBFXmv12l+YHlmjdE6/idkFwFZmam0RBMDBGgMYu+9ya9vrYO09KmiEdAALX
 eJBkKsDkSf9Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Ws8ayhsZ
Subject: [Buildroot] [PATCH 1/1] package/kodi-audiodecoder-timidity: fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-MidiScan-include-missing-cstdint.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
