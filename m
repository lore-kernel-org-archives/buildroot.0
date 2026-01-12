Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45821D25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195AD614F8;
	Mon, 12 Jan 2026 08:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyyuZ_ZuT2tw; Mon, 12 Jan 2026 08:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF90C6119A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205660;
	bh=3uYBwO6olVKnuCEibxP26lFzwJahTr+YfafNQh4IHRg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaiMZ/I0cYTVCHJcjUAvn2b07A2Ul9dbJe97kkXJlx/GIiGxsY/TZ+NndQMDFbF5m
	 XeLXGwdnw46vUtYQ6e69fRBbXseoBS1dXaUiu60QxshRhvXI9X9Y2YlCops2OXeZpt
	 wS2ruJU7yYn3Ea258ihZfhDwRZOM8gWj+p0sVpDeQLqPG4JYeEzQc2Ajkl2DcXdKEp
	 /YTLLf47wjBZevWnUKo/tdF45/FSdgPxvS/1KJmFpe8cLz/VOYmA73ZB2oegjraDHO
	 jEfQc+QDg/lns70lMR+iyyi+qpTB/XRWkdwLyRKnQ7Y8g3efwY+XoO7lRWtGeihqi9
	 e6A0NeL7y4O5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF90C6119A;
	Mon, 12 Jan 2026 08:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B72E718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE0B414B2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGjBYvndVCDw for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D5A0414A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5A0414A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D5A0414A1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9914FA4C3C7E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-1Zta
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:12 +0100
Message-ID: <20260112080419.2516889-97-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205132;
 bh=1/ZFy6waWBhY5vB7S1JDUk4rTFSYT1iMi+inkK8VaW4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=e0ftozTgfsKV4j6DtaagGZWJnGortk8NlR++4HVkE7noQRTnW04qptcBcKOAICWMp
 Xo+szUYMO/ywtqCzYeMUcNirlz2E0p1sJ707OUi//vqK8DUl122T+tV/sYtrvHgYS9
 f2Nu+Z1moLcT9zXsIcBJpTOJ7Rhcr4aSzm/5xpink0rfEvX9DbtLEgFvTYxziRDgEN
 L33AfSGkK6erqGU2UwX0m9rg2htvRbHX2wlcMGnloDDSO5t76y4KWmn4N0EyWWx0f0
 SizGVheacIEiAdZi7Xa6U4OVRVdKqv+vX2xrQ1KKcNNnAZWJw5V5gdeTgTdcIiqGOG
 V+vXxpcK5YmdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=e0ftozTg
Subject: [Buildroot] [PATCH 097/104] package/x11r7/xfont_font-util: bump
 version to 1.4.1
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

https://lists.x.org/archives/xorg-announce/2023-September/003418.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/font/util/-/commit/c28d8ca618f24855e735313c2b8f6effa7b7f1e4
https://gitlab.freedesktop.org/xorg/font/util/-/commit/5a9e7c7d3c3da68e5b421e7d038bc0a7a5f66b22
https://gitlab.freedesktop.org/xorg/font/util/-/commit/ecbf1fa15e14a9ccf339b86198b03f31db838382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 8 ++++----
 package/x11r7/xfont_font-util/xfont_font-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index cf52a2348f..13263ea5e1 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003331.html
-sha256  9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d  font-util-1.4.0.tar.xz
-sha512  05fff613019718a4bd8537ff7eb270bd85345ffb006c16f81b739d6e8cdbfaa9d6503aef9bc48d6c7f70330bf90ff1a46bacdff3c99e8017191d935c85f73d60  font-util-1.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-September/003418.html
+sha256  5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95  font-util-1.4.1.tar.xz
+sha512  cec7fc38ba64ca9c81c59a8395da94d71c75e14f19faf6457da0a1a8c3c1cf51bcaab227834f6f5a6d274ba2557555e542dbe2bd88e527c45ea196318bbc38d0  font-util-1.4.1.tar.xz
 # Locally calculated
-sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
+sha256  5d959e54276964bd0056941fa6f2ecd818a1b081b27f5debcacb54c0be87ece8  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 8a97c85d68..fa4d983109 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.4.0
+XFONT_FONT_UTIL_VERSION = 1.4.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
 XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
