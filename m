Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD1AC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF7C409A5;
	Sun,  6 Aug 2023 14:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF7C409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YUEWzY6MXG8; Sun,  6 Aug 2023 14:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B925415AE;
	Sun,  6 Aug 2023 14:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B925415AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E911BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83D9B4046D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D9B4046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VujaXqdcFT13 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:05:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFBB5409EB
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFBB5409EB
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96A5BA4C10F8;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLE-0000Bn-0n;
 Sun, 06 Aug 2023 16:02:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:40 +0200
Message-Id: <20230806140241.4155773-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=VnhgJWdFqZmVnIkYeSklhbiO6EF/5lyO+w+SSQ5BW7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WcTUcBuExPyN1eruLRav8Xbg/G8VEnUSSe7V6pf6FF5LQmbinZXVHy+dYPfXTAhHN
 PgT1ddcC3b+F4PiTZjGmLEqW/uxOyuDMEocIHZNFs4XM1+0dPd7GQ/kReHEi6KuIQf
 5D08m041vZoNCyEeEF4yT33m9DUrNars48X6uNpX+V/JBc9bUxxI7g0DyZN4rN5fVs
 mrGNhwfJ72wkWQLynLegtRoNogXgd1PKD1QXVlRRKIW0+2pwpTg75G2pCOmLjWf+lr
 w86T8agl+qXTxrha0+avW4BfKq20LtxxhEoOhtJ3/oQ0+T5ilhrqkfuGp3FzaI5Y3f
 X4SxYstYHvSdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=WcTUcBuE
Subject: [Buildroot] [PATCH/next v9 11/12] package/libcec: optionally use
 libudev
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libcec only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/libcec.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 33e0463eb8..4661cca6fd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -16,8 +16,8 @@ ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBCEC_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBCEC_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
