Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3444CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9553081103;
	Mon, 13 Oct 2025 17:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1qm8xYfGbJU; Mon, 13 Oct 2025 17:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD32831A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD32831A5;
	Mon, 13 Oct 2025 17:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0E00294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C3061443
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5j3FB943r_A for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEED56141D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEED56141D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEED56141D
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BF44A4C6A0C;
 Mon, 13 Oct 2025 19:55:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlQ-000000005Im-1XaX;
 Mon, 13 Oct 2025 17:55:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:54:57 +0200
Message-ID: <20251013175513.86276-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378117;
 bh=AhRTCc3mgAJWA/zua0t4VJX8HlM1ywQXK80HQ2/M654=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ime7CxfR8eHcdFBasdTBg+nUBhVCATmSYROOEDahgfQtUtjXQOCKjGah7tg7IBPxR
 NqP08pOmQlatw+HZme1oin7jFF4SB6a5Ghl0Oe+8EQ0tSm5D9BRZpHZ6obXRtYW59P
 wM0EaklwbaWsfr6cZUGvfnybxAn28wYMJFpMurTRxQDnOoAPAePdtg6qfhXvhW3H29
 fQVfteTvW29itEwVLV/+uY+pIMzRs1J+GTXSms8ZFD3D2J0RkV6WtoTSRuxwynw5+p
 7gsf/ZvIJD7pC5cjnK40nLJX5cjz2D9tr5BqUOjPAb5FbevLWwhbxEpyTwAyuyEppt
 nvnzR+jeBMXsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Ime7CxfR
Subject: [Buildroot] [PATCH 20/36] package/python-pythran: bump version to
 0.18.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index b72acfbe47..b0a0b04258 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  b754bc4c5cf37c4f0c4a3ae38009e799  pythran-0.17.0.tar.gz
-sha256  3b77d6d970a6cf5b448facc7d4f6229c3e73909ac27ea2480c843afdadbad0fb  pythran-0.17.0.tar.gz
+md5  829c5cba97e1339556251b631f4faeca  pythran-0.18.0.tar.gz
+sha256  5c003e8cbedf6dbb68c2869c49fc110ce8b5e8982993078a4a819f1dadc4fc6a  pythran-0.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index b9b1faee85..358b0c9ec1 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.17.0
+PYTHON_PYTHRAN_VERSION = 0.18.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/34/2d/4ac363a2eecd68c372b058d1b95a5f262c70776e107619cdcb5a4b68e1a3
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/94/0a/95a72f09f25dae48f41e367959075ed4c7a0ff02dd3f54eec111501d648a
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
