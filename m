Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C6CA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 14:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F03961333;
	Sat, 23 Aug 2025 14:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ED8qxA4Azae3; Sat, 23 Aug 2025 14:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4271161312
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4271161312;
	Sat, 23 Aug 2025 14:38:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4FF71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BAC61324
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8ZA2C3c1GVJ for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 14:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04CF161223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CF161223
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04CF161223
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b990.dip0.t-ipconnect.de [84.161.185.144])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EA21A4C41C4;
 Sat, 23 Aug 2025 16:38:08 +0200 (CEST)
Received: from [192.168.1.144] (port=42808 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uppNf-000000006Cj-3MHv;
 Sat, 23 Aug 2025 14:38:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 23 Aug 2025 16:38:07 +0200
Message-ID: <20250823143807.3148002-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1755959888;
 bh=0215sHzL6jqYI7G6pZWdLL+el1bIa+btdFVzdn2bz8s=;
 h=From:To:Cc:Subject:Date:From;
 b=1MXaO2e7c3EEkFs5JLfM0k4pkHoNGLTMXm2ZAg+JxHRkKPsT5dF/E0JOj7l9ZjKHu
 jUp904MzLlVbWvlXUetU0x3fe9Y120JcQp+4vaRyEXa9kRuK0G7C28ZpZdfJqZrGjd
 XrUpjOeAkbgT/a2awwI1sEdsVZ1Wp9BPmd175j7nm0UAC6In+5XoiKLpNmh//+0bh5
 Kg6g03PRbzZkbyQvwOWrD4uSzSWsxhtvQDvxWkpt4iU8fFk7d+mtROvC5iBcs96JAy
 8brNtEHhAjD6jGKFlwpH2Sjm8dsQxd87MMQj/OuaIiIzHykGoo4auD3LtEb5o7s3Ks
 MRW8ZtWEbR33g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=1MXaO2e7
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.3
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

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=01cd1ba06fa6570f34e41fd8374f543c7e181604;hb=01d3f764f79b2f571174a4cec855e651258f20ec

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 50498a6ba9..99c3da5e74 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f0b2b07c7014b7aa8c4689095b83a49a85d41887049fc5302543aec0bef7d066  ffmpeg-n6.1.2-27-ge16ff06adb-git4.tar.gz
+sha256  bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  ffmpeg-6.1.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2d65623926..d7fce41369 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# Update FFMPEG_CPE_ID_VERSION if needed
-FFMPEG_VERSION = n6.1.2-27-ge16ff06adb
-FFMPEG_SITE = https://git.ffmpeg.org/ffmpeg.git
-FFMPEG_SITE_METHOD = git
+FFMPEG_VERSION = 6.1.3
+FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
+FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-FFMPEG_CPE_ID_VERSION = 6.1.2
 
 FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
 FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
