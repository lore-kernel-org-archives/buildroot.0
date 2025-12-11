Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44059D43345
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1990941172;
	Thu, 11 Dec 2025 19:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alU7o9vM9CaY; Thu, 11 Dec 2025 19:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E91E41173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483179;
	bh=1dMMxbzQvi20pkAinAApfy4GDL4dAbBFrfrrEZTyF00=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WW7vVoMqSswadoaghCwFkiGj4sfMo2KrEJrkPoD7ifRwz5n9HtUKNaJ6oYTdYXNS5
	 /GcoZtMr+H+2mr/WzBYuWOCrBPMtxVN4ZS/sTVF8WKokVUglMshDfxXyWplWURVyYf
	 /+r0UaN8SIpOsOchxeO+DpbJjWD3USMWF0rSwuRE8VZMh77DK+a1/4/yQT/Dx9o4ui
	 kno5H4eEZdNV9MpA6lcYx1Y6U3eCnNiqDPFafDlN2+jPesmRMtt6N8wlscYBgqftBj
	 vqAhvLmW0J5Xf3KjfxVwoU2P6Z1EMcr7j0ClDAWAeBYhEccNTeFSkhKxYdfY8WRhKW
	 rBPmcNo8aKAPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E91E41173;
	Thu, 11 Dec 2025 19:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FF72C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D0C40028
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9189pzC5ovWd for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39CD040012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39CD040012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39CD040012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A06AA4C3953;
 Thu, 11 Dec 2025 20:55:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-2fq0;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:27 +0100
Message-ID: <20251211195527.3276900-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482939;
 bh=q54v/yez2q1gdo0dlo0TS5ysk8622/9MGM3ZOcnxCyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IauWqjFQtJsAgA7qTsF2NblK9xm/JLqGA7+EMjpkgRIxfIyC9MnKyC2ievQbESWwu
 7w5SehoIZFqKA2QijRuGA9zaAXzzskq2TVm9DkUv8Us/iw6oyLh5walBC4WpyQEN22
 rC+nxjEqB1ASj2ctOYX+pDb0xa7UNn3IgE+MG5vgBy/48bn40tqJGE1t3HD0Wt8AXs
 BJNybkWmFyKl9XxNVqB2ltmkZeJdlW943B801OzTNB7N6ng3gtvn9wBr2HeRI8od9O
 tvWXwhBp9vGZtzzCzQiTr8aeSzaGHIQVL+v0QMIerFusUzhNnulOnZg+LXo70Tg56W
 wGAnIrxzkkkYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IauWqjFQ
Subject: [Buildroot] [PATCH/next 21/21] package/python-iniconfig: bump
 version to 2.3.0
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
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pytest-dev/iniconfig/blob/v2.3.0/CHANGELOG
"* migrate from hatchling to setuptools 77 with setuptools_scm"

Updated project URL according to https://pypi.org/project/iniconfig/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iniconfig/Config.in             | 2 +-
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iniconfig/Config.in b/package/python-iniconfig/Config.in
index a288da8a64..6dd11aba3b 100644
--- a/package/python-iniconfig/Config.in
+++ b/package/python-iniconfig/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INICONFIG
 	help
 	  iniconfig: brain-dead simple config-ini parsing.
 
-	  http://github.com/RonnyPfannschmidt/iniconfig
+	  https://github.com/pytest-dev/iniconfig
diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 7e5884bb7c..576a93455b 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  437ede5b20b0ab2e76ca08f02b5c49dd  iniconfig-2.1.0.tar.gz
-sha256  3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7  iniconfig-2.1.0.tar.gz
+md5  5c1d9c21275feb3da71400bf716edd72  iniconfig-2.3.0.tar.gz
+sha256  c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730  iniconfig-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3409fa91f7ace557894632676656e32264fe5ef7581535725dc9a23774551bd4  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 3276032fd3..68392aaa10 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.1.0
+PYTHON_INICONFIG_VERSION = 2.3.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3
-PYTHON_INICONFIG_SETUP_TYPE = hatch
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10
+PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
 PYTHON_INICONFIG_DEPENDENCIES = host-python-hatch-vcs
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
