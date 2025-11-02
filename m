Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8103DCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3E542610;
	Sun,  2 Nov 2025 13:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I71JdXkcUJoP; Sun,  2 Nov 2025 13:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D81442613
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D81442613;
	Sun,  2 Nov 2025 13:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BDE3222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E3A442613
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6oyRF14aYcT for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E565D42610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E565D42610
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E565D42610
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:37:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5CFB6A4C5EDC;
 Sun,  2 Nov 2025 14:37:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFYHJ-0000000025N-1OQT;
 Sun, 02 Nov 2025 13:37:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sun,  2 Nov 2025 14:37:51 +0100
Message-ID: <20251102133752.2690402-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762090673;
 bh=X/jNbjyMPESAAQCOopPHkkt8joxcdE0FTbOZG9m9FJU=;
 h=From:To:Cc:Subject:Date:From;
 b=vfqpST2kwv86UaTEp79T9BJBMFe5rySKVvGN4Nsw7DxhoBUHh0XEvep93xHSFqdvI
 WmrSgcpBuIpGiQuUchfAIJDPV/C6rWGH0UGrR+hJ3umpMOw379onclP17M2lCMrE4l
 FM64Qae+sxvCixjxqT2uZb1dT41vpIcGO1jrZkCtd70jomVG/wtNFSl1e4zUPPiws2
 XlyxLcYdc9IxmImnPsZ8en1qGL0EYUTeK1yHGeWeR5FiwqSo0momLVMpJLN/xbt1B8
 mO5LgcvyCRZ3KIhd1rli0FciNiegUN9O3F2565zHaMc8X9dOBH8Af5lQaAD66df2zR
 qn4ISITzEZQeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=vfqpST2k
Subject: [Buildroot] [PATCH 1/2] package/vlc: fix build with newer versions
 of live555
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

Needed to prevent build errors with upcoming bump of live555.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...5-fix-build-with-versions-2024.11.28.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch

diff --git a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
new file mode 100644
index 0000000000..9708f680c9
--- /dev/null
+++ b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
@@ -0,0 +1,47 @@
+From 8befcbfa834b809602db24c9ba7456d8cfc25cdb Mon Sep 17 00:00:00 2001
+From: Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
+Date: Sun, 2 Mar 2025 08:30:43 +0100
+Subject: [PATCH] live555: fix build with versions >= 2024.11.28
+
+In the 2024.11.28 release (version 1732752000), live555 introduced
+`EventLoopWatchVariable` as a typedef for `std::atomic<char>`, replacing
+direct use of `char` in earlier versions. Add a conditional typedef to
+define it as `char` for older versions, and update `event_rtsp` and
+`event_data` to use `EventLoopWatchVariable`.
+
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/8befcbfa834b809602db24c9ba7456d8cfc25cdb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/access/live555.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
+index 461766661e49..cacea3c46952 100644
+--- a/modules/access/live555.cpp
++++ b/modules/access/live555.cpp
+@@ -194,6 +194,10 @@ class RTSPClientVlc;
+ #define CAP_SUBSESSION_PAUSE    (1 << 3)
+ #define CAPS_DEFAULT            CAP_RATE_CONTROL
+ 
++#if LIVEMEDIA_LIBRARY_VERSION_INT < 1732752000 // 2024.11.28
++typedef char EventLoopWatchVariable;
++#endif
++
+ struct demux_sys_t
+ {
+     char            *p_sdp;    /* XXX mallocated */
+@@ -232,8 +236,8 @@ struct demux_sys_t
+     bool             b_no_data;     /* if we never received any data */
+     int              i_no_data_ti;  /* consecutive number of TaskInterrupt */
+ 
+-    char             event_rtsp;
+-    char             event_data;
++    EventLoopWatchVariable event_rtsp;
++    EventLoopWatchVariable event_data;
+ 
+     bool             b_get_param;   /* Does the server support GET_PARAMETER */
+     bool             b_paused;      /* Are we paused? */
+-- 
+GitLab
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
