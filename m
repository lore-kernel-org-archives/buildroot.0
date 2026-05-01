Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D646CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1015C426E5;
	Fri,  1 May 2026 12:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7AyXfUB_7fq; Fri,  1 May 2026 12:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704904273D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639480;
	bh=ycjhrisJ5ZaIPIofUC4kvSv5cpvP/iyeJFVccDkSqgY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CkM/t/YekGdWPnt7wnMXfZj2Thp8efzXT6MjovjcrJQSXKXTmH1qbytfOUFOP49N6
	 YkriMZBXSJlMzs1bZQsMluCNQIi42PG8KQ302G2dGwn55FyrtXDPWBAXYBXQwPyKZd
	 oTKE/AR/qh6dpbT17PipAZ6HC7Hg8RTi+B37sDd3iclW1PvwZEqJ5lg13dzTmHPuBt
	 PPLEmNrwH030w18cQU/dVUBlLSjol5M2tbERJHtutTcz+iy3Ui17BeJ9QJCXJ5bAp+
	 3HnE1JgkNERWy/CPCaZEx/iBwG7Ct65Pk8bp5DJC6s1usGSboh5jDSd+P+VRW7zQin
	 pTTj0UcKb46Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704904273D;
	Fri,  1 May 2026 12:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE713293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9420C6F797
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AUTYYcePScV for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A5A2616FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5A2616FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A5A2616FF
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D5EDA4C3073;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-3TwG;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:55 +0200
Message-ID: <20260501123100.1918951-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=r7G/vh8iBRnJASwONEDeaN229S5Jn9CZfk0k2jndRa0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vRNrobv9vDcqx3NI7MgMdNojugF9PTBhHeecuOxn2ePlis7h5KV0NiQq1F/pztT2L
 LC/bqmA/vbq4BaF19oAY1ymSfJJ6UtWg5DgebfCUd4K59J+wb0fEsc7q8MRFQO9xb5
 pFXakUsD4O2CldxKanKXXmg+RlVHoxSziBKa3gvEyOAUBtQ5dKWuwwWh3Nk3o+Nq+9
 JE/4WJAJlgTjwZEdTjswM4nQxOJLwzoDXX4yYaPydt0fjC27R9FU2pLnZ7UnZnpV1W
 YMRAhPSb5Zc3Ai57cI6xLszK4Vukk86dOxikB5AkymynlnCwIZYJo1w5SVnL8t8mEk
 V8RPm3b+HFUTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vRNrobv9
Subject: [Buildroot] [PATCH 70/75] package/python-werkzeug: bump version to
 3.1.8
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

https://github.com/pallets/werkzeug/blob/3.1.8/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index e7900fa734..4cbeb14e23 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  4ce9c948613b9b823226c98e28b9004b  werkzeug-3.1.6.tar.gz
-sha256  210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25  werkzeug-3.1.6.tar.gz
+md5  5b3063a0bfc95d46cb35258b03b9f30e  werkzeug-3.1.8.tar.gz
+sha256  9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44  werkzeug-3.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index c3b8a2c099..745e93f443 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.6
+PYTHON_WERKZEUG_VERSION = 3.1.8
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/61/f1/ee81806690a87dab5f5653c1f146c92bc066d7f4cebc603ef88eb9e13957
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/dd/b2/381be8cfdee792dd117872481b6e378f85c957dd7c5bca38897b08f765fd
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
