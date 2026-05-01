Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA8CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BF041EA3;
	Fri,  1 May 2026 12:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HudMAnNVbVt1; Fri,  1 May 2026 12:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5185E41E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638936;
	bh=aDMPamQUr9BgT0IBh5mFtMSLKU0KARJtSwTWSR12vV4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QsRoeDR7Z0InX1xafZMpFi1FeUhqcM330lBO1WOkPu9i6CXTK0IYUnfyVBoXYRQxe
	 IEcmO8XnkTkZWUwkSNl+0TJSUO4bw0D4NYIPp2tpYAKZZdyzML+PCaXKUwJBiJmM3t
	 3BZcwDQ8IE62ph1qmpNyOC3fktTU0yaIjFKmWN2ctb9IbL8qXHT8qveGl8O1nQiNhj
	 Ccxb8/xBeTvKPzs/xDfkzbaDtgFz+c63mVyRTAkeYFw9EK39Fn4yUtPgEgAHndOuSh
	 qwOkmlr+UwnEpp5xGzYM3aWZG6Sd9rDTFnOmmXwJtXDvSWvyHAZy/2hszBEj7AmBMB
	 X4/HOGTr41UOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5185E41E95;
	Fri,  1 May 2026 12:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46672293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C4666F643
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpTK_CN9u3qH for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CE006174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE006174A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CE006174A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21BABA4C2EBA;
 Fri,  1 May 2026 14:31:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-0VSc;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:36 +0200
Message-ID: <20260501123100.1918951-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638665;
 bh=3W3oJ650MHrRVrKwGocuU4MGcSNevCG2uw6CRX5i2+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lWydCSA4bFaIShtD57ZEYSe/tKVN6HbluhqEbUPbyvTKGRUZSUxztKduQkCIoGyed
 MdxuWzTQ/XFZza/E7tdBLp/7t4kcs12j5FYIJbZl3X/F2WleiIP+8nyR50wRbNQAO5
 F3olYyXKHUS5hAMwhSc27WJmGS9abZiiCbMhvliFYpk8wLqOPCKC4QN9JH7iwOHn0r
 s0tB68HT4nSmJXo5NjlnIRvSFA8Ll0pZvh2+T/67KLN0pJ4NVqf/tykNfJabL6I2Us
 C3FyH19GVtQezaXwdZQhBp1Cj1iJsBy03SB36i21nyJYFmjTmiIv1L4hpnni1+CqZJ
 1O4HhBDjzZhkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lWydCSA4
Subject: [Buildroot] [PATCH 51/75] package/python-rich: bump to version
 15.0.0
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

https://github.com/Textualize/rich/releases/tag/v15.0.0
https://github.com/Textualize/rich/releases/tag/v14.3.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-rich/python-rich.hash | 4 ++--
 package/python-rich/python-rich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
index 21fab25498..e9f909eaa2 100644
--- a/package/python-rich/python-rich.hash
+++ b/package/python-rich/python-rich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rich/json
-md5  0d1b254b0743669f2112332a08081809  rich-14.3.3.tar.gz
-sha256  b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b  rich-14.3.3.tar.gz
+md5  44f6e884d4af4150446b36469025e060  rich-15.0.0.tar.gz
+sha256  edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36  rich-15.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index aabc3ea442..cb98d0ff3e 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RICH_VERSION = 14.3.3
+PYTHON_RICH_VERSION = 15.0.0
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
