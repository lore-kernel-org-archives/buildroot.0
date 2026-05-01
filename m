Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457EACCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B91E42A7B;
	Fri,  1 May 2026 12:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUQQq7f0lTM6; Fri,  1 May 2026 12:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C2242A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639565;
	bh=68/ewVKLjdAyXwb4h/5n5PlOboptNoAS7a02+N5Aa0c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W1Dwj80AnPDzY8HFLIet7qwltG4NMVs9AE7WyTzI6eMaDq4nOaTjRaCQjkGGj9iI+
	 LoIx0muOazkNBf8RhLARfU2zo54bET4EgBQapmA4EbK/6Ay3+l0vRNF1NQqmLR2KCZ
	 kpC57Q9FcQ00lLUEh7LCwPi3fdG1RpnsImDhwIwG2WOuapgQWMBNT0/wwhn/xAYUrX
	 qkc7mNNYwXH/LMstbmyt8kkRKm0zsM+dfImupQJxn1pRDXc2VOpWTo3F5aSM2Pwmes
	 SU5J5rSmfgoML7W8jtQ6rhrm4ZbGutsMm5lddrTqGK5s/I1w6iNQZbLKgm81hxFtQy
	 ABXpPn943BJTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C2242A75;
	Fri,  1 May 2026 12:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C835127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A1FB6F7B2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeQReIlkBW8e for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74C9D6F7AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C9D6F7AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74C9D6F7AD
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:46:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE158A4C30AD;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-4AIO;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:23 +0200
Message-ID: <20260501123100.1918951-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=+o3q3mjZhjMaPeBwjY8v+RLw30r7CKkXVMzEVv2cHik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DCdarqzS5wdVAXR40gBqWVLsYDaqRbZkEdVdaDDurTTyU3sGw/pOOZz+6UGVwE45i
 2YNBeOpTjqw+Hbn4CEfqrhSFfOmfWRObqc063p0y+gVAQaI5tz5TwWrA7fvjSfgC+C
 OKXfYKnCWB6rWKRRCbRpDxXlyvGrkTluw1LdLWoT7uPETVoeadYMqX6xDVKGiXe5rS
 zXUzeaV2NWJxMZm0re+2sQ/rv1LI/OYwv28dFoTal4HKGIQNgcIQsLIs4v7vjnKOGS
 djltVsICxpzTZc0OTtrxDr6gPbnmlZFHgyJ4WYdnDxCOWJj28xC26gNg+70cs2rdRK
 WNf7Y3n249ijQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DCdarqzS
Subject: [Buildroot] [PATCH 38/75] package/python-platformdirs: bump version
 to 4.9.6
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

https://github.com/tox-dev/platformdirs/blob/4.9.6/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index cc92e4a824..3e2f4ea59a 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  8168f7450c9606bfa4a28268f0f59a37  platformdirs-4.9.4.tar.gz
-sha256  1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934  platformdirs-4.9.4.tar.gz
+md5  6b9f7a12243ab0609a433bcf2f641c6b  platformdirs-4.9.6.tar.gz
+sha256  3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a  platformdirs-4.9.6.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 11e8acd078..c3a7df9037 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.9.4
+PYTHON_PLATFORMDIRS_VERSION = 4.9.6
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/19/56/8d4c30c8a1d07013911a8fdbd8f89440ef9f08d07a1b50ab8ca8be5a20f9
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
