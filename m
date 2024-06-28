Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75789C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06FDA41973;
	Fri, 28 Jun 2024 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvsUx-xbRssX; Fri, 28 Jun 2024 16:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6DA41A4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6DA41A4F;
	Fri, 28 Jun 2024 16:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFBA1BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D4E405A1
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wHCHFAGpHkd for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9ACDF401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ACDF401D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ACDF401D8
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:46:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 130EBA4C0CE6;
 Fri, 28 Jun 2024 18:46:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54616)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNEk4-000000008PK-0PBR;
 Fri, 28 Jun 2024 16:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:46:32 +0200
Message-Id: <20240628164632.11078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593193;
 bh=fFAuJRmwn0r2hRQFnuoz6dh5OKse6JPUXaGc54vF4c8=;
 h=From:To:Cc:Subject:Date:From;
 b=Qug+l7BVHMfjubRWhqdPYWidZBJJHJXLuhYW/dzWQXLejshEMjGoCMTiKH7bksobh
 5X3D1tYwafMkhzsB8RNQu9PjdtECUjItX6lW0Kj1mWD9Qb/IMg+iLL1Dhs50iYvthF
 Gzd5JOPUF2Skyd/ReNNSSsfIz0kVh4wybJoCH8ajElW8H6FcYW2vFyRTwC9fpbp0QT
 8hU1JOVzqgaQfYk39twnmyCFyJ9JuMuLRTOF6cSUn5284x4/E5x4zbYo3LLHdkJ6Ep
 U8GGVdEOD++3nqWihyXVPrN/i+gixlbcHQvSLstk2GwW6y0DxSrKvCEz+F4pBbA5jO
 bDK7Ifqe2/DNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Qug+l7BV
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump to version 3.0.21
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://www.videolan.org/security/sb-vlc3021.html

Release notes:
https://code.videolan.org/videolan/vlc/-/blob/3.0.21/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 40529bd664..b3d9a083b9 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha256
-sha256  adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5  vlc-3.0.20.tar.xz
-# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha1
-sha1  b834516ab701bf6311980ed5d67b77c834fdebe7  vlc-3.0.20.tar.xz
+# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
+sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
+# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
+sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index d0fc1744c0..a597616470 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.20
+VLC_VERSION = 3.0.21
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
