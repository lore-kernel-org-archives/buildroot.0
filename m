Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E90EE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E5D81BD9;
	Sun, 21 Dec 2025 22:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOe5Cq70ZXjy; Sun, 21 Dec 2025 22:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D248817B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356486;
	bh=6nRTasF2YYTSgApjSE+1xV8IkezZ/Tm96N3msQYB9OU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TlsLQOpfpJroVpHdR+4ljyrWixS2+YUT2k7060Th4zlebUE0csloWoiWan5hfkRZe
	 X9d+L0GQMKWBSWyqBa7dNcDEIkXpAmJDHieJwnfsviNe5e/kgX5lSpaSSIE1a3x8Lb
	 nUOFsCBUEWM3aASnZZLsx2uGCjIeRyzjZCgdvLMuW1T62bZF1Hrej5baK82cgZym0L
	 9IvQMflj4c/xRr5d4lHux0+s2eN9qNXJGc/7a/5JSqCwY/DqkBJDFd1VmOWigTUrel
	 dVj5mrtrczH63Y1WeDsLLN6GsTVG7eULN0Fir7goYG7Ic6W+oKEMtOl2RH5OaCpZ1a
	 0ES+tvbgxg16w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D248817B5;
	Sun, 21 Dec 2025 22:34:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 586D6195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E26760810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HVnmEZSe2Ll for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3040B607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3040B607F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3040B607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6369A4C3E8A;
 Sun, 21 Dec 2025 23:34:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-1TAq;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:19 +0100
Message-ID: <20251221223441.185169-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356481;
 bh=c213KId/ME1Q/jz/oWdWooBBpk8+YZOyZOG0ZNAcMZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=UhA6Q3DmvaZTLBr76VdwwngNFs3F+oAG09qKKHuUdGTTe7CkLQ7NneIDZQUp30YtT
 AUwRTZ0GmbN8no0D4GjETY5NpMiHIjYai6vV4msG6q4hPqd0v2VhjM1+egrjHXkhdJ
 kAY95HlutVWhCTEbEkCVGr6or/4cVjyJ+uw2Zwk96b2wHSf6WeshZpouKCHHbJlwxy
 /qNQl/XHidUtJ+5ov+s7Cp79uXkkQBRB0H7SNtfd9lyRim+kRVORhzidttvflnFVAd
 zpaEs0o6Ej3Nidk5uoO9xx738HPSgFJTwqczgGqXbKrT/RwYkGcy7rT7Orx892dTRN
 1WzzfaSDawAyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UhA6Q3Dm
Subject: [Buildroot] [PATCH v2 01/23] package/python-characteristic: add md5
 hash, update SITE
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
 package/python-characteristic/python-characteristic.hash | 4 ++--
 package/python-characteristic/python-characteristic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
index c91017d707..84304818c6 100644
--- a/package/python-characteristic/python-characteristic.hash
+++ b/package/python-characteristic/python-characteristic.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
+# md5, sha256 from https://pypi.org/pypi/characteristic/json
 md5  b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
-# Locally computed
 sha256  ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
index 7ea8d95cd4..dd081eacef 100644
--- a/package/python-characteristic/python-characteristic.mk
+++ b/package/python-characteristic/python-characteristic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARACTERISTIC_VERSION = 14.3.0
 PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
-PYTHON_CHARACTERISTIC_SITE = https://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_SITE = https://files.pythonhosted.org/packages/dc/66/54b7a4758ea44fbc93895c7745060005272560fb2c356f2a6f7448ef9a80
 PYTHON_CHARACTERISTIC_LICENSE = MIT
 PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
 PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
