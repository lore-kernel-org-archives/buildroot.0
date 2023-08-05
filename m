Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C350C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A9560BDD;
	Sat,  5 Aug 2023 21:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A9560BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBMYCn2r2Acf; Sat,  5 Aug 2023 21:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FA960AAD;
	Sat,  5 Aug 2023 21:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FA960AAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79CDF1BF86B
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEC7405C5
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEC7405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRF3ozNniQrh for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:52:14 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E85640533
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E85640533
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE9FAA4C03A4;
 Sat,  5 Aug 2023 23:52:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSPC0-0003mb-1p;
 Sat, 05 Aug 2023 23:52:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:52:09 +0200
Message-Id: <20230805215212.3637412-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691272332;
 bh=O5cicismX7/EyRLK+UouUIV9PIUWYsCXMD8qpGJpWhU=;
 h=From:To:Cc:Subject:Date:From;
 b=af53dVn8viCYZoDSmBNnxXDXrTwoOhlGsQEKvlEucCgbVBmc4zJEYWI05KcB8sdXj
 eo4mDSOse35M6q9FL43SQLOO8R3OCZLTi/QXbI9l6FZG/HYf/CRlkzHNasFj0gigid
 i9HQ0W/hzXDMWR2kjUe5By2Fp1xcJagSddr0Zsxdgb1uhoUYjbKaklinkxSundZBf2
 1FY6Vx6D+icdzl6Q0zSc0J+WGmoT4HGcUvP9nu/7QaO7Xb5aRJooyhj3Ama7gsXIVp
 RW6mQDk1pqlkhiog5xKuPSNEmRyyu7oQb+GjXcaWUE/MIeqxmT/Wvzwi6yDcBJSntX
 TdxqVB313VPgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=af53dVn8
Subject: [Buildroot] [PATCH 1/4] package/ranger: switch from distutils to
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
 package/ranger/ranger.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index 91b30f216e..1c948db848 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -6,7 +6,7 @@
 
 RANGER_VERSION = 1.7.2
 RANGER_SITE = http://ranger.nongnu.org
-RANGER_SETUP_TYPE = distutils
+RANGER_SETUP_TYPE = setuptools
 RANGER_LICENSE = GPL-3.0
 RANGER_LICENSE_FILES = AUTHORS
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
