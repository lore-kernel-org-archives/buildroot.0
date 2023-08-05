Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A035C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09824409B6;
	Sat,  5 Aug 2023 17:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09824409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ry036pNP5wFv; Sat,  5 Aug 2023 17:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C674161A;
	Sat,  5 Aug 2023 17:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C674161A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACDE1BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2311401D6
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2311401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Y3bItkyHzbO for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:38:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E639E402CE
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E639E402CE
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05B76A4C10B4;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-36;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:39 +0200
Message-Id: <20230805173749.1570940-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=Ijcb74AzvgVegLXJ+tz5NbOX4maNAV2s95iJRu7+Xis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MSYPJf/LDU1Liqg4TPvLVa671ap8OTFo/fxGnB0/UZAON7QIsL3RFARUUZnDYmHnN
 WZRpvq3pFhggcCnZ9c7DPcq5UajWAcRiyYPvSdRpvLSQSjR41Jw/ovhCMn24y9HNdb
 Tprwrlhcos5da9w7Vd0L9aubNiP1NlHDQA4BvlMFDIYc9YAji1NoUeJr25LTem4Ufx
 1F8wFniHnUags6/Nj1ZiRz7Wd9eGDc2jTX6HN2bNuOLI0cFtTQUizCYAnC7n889nhL
 JbeveNI8jO0drO3paNncUDLqQdNNTWm6czcb8l/V3V4uvswO4fcot0tC6HiylRQ9n3
 bEKeCUNAyy/OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MSYPJf/L
Subject: [Buildroot] [PATCH 10/20] package/python-logstash: switch from
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
 package/python-logstash/python-logstash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-logstash/python-logstash.mk b/package/python-logstash/python-logstash.mk
index a78b6e6590..6cdbe2009b 100644
--- a/package/python-logstash/python-logstash.mk
+++ b/package/python-logstash/python-logstash.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LOGSTASH_VERSION = 0.4.8
 PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/f7/3b/c3a957bbdd23859f07905fc3d1adfe89957217a347478c58409f0315cf1d
-PYTHON_LOGSTASH_SETUP_TYPE = distutils
+PYTHON_LOGSTASH_SETUP_TYPE = setuptools
 PYTHON_LOGSTASH_LICENSE = MIT
 PYTHON_LOGSTASH_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
