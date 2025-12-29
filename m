Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3E9E92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3E681BC5;
	Mon, 29 Dec 2025 17:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNcWlapwAHNf; Mon, 29 Dec 2025 17:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B60E814EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031043;
	bh=cdk3uyR2tN09eHNwm5Rjl3np1xeRHzRNyTR1wAmWovo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XG18qfDevdzFFcGkLUYhfwMcSq6fXhpC7h2BABGmRuGN0sO27ydzI+03IT/3EILJX
	 xvR2bR7TZAJ/OnCX4gIVD9z+thMipZT7o6mhWSpJN8WgiZEjVsoJLEQadFDj5Cfki6
	 A3iYMDG3ye6kWDe/BKBli/RTeVxkJo9UMe76A4lfPnfNMVRgmptJgXaqFWmJxucImQ
	 Ix/hHMv9m64DnVR7wohO+EbU9rpntOmv9gqExKbcP8C4G1Wu3Mb6dficRCpDKOslrh
	 j9t58AGsa3SSyxEd/2hoBiIo9S8nfG7jhq6cy8SHA+n8p+1CXOFBf/lHvMrwo50RWm
	 aBqpblbJWJ9VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B60E814EE;
	Mon, 29 Dec 2025 17:57:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58C31D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF414055D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiujorH59Kti for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46626400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46626400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46626400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD661A4C264A;
 Mon, 29 Dec 2025 18:52:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPY-0000000012P-2J0Q;
 Mon, 29 Dec 2025 17:52:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:51 +0100
Message-ID: <20251229175158.3548903-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030732;
 bh=7Aag5+7VYWixr8uut6I5+10hYWlRm5sJRYNWQLveGuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PhKCefLbX7MHrIRaTpmoZ9gHFReZn9ILu7FgS7FJZ9l/bhS1JujbumWKCXywdcOgP
 uC9MZIeudCJH+80pJ4r2qlZlYLGA1zS3MVDkCmeNVfY11QAHl/AGysvDDoAnIgF2zI
 uiuYh+X704VivyWvgfhf3K6BxoLs0/5hd+5GYmi3o2maLcocIrAE1i2BniKrdUOXqi
 u1dlgdh6vqd8SbiGkw/wIYucd5naUX1PeVzf2Jt2vvneu1nOLq/lt8bj45BinGMcJq
 5mVknrVnZtfzRlEugqDz1xtA1FBwusQXfmGse8Y/tylO3CrQs6OYYtdsqP1hRV3wpo
 MmATs9TfTwSkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PhKCefLb
Subject: [Buildroot] [PATCH v7 23/29] package/gtkiostream: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index c748c7a000..250e47a0a4 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -47,10 +47,6 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 GTKIOSTREAM_DEPENDENCIES += libwebsockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-GTKIOSTREAM_DEPENDENCIES += opencv3
-endif
-
 ifeq ($(BR2_PACKAGE_SOX),y)
 GTKIOSTREAM_DEPENDENCIES += sox
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
