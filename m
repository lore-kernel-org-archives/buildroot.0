Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DAECCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A664F613B3;
	Mon, 13 Oct 2025 17:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCVIjbDcLRRO; Mon, 13 Oct 2025 17:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1CA761456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1CA761456;
	Mon, 13 Oct 2025 17:59:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A05BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D59996145B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8YYakwtQ_fg for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3D1661456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D1661456
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3D1661456
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0184A4C6A0E;
 Mon, 13 Oct 2025 19:55:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlQ-000000005Im-3zLw;
 Mon, 13 Oct 2025 17:55:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:55:01 +0200
Message-ID: <20251013175513.86276-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378117;
 bh=zvYSSLoTs8OUhHx6o6a/bERDEuLqcrcaxH7ZEt5dJNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PUzl8BdfCulVKdBAo0u7uovwKVtldeePc5WhTQuxTwqYnlhLnkJtI5KDOex/NNuO1
 m3iKGReHem86rjA4Kjd578HdO0LEtfT2HL0HykugDS3zUfgoNPfacViAi9g+lMuAeP
 gwNgAoAsNW0B3DPoSBlEcFIsnDF4W2xpZYVepLiv9kbH6wF7hnWVbEtT3s29+SHsr5
 SFQHYkPeoNxEtvkPjvafTWQ8g2s4Ws07RdtCJfp36rYxq9i9mJnPfXda2dq6xMzGnd
 YvDmjcFAvKtiPTXtvY+/IGS895BZn6vqIOBYfm7q6dM4ngD2MxJREEA21ZxPye5HgR
 88V3SVXSxNLng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=PUzl8Bdf
Subject: [Buildroot] [PATCH 24/36] package/python-ruamel-yaml-clib: bump
 version to 0.2.14
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://sourceforge.net/p/ruamel-yaml-clib/code/ci/258748687a9ce0798d24c329ad2f7bcd3519990c/#diff-3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash  | 8 ++++----
 .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk    | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
index 2bb726819c..fdafa0b28c 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/ruamel.yaml.clib/json
-md5  53fa5737bbe5a07fac7db3d1a083fee9  ruamel.yaml.clib-0.2.12.tar.gz
-sha256  6c8fbb13ec503f99a91901ab46e0b07ae7941cd527393187039aec586fdfd36f  ruamel.yaml.clib-0.2.12.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ruamel-yaml-clib/json
+md5  70ca03596450ed0ad19393620c51a4c2  ruamel.yaml.clib-0.2.14.tar.gz
+sha256  803f5044b13602d58ea378576dd75aa759f52116a0232608e8fdada4da33752e  ruamel.yaml.clib-0.2.14.tar.gz
 # Locally computed sha256 checksums
-sha256  99f72489621ceea1254f9f0ea7c6e8a5e8e38b62edd1d983e6e1cb20d533f0a6  LICENSE
+sha256  f8ad7efe71dde909f2d694f7dc69470d3dbe07c001c0b30c6bd9951e472077fa  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index 2a4d8a98d1..b44bbf5187 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.12
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.14
 PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/20/84/80203abff8ea4993a87d823a5f632e4d92831ef75d404c9fc78d0176d2b5
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/d8/e9/39ec4d4b3f91188fad1842748f67d4e749c77c37e353c4e545052ee8e893
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
