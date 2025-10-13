Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5147CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866B661373;
	Mon, 13 Oct 2025 18:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejYkZTKpHiCJ; Mon, 13 Oct 2025 18:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42D660836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42D660836;
	Mon, 13 Oct 2025 18:02:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE9C4BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D1C4047B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtOKMV_BecF2 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9938540472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9938540472
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9938540472
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:02:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A734A4C6A1A;
 Mon, 13 Oct 2025 19:55:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlS-000000005Im-1vxX;
 Mon, 13 Oct 2025 17:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:55:12 +0200
Message-ID: <20251013175513.86276-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378119;
 bh=QFV57ZpacCE1S2uqeZq0Z+vD+WbSRk/LRoo7XGO32dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JH+d4ptR/CkQmk2wobm/nXkhmlK1Hz8NwRXIKnAaL38q6kPsYns/IgZR1rlX37v1g
 r1Ahkx0NfM90P74bb8yhPNhcFSehCTjZHgezFytpASLl3ijUkX9taxLmWMDNLa1Iq6
 NfDSmfzYw49KJBb3vzGpdPl3jZnpTJUQrBoFujU0ycrgWxvrwp4VI9l9Osc4UYu8Y8
 Kf/qLVfa+dyuEnilVKvsSD9vPJczWS/jf05zDHsMeD/q4s7Ai+ambGZ8YTTHdvAjcY
 6/G+ksVVDfuUcNnoYodBzw3VGGUPXsnqB65eja91nwn+x/HpNZtXvaEgjvnC6TqwnX
 2azzccMd0ZGcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JH+d4ptR
Subject: [Buildroot] [PATCH 35/36] package/python-telnetlib3: bump version
 to 2.0.8
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to upstream commit
https://github.com/jquast/telnetlib3/commit/b7dfcb60672c0cdca6c69941a21fab119f96f1f2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-telnetlib3/python-telnetlib3.hash | 6 +++---
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index db18889b8f..135b985625 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  2dfac7e10ed63c408da50ea712415f87  telnetlib3-2.0.4.tar.gz
-sha256  dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d  telnetlib3-2.0.4.tar.gz
+md5  effe967417ede0c7dadcc3ccd3263d5f  telnetlib3-2.0.8.tar.gz
+sha256  08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752  telnetlib3-2.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  caaf4ac82c4363d4874a49b50af15797618f6aee5bf42218697cdcb41c391ca5  LICENSE.txt
+sha256  df4b9fddd41b5811d9ba61952c7513ab3b0ca1d00efe611d19c51eda756f5dd1  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index e68533af5c..d8968d4f15 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 2.0.4
+PYTHON_TELNETLIB3_VERSION = 2.0.8
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/ef/af/0fadfddd1764e627f4ba9c7381caaf121795ed459a1cc3d0fbb89a187954
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b7/12/305101cfdec4863c088e520cbb698b08ebd3396904ecfe0062612db77c66
 PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
