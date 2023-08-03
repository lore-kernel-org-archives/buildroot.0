Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B594C001DB
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 20:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC53B6141B;
	Thu,  3 Aug 2023 20:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC53B6141B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY4trkBwcYYU; Thu,  3 Aug 2023 20:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05639613F5;
	Thu,  3 Aug 2023 20:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05639613F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D141BF304
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 20:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 337FA821E1
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 20:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337FA821E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yErssqhkcHTW for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 20:15:47 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFA9482128
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 20:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA9482128
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 490C813F8CB;
 Thu,  3 Aug 2023 22:15:40 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 22:15:25 +0200
Message-ID: <20230803201527.19108-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691093743;
 bh=/UgDD1jLUY2InSOanx21fNvCMRwz+TOmltGzzklziWg=;
 h=From:To:Cc:Subject:Date:From;
 b=EDP8ytulbl0bC8JfVWFojg2R84DoVRTnYKs4+f28IEaS8m6hxWoxqugpCgJixq3Ex
 kdONgbL2RVUH9OOjGaWfryG+53i+TrPL8ngWiuw/cW38OFN8ZHmj0qyQls29AFojd4
 oddC2H+UoLa1RMRzJhZX4M5yMOuHnKLJYSjxsIEnoowG4iPBjbQkkoy8BLs9wOpHkJ
 I8cvMpZrCBfPliBNC8C+vwW19xweiNa5FcWgiS9xjNipPXuEK6EIhqKnA8bUCaK3cj
 XHfwLC/TQ+9xTFpuhHZM/ljdVVzLZaidYuCkHvm1DnFhOJ8UJFgL0neZVpTHET+cu5
 L15BT7Bw1YDWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EDP8ytul
Subject: [Buildroot] [PATCH 1/2] package/weston: fix the configuration of
 simple-clients
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit 7329a0db442026c6b856e76ea964107fa3c730f3
"weston: disable v4l simple dmabuf for headers < 3.8"
disabled dmabuf-v4l-client when kernel headers are older than v3.8.
This commit was made at the time the weston package was at version
1.10.0, using the autotools package infra.

commit e672eb5c39fa626f8e924269cec2056be9e14ded
"package/weston: bump to version 8.0.0"
replaced the package infra to meson (since upstream deprecated
autotools). This commit changed a disable of dmabuf-v4l-client in
autotools, by enabling it only if supported. The end result is that
the current meson package recipe disable ALL simple clients, or just
enable dmabuf-v4l-client when supported. In all cases, all other
weston simple clients are disabled. This behavior is not convenient
since some of those simple clients are useful to test the correct
operation of Weston and the rest of the graphic stack.

This commit fixes this issue by enabling all supported simple clients.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/weston/weston.mk | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 437c6f2e38..5f8d915d5a 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -22,13 +22,22 @@ WESTON_CONF_OPTS = \
 	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
-# Uses VIDIOC_EXPBUF, only available from 3.8+
+WESTON_SIMPLE_CLIENTS = \
+	damage \
+	dmabuf-egl \
+	dmabuf-feedback \
+	egl \
+	im \
+	shm \
+	touch
+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
-WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
-else
-WESTON_CONF_OPTS += -Dsimple-clients=
+# dmabuf-v4l uses VIDIOC_EXPBUF, only available from 3.8+
+WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 
+WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
