Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86A3E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8207A8220C;
	Sun, 21 Dec 2025 22:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-BU0uDkfJKK; Sun, 21 Dec 2025 22:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EA282205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356667;
	bh=l0+Dahnld5ButYz7lYdxRr82Xp9WzSggg31ZayIKCg4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=li98m7OrtzNibmOPl6CYE+mp7I0KQM7k2oGyCsl/CBAkNmaLDLB9bneF7Ffmi6Zjn
	 6Kvp/tgyqxyfPimOK8LxlG0xWSkpARb0oBLlJBVK2uG11gUEAFuLNYJjj4SspS0Bu0
	 n+sztbyHpaqUY3Ve8za1o3ZBw9I+jcTTJZEzIefpsAgYoYqOuPzvnMVevTiigsFWbw
	 Bc4rPLXRkf8zLlPYcAPGcwysjlMrx2IfMinR1aLshMVTexLZH3bUASwB1J1wYR5s4m
	 EGcPEWd39iWmSbykDRpWD7jS3hqIzxwI1/IefiOcG5nM4rPTTnJs88AvNII3fj9O2U
	 mNmnGw6/jJ1gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EA282205;
	Sun, 21 Dec 2025 22:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9069195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F56C812B4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wIaOrXezhM1 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FFBC80D84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFBC80D84
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FFBC80D84
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85FEEA4C4E49;
 Sun, 21 Dec 2025 23:35:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-1gel;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:34 +0100
Message-ID: <20251221223441.185169-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356505;
 bh=H3C3TgQyq56PPw1MmAc74v01lrWiLfBrPxzhA26oZYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=F4RyxGwnHDvv3ziAAgKjtNfmKnu6IsUrhHeNh6IkzvYW1lPHZ6TcA4sCq2KX24Qbf
 luuqbR/lX2aAK334+/1NpNsJkNiYReaQ77gLfdtpLnuGALqmlFjezEiIQVIYRXtfyq
 Kiuo1ZMYCFQdCEkVqjuvD/xtsmZN1N22CufM3v8JrvU5URjhXmwV6wtWNpsQ89SNf9
 8mHxwDg7/F95uhMs0xtCOL66GZV1Bo6qN8+nPPdl12aLkM1ZWq3e4XE7zX2RKOUk34
 8MK7+AZVXqZijiJ0CBe2uicmfQyx2wlnAeRUdECMX2WS42Lw91/t73D7fRID0UIzhI
 uZvuH8gGExXgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=F4RyxGwn
Subject: [Buildroot] [PATCH v2 16/23] package/python-pyasynchat: update
 tarball URL
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
 package/python-pyasynchat/python-pyasynchat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
index 6fb460cee1..2c503ea71b 100644
--- a/package/python-pyasynchat/python-pyasynchat.mk
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCHAT_VERSION = 1.0.4
 PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
-PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
+PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
 PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
 PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
 PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
