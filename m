Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A123CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3DA6F682;
	Fri,  1 May 2026 12:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GP9ywpffY8EC; Fri,  1 May 2026 12:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD627610C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639516;
	bh=VEpUnv09iQ7Fa3dZfAV5U6yisFpEjucC5sFQQmyLTuI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EOSX67izB5rb+ycmpeGHeBptp7erOZWxUTH6SUJ7R2V/RInhphqQaA3et8EfIBvCa
	 zYvPjLV7YpUF3hqmZZVdfnBJn8V0oLPJoFjkawLFP3rTCiZYE1Bzr3wNr+hCjkHWpE
	 aHV/+AWnhy39TJhqVrmILuLNmNFoWYBBgYxmT0MDClJDZeWXbznRSvPK2i4BDiRFFQ
	 jmntMSlF1AG7A2HoTrWRqDynmw5BJz/Zanw/JhxeiC0/U5G+BeNfbQiDOEAQWd3ZBU
	 MVBAABbATSEbR7sU299C9zfuU5OCrMi13W8G1kdUZQWZM3Y1PhLUKf4d2eondV0fS7
	 pNZuNvP48Apxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD627610C4;
	Fri,  1 May 2026 12:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27404293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E9784054
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHBPvmskMK0M for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F41884039
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F41884039
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F41884039
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C534A4C3081;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-49oD;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:57 +0200
Message-ID: <20260501123100.1918951-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=LgDHKQwox8oJGSW14dP+FfsANaRo0NocUvtq5Oa4vbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gwCfOZLWn1ujoVrnFrckkjJUm+qBgrDSZbV/aoDjfdJ+VTUw/jZPEUb5Puhz5rBzd
 gz8m1Ug1TSowTucH2f05maM0lvm4LhXk5QSVd+aAo17Zj58qcjiIpA05LldQa1Nm8k
 +8ajUkUIVgy/gPE3AJBSd27h84wjnxhZ61GnTUwCJ2x3g4DRX9mvOpnzCzORT5VTDL
 dwJaW8RFq30ajmZhoTte3PHAesCYvoaJmGkaAn8yaN2ITiVAFak+8KhkPB5MB5EG00
 MVGhomxgCwMClaZ8t3malOcl6YVEgHFmmxZ1Kg5TnlOWt9GTgg3iuQ1+mz49DoY/VK
 B/NoYss0WqWOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gwCfOZLW
Subject: [Buildroot] [PATCH 72/75] package/python-xmodem: bump version to
 0.5.0
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

https://pypi.org/project/xmodem/0.5.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-xmodem/python-xmodem.hash | 4 ++--
 package/python-xmodem/python-xmodem.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmodem/python-xmodem.hash b/package/python-xmodem/python-xmodem.hash
index 65a9b6afda..585ae4e585 100644
--- a/package/python-xmodem/python-xmodem.hash
+++ b/package/python-xmodem/python-xmodem.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmodem/json
-md5  0a21c269cb4d3995d13a2615c24fed0a  xmodem-0.4.7.tar.gz
-sha256  2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35  xmodem-0.4.7.tar.gz
+md5  859d3ef50394555f8157092341b34b25  xmodem-0.5.0.tar.gz
+sha256  a1a818f31c29412f1cab0cd69deccd7be77bc1feb516723af990d00161f6fb6a  xmodem-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e317b0ce19724327a41e09def456579b80a7b82f9bceb2ba6933eba406f78d88  LICENSE
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index 1ef5f53bec..b9e48d2c39 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMODEM_VERSION = 0.4.7
+PYTHON_XMODEM_VERSION = 0.5.0
 PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
-PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/3d/17/fd6668a09afdc46c22990172b6f65e07dfb5bcf38960d063a7a887ca926d
+PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/c7/03/a18c2b571266787aebb7cadc5d4c90af15ae7e949ae0ee99ed23b5ba4f3c
 PYTHON_XMODEM_SETUP_TYPE = setuptools
 PYTHON_XMODEM_LICENSE = MIT
 PYTHON_XMODEM_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
