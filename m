Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31773CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E191D6F6CD;
	Fri,  1 May 2026 12:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5Q3veaokMUW; Fri,  1 May 2026 12:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5585E6F4C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638815;
	bh=S5X09ZO3VBW82CDm0VR4usQhnrwOSBoQMYFCtzK8Z+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fEDYHx+dUFq8zXvs3k9xkw/KrbfKtmHLdO7/gu7ixr7RFbQNHlT04m9+uHyTmidyC
	 /wuMEI1AuA0iSPHtVKKBUpmfokr3QAHo/rJzm7jc5KT4E5ku3ndd9mUbTapfAXqC4Q
	 0hZTvm1VP9wb7czKUpwHHBP3vosmuxWWMDe7KvhBBfVzfmXkGS7YWmozvWu895MA2N
	 /17yDcrK+ohpsD4ku7hoaPNzgQYr82+IhdMGuaTwtMNBKJpBVXMCb7EKhlVYRVAUXN
	 5cgUzuQ+1MnjKdQ2x0HTy/aJWRlCSwUU3yg69tahNB8mnm+7CPnLDto77lUgOuWU0T
	 hlBSNJZGX03Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5585E6F4C4;
	Fri,  1 May 2026 12:33:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C829293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A8EB85632
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8tUsjo7VPD9 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F98C85626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F98C85626
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F98C85626
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C850A4C2E91;
 Fri,  1 May 2026 14:31:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-3PEL;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:58 +0200
Message-ID: <20260501123100.1918951-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638663;
 bh=Xg+uuUraaPNwBQ/S5gzHGFHNsPchel4kdnME4viF+BE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tKuFcBQCTm/CXX4nIbXggHMAJagmHYHXZ2TyLtRiZy3bA8qbpDPcIweyWNv7NdANq
 8Kp8wvQ/x9q4b7RdC7KnpKGG+KKpTUWtpQQaRpE9YqXtePdv+Pp3sZNdBRZvUZ4IBj
 3bMcubmPRbLURgcSRloAgu8p5rX9tVZGfH2lJvZ4OSRfH51ssazByyovBkIwSyvXT7
 HpmzuXv1ixlUeB2L4oiIBA73SpJyQNwZ7B/yzzEfSIhkvL4R0aqv3kuNbkDFM+hvjE
 Gen5itkRcUvP+fSJNAFJGbDAF7lsDAJoke5wbrN95NvwgesgTId4r1BttwksfTdp8R
 UpRU8SgHFiI/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tKuFcBQC
Subject: [Buildroot] [PATCH 13/75] package/python-dbus-fast: bump version to
 4.0.4
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

https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.1
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.2
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.3
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index deaaf4bd79..4709b7ed18 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  02f1448d52a71999626135269f3763f2  dbus_fast-4.0.0.tar.gz
-sha256  e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe  dbus_fast-4.0.0.tar.gz
+md5  af7d1d9f9b169f07fb4f185c6a78d664  dbus_fast-4.0.4.tar.gz
+sha256  43137f0b73a7adbf7d5c0e9eb9d8d34df9e6e0aeafade2166e641c52dfe0a853  dbus_fast-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 5addc1031f..895d5fefd5 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 4.0.0
+PYTHON_DBUS_FAST_VERSION = 4.0.4
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/3d/f7/36515d10e85ab6d6193edbabbcae974c25d6fbabb8ead84cfd2b4ee8eaf6
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/5f/cd/402b0e524bdf37d8b1d22b1d926c538bf1d2eedf115ea1d401c6c08a7d81
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
