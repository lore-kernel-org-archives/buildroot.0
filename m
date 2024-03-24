Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7CEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 527F381BFA;
	Sun, 24 Mar 2024 18:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_p2AcMCs4Bp; Sun, 24 Mar 2024 18:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E88D81BB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E88D81BB2;
	Sun, 24 Mar 2024 18:57:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 254E91BF215
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E11F405D4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amV0v1iqQOyG for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA566405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA566405D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA566405D1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:57:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b575.dip0.t-ipconnect.de [84.161.181.117])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54E7DA4C3274
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 19:57:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60568)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roT1f-000000000vN-2vF2
 for buildroot@buildroot.org; Sun, 24 Mar 2024 18:56:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 19:56:59 +0100
Message-Id: <20240324185659.1777379-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711306620;
 bh=MabqUgcPpJ/Q4jBbkYqZrXgGwfG6rrgijagVAJOJA+Y=;
 h=From:To:Subject:Date:From;
 b=Dii9oTNbqsz6jbK2L9WCRRqHOjm+ekIHLhoVxXOZ9uwQngzGUyOZtX8FIQBv2uY7p
 PurYVNBSzrQXPtBSbCOQR5K7snEgF0trEGYX9oQPVq59ftZtSXbwCU28iPbd0q8x+B
 jMTHQ8Lf6iAB8e5FGtqDfxGLKbIw6xULvzugZatb1NvPqaRW2lawhh9oSQocbct78p
 V9eHfwkLo0FHV8iIHCK3yDVXP35tNnN8D4XhFWJxQ+YHpkUac+peejFBTIlo1ru4kG
 obU4/FUpkUQXiTznWWE4DXsS1aui3bsNTIAw3IeT9WWHB08Bk+ezf8GFhMG9wpugs0
 0sS9FDEo/cM0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=Dii9oTNb
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: fix undefined symbol
 error
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

Fixes runtime error:

    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-undefined-symbol-resolutions_help.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/mjpg-streamer/0001-input_uvc-fix-undefined-symbol-resolutions_help.patch

diff --git a/package/mjpg-streamer/0001-input_uvc-fix-undefined-symbol-resolutions_help.patch b/package/mjpg-streamer/0001-input_uvc-fix-undefined-symbol-resolutions_help.patch
new file mode 100644
index 0000000000..f7feb2bb07
--- /dev/null
+++ b/package/mjpg-streamer/0001-input_uvc-fix-undefined-symbol-resolutions_help.patch
@@ -0,0 +1,27 @@
+From 32bd867cc8a51568c031430a2886712438052945 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 9 Mar 2024 23:15:52 +0100
+Subject: [PATCH] input_uvc: fix 'undefined symbol: resolutions_help'
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/401
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt b/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
+index 72b24fa..90bbfa0 100644
+--- a/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
++++ b/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
+@@ -22,6 +22,7 @@ if (PLUGIN_INPUT_UVC)
+     MJPG_STREAMER_PLUGIN_COMPILE(input_uvc dynctrl.c
+                                            input_uvc.c
+                                            jpeg_utils.c
++                                           ../../utils.c
+                                            v4l2uvc.c)
+ 
+     if (V4L2_LIB)
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
