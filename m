Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC27FC001DE
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97BED410CB;
	Sat,  5 Aug 2023 17:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97BED410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GysJV7kiRj6R; Sat,  5 Aug 2023 17:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70B2E415EF;
	Sat,  5 Aug 2023 17:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B2E415EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8281BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF2760E84
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF2760E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53mgqbMHdYAO for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:39:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEBB460B06
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEBB460B06
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DA83A4C10B8;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDs-0001nw-01;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:40 +0200
Message-Id: <20230805173749.1570940-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=WuVv8uGWylLoPPNRjxT8ak4mCagy2FLK33EfpAOhHf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OT9HUQfoxJeSmocYhZA6s19oXtjMq5/DO6FzqSFI2nCbJSz7afldbDEEA9g1zfRLX
 Gh0NVuG3JpIm+4rux+grWUb1Dua1YVZH5AsBcnGFyZOiCOlsXXKtojXEZy/X1XkzS1
 VPaq2m43jSU9lpkhDGbnjT5scizGHf4cv3qX0mvFaksLvIbcO5rEn4k16Mhy5ImhWI
 8w+JBYd3qU1dXLDaUjzZavFIwtJkAXJ3WbAKp2iy5lRklWGMZTjxxBVWz63ijxNNN2
 A+BDKYLeJAIZOZxCpdYqQfV+Qnc+S5jlEbdeBmY90hUSjnJNdnZwLr6jLxmVT9TLKp
 QpD6ZZXRjDWkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OT9HUQfo
Subject: [Buildroot] [PATCH 11/20] package/python-mwscrape: switch from
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
 package/python-mwscrape/python-mwscrape.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
index 3ffe9d6880..8b6c718c56 100644
--- a/package/python-mwscrape/python-mwscrape.mk
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -8,6 +8,6 @@ PYTHON_MWSCRAPE_VERSION = 568ccbe6e12dd6391277df02adf724ba0e5f9197
 PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
 PYTHON_MWSCRAPE_LICENSE = MPL-2.0
 PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
-PYTHON_MWSCRAPE_SETUP_TYPE = distutils
+PYTHON_MWSCRAPE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
