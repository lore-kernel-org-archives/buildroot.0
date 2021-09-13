Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8806103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F8806103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 602976060B;
	Mon, 13 Sep 2021 21:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhH1R6GXi1ez; Mon, 13 Sep 2021 21:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA765605A1;
	Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40F3C1BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E3D34030D
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLmhVinOD2Ty for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8B8F40297
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=GQn+rQv9gy5NZedyy9EE1fJxiXReH6pHK34KjSiHWbQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=OPC1+WcpAqqn7JmiEymdAXlPHjN8s08AWgYdR1U2q5RFPHBBkRaoFMl61ZGid08uZ
 ZDc+P+DA2XluPy2ScYGaFlZwTylBU8T4Mca4tR/TZ7bpdG2Ppisf5xFA964Igw0xb1
 62MHJUASR1wNTYGeQ5CzOzv0qemKVADC9eptO/KM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhD2O-1mtz152ln8-00eIIN for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:06 +0200
Message-Id: <20210913210412.24042-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dX1s4y6QMS+FVjhmXbmehYaRwEDkfgkwUSc8//8DMcDvceo2mJb
 A3xeKAgbuWCXtc8cJiNrTJ7IcDJCnbqjTLZNso1ZGnHZczbdVUQuyHYsRbpAVO1uSDoMI0H
 lpN4BYJhI+LYHzIgdN5lD3MicVC2hd0m+oivRcl1iz4ui9nloHHi2uy+su1ALH7+VPOOjuc
 cCuKa5oz8DtHy5uvlfgVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X3ycO9YyGmI=:ajphmaC9wzqCjWGb0OInMF
 fhUY0PNGjt/qbIhAjUSuPkqS4h2zTRhHQrmA3SP/3Bvz0DAYZ0pU9z58XRgkvfUTXkjsLjOVG
 FXr0XvgJ+2Jww64BEcsqDNEajJ5A7xaliKRjlabLwM/FlpkHvruU30pdOmLF7uTAMAFiDlG01
 A15WT0RdlfWc2woK6AJ3C60qvKxO0Ot4ibuZxi0HLjjYCb76XVF2k+llXGL99l0C39+NQTvfd
 NbPyOL+Z3pCQ6O2ISYDquYzOLAVlBryQ5G3U1TcPj/LcJM1fkLfX5Xj1aAYAxBUgTZn/mrVit
 3mwEbYkq/pjMAuPEDa/bm+O0p1UJutG72u6ShK4uJa2yMBHy7MTq2Vt4WESu4quydknmLrfdo
 obcilO2rfbYzMM2PisOs6YWDg7MweqLklqzf1auOfn+i7KvVYRRR4VlIBg8d8N60O7LarfPAp
 BLJYLTqUq+sky5J6C1BLcV2efJQeclvQiixS84o/Gz1OKNVBRkzFjjUTwVf7rXy2y7ocF4yWe
 Q/D400EpNWoPjUbfnLU66Pg8m8AnL5WCJbD8Td/LCUeuyiF8KZM6VGEQ1s4PZ+Ww6bp99qFhJ
 Oj9ThWmUpJKHCkfQvhhT4uhZ28u8tRUwGGZZcKXuOaYJGg8fEKMSZ4zajwFNheQ0y+vck991Y
 cXMx5qVZN6gIXf1d0rjHUxZGDi4MEo0JXCjSwf2c+EVJNXNC4gadY3Xn+aNh2aNtgl4yuG0yG
 t9SM1GQxQmvxNFOVaWTnTUO4suAHLEE5Oy6N4UioG8IdOD7y8lGnlgDlw//ywMxQfnaMzufeu
 yL1CspkDPm+MEVzjX4DMPRVYMHNV0g4VXmM2xLUUYfp6PLkDEYbcgM54jr7J/zQYRY9Su02jv
 qPua+VBFrnz6SN2+LKWU+mXSV7oNcPX2QPjmmKH37y1OAHRThPlJrv+Q/3w7yatDLrsVCKt+e
 IaXTevnwzd+8Gqt8zQBwq6IekU6pXDNf2ViJVS8jrSWah0nDnm8YcIaTlEMO8iaUfwLkg3xZw
 3goDS6ONniCX3WUNqQXeApZ1GwHP9XV9TIvOnDDDE7OaICQP+iFW+W6cnxjV20ggyH3bmXo9K
 mpMuGKSNLaK9bE=
Subject: [Buildroot] [PATCH v1 07/13] package/gst1-libav: bump version to
 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 632c2f8651..040a6e33f3 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.4.tar.xz.sha256sum
-sha256  344a463badca216c2cef6ee36f9510c190862bdee48dc4591c0a430df7e8c396  gst-libav-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.5.tar.xz.sha256sum
+sha256  822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548  gst-libav-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8ae5b87beb..01ec4d2c98 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.18.4
+GST1_LIBAV_VERSION = 1.18.5
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
