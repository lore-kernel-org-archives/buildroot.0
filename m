Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4288810706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FEC4159D;
	Sat, 14 Mar 2026 14:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jNX2gReUhVu; Sat, 14 Mar 2026 14:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D651241588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498004;
	bh=RInqLWk+GX+EQqoAdGFzeG1+6an1XhLPAHwWR7JNLm0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZbcUFN1yKqzu3P8C/JTzeixOt7j7yzq249t3opfuXcSTDHTxhHWxRzamFq2U68F13
	 Uzwda9Lja6KyKg6SU3x3ZNBT2EeEnmo26Q0Nvd1cqdU3jufrDzix5fdF9SYEHV7XyO
	 9z3OqovA6a7TvqwP0JpCAg1fnLWROKhcUVVHJA4UKU1S8HCcA9lNqMWGbPYoN2A+WU
	 VaKXnDxcPoy968owa4olfHzn+DJpftSYrwy0i01OhwLVyDLjd2WYD1aLl8K1DKZuGA
	 B2VVpG3e3hFtCQAM3QZ850hgAw9+DYrcOdgQyWvqb/AEz+1zWkt6B3n0A6+nTCrAar
	 kq6p3hwZbudJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D651241588;
	Sat, 14 Mar 2026 14:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2131A1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0733C82258
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVSrF9kGjcx8 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E816681A1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E816681A1C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E816681A1C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB9D6A4C1911;
 Sat, 14 Mar 2026 15:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-0bTL;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:20 +0100
Message-ID: <20260314140633.2967249-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497222;
 bh=Eg3HOV0JhvunGv3uEneDFEoHAUnP1H4DcFeREaIAJPc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dC55z2yjGva2Q8RobieLhZdGre5Wa0gt0Y8Ku/UPQPckD5mOM7cRyRiqq2c5ZSST6
 ZVqBZWiNQ7WhBjhTWzdn1wOQh2gesMJ18TLZx8tX8TsPGjhP+rrD944V9fwdFhUWHY
 AFolX4ZklUp3S7yyk81oVTRY7oTKvaOnJMlKeLsvHNb9VoD/s85iC/GX5fDuYfU6cS
 D1LHFLko90wkE2NzsQHtchIlCHrEmaZQp/aTWDOiLEgUuEZfb0+KOl0FHpy1CGr9nt
 l8cy3l8be1UWQq2cjpWKWvKe+c2K3D5MyVahiZ+T44e4ezmyG+4iwTnff5o2IQlL4T
 flH1aTkNku1Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dC55z2yj
Subject: [Buildroot] [PATCH 24/96] package/python-hid: bump version to 1.0.9
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-hid/python-hid.hash | 4 ++--
 package/python-hid/python-hid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hid/python-hid.hash b/package/python-hid/python-hid.hash
index b990a2a9f8..3cda49a3ca 100644
--- a/package/python-hid/python-hid.hash
+++ b/package/python-hid/python-hid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hid/json
-md5  231df641df11d452dae6b579ba2ccf6a  hid-1.0.8.tar.gz
-sha256  5ca129a7b9434ace5e3e429c1092a16792feffaf067a46b666e9c586872cdcfe  hid-1.0.8.tar.gz
+md5  57f581cb0c91f68d03f7238787d6e644  hid-1.0.9.tar.gz
+sha256  f4471f11f0e176d1b0cb1b243e55498cc90347a3aede735655304395694ac182  hid-1.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  5524b425acacdfedeca3f959980f0cd38b00176ebbb292e4a96c520d6074353d  LICENSE
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
index 1e422dc97b..29943d618c 100644
--- a/package/python-hid/python-hid.mk
+++ b/package/python-hid/python-hid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HID_VERSION = 1.0.8
+PYTHON_HID_VERSION = 1.0.9
 PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
-PYTHON_HID_SITE = https://files.pythonhosted.org/packages/29/42/9cd3eab530ffae5e0ff880c575fd18cfdfe292b71f1e9872c392329f35fd
+PYTHON_HID_SITE = https://files.pythonhosted.org/packages/e9/f8/0357a8aa8874a243e96d08a8568efaf7478293e1a3441ddca18039b690c1
 PYTHON_HID_SETUP_TYPE = setuptools
 PYTHON_HID_LICENSE = MIT
 PYTHON_HID_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
