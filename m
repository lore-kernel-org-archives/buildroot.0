Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7DCCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE246613FA;
	Mon, 13 Oct 2025 18:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHnIwk1sijSN; Mon, 13 Oct 2025 18:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F8661399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F8661399;
	Mon, 13 Oct 2025 18:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C28BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA7740416
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkCrU1tjTD-2 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D285403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D285403FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D285403FE
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:01:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E594AA4C6A17;
 Mon, 13 Oct 2025 19:55:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlR-000000005Im-41Yu;
 Mon, 13 Oct 2025 17:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:55:08 +0200
Message-ID: <20251013175513.86276-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378118;
 bh=9vmwqNtp4ivEGPtVAa2FsNySLBOhPLxr+142ropYjME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=olQ5MrO9Dx7qKI5FYmdl7YcqoLv6kTfRMG2COSWX56CiA3uZwvY52tU57WWBDpYpf
 GKVStop/tU7vnynhSw2GFIbCGfrS/hNQAD/pxYP11aQGYXERv40CMpuHfysfWuYxFy
 wO2NZYidt8Anld5nMzJy8e+5ncR8VbD6bH39b9g+t97D4sE8usb5GQRO7ZsKFhiCb3
 a9Zd9dDD+HSuCFLqBwHsjuphw29HXGITePERZV6xm0Uj1uHrueUndCTQi3B5wrjdVu
 9ChbsyKbnKc74++rM0ZBhJOKT1gU2HSpuSbSeiskBYvVuN0OofV/chjDQw+R0yyy6h
 KmHvbfC4cm4HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=olQ5MrO9
Subject: [Buildroot] [PATCH 31/36] package/python-spidev: bump version to 3.8
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
 package/python-spidev/python-spidev.hash | 4 ++--
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index 77f7ce4039..166a36faba 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/spidev/json
-md5  3074b983c687b1ec3a80833a7508642d  spidev-3.7.tar.gz
-sha256  ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0  spidev-3.7.tar.gz
+md5  1c44b18936bfb8d519f11ef9fe15fc73  spidev-3.8.tar.gz
+sha256  2bc02fb8c6312d519ebf1f4331067427c0921d3f77b8bcaf05189a2e8b8382c0  spidev-3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index e93871c745..2f7f7f23fc 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.7
+PYTHON_SPIDEV_VERSION = 3.8
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/b5/99/dd50af8200e224ce9412ad01cdbeeb5b39b2d61acd72138f2b92c4a6d619
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/67/87/039b6eeea781598015b538691bc174cc0bf77df9d4d2d3b8bf9245c0de8c
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
