Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34822C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93EB8401F9;
	Thu,  8 Aug 2024 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaC40P-dqAUL; Thu,  8 Aug 2024 19:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B6F4011E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B6F4011E;
	Thu,  8 Aug 2024 19:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16DB1BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB7F340E71
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOb5lsSdNplf for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B4D74051F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B4D74051F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B4D74051F
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:21:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5ed.dip0.t-ipconnect.de [84.161.181.237])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21D52A4C0375;
 Thu,  8 Aug 2024 21:21:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36558)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sc8hS-000000006DX-3QBb;
 Thu, 08 Aug 2024 19:21:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 21:21:26 +0200
Message-Id: <20240808192126.1767471-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723144887;
 bh=wvs8yKzOTZqMNxrbIl3Mxy/9ntkgMTKhVIP1sNG7a7E=;
 h=From:To:Cc:Subject:Date:From;
 b=nz+VOIPBLwpPTqV1NCp4aGWZAMl7Bp38RtVfUVBI38B3tcblMylaePghrSmPVppB9
 IHd70ygjW+CICUkymiO68ePSAD6FzWdvCMHzMOGxNQe4N9Nr0aczElqBemARhzFnQc
 JY9EFSaA7uUTGxIMEPTqdLapBaEC0l7HpmE+feo6So1wwR99AN/NMuvYNLR/R4T/7C
 vPsO/nc8DASkbaQ8iUf7z/9G74aDJ13rBB/miccw5m+AWG1HUrGCSKaFy+ahhGJCb4
 I7hEwvPZGrkCJIsefq0uR68uVwr52e9D7WJTXsSRmyPAHfUWoI9m3YARPfxCw6rMVA
 OU0z4FbN+lypQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=nz+VOIPB
Subject: [Buildroot] [PATCH v2 1/1] package/mjpg-streamer: fix undefined
 symbol error
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes runtime error:

    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help

Patch was suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: used code suggested by Thomas, run-time tested (Thomas)

 ...-all-symbols-of-mjpg_streamer-binary.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch

diff --git a/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
new file mode 100644
index 0000000000..a0b80ff711
--- /dev/null
+++ b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
@@ -0,0 +1,33 @@
+From fbde1593948ae95f287b2167d0bec5b27948cc01 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Aug 2024 17:04:55 +0200
+Subject: [PATCH 1/1] Export all symbols of mjpg_streamer binary
+
+Fixes runtime error with stripped binary
+
+    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help
+
+Source: http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/401
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mjpg-streamer-experimental/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
+index cf26620..3ff12cd 100644
+--- a/mjpg-streamer-experimental/CMakeLists.txt
++++ b/mjpg-streamer-experimental/CMakeLists.txt
+@@ -92,6 +92,7 @@ set (CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
+ add_executable(mjpg_streamer mjpg_streamer.c
+                              utils.c)
+ 
++set_property(TARGET mjpg_streamer PROPERTY ENABLE_EXPORTS ON)
+ target_link_libraries(mjpg_streamer pthread dl)
+ install(TARGETS mjpg_streamer DESTINATION bin)
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
