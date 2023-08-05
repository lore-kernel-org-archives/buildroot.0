Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA138C41513
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 470A560634;
	Sat,  5 Aug 2023 21:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 470A560634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoBx58jeKlJu; Sat,  5 Aug 2023 21:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970CC60A6B;
	Sat,  5 Aug 2023 21:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970CC60A6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68C281BF2C2
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D341E608D8
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D341E608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esAC-BHRP74e for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:52:38 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E25E460803
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25E460803
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFAD6A4C1043;
 Sat,  5 Aug 2023 23:52:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSPC0-0003mb-2F;
 Sat, 05 Aug 2023 23:52:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:52:11 +0200
Message-Id: <20230805215212.3637412-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805215212.3637412-1-bernd@kuhls.net>
References: <20230805215212.3637412-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691272332;
 bh=Ednv5GwbeQXSagvkLY5kEDx/SSemnYf7x7YE5sV73oA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=urk//TxIFZmNv96rDy0ie/sZRwAnLWN82Yw8g1QezC/Nx6IVkz8ZN+NRFFu2n1x8U
 x2ZY+9sS88Gw2O/vj49QFHUMZUMz4Xuh/Z7Z9P3WgrI/TI6LojVioizm8wPEQDqMn1
 owh12CosRii+2P60qlvSBGoQdC5VcKlBBtCPOIu949LgV4xX7am/Ph9ZpIP8t/hauB
 T/lCtFG69iwcDGy3BqWN3X0A9H3gMlIvJOkz1wEyBoNIKCXBTCAAicbIsHitwxq/si
 BSNE/A/tcn6q8iBUBEVMlVbLgZPAka+q2noIozcrx5PYWGg0Gey4g5nZoI4c3jD2lp
 SR5P7DkTa5dHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=urk//TxI
Subject: [Buildroot] [PATCH 3/4] package/iotop: switch from distutils to
 setuptools
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Thijs Vermeir <thijsvermeir@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iotop/iotop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iotop/iotop.mk b/package/iotop/iotop.mk
index 8b5564974e..e9ef9edc10 100644
--- a/package/iotop/iotop.mk
+++ b/package/iotop/iotop.mk
@@ -8,6 +8,6 @@ IOTOP_VERSION = 0.6
 IOTOP_SITE = http://guichaz.free.fr/iotop/files
 IOTOP_LICENSE = GPL-2.0+
 IOTOP_LICENSE_FILES = COPYING
-IOTOP_SETUP_TYPE = distutils
+IOTOP_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
