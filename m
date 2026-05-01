Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E2CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F995427DD;
	Fri,  1 May 2026 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS1gFmFJUhrN; Fri,  1 May 2026 12:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53102427C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639262;
	bh=d7U7heS9NrRMWsrFLeTipGIg2UV8FUy5a/G3JxalsAM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HKrClzdvoiFqHFRHheFgDa++hqySlImzImR3mgECLYZOuyksHRkzDGWc809lCkpaz
	 8U2LbA/gWdaaGw7Uk4DV0zRakMx77mEJ2p4qLnmEvr9LuJrPLevq1pdiaU5dmWTab9
	 z8K2ZedS70trfo+k0MWji+NZxroY70gQhpwpShelPGzD3LILj9QJma7pK0/1BDDhHL
	 em3kh9uU6uu2NFQjMv5IZauu+I05gUfUlJX7ya3oA8XIkI1pMkNiXe0+YgutmE0Fnc
	 CVOGmjM0goKHal7VYFAjZzAaRLWF8uFM0uz2NaCYBkXx/a0ZE6H+KdgXEEtRVttmG3
	 uphsyNl38DSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53102427C1;
	Fri,  1 May 2026 12:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4EBE127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6FA184E6D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVwlULtj3KSu for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:40:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 939CE84D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 939CE84D98
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 939CE84D98
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC68FA4C2EF6;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-1lTI;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:05 +0200
Message-ID: <20260501123100.1918951-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=hsvz1cLTtvO4cW3TQTwi/ZuSElEH0VPtQIHIjWElEtY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j+5BaArYSioAM2oaVJJ7C3x811xlxYUwAdsZwl93hEO31OmpKIUqFp7jmCf2quNCo
 uVBZ0CR1VIlG0zWd8KAMIFfir/2i81di14th2w44yIpZezEXNBXfkk6vOzSlhRJEfU
 bl5IRB3KfrleZihHAw9lRHn3zlZ7OtJf4PZ4FH+H47JIZlYxppvZsXHN11uNbM4cwy
 qDqkCIWMiCt7qqt+6VC5wpqArboCaBe7YhmfHUkoq7SoO6Fl8hUfvghEUwSZfUjjBR
 0g40xcazGiA3JLxv3U8ritu5gGYaqwX9We9Ec26nMKSrFEGmRnoGio3JPtIwUiqxF2
 qAhRoRGPrTVmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j+5BaArY
Subject: [Buildroot] [PATCH 20/75] package/python-google-api-core: bump
 version to 2.30.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/google-cloud-python/blob/main/packages/google-api-core/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 83377ccd41..5e4050fef8 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  8c5ab43e8f25708f22a6f28d919bb45f  google_api_core-2.30.0.tar.gz
-sha256  02edfa9fab31e17fc0befb5f161b3bf93c9096d99aed584625f38065c511ad9b  google_api_core-2.30.0.tar.gz
+md5  e76b31eab2af8b172449ce786f37333d  google_api_core-2.30.3.tar.gz
+sha256  e601a37f148585319b26db36e219df68c5d07b6382cff2d580e83404e44d641b  google_api_core-2.30.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 28c4518aef..f77548efd4 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.30.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.30.3
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/22/98/586ec94553b569080caef635f98a3723db36a38eac0e3d7eb3ea9d2e4b9a
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/16/ce/502a57fb0ec752026d24df1280b162294b22a0afb98a326084f9a979138b
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
