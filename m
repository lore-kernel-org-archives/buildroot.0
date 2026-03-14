Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B69910706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E97241277;
	Sat, 14 Mar 2026 14:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGCuv5ntA2pV; Sat, 14 Mar 2026 14:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC9341281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497489;
	bh=xQzP81MRSZPlZpFSqOCTXNsDPRLDdBlRWouBGx2ThGs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y4FAnIpg/3wiqMENA6cA9CIJwSrHHPXdH/5+fwCWvIyst3N2X81eRZB4tFGiDVLAY
	 poAE63wNnzVryJsGyMZrybN0eHIfIa8HCsxj+RqFPQq35fh5yuF8uC7767cmBQUqD5
	 zfysPLtjK7Xto4TeK4rU/ABiuzDscRWFhOEmE8mnmq+zc1AwGawbCbF//LLvLZxR5l
	 rvXF71MmeGJfyE3fBdR/SvM9CSbgxNSMWaTvdYC9woY9c7JX7FDEs0KR6mCNvgejsI
	 3n9vs7ObfVYqvB4Y0AxJUYiwB/J9nL1/B0/RSJTJvG56EESB677xWK3S1lS9LBQyGt
	 Djw6RufTjSd/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC9341281;
	Sat, 14 Mar 2026 14:11:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E105201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4656066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANYIMGGydNiD for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:11:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FDC660640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDC660640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FDC660640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04D20A4C144E;
 Sat, 14 Mar 2026 15:06:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-2be4;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:10 +0100
Message-ID: <20260314140633.2967249-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497210;
 bh=W+P7J09bvTUER1qa75B0mxg6DBqCp6HlXiARR225Sf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nrh3ncu8bDIOVYK2WHz7OcbABHG/BpduQdpl2Mu2+Rf1a5ypKsficKbREzbdFCn+z
 7Xxwf8OuxUVoCD80bC2mIK6ZA/sVZ54li9r6OcglKBzhv1Djq5sMS/fUNsaLtOOtrW
 +SrnIEU07MZmFo2NEXmpQIXEDy1fFK2ARCt8vqQZeUiYexsjf+RTiBD6hOXTx9d1K0
 xJuBCecTcOHj5VXVNuz8upD/DUgzNAYAgTwKCij6k0V/OMQNBvAKZohbOLYFrp7naV
 GZ1t42F7GDJeVADcQbZuvMMh8tNO24JCiuehldq1rHQkIS4wP++mbpKqVEuPd0aRP5
 R/s1SqvyGVSPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nrh3ncu8
Subject: [Buildroot] [PATCH 74/96] package/python-tomli: bump version to
 2.4.0
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

https://github.com/hukkin/tomli/blob/2.4.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 560c4cc3f7..91d9c51212 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  30b640d2f852e26c189cb0edd275f1e4  tomli-2.3.0.tar.gz
-sha256  64be704a875d2a59753d80ee8a533c3fe183e3f06807ff7dc2232938ccb01549  tomli-2.3.0.tar.gz
+md5  10ef5dd352e7dfd2d6ed322cf0280435  tomli-2.4.0.tar.gz
+sha256  aa89c3f6c277dd275d8e243ad24f3b5e701491a860d5121f2cdd399fbb31fc9c  tomli-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index e4d4a7a62d..0a1a528339 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.3.0
+PYTHON_TOMLI_VERSION = 2.4.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/52/ed/3f73f72945444548f33eba9a87fc7a6e969915e7b1acc8260b30e1f76a2f
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/82/30/31573e9457673ab10aa432461bee537ce6cef177667deca369efb79df071
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
