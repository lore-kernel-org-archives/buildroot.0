Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B88E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895A560E26;
	Sat, 20 Dec 2025 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFLIUYfxouSx; Sat, 20 Dec 2025 21:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A243560E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266988;
	bh=g+NwZWQ3hDKUlo4dUIi5JpIvIX1m2TNe5oJz4tuCTzU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bwYgE7ytts8fGKMCc8Naf5bXkY5a4EmncDOo6DNGKsuUz4/rsHAAAx6TXGYl5Hrze
	 3GkP4EU5/AlLR+FjJs49/Z5mwPhKSVtjZMeISCONVKxO2qXjgjKWsBn+kuGXpz2DBg
	 RFAQ57HtRT1YNJdvdO78b6QkMfxqBbahgQCOmY/fkG4+FYutO3GrhIcFxCGYpx4zo6
	 lUZ6OvpeBa9OPjKDt8IU5bWA7SAfHfqaL6OTxoc/QRMhtkzSqs/X5GC9qxKgQ9kkeW
	 pnWfXOPKk05CMfoMbvN36aAQiulpeezrve+yePfI7Jy97Y9MzSoGu3IPvLbJjDGZtn
	 2Y9Cn3mRoNB1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A243560E36;
	Sat, 20 Dec 2025 21:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F6623D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAB37406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2KrYZLfZgl8 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 971D4405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971D4405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 971D4405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01B16A4C4B96;
 Sat, 20 Dec 2025 22:42:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iE-000000002DO-3kZ9;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:50 +0100
Message-ID: <20251220214206.1089100-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266927;
 bh=Lg46PNJgkyY1XZozBc65gAGKpQUgQcbJDwqqXPQTDZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HE8db5/mSEjSjckPqanXXTLM0ICEbtdMQdqE82EaIc5ZZ+6NCMXJb/8mAWtUT504x
 +bbJIAn0iDx4Y8M6DXWVx0rXizTUY5x0fiVz5tGa69I3kmBnqFSZpNJMPWnK9PlOtm
 A0HxMY4Bb1RANbJAOO9gmJbrJvAK2BZY4SwzkkI+5AXEbq0TmNqZVHHdRZOSZvJMfX
 QgQXkRRG1WjIOp2HjFrI3inw3I2Y3jEtVlV1dd6bzmgD/065QWR/2jDKi8RnPNzD0Y
 M8ooffH4sZhWmfZsw0T8exByGgjSuANRL2RObn5j0oRO73wjOQONQVB9+7yCRgGJYh
 vIiPw/F3VFi7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HE8db5/m
Subject: [Buildroot] [PATCH 02/18] package/python-cachetools: bump version
 to 6.2.4
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tkem/cachetools/blob/v6.2.4/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 2a11fa1afb..aa44ad61ba 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  f6a09127cf6d315ef12138b20a22f69e  cachetools-6.2.2.tar.gz
-sha256  8e6d266b25e539df852251cfd6f990b4bc3a141db73b939058d809ebd2590fc6  cachetools-6.2.2.tar.gz
+md5  1501ed3542a4ea9212d74e3bf5974bdc  cachetools-6.2.4.tar.gz
+sha256  82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607  cachetools-6.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 3e3100067d..0804e0f2a5 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 6.2.2
+PYTHON_CACHETOOLS_VERSION = 6.2.4
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/fb/44/ca1675be2a83aeee1886ab745b28cda92093066590233cc501890eb8417a
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/bc/1d/ede8680603f6016887c062a2cf4fc8fdba905866a3ab8831aa8aa651320c
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
