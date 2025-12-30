Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610D9E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3903440821;
	Tue, 30 Dec 2025 11:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8ynrnhDXNpI; Tue, 30 Dec 2025 11:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF694082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095271;
	bh=3e53gRE36IbX0AUP3hb7seyc/KnPuTBpGRbd0YfjX8s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luU2ZyHcRZbYLSTed8ByGZ+bbUeEPq1S/gVKYKYarhIRw1LfEYl80Hc4b7GVDlhxu
	 6bAxORKOHPPVP8TyJefRnUG6+cKrlXN4PkaWFzuirLreop14l/J/h/tZ1IFbRdQj9V
	 mL3OZkjfCq2IKFtsnzq5UE++lScqRDSqbGeJdRt04B3zmSqG56DjvZGQ4VP2YHIR7O
	 u2F3P0Fcdr2CLKlHM2zVlLbmf7wCFw8Lu/ja7O8s1TsRyUS2VjSYVKNWnaFgyu7u/v
	 lMarc+pE43Dl5yUZOSl0Go58OljhU+EJwvB2d+Xt1NXitTvzdFOiTTBZ1ferVjq7UI
	 gKvW3IuaHAS8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF694082A;
	Tue, 30 Dec 2025 11:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D195035B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3BFF8136D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErDxJwy4Gxbx for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:47:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD47481368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD47481368
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD47481368
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:47:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F21FA4C2A95;
 Tue, 30 Dec 2025 12:46:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBL-000000003Vt-33Bd;
 Tue, 30 Dec 2025 11:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:30 +0100
Message-ID: <20251230114545.2236640-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095192;
 bh=w9WGuKANOBJ+WT5JypXWY7+enCmY6djoUOvADleTk9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FySG2KyOsjtG2HzpphzrL8yrM3dmj0TKYYDC8BtN/D7PonDqqfqeyTRPGHDtXC2B/
 pUwTU/RLdxmXkxYAluleihb+4TmdDCwPRpoZZE/1MZSyYvyhVwvHgAB/h8F82DVals
 WCbVVJnONk96fyzGVZULlLBJP/LXP1A1NMOqmgof5FF6F8VgSDm4eca30UEhDHcXky
 zbSrOp3jwS9uddI1x2MX5caWkwfapkjjksqM9d8UU0pzthOyhEBgv4I5kACEzn8hgq
 b63q/2eqBkxyqPUCWoLQpKfEJzJ+7l6SQT9Pu+NTATAuX6SRGASTGAhizjCb/N90W/
 ln+QK02V9xLxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FySG2KyO
Subject: [Buildroot] [PATCH v9 09/19] package/python-aioredis: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/aio-libs-abandoned/aioredis-py/blob/19be499015a8cf32580e937cbfd711fd48489eca/README.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                             |  8 ++++++++
 package/Config.in                            |  1 -
 package/python-aioredis/Config.in            |  8 --------
 package/python-aioredis/python-aioredis.hash |  5 -----
 package/python-aioredis/python-aioredis.mk   | 14 --------------
 5 files changed, 8 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-aioredis/Config.in
 delete mode 100644 package/python-aioredis/python-aioredis.hash
 delete mode 100644 package/python-aioredis/python-aioredis.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 44351cf3ca..ecd22e2194 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_PYTHON_AIOREDIS
+	bool "python-aioredis has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_REDIS
+	help
+	  python-aioredis was abandoned upstream and replaced by
+	  python-redis
+
 config BR2_PACKAGE_LIBCUEFILE
 	bool "libcuefile has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d24a17d887..0764388842 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,7 +981,6 @@ menu "External python modules"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aiomqtt/Config.in"
 	source "package/python-aioprocessing/Config.in"
-	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
 	source "package/python-aiosqlite/Config.in"
diff --git a/package/python-aioredis/Config.in b/package/python-aioredis/Config.in
deleted file mode 100644
index 46ed2c7a46..0000000000
--- a/package/python-aioredis/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_AIOREDIS
-	bool "python-aioredis"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
-	select BR2_PACKAGE_PYTHON_HIREDIS # runtime
-	help
-	  Provides simple and clear interface to Redis based on asyncio.
-
-	  https://github.com/aio-libs/aioredis
diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
deleted file mode 100644
index 29e6361014..0000000000
--- a/package/python-aioredis/python-aioredis.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5  8f3547af83ef4b863b18c19f23166a9d  aioredis-2.0.1.tar.gz
-sha256  eaa51aaf993f2d71f54b70527c440437ba65340588afeb786cd87c55c89cd98e  aioredis-2.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
deleted file mode 100644
index 798dbd0c3c..0000000000
--- a/package/python-aioredis/python-aioredis.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-aioredis
-#
-################################################################################
-
-PYTHON_AIOREDIS_VERSION = 2.0.1
-PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/cf/9eb144a0b05809ffc5d29045c4b51039000ea275bc1268d0351c9e7dfc06
-PYTHON_AIOREDIS_SETUP_TYPE = setuptools
-PYTHON_AIOREDIS_LICENSE = MIT
-PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
