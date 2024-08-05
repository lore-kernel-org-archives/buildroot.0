Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72318C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BEA60773;
	Mon,  5 Aug 2024 17:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MudTzO_fybBM; Mon,  5 Aug 2024 17:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B28B7605C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B28B7605C0;
	Mon,  5 Aug 2024 17:19:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40C3A1BF31C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 296544023E
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI-OJQub386d for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 17:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5596D401CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5596D401CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5596D401CD
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 17:19:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b502.dip0.t-ipconnect.de [84.161.181.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05922A4C0AA4;
 Mon,  5 Aug 2024 19:19:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43970)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sb1N5-000000005HC-2B6k;
 Mon, 05 Aug 2024 17:19:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 19:19:47 +0200
Message-Id: <20240805171947.37834-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722878388;
 bh=ergqfNHLGpxgiWUhfY3ugUUflgzqd5Mb15UMsytBcx4=;
 h=From:To:Cc:Subject:Date:From;
 b=uup+CHEZZvPLJbpqelYot/m4VjcYI6PA5jLD8WGFD3MRmof/Bs8BKK+byRtdYqzZO
 bFoANB2+CpoWMg3jLM1m9FsWMKcF5WgGVRt+Ta4dhF2pLsPuS5lO8bZNEhTXF4GBXI
 atnW2AQPwcvUMNYDXA1eDHZFaUVc7SodibF6qqFh/OIL5sY7tR7kz0Q8xWaaRsH9Tl
 cZMQyuHJk8fKoMJHkejfE2wGB4fpTSE605Sc8KGkOGhQlxN0Ig09ZWDDIUu2ni343S
 aR0/5QZBOiP61jPot2LsU/UcVaNL7B3rnQRDgh/dTlmOkhyzDu1H9FdaAthhU3zc1o
 I0cnkKYhZChhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=uup+CHEZ
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.2
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 5 +++--
 package/ffmpeg/ffmpeg.hash                         | 2 +-
 package/ffmpeg/ffmpeg.mk                           | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index a52d7fc347..aeb272c459 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -10,7 +10,8 @@ Fixes https://trac.ffmpeg.org/ticket/9138
 Patch sent upstream:
 http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 6.1.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
@@ -23,9 +24,9 @@ index a89cfa6d959d..6ec00df75312 100755
 --- a/configure
 +++ b/configure
 @@ -2227,6 +2227,7 @@ HEADERS_LIST="
-     opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
+     pthread_np_h
 +    sys_auxv_h
      sys_param_h
      sys_resource_h
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index f70ff5da83..630bd70c56 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968  ffmpeg-6.1.1.tar.xz
+sha256  3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38  ffmpeg-6.1.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5b2d33883d..19c270a14b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.1
+FFMPEG_VERSION = 6.1.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
