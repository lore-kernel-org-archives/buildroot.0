Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D4FEB64D8
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5D8C40193;
	Sun, 18 Jun 2023 11:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D8C40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAJ0MX6H2Oyo; Sun, 18 Jun 2023 11:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB5F94048F;
	Sun, 18 Jun 2023 11:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5F94048F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26D001BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 004BF60F22
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004BF60F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zV113xs_zTUE for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:15:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9E760F1D
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D9E760F1D
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:15:00 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 27D175FD05;
 Sun, 18 Jun 2023 14:14:58 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Sun, 18 Jun 2023 14:14:58 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Sun, 18 Jun 2023 14:14:34 +0300
Message-ID: <20230618111434.62274-2-SIBobrenok@sberdevices.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
References: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/18 08:42:00 #21509530
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687086898;
 bh=ix4JCQu0R/UX03Ctlnkp12WKvJIh5QYBGcdlxTwzWJw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=ou5GCSaQKOvQSU9GZrwtM2DUqAcwSbEY/5TzXpjWwfZJJdKI37G8csMjLSd4dJ9GN
 RLFkiLWAPZD2U6fQ/tv8YPlFVqiWj9WXNePHaREfk1rUcA7Ce7wXZQHKGRcozsAOtv
 iaVOQkM4wPfD7D0nuElx6p++69JWJa8350pxKUCRWi926XP0Y3BKNBcGi1RRixjMhh
 Ie9QxAkm1AXZbR7KwThT9sQigp7wr/7eaYJM8Df9TBPdexYEdLPgYH9qvvhIV+mgMh
 GNvamN1nxT0xaxxtcWI546EI7YS2RkBIqypmAJwfZmMeEMb8bAyVv5PHVNx1+EqRze
 AB8sofpmVVlFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=ou5GCSaQ
Subject: [Buildroot] [PATCH 2/2] package/crudini: add host variant
 dependency from python-iniparse
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
From: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, sdfw_system_team@sberdevices.ru,
 Sergey Bobrenok <SIBobrenok@sberdevices.ru>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/crudini/crudini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index c376c5f777..ceca53abe6 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -9,6 +9,7 @@ CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
+HOST_CRUDINI_DEPENDENCIES = host-python-iniparse
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.24.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
