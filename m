Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF9E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937B0821FB;
	Sun, 21 Dec 2025 22:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKSJuqUK0nJu; Sun, 21 Dec 2025 22:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FA280BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356654;
	bh=DTKI63x/TB5YEryscRxascPrH7oYm0aERuAHxMQMkDs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ze/cuzt5/a+sEIPRMHZ8+LkuKlrnfL1Uizn1rQ5cZ+q/U2RbTjhYKHWjwqiKaYG+o
	 vQbnjRjiE3QXwLuQCVr21HcDNd3k7CqapyBWJe2JUvT3avR7Ud4BlSPXXzJFUXT4PZ
	 yOX0pP6Ba7ALq3VfNiQoh3gHhhMizUBaq15Rl5Ho27NaiLpao2Z8H70wPzJ3nKEC0L
	 etjUUMPMeMMhJeW5bl6Gua+//zBwvR/Drhyl/WVaPQRd7tNm8neUCXV9fENrnzLsUx
	 hMMy1zFOG6l8YRJJcw+dARm6StyY+DEp8YUy6qRcnAWQsakD50XE9d/WG+WxdMLonN
	 pXEidav+siz7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FA280BCB;
	Sun, 21 Dec 2025 22:37:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B93119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B508607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd2r4n5VAb1J for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30CE360746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30CE360746
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30CE360746
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 551D7A4C4E48;
 Sun, 21 Dec 2025 23:35:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-1O7B;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:33 +0100
Message-ID: <20251221223441.185169-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356505;
 bh=BO4J07iCA/F28FrC8BZiOYhUWChZAHoqGiZ6mm2pTNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W7QSfpRt703I6ojT31VCHiZFu82RKKoVJAanV8Tvrwau2WSn8Rjw4M3hZayu7XzDR
 ohhYeWYjcTznLHuaqbBmPx9slosX0r1+PpGYVNl/5ZSfADaaRxvBIYcxTyyEwPfPbU
 WAYYa9OnqP4a7qazDaxzZj1obgR5cyNstxpzj+07ANhySHKJUftZC0bkse862hKsXL
 FBNSzE1yXdYLdA/A2aXQdPfnSYAXGKErt4uNnrK9MIgTT2cezdeQxM484pzLPOzvNG
 4P7n84jqX74lVb9A0y6hPMydUlBznGhIXt1KJNnVpYV6AvUS8z+zqGuNG9gq7S8znS
 c057OnUT/nn6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W7QSfpRt
Subject: [Buildroot] [PATCH v2 15/23] package/python-mpmath: update tarball
 URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mpmath/python-mpmath.hash | 4 +++-
 package/python-mpmath/python-mpmath.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index 1b263c925f..e402647a59 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,3 +1,5 @@
-# Locally computed sha256 checksums
+# md5, sha256 from https://pypi.org/pypi/mpmath/json
+md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
 sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index cd19dd52be..86a3562d04 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MPMATH_VERSION = 1.3.0
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
