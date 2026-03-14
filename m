Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE5910706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50DB9410F5;
	Sat, 14 Mar 2026 14:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga3aemLc57I5; Sat, 14 Mar 2026 14:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6181B41101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497413;
	bh=ttxekcE2R13j8aTY5v4l9oCtCDO5eCz8bx2NkkS9/As=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rbTUrUxMXCnsE4aXhTdX3WAPMxtE6Cd777mGxI+d4c5stV+2E/4r90WEvb3laShO/
	 +jRYDzLG/SZxX7jy5cEuNYx9gNIQFpdAX21c4DGnhMcJTDm4zW/LL+GTBi3grKZKcJ
	 Kv0Re8Ih+AmPGY0AFUQ7o9ru0S7cTr2tY7D4eoZxHN4SS56Oz/fzne3ZiKV0fP4Txp
	 rdVPN/FDBQ4GahcpLPq9am7Kvs/rN04ffXwPKuXE3TpHmsFW76I/NqfvvbbvRZBPgw
	 uKDwPFff4DumsO1lsSmEqRO9tB9iQiybv5p3WLygOfhOXhSFP8wJB9di9V1sf2jRWD
	 47O1zcjtsUQJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6181B41101;
	Sat, 14 Mar 2026 14:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4098A201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2691C41101
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LChSp7gWv8IF for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FB8C410F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB8C410F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB8C410F5
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A7EEA4C142B;
 Sat, 14 Mar 2026 15:06:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-0Fgu;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:04 +0100
Message-ID: <20260314140633.2967249-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497208;
 bh=dVv8I5gSuUxCEODYTko7yEkhfKeB99Bx70+Nlhx0c6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ESRvV8fHR1XflNm0NDb0+/0Nz25jMtAeU200A0vkEr9ZvbM2RFIV1NUFU5lhgG24i
 kcEnNUBXGhJuSzMqKyphjyFVY51///sy+r3MiHGypQqIE2SBmvRK/JKKYdZC3JrnfX
 fO2zJS7L3doJKgQu23uTwPCVwtUdn4f52/wm7qGeD7izj8Fp3VxU57ioNrw+MvhyiT
 QFgfCtddFZNOYs3mfRRHv5NySlBO/5hETTVgJat7W8/7n9HGnPjQR2/D6OIwHWRANg
 GqyU2GAxBHvb/56ZulhXjVRVs6VFkcgsuQZDbqVOZ6NV5rXEi9pBh4ikr3NzIj30l2
 j492ep+ulxfpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ESRvV8fH
Subject: [Buildroot] [PATCH 68/96] package/python-soupsieve: bump version to
 2.8.3
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

https://github.com/facelessuser/soupsieve/blob/2.8.3/docs/src/markdown/about/changelog.md

Updated license hash due to copyright year bump:
https://github.com/facelessuser/soupsieve/commit/09b27696ada6f07523a077950ce73da45579d524

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index be9bc3402b..e604cd2d1d 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  ec2c755903968868cb307512203ef3c5  soupsieve-2.8.1.tar.gz
-sha256  4cf733bc50fa805f5df4b8ef4740fc0e0fa6218cf3006269afd3f9d6d80fd350  soupsieve-2.8.1.tar.gz
+md5  8c20930a780872dafd6f22175398ccf7  soupsieve-2.8.3.tar.gz
+sha256  3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349  soupsieve-2.8.3.tar.gz
 # Locally computed sha256 checksums
-sha256  571d0dafef795a196a0bbc3ac9b160a06b3cad41c320fecd98da3e26a8c81971  LICENSE.md
+sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 34fec5218a..04d33f67be 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8.1
+PYTHON_SOUPSIEVE_VERSION = 2.8.3
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/89/23/adf3796d740536d63a6fbda113d07e60c734b6ed5d3058d1e47fc0495e47
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
