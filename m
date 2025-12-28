Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467FE8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A7740376;
	Sun, 28 Dec 2025 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3_R62lQqZVw; Sun, 28 Dec 2025 21:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188D4404BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956270;
	bh=v+Q20PoJFoELViYn9WJLo2Tm8Gz6ywWtOcTv8qEB4Ec=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QcDdDOpd0J7z6oZMKQ2KtcmcO2DE7flW+HpOuXGXO9iKgGwlUEMw+GlpqJmsqgjrR
	 BigEvOUwYTil9SPSzu+kQhNficZeLgeNSQIccSB4HZeJNR/vEfAERC2GchpYMuk17U
	 vvg0ZRXwmDQlX25rbG73NPaaCLzNOW5wBe3bQYJ6mP3tRwGpp/C/68JPNtXYFAV4oP
	 ULmFkr7BmBGbFO3qt4poih7bsSzvlPfSu7F9JtaC1AEa/P9TSI3/6YETSWhHd34BIH
	 Ck1tyExsj4RbXXtpBXga7QLfvPwVktw1dFS6aMXgg7tbWHjWKZVuUEW2Evh8FZy4D8
	 V3scsV54wRw6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188D4404BD;
	Sun, 28 Dec 2025 21:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D36D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C442360A77
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e1Oa-wBgKwH for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC10F60A71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC10F60A71
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC10F60A71
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 212BFC1D70C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:10:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88DD760725;
 Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6A4C119792C6; Sun, 28 Dec 2025 22:11:01 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:10:43 +0100
Message-ID: <20251228211045.3059593-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956262; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/PIlNAmQ8Y+vd98e9B78wY/nwGfo1oonLOGuJdibYoY=;
 b=h+tZfs2go7HDeN97Jf2DLoWrZ6kXPu1bbcadSmmL8YVIMy2wF44W7bDDTomwak/NI5Ur0l
 ciszFqeRbiI0uA0aSO0AKHQq82nnATbByMOwgaePpxbKHVdgvTklxrUR4cCk3Oo1LclSNa
 1Ts7qCR4js0P0HpC0TTGQGx1snYDHGWp7fUyZa+3jd9Ftq0WzpMBJA/Qub/4RGRN1VZrC3
 7fBiwsbT6MxvyMBRIKTyuK+GLYYrkPDwaFtLa30+iCOIQVPes05r3PW+syXgdrSjgqui2J
 i1FexQzn5Y65JqKe+K93nHf/RBJMbWMKkmd9rdzPpFklcGEOV+vPYwuK/pP/yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=h+tZfs2g
Subject: [Buildroot] [PATCH 5/5] package/python-pyqt5: disable qt5webkit
 module
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to issues in the installation of qt5webkit, building the
corresponding Python binding fails:

Project ERROR: Unknown module(s) in QT: webkit
Error: /home/thomas/buildroot/br/output-all/host/bin/qmake failed to create a
makefile from PyQt5.pro.
make[1]: *** [package/pkg-generic.mk:263: /home/thomas/buildroot/br/output-all/build/python-pyqt5-5.15.6/.stamp_configured] Error 1
make: *** [Makefile:83: _all] Error 2

https://lore.kernel.org/buildroot/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/
was an attempt at fixing it, but this patch doesn't work and looks
weird.

So for the time being, disable the Webkit module in python-pyqt5. This
issue has indeed been around for as far as 2022.

Fixes:

  https://autobuild.buildroot.net/results/b9d69d21e734aa62a6e0b4d4124c2bcfc027ebe4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyqt5/python-pyqt5.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index bee0c529ca..1ab9cea4ad 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -91,13 +91,6 @@ PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
 PYTHON_PYQT5_MODULES += QtWebChannel
 endif
 
-ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
-PYTHON_PYQT5_DEPENDENCIES += qt5webkit
-PYTHON_PYQT5_MODULES += \
-	QtWebKit \
-	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebKitWidgets)
-endif
-
 ifeq ($(BR2_PACKAGE_QT5WEBSOCKETS),y)
 PYTHON_PYQT5_DEPENDENCIES += qt5websockets
 PYTHON_PYQT5_MODULES += QtWebSockets
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
