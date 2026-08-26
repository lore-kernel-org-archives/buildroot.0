Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C7C61DC4
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 09:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B339605E3;
	Wed, 26 Aug 2026 09:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yq6VuX6eTS9M; Wed, 26 Aug 2026 09:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787735994;
	bh=P+DOvEYsMzjgznmgRdSuKdF+FBCYXm1nXxggMMzQc0M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PE3Gybd6Nc+ncnXSvFJWRKOJoHuibid8iloZTVwwGxrHecWogJzByd4qRDtf1eXxM
	 xqmnvLFvE2dawj3KIEXLzTR+U7U96e/tjQ/oLDgfPAJS/TuU/H+A7CJL+6wGug8v49
	 zOEvt9I+Nf4N2hFx2WvwLSGNypQzgwzcMNv0W+qUtBm/mF/GauO5uhyPQv1xwOWt/k
	 qZjbr85xRPSI2MFZZKVLQe5WsBpccEbfyZ90H5MhhBJ6yeuZyIi1ediwr1XndpJDe2
	 x77MJ8VaDg+EumKWg/jx/pGyAXCm7E9OvEQh+SmU++22GAMBuDFoUy48A51XaIKpud
	 7Qf2w3reJG2Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE11260736;
	Wed, 26 Aug 2026 09:19:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1B3E3AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80C0060736
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUGsNJTCHiOZ for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 09:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.52;
 helo=mout-b-203.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=velgcCYD
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50F44605E3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:19:50 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4hVJy53wtlzLlsG;
 Wed, 26 Aug 2026 11:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1787735981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hz0lUuIL5aNDPWfiI7tm/j2k2TaT32Vq19ByFV4FGBE=;
 b=velgcCYDVZ36t1SkmkOkNCJtQ3Y0g8o0gxSNAWWPRSZPtL6ublgnwAKd1La8u4hUlvatsY
 ZhLKdYUvxlWZe3YJudJbwOn1tTK8pgp6TDXnk7oqiN/kV/H1T9/y/oKi2SySjX7g1b+Bpr
 N2sAV09f07oSTOCqg0u0OFfV/w9mTFDW+hgnBCf7y87qXHN69HEg4hNcA4JcOOctdNk2x+
 87suqxxCYxBK4KW3+7hrerxgP9RK3Acg2WDjF/6oJqTUYwPswpk1AxL8bvFgxku373KnLW
 ltcvga+gdLq2+UR2X4RXm6Ve6VhSkt3i+fycvLXBDt7dz1SEvzJOGtH3VJV6VQ==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 11:18:50 +0200
Message-ID: <20260826091851.467182-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4hVJy53wtlzLlsG
Subject: [Buildroot] [PATCH] package/python-questionary: new package
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
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-questionary/Config.in               |  7 +++++++
 package/python-questionary/python-questionary.hash |  5 +++++
 package/python-questionary/python-questionary.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-questionary/Config.in
 create mode 100644 package/python-questionary/python-questionary.hash
 create mode 100644 package/python-questionary/python-questionary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..d881d3a211 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2246,6 +2246,7 @@ F:	package/python-log-rate-limit/
 F:	package/python-pydantic/
 F:	package/python-pydantic-core/
 F:	package/python-pydantic-settings/
+F:  package/python-questionary/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
diff --git a/package/Config.in b/package/Config.in
index 6058800682..bcfeb99d15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1376,6 +1376,7 @@ menu "External python modules"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-questionary/Config.in"
 	source "package/python-qrcode/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
diff --git a/package/python-questionary/Config.in b/package/python-questionary/Config.in
new file mode 100644
index 0000000000..fbbc1895a2
--- /dev/null
+++ b/package/python-questionary/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_QUESTIONARY
+	bool "python-questionary"
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
+	help
+	  Python library for effortlessly building pretty command line interfaces.
+
+	  https://github.com/tmbo/questionary
diff --git a/package/python-questionary/python-questionary.hash b/package/python-questionary/python-questionary.hash
new file mode 100644
index 0000000000..c350e024ff
--- /dev/null
+++ b/package/python-questionary/python-questionary.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/questionary/json
+md5  0c7b9d9ba6c6b4ba94f5e705850cd0c3  questionary-2.1.1.tar.gz
+sha256  3d7e980292bb0107abaa79c68dd3eee3c561b83a0f89ae482860b181c8bd412d  questionary-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3a492ab6d436c5e75f54a9a556de91c4322c8ad408fe849c7da1f7352721c63a  LICENSE
diff --git a/package/python-questionary/python-questionary.mk b/package/python-questionary/python-questionary.mk
new file mode 100644
index 0000000000..803735d5e5
--- /dev/null
+++ b/package/python-questionary/python-questionary.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-questionary
+#
+################################################################################
+
+PYTHON_QUESTIONARY_VERSION = 2.1.1
+PYTHON_QUESTIONARY_SOURCE = questionary-$(PYTHON_QUESTIONARY_VERSION).tar.gz
+PYTHON_QUESTIONARY_SITE = https://files.pythonhosted.org/packages/f6/45/eafb0bba0f9988f6a2520f9ca2df2c82ddfa8d67c95d6625452e97b204a5
+PYTHON_QUESTIONARY_SETUP_TYPE = poetry
+PYTHON_QUESTIONARY_LICENSE = MIT
+PYTHON_QUESTIONARY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
