Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AEACEFCFA
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 19:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFAC560BAC;
	Tue,  6 Jan 2026 19:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFyayXzKe6Ci; Tue,  6 Jan 2026 19:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 280C8606F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767727592;
	bh=Ga7gqo7SJ269A3Ls+lPjMm+veEUw+0r3tBqXX+DyGx8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FP8vl+J6fbJ0buBB/Uo481tvsE00u0LlLmHEPG3XjQgC0vmyJmP8iCLGw89obgQyJ
	 GH1otyPMPun2zQfFF5EQ7CsIVdTKjn2YPSlCMfTyb70mCCy1S3XpEHYXqUU9j6Qe6O
	 0lYwymqZfhqdhOVqN4mlTmdN73IOJnmnDMdD+tPExetmbF3p5YNiPCyOxYDzjDudIu
	 789z1esGHEOiPSmxAwD9vKjNZdeh0ihqVnLBv6eMDXApmoQB07Ky+hhQcp7dT1Tcc1
	 +ntr2hONLGg8ZmSMA+GkkoGM2juhb+8AAodrdUjxOKgNra4JZqno3K0IYtePB3Ygqp
	 FLiYL6pwL+Rwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280C8606F4;
	Tue,  6 Jan 2026 19:26:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6E93249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B788E606F4
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ6jHvM4Ptvz for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 19:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83584606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83584606E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83584606E9
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:26:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75B67A4C3734;
 Tue,  6 Jan 2026 20:26:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57190)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdChH-000000004m0-05Vf;
 Tue, 06 Jan 2026 19:26:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Tue,  6 Jan 2026 20:26:26 +0100
Message-ID: <20260106192626.1712153-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767727587;
 bh=WrWeL14oeNQvRx4hi0s8RxUdbV5gcCR5VtbQtJllVJs=;
 h=From:To:Cc:Subject:Date:From;
 b=sTVS7moW2IhBJJca55i9u62IA+GY6EyuwK22sBv4wojoFGIHpUV7E+z2p3A3Ksk5R
 ZT/XdEpgAcHu2DosisZllkdzSLS1e5+9zIlxNnpKeHFp10pJnz97tLK1b5LfVkyzLv
 OANOG27WCz3mDrq8Ds9269oIVmZvccTyhccC5n5nMVGSbupNQopIGaJQLcyG2FARmm
 DNhWaBrRQ5X00tAU/9XP05T665x/W9kUUZgWUCZuw/Gctf6/j3x2zkk11eZmnd9/qm
 pX7AOLTXgDwNwz4cjoiHQ01hwgi5yELZoCBONDYCNQ9vSL/6TZXXLHjShlvWGztBC7
 ExKzDUZgkcbmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sTVS7moW
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump to version 3.0.23
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

https://code.videolan.org/videolan/vlc/-/blob/3.0.23/NEWS
"Security:
 * Fix null deref in libass, undefined shift in theora and cc-708,
   integer overflow in daala, Infinite loop in h264 parsing, buffer
   overflow in png and multiple format-overflows"

https://code.videolan.org/videolan/vlc/-/tags/3.0.23
"It also adds a small feature on audio codec information, and fixes extra
 security issues compared to the numerous we fixed in 3.0.22."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 6733a870b1..9634ba3f1f 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
-sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
-# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
-sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
+# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
+sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
+# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
+sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9091a7e7fa..07aeefd193 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.22
+VLC_VERSION = 3.0.23
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
