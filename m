Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F782EED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E742B6074A;
	Thu,  1 Jan 2026 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC3ybas0Q5ZT; Thu,  1 Jan 2026 19:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B562160679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767295315;
	bh=5qkPQRj8RrUkIEP//tFz8MScUoS61LR3eCCJBmTEeQI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=edlOJqiFkZ1Fs4KmEdpbGsuPCts5YoSts1U3apP4a/Bbb2e5LTdTtSHZiQBFrGoF0
	 z64Nf8KNs5mFhOr99IArw92j0iunhtbxrIQGwy/WNYJYdVJoo9grsGA85XbgjC5mCy
	 D9BwJUDCcbAyan/iuVCijXnsj0ZPH/l3jatmBSfhbGJUDaWIhEu74k615hjvZ4h12a
	 I1jJkM5Qspr8x0p7FJc/BQUekSVbPuPeU/Fs9WrCsFpvnJxydm3ftIYGsq+AInMxpx
	 eEoxjJiy7q8Y1MlTe9OLBOjIXBCBs2kiPTQG/9BWHVmmB/YDGZ7bTfa8e8DU28Y10x
	 qUlLztgTr911A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B562160679;
	Thu,  1 Jan 2026 19:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21433351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B1780EE1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjJGgjtyChOn for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3D4680EDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D4680EDF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3D4680EDF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:21:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 14079A4C1F78;
 Thu,  1 Jan 2026 20:21:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35538)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbOF4-000000006wK-22rH;
 Thu, 01 Jan 2026 19:21:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu,  1 Jan 2026 20:21:50 +0100
Message-ID: <20260101192150.1714696-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767295311;
 bh=YTKGOO5prFPPUqE55PKEcDwMe4vSFXfNRtMFiGB+c30=;
 h=From:To:Cc:Subject:Date:From;
 b=LzM7dB35g+JBF4CfSZk8nmBcSESYDZ9cs5QoBlW5iX+MSNHmmEg8pdgRUuscsjJCc
 dfbeE9IKlDrr2ZQ/VMq2zORJF7eDoXiU9iS9Zgg7dw5Oohqk3P+LPg28kr9RCUxQSG
 d+SV+cRQM753lGnIFxTS0/scCLiHVuUJQOLNh/D9iTvxC7zrPd3y8s1YW16SytOXGY
 HE1zPKXoL5ooq7OwP7/IvqL1c3J5Li8+4nhQRnTqBxyreRW7XGY3nnEj3sQzQST+rv
 Zj16+vP1rHc8PYRAP8d7TcagYxwWqMwos0IvGpjMpqjAq7F2C3K4SE3bAMursD2AZq
 OUeOrrSlUEpEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LzM7dB35
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.4
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

https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=0b3937cd1ab60b206a8bca8be5253b053e042161;hb=34277e12e80031c7f89494ba543684bc1dd0be8f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 99c3da5e74..1ffef61309 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  ffmpeg-6.1.3.tar.xz
+sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 7bdf948c80..1efcbf87aa 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.3
+FFMPEG_VERSION = 6.1.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
