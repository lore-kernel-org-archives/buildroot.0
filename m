Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC2E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586FC812B4;
	Sun, 21 Dec 2025 22:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPgk9W1A90hw; Sun, 21 Dec 2025 22:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560CF812A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356594;
	bh=rFu6U58ydqdZpWVTnzWnXVLZGZnkrZNOU56fkuZDkLs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K/oNS7u7tckIrwIihS8Nt4yFcTwxWaVBoGsssUzs9ZIKCG/hY27iQ+jvZbVUZvDOt
	 dPUzOdcDKTvETZ8a4FyjTR/HHPa1FtOCKI1bGWlu3W1zwh07nr4Eh8CI4aSVF2bJel
	 29fp5e6cxfkePENDvElkp/n+IcPMZrMDJ13iktMmVEFr2Q4EXR1DNAh3nLKocT82lk
	 02W4/sWGSM7QfArorwhI/CH5yLNaCCz9F5b0vUQsF8O3qBhlzzINTD6+Ugl3i9uMg+
	 6mDsTbezsLBgUAS0vLcW+TISCXqamziCb5KsO5TImKj0N6/UKRo0A4Iwueztsbnz9E
	 LLoMnuRjHvl5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560CF812A5;
	Sun, 21 Dec 2025 22:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ECD9195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45849403A9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Obt7V1RvnXNJ for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18B4F403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B4F403A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B4F403A1
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FCB9A4C4E29;
 Sun, 21 Dec 2025 23:35:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-2ey6;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:23 +0100
Message-ID: <20251221223441.185169-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356504;
 bh=HXQjUGjizNyeHVB8PbHBUE1zDU4TxkeOvp7DyEQCohQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lYo0dM8jDOEB3p3KFGc7KbE/PXTL5rhJ+pLKR1AQx7X+TuAMNsjkwrJAPyXuwGeV0
 qEKj7KsXqTqJAPdXKctywiEQHni0clqKY6G4Ro93DOW/xU3RcX4EXgciMlh7lKAb0z
 lbWwAZvyOE/cnCxI91E2oR9cEpvrRO7GGzS9slsFDI2+bJYHedTsacVKEIpnPRAYJE
 5r8CHf/S4wd3jRbbdixFSFNAxBjIP9lUfIxZ1Am6fk/3xRY2H+qNSChl57dROER0C0
 iGDU1V+/H5ko7Ruqpa8AdHkxPBzNRyXs1aqsUR1kMr8AX6W7uamapwk1A71CR8sdUw
 +nvFwQEsZClJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lYo0dM8j
Subject: [Buildroot] [PATCH v2 05/23] package/python-crcmod: update tarball
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
 package/python-crcmod/python-crcmod.hash | 4 ++--
 package/python-crcmod/python-crcmod.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
index 43ef7dd8e7..81a7f34614 100644
--- a/package/python-crcmod/python-crcmod.hash
+++ b/package/python-crcmod/python-crcmod.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/crcmod/json
+# md5, sha256 from https://pypi.org/pypi/crcmod/json
 md5  2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
-# Locally computed
 sha256  dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
+# Locally computed sha256 checksums
 sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index c97f8808c1..a8f2e86be6 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
-PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
+PYTHON_CRCMOD_SITE = https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
 PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
