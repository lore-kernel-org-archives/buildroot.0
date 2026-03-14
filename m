Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BDA10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1440641302;
	Sat, 14 Mar 2026 14:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IY-bH7KanYOL; Sat, 14 Mar 2026 14:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A84E412E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497596;
	bh=Y63Kwf6vuNk72N26NDa9pVsz3p6aIWtwEBC6+xgXou4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l4mq+c15evwH2a1HmG2b6T7tQsMnUjvFIGp+mBZHz2CI9Y6e/L8JzSZKaHBs1rAtL
	 bq35o8IHRlv5PUOG3dcVFsd9Cf1fEEiBWvNQK4UXdoqZqIuwnt02kNbxWws0bOCs5A
	 1AXUNX46z2Yg+As14aAakKfSHB33+p8HdtpckR2Q5IKfr9QnH3wFkpdLczMhrlCeUl
	 iCz42cPI8pGSJYJeJB+UM3GUoh0hNw5Q/aPBX5nnp3B5264xbWI4XrkUWGj7JG4lwc
	 DbDft08YENJu/iVkZu7uyae64JnsEsH7yUhL4/aYzaiQLUWuKsh7gDo5ihgYG9V199
	 hCACJK3lCFQhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A84E412E4;
	Sat, 14 Mar 2026 14:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE57B201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC2FB60704
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBHfDXWYfGw8 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA8CD606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8CD606F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA8CD606F4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8648A4C1466;
 Sat, 14 Mar 2026 15:06:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-2Jjt;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:20 +0100
Message-ID: <20260314140633.2967249-84-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497212;
 bh=RsyT8AJvAZ9UiRf3AOf9mQx9gSOgnhcLPtd7tc1qf5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k5XpJbh2UT7P5OUtyZqyvaCauvcYCSx77MLqP46TG5S4bW21WTvuDB09UdenrHkr2
 pNFFf9LvCdLtOdF9SVuEl8LIzRBokoDza3HEiMcco+fpEsW3wkke6x4FrRAJR4P+hK
 pCZs5nvLyhK52M+yTNbkUZ0wgZwRbWH+CWFP4V5QLiFHj3vsIzhfSvZ50q/kPzPXXV
 A5G7d/ri72/yCr/API5F3tborLzCGPpMY4rIB1e374Fc86ncWiQs1xEfBw7weipcHl
 /LXIAOUZUobMmIntx2vp+IaQ/nXltA6L1/N5OupsSstan5bj/PoVBIHYEHgakJPBuz
 AGzPimT2lXm3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=k5XpJbh2
Subject: [Buildroot] [PATCH 84/96] package/python-ujson: bump version to
 5.12.0
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

https://github.com/ultrajson/ultrajson/releases/tag/5.12.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index b4b0a4906e..58fa1b611f 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  dfe38201fc1cdbb6f9e0bdf135173a6a  ujson-5.11.0.tar.gz
-sha256  e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0  ujson-5.11.0.tar.gz
+md5  a1104b826ed8414130553e4482bd714d  ujson-5.12.0.tar.gz
+sha256  14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4  ujson-5.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 88e6c736b9..3893a205c8 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.11.0
+PYTHON_UJSON_VERSION = 5.12.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/d9/3f17e3c5773fb4941c68d9a37a47b1a79c9649d6c56aefbed87cc409d18a
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/cb/3e/c35530c5ffc25b71c59ae0cd7b8f99df37313daa162ce1e2f7925f7c2877
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
