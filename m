Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8419CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC6944241B;
	Fri,  1 May 2026 12:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb9rd3eeaw9t; Fri,  1 May 2026 12:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B57423E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639009;
	bh=QK4MkCzO1QLV74fSuSE1c/tQ6WIJQsPVLfNiIfAuUkE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B9HMNxmrTuCuBjw+CdTEvCEY+8f1rABga1WVxtqVwi8wQS1oSP1C1XhLXTBwyymKG
	 l4lXmE59Ch+pmb5P8zC3Y1udVOdboqow40DbYBxH9xb2UhlFA5cpn6c4Pgxyh4XG2Q
	 e+CLf9WXI6f6fgB+VExjWGnUk0ZSTNZfbEg93nBCvyH901hw+/e35cCOT3gf6+gOAx
	 0ZkOgbhfXLdvLIaZPK3Z7tQ5pSEMZoTwQ9fBo4t/uLgZ8G2R2gDfqLWsO2DextZfsf
	 MwtXqYq5D7R3BvTw8E71+yLOlLCG57Ex3aZZ3Mr5+28eYkfCBYh0mqMtnRmtKSEE1T
	 6XYeMIOmiAcHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5B57423E7;
	Fri,  1 May 2026 12:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B461127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BFBE6F753
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEACKguYaKjn for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5165C61750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5165C61750
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5165C61750
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DBB4A4C2ECF;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-0sgd;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:14 +0200
Message-ID: <20260501123100.1918951-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=aDggUcBtqEFWp/57hj5N/FO/5Fr9gyfJwWxiaOv/XnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Bb8/72vozARIpHRBPntAA4CtauDl4k8UaCSr9cVj47apgZS5grvHB8pmKm1J53zhm
 FPV5PDs/n6fun9FPQ5OhZEx/cYgsrb9YCMr2frROfCo20AbMTHJ6Y7GX7cTiTxMcM3
 6FQW5zzg/ImxfWCoREp9/lw86c4c1rgCDb1yNM7NPIer+dyquAx3b3xyfpJNq339Gw
 0aeKfFoLmggffUd1DV6HpXyNnWr0lOKqu3J8FYMTGsjIY+ISo+ccHux+xPpgyBd6/Z
 5Out4OovaPIH3A5PNWF+umTGU6I0k+gcvL2QJFrivgW3xKYEt8g3pIH8k9RKdwxmXG
 tdfAMwp79/iDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Bb8/72vo
Subject: [Buildroot] [PATCH 29/75] package/python-marshmallow: bump version
 to 4.3.0
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

https://github.com/marshmallow-code/marshmallow/blob/4.3.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 56bc15bfa2..6be06f20f4 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  d3f861e4957521a6a15eb906194deb70  marshmallow-4.2.2.tar.gz
-sha256  ba40340683a2d1c15103647994ff2f6bc2c8c80da01904cbe5d96ee4baa78d9f  marshmallow-4.2.2.tar.gz
+md5  95589d6f1082aae57ef81cc5ce15fc2c  marshmallow-4.3.0.tar.gz
+sha256  fb43c53b3fe240b8f6af37223d6ef1636f927ad9bea8ab323afad95dff090880  marshmallow-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 5e86821d0a..964ff66732 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.2.2
+PYTHON_MARSHMALLOW_VERSION = 4.3.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/f9/03/261af5efb3d3ce0e2db3fd1e11dc5a96b74a4fb76e488da1c845a8f12345
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/25/7e/1dbd4096eb7c148cd2841841916f78820bb85a4d80a0c25c02d30815a7fb
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
