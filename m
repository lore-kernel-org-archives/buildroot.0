Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FACC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 15:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FAE60703;
	Wed,  7 Aug 2024 15:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9wRnYweLgc7; Wed,  7 Aug 2024 15:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38CB26076C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CB26076C;
	Wed,  7 Aug 2024 15:10:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFC41BF31B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 15:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 788A940450
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 15:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0usnI8vyGoW for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 15:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4637A4043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4637A4043A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4637A4043A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 15:09:56 +0000 (UTC)
Received: from tuxedoOT.. (unknown [61.8.130.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2C0312C8021C;
 Wed, 07 Aug 2024 17:09:54 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 17:09:52 +0200
Message-Id: <20240807150952.765978-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723043394; bh=3JNltxS5E6f+gHQuST1PjsXf5+pTwExcuROTu3E8GNc=;
 h=From:To:Cc:Subject:Date;
 b=i9taZHT52uFsxtbWhRvQFVJao2A3W2aO9tCyeSriAVTDOosaAofyOlt3h6Vi7iUU4
 77G465Ja0ZycTwJUVPXa3jOnmihORpFsjjz8u+3iRwRzfBvI8SFqVGAjZOfPxBQ4BK
 gP1Raye2+VCnGxbTKuBBmpqn3kBWTbCmYjrWRicCcpoeFYN8+JWDEyn+8OGrmACfed
 fqazb3M3EcgXveSchsLGa54p0Yo7mDlJ60gy0C1A2KWWhbqkYtv8um1qlNEfq0Njzt
 v/AOFrbIABHMWmOw4BCXXtOxhL/q/d1I8OX2jlvchLPMjZT1P8R9Wk0E+yyRdmQBSE
 Y+CBu5jiswxiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=i9taZHT5
Subject: [Buildroot] [PATCH] package/picotool: add patch to fix sparc static
 build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: http://autobuild.buildroot.net/results/20d2fc02b7ca4c19b22b5853dccd8e55a052db10/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...lso-link-to-additional-package-confi.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/picotool/0001-CMakeLists.txt-also-link-to-additional-package-confi.patch

diff --git a/package/picotool/0001-CMakeLists.txt-also-link-to-additional-package-confi.patch b/package/picotool/0001-CMakeLists.txt-also-link-to-additional-package-confi.patch
new file mode 100644
index 0000000000..b80de67b8a
--- /dev/null
+++ b/package/picotool/0001-CMakeLists.txt-also-link-to-additional-package-confi.patch
@@ -0,0 +1,40 @@
+From fc86e05ea6a2976d0e1004d20b5bf3e693621253 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Wed, 7 Aug 2024 16:49:53 +0200
+Subject: [PATCH] CMakeLists.txt: also link to additional package-config
+ libraries
+
+LibUSB might specify additional libraries to link to via package-config
+(i.e. libatomic where this isn't a builtin [1]). These are correctly
+discovered by the call to pkg_check_modules and put into the
+PC_LIBUSB_LIBRARIES variable but then never added to the actual linking
+step.
+
+Fix that by additionally adding them behind the libusb library
+discovered by the find_library call().
+
+[1] https://github.com/libusb/libusb/blob/v1.0.27/configure.ac#L184
+
+Upstream: https://github.com/raspberrypi/picotool/pull/103
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ff3e787..d6e41da 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -58,7 +58,8 @@ else()
+             pico_platform_headers
+             pico_usb_reset_interface_headers
+             picoboot_connection_cxx
+-            ${LIBUSB_LIBRARIES})
++            ${LIBUSB_LIBRARIES}
++            ${PC_LIBUSB_LIBRARIES})
+     # allow `make install`
+     install(TARGETS picotool RUNTIME DESTINATION bin)
+ endif()
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
