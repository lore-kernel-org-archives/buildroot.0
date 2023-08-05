Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD8AC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB490415E5;
	Sat,  5 Aug 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB490415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I71Zu7HRBo5q; Sat,  5 Aug 2023 17:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 952F14002C;
	Sat,  5 Aug 2023 17:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 952F14002C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C79D1BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B0D816F5
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B0D816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2XBtOrUdArk for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:38:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 953838146E
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 953838146E
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF015A4C1099;
 Sat,  5 Aug 2023 19:37:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-23;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:33 +0200
Message-Id: <20230805173749.1570940-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257071;
 bh=Zlhjgw/u6mKsws+DOlLaGwtZCLIJoQ3aY0IPr73QFRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tZ0qW3TYoQAgr76sAIpBnWISfU/jx/RoGOBlW5NSjKMSayxKWxxeDSCZ0Bh6iLvnV
 ere5p11qVI7clrzruez/PYMuQ5r6+Xn4BZ/C6ZuxIcUw4MUxbpUXYGBrZaysaMzonz
 6uuLeGSyWfbc7y8ZbQKVlY/GYD2Xby0Vbl7laXPVkF1zMZ1JiPNAXSAi98bAuSIxug
 +AQu2bmshKW1gkRCdM1HVOsJyydxFKLnSeRsoMwkI5bCX01dVCxmWY6yxNhEa4K1T5
 0+ywVAqm/lj9pvUU8yj35rCDXWfJszyD7CCcCiDel5PvJ6kcYnS+l1mueHIb9PpMwK
 DtLP5NXusdlDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tZ0qW3TY
Subject: [Buildroot] [PATCH 04/20] package/python-crcmod: switch from
 distutils to setuptools
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-crcmod/python-crcmod.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index 1aab7f5084..c97f8808c1 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -7,7 +7,7 @@
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
 PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
-PYTHON_CRCMOD_SETUP_TYPE = distutils
+PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
