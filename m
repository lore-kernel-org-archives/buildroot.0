Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A24E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298E460E27;
	Sat, 20 Dec 2025 21:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgCLe5nDTYWE; Sat, 20 Dec 2025 21:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525DF60E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266818;
	bh=6nRTasF2YYTSgApjSE+1xV8IkezZ/Tm96N3msQYB9OU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kFt28rlCMcowYftQUzImbD0AsEZ1K7lfLTIrcpAxRxJyuP/PIZ9ZtikkqP/cGLcV0
	 3b2iivPdd4yHfvxJIVzvoPPXuFZYeTRZT50FInTAu0KlTSpQc9OZRIxCkjRlsbnzwp
	 Z5O2xlaHWUCAmjvpcG7yAyrNuuZpXeajENfjPgWPX1rDTU2UstW/IyP5ba34R3jUH0
	 7bp7VT3Ucg6m4qeVtoZVenFV7rzSPBq2ESHeWaBB4sqOm01/Sc9+m3USqq+iGu58xa
	 CIwBOyz7d/G4tq3k6LFH8EWeKiy/OUTGHkImYAMxJeGUXLGHMF2NojDzOvangZXnU2
	 POd+lq6qOydUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525DF60E15;
	Sat, 20 Dec 2025 21:40:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B19AE119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A333A81E7E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGi8ijo9sUtk for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47E4E81E3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E4E81E3D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47E4E81E3D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E52C2A4C48E0;
 Sat, 20 Dec 2025 22:39:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fy-000000001mj-2oA9;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:32 +0100
Message-ID: <20251220213946.1088820-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266786;
 bh=c213KId/ME1Q/jz/oWdWooBBpk8+YZOyZOG0ZNAcMZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=cyFZ9wdaoMPWNxyalMbnOQ0IQ7qLvBA1TQ0Y/gM2EerTSybnhSe1l8ZQZNI4qfoJ5
 H5oTY9z+phtiMKmrvCw7F65Z9OjsVD1LP/qcrrsNzu7MPScO80QgDj9zu4oFFMQM9V
 duUPaGFUnKu1BKclNPbm97jiKEkn881pP8H+qkkp84ndnGxnMo1PhWUEvJAJcpGsp9
 J1CpCnAec5bOS4KrtLEMzx6sGEl5WUtiEr/etMPiDSXQPrgcBt3/3jsirTRJzf9qrT
 QMjfIPw1ARIg42jlhZSciludG4q0sqCExRE+XFvCZReemLnJIxctO6BJggA9r3w7O1
 BhbuJPW3Grhbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cyFZ9wda
Subject: [Buildroot] [PATCH 01/15] package/python-characteristic: add md5
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
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
