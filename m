Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CF110706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D45641292;
	Sat, 14 Mar 2026 14:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKYA-s_M79k1; Sat, 14 Mar 2026 14:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81587413FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497764;
	bh=lXdPyxmGGwhGMfuMZ2Q3IFlwyE363LqbXz8ZxFIDlgo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=akfLwAK1WIqguIU2W5keHAKoaUg+aN1+hwtrdUqxu0jeD/SsweCGM22c+grBti9H8
	 tKQr1xT+dbsBX29feF+lIIeNDXyymOSsOGeTTKidxSs9QvXIfkzxdQzhYG1Y2mUGUX
	 sJo4e0yoLdPUQVXNQcTTk6NL8CRHJoYGNN5yprTF8G+cEzxtO/W1LCj51WQ8Ff50Iw
	 ybohHWef+kYFDAABEEA+8KWdthar8C5QHatRU6aWKTelEix88qpYzOgfUUXqyGDeqh
	 gW8pCro0l6TD9A1WhYRynQaw/86YOCkdC3HCJgt2aah1LkjJUuc2HwAV8KGmaZrwDz
	 Vpw/kAp1ZklzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81587413FB;
	Sat, 14 Mar 2026 14:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E64DD3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC84941292
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJWNg_GkWC1y for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4B9E41406
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B9E41406
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4B9E41406
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78C90A4C1700;
 Sat, 14 Mar 2026 15:06:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-2Tos;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:03 +0100
Message-ID: <20260314140633.2967249-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497217;
 bh=DWIdICQxzd10/BrgwHAArpatFjTCIhsFY0Xa+ZinPpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=A2tS/2ayTgXmkeXD0t2LipmbBwuPi44hVI7v7RCV3GLuMtPeAWJZ5IvtIOpzv0WgS
 WpIIkLszOwQGxq0jce+hVTQVDi73PaRU2Fiyb1gl4PCmPH4/HtZokP5AH1dCv72OiL
 P+us8AxArUiADUHwkMxI8uiesMWZ/ls7YOORnR0E/pFgUpmkHUjLY5+he8s1b20+yG
 wydQKNefoH313k1oMkaAg4ITAb7XnvbQaq0ztFdVdLsfxo9Bz0uMA0vnghi8yahdPV
 hlpx23fwpvE84pNqOml8JVoWZeMAh4UI0297RwOp3jSABbNU9qUNQUIn3jCqQoXYbB
 aGTcZeuoDGt0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=A2tS/2ay
Subject: [Buildroot] [PATCH 07/96] package/python-bitstring: bump version to
 4.4.0
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

https://github.com/scott-griffiths/bitstring/blob/4.4.0/release_notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 517db883fb..a0a13a20e3 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  83984560794188b0f1183e115890dd91  bitstring-4.3.1.tar.gz
-sha256  a08bc09d3857216d4c0f412a1611056f1cc2b64fd254fb1e8a0afba7cfa1a95a  bitstring-4.3.1.tar.gz
+md5  3a7e512ad3977f4c0ceb3beef0794b29  bitstring-4.4.0.tar.gz
+sha256  e682ac522bb63e041d16cbc9d0ca86a4f00194db16d0847c7efe066f836b2e37  bitstring-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4110041ff5b99a3b0f64d4aa0c426fb9bb4fb3de69cd4c847e634f8e99b2c6f0  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index dc3796a829..0642d6d6ec 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.3.1
+PYTHON_BITSTRING_VERSION = 4.4.0
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/15/a8/a80c890db75d5bdd5314b5de02c4144c7de94fd0cefcae51acaeb14c6a3f
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/36/d3/de6fe4e7065df8c2f1ac1766f5fdccbe75bc18af2cf2dbeecd34d68e1518
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
