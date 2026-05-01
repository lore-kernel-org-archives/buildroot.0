Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E18CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE8ED40DAF;
	Fri,  1 May 2026 12:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoOC4RS3B61m; Fri,  1 May 2026 12:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1640E40DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638900;
	bh=o7UyvbisA60nUMgDhL+NxPH30mtkWbpXWzmV0zki0hI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EVCwoXl+eSw8773Z8KisJaj+CqoDa1ooN/xlvY8VTqInEiLn7hckfVBO+qn2HTNpj
	 eju4wPLaUirF//16uMpJj4C8na4JR/g+Qcb1vslkAwhhnhkIv+P2NVmevi0B5gTPFX
	 dQmaThriz5fGmf9VmChaDFV536QHGdhbJ0Np91qD44LohHYPGp61zTcNwdPOkfNiqN
	 PvbZjXCpKk9mI07YqSjveH/ThDf1qocAHZbV6hPQFG99q3oez2sUvguEpFl11kgEof
	 79hx2T6KXRFJUma+s8pbP4y0Spnjj2eD1E9/144TKDVLqpyUp1zM/x16LB6F76qqvg
	 eyIK0nPgdNwbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1640E40DBA;
	Fri,  1 May 2026 12:35:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0848B127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEEAB40D8F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVD_7zPlG7Pz for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:34:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DABA940D05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABA940D05
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DABA940D05
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72EE7A4C2EAB;
 Fri,  1 May 2026 14:31:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-12Cx;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:03 +0200
Message-ID: <20260501123100.1918951-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638664;
 bh=G76e480EnW8/6HhUF5cbJsDHa7rppCggqZwmlwJyAI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bjRg89HUHoxNP18RabgdMw6FGwoxvQpBLzEi5JRSK5goAYOWJVyxxKpRGaQul43l8
 pSytM9AQTEfjs+xV/5ot9Pr0KIJTTj2I8+9G2WZcPF6hH9sf397+Ul1k0fQo1DGOvl
 Jfv6gsT+81aGFwIMU4dV7fHRmvOr2H7pmC0mreTPhvs6ldi8Y2AemnU3IDUqBDTf5k
 s9COaGwsRLKnoAKkUfvHGF1wr9ychch9bQBYNukZaKQdik/tkvy4IFG2DC/OnHlrUo
 AU5zQ24lluohSGze4iz597AbSQfvePO6Swwd1joCQ5M1xXc5eLsQhbdT+1kqMIXyWP
 +rWZD7+U1ed8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bjRg89HU
Subject: [Buildroot] [PATCH 18/75] package/python-flask-smorest: bump
 version to 0.47.0
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

https://github.com/marshmallow-code/flask-smorest/blob/0.47.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index f59d0a18eb..b48f4f7287 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  048a22ef87f5a98d3aa9287259023cb5  flask_smorest-0.46.2.tar.gz
-sha256  7d9099a37a5add415670d6904ae032eefc1d2ba2432f060d7c048c74fc655a80  flask_smorest-0.46.2.tar.gz
+md5  f3236d4faefd989d2bcfe7820fa0d6b4  flask_smorest-0.47.0.tar.gz
+sha256  a415ce7db3d7e63dd854eb16d59047686dbf5d31c4913e245fa5657f88e7788d  flask_smorest-0.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c8a48548bbb732a0bbd6a0dc2c556cfa1e6e5fe35d888cdf6a1974d69e0e312a  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 8298003968..34b3f81b38 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.46.2
+PYTHON_FLASK_SMOREST_VERSION = 0.47.0
 PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/20/09/70074c15a9644a1def601b4fc78c114d4b2f4275310bc3476d1411da3003
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/99/b0/5edd5f3231ea26b52e786588c45d786df26929d2be8fec634bcb871b2a3f
 PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
