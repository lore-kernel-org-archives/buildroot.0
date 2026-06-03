Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DB2CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 12:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C10581468;
	Wed,  3 Jun 2026 12:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bS-D2MK3CJmF; Wed,  3 Jun 2026 12:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7139484277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780489009;
	bh=upQ2oVUrTijcgnfZrcIGV4p2AK9P5fTXk0+CGjvmX2o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RBMIMWJoa2G/ififwBpQT9KuaGx5IJ/IhM2K307Bew7qqUIemQ3vMRwyTEI7k2pIw
	 86m931M9mZYGcLWzsK4z0jUcTKZWc7lZ5JkNz2I+XlzZQoP0qNkIBsQ23KJ2noF6Ii
	 4tgwPvNLha44JhtSjR1YgkxIByNIxwjIa5UHNzNdmGnKRLtsKl9zRvwUsoqjTU5x3n
	 YQGDwSFUzhmrBpTUN+loUaOBf8i5bn3UaNXjWSdbVVxxavFpMHw5Zl/CVNI21P9zBc
	 dATbRcRuHTaKz7/HgDqNEpqUH8SY+cbrHPxRKmyMPGXcQioAdfphskLpNtRt5GWKVa
	 ESeNEa8CmiYQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7139484277;
	Wed,  3 Jun 2026 12:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47C92353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 12:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 371BE42330
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 12:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEfy0Sz8_ra7 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 12:16:45 +0000 (UTC)
X-Greylist: delayed 566 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Jun 2026 12:16:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 607B1407B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 607B1407B9
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::110; helo=mout-b-110.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 607B1407B9
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 12:16:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4gVmf94yzRzB0tF;
 Wed,  3 Jun 2026 14:07:13 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 14:06:56 +0200
Message-ID: <20260603120656.738212-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1780488433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qcQmwv9VdC2jZONbgOKQ7d+K/7ULqzCtATjDzN6sFrE=;
 b=iDhHNhmssx/eZY6p0I4wNyM03t3pZ80TRdPCjLTQS1RT5EbVyP6lBo//B+8FFt4y4zX1wk
 GjrEnARUkxxna7vn7TQWZVGuU4YPHr6iWd5a0KK8ixoOBzVCCM6wsAkepLU3STTM/d+A0h
 zHgynldCKP8WQAb3Z6inw1RDWZDweYTbCA/o2ackWVIFr5DebIMmJTerMTRt8hO2OVQNUK
 SNmPWCuhD4lj3EJljYqgbs0mGSLQpeLZGEFNqSreFnnBkGsu+uyBot+s1I2+pPwiuQTGpX
 A4sN4CbQsvVoLqsAO0NwGk2Fp/JB3tb+PlsSQqMVO9qHQhlyR8H8MwsVtyJurQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=iDhHNhms
Subject: [Buildroot] [PATCH] package/python-sdbus-modemmanager: bump to
 version 1.0.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://github.com/zhanglongqi/python-sdbus-modemmanager/blob/master/changelog.md#105

Patchfile removed as it is fixed upstream.
---
 ...l-fix-sdbus-modemmanager-intall-path.patch | 50 -------------------
 .../python-sdbus-modemmanager.hash            |  4 +-
 .../python-sdbus-modemmanager.mk              |  4 +-
 3 files changed, 4 insertions(+), 54 deletions(-)
 delete mode 100644 package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch

diff --git a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
deleted file mode 100644
index 40638c652e..0000000000
--- a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7a99efa663bf9602099f0658aecbec6b5dce778a Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 9 May 2026 00:29:59 +0200
-Subject: [PATCH] pyproject.toml: fix sdbus-modemmanager intall path
-
-Since the switch to poetry in 1.0.3 [1] python-sdbus-modemmanager
-install step miss-behave (as reported by [2]).
-
-The sdbus-modemmanager python module is intalled in a second
-"modemmanager" subdirectory:
-
-  /lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/
-
-This break existing python script using:
-
-  from sdbus_block.modemmanager import MMBearer
-
-Fix tool.poetry install step by removing one "modemmanager".
-
-[1] 0d8ae7217841ab1bc12282076f766f94415573f5
-[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359
-
-Upstream: https://github.com/zhanglongqi/python-sdbus-modemmanager/pull/25
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 5e57df6..bf97a5d 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -27,8 +27,8 @@ classifiers = [
- 
- [tool.poetry]
- packages = [
--    { include = "modemmanager", from="sdbus_async", to="sdbus_async/modemmanager" },
--    { include = "modemmanager", from="sdbus_block", to="sdbus_block/modemmanager" },
-+    { include = "modemmanager", from="sdbus_async", to="sdbus_async" },
-+    { include = "modemmanager", from="sdbus_block", to="sdbus_block" },
- ]
- 
- [build-system]
--- 
-2.54.0
-
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
index 3833864bd8..c93b881843 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
-md5  d75c065dd08ce96e37db0858af0dd44f  sdbus_modemmanager-1.0.3.tar.gz
-sha256  8fd5509de6ce363019667a14267ebce99f2b67849d1d7ee72d0228611ac1ba0a  sdbus_modemmanager-1.0.3.tar.gz
+md5  e68913d43059959d564744bb31e09f5c  sdbus_modemmanager-1.0.5.tar.gz
+sha256  d8b2ac81b3c43fc4e13a2aabdf0e8312ebd61c8488fe3686d0f4338605b88e25  sdbus_modemmanager-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
index 62d128b264..5d0e9b20fb 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.3
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.5
 PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/38/2c/d66aa7f981df1d654bf70942964a4ca24cf930815fe7d656e1979c44a33a
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/4e/fe/9ddd6c51aac270339b47708732112491c0dc690094bd8210253ce934285b
 PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = poetry
 PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
