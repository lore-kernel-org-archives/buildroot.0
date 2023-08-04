Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD1C001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 15:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496B360F80;
	Fri,  4 Aug 2023 15:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496B360F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCDC8pJNO3x7; Fri,  4 Aug 2023 15:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8902360E22;
	Fri,  4 Aug 2023 15:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8902360E22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35CB31BF99D
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 15:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 817C141F5A
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 15:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817C141F5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYpUXZqltKFn for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 15:50:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D998141F60
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 15:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D998141F60
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C31CAA4C0D76;
 Fri,  4 Aug 2023 17:50:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46360)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRx45-0006Fd-1j;
 Fri, 04 Aug 2023 17:50:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 17:50:09 +0200
Message-Id: <20230804155009.576919-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691164209;
 bh=qIS5jPFNMix7uQuWfVEA7yjYO+vFAeM6U9S/wP+7pKU=;
 h=From:To:Cc:Subject:Date:From;
 b=yIRLa+QZkwyB9+Fnq4MTbz3V/cmdXCCDHX9BW8UFnfbn9wPy4tDNud90nE03S6hH9
 zDmDIuGEd8MMvZPDklzA+XtbxbGi+hOP5B9i0wx3l+wSjyeKzgVPvPOVGMvT77HUDB
 /uMC3Wsik0cCd9LDRO/8QRsc/XBxGcIjrJSL1RlLSoR4lpRE9q1pcfx+7dunOThU1H
 jxWSF7JdlLOhf9aeBIGVZEHjXaFca6s71hVm6MmTKIDhGVe57DTQbVS/38t4wrRoMl
 pcfW2NYFWehajWNRL4WOkPjGZ/hbbKmNTA2pZnFWS/xpPvG7TbjGpKvmziEonj9Fr+
 w1lT8cROUGzgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yIRLa+QZ
Subject: [Buildroot] [PATCH v2 1/1] package/composer: needs host-php to
 extract phar files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Although composer has host-php as build dependency, in the case of
BR2_PER_PACKAGE_DIRECTORIES=y host-php was not built during extract stage
of the composer package.

Fixes:
http://autobuild.buildroot.net/results/506/50658c50fde8145fac320e3b17004e98c78c6c4d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: use _EXTRACT_DEPENDENCIES (Thomas)

 package/composer/composer.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index a24c020796..fde5b48951 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -15,6 +15,7 @@ COMPOSER_LICENSE = MIT
 COMPOSER_LICENSE_FILES = LICENSE
 
 HOST_COMPOSER_DEPENDENCIES = host-php
+HOST_COMPOSER_EXTRACT_DEPENDENCIES = host-php
 
 define HOST_COMPOSER_EXTRACT_CMDS
 	cp $(HOST_COMPOSER_DL_DIR)/$(COMPOSER_SOURCE) $(@D)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
