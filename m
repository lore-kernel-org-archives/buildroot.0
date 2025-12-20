Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84A2E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF2580972;
	Sat, 20 Dec 2025 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbPhyo9Gm3LM; Sat, 20 Dec 2025 21:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF144818CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267001;
	bh=/n7qy9ILHfNfnmKp2E9RrBeaNRKThu22YgNQrNDb3PY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hHwXGq3QeEOPGx+hrrRUiWHpN1VilaiL9A+1Hr4GOQ5vIyZqe9Ql6nW5X6cyeUQBq
	 5KviivY7NHdtt/7cmWKwEqsfRpqi8k0rWK4KDfbpKkEXcj92mYQxIvmx9wJyZa1+v7
	 oLbwRl1V9G/i4p8gNU+9bq147BeNZGpi+jH7eUiwclAe4BOdaCu153NUaFBdbPyF/0
	 dft0faARh9zE8Rps3x8PRogGmuDaTZ4y3rGHCWXgCOzYQgaLZ1zQWzIK5yopVdZ0E3
	 3AH8QL1YCTymTgjHB2x8bMbHhAhb5qsu8lPLvMCgZBRX2Get20no+U9OP8K2o8Vm1x
	 AiePGvDkrxC7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF144818CA;
	Sat, 20 Dec 2025 21:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E5B119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EAFC40923
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrBbfqJgXrGT for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BC014091E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC014091E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BC014091E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12587A4C4D0C;
 Sat, 20 Dec 2025 22:42:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iE-000000002DO-41lV;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:51 +0100
Message-ID: <20251220214206.1089100-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266927;
 bh=G+stnk1y1kC/yvwoYFxckO/nqwptG6PuM0S4JuvWjEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LVOSYhGEohtS7TP2uT54aixLAK+kYlzAORE6sDpD3IXLbHgKbq8cIeKbRAPqeeRhJ
 Fltwbe+hsNF0Mi2yz3pBmZL5X5SYlQTt20MeZwsqMHgE6VzF8eH3b+Gyl8SN8pLkxn
 6NEvBnxo8w/Fcz+6C2Vhv8wwfboiRNWPc8Lb9HA/IrI3Rum0LNXlEt+AVPwu997pwD
 0fZgxCF4gJEDDFazgPq+OB0mLEw0MKMMADRMB+7xJjw6U554XB+O1HZa/Am87/xPAN
 paP3R0+B/kwBUJZy5qTGf6BBfydbo1i8h49It1gWER6E7APHEExJ00RU1AwbMPL/BI
 eCa6wvh2g/5fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LVOSYhGE
Subject: [Buildroot] [PATCH 03/18] package/python-crontab: bump version to
 3.3.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/doctormo/python-crontab/-/tags/v3.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 141d075851..5533d82a7a 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  7ff9f13749104faa73f353a0d4ae9087  python_crontab-3.2.0.tar.gz
-sha256  40067d1dd39ade3460b2ad8557c7651514cd3851deffff61c5c60e1227c5c36b  python_crontab-3.2.0.tar.gz
+md5  9edf7e8e5d9fbea6aa8a9c045bee93b6  python_crontab-3.3.0.tar.gz
+sha256  007c8aee68dddf3e04ec4dce0fac124b93bd68be7470fc95d2a9617a15de291b  python_crontab-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 7946f56829..248ffca405 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.2.0
+PYTHON_CRONTAB_VERSION = 3.3.0
 PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/e2/f0/25775565c133d4e29eeb607bf9ddba0075f3af36041a1844dd207881047f
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/99/7f/c54fb7e70b59844526aa4ae321e927a167678660ab51dda979955eafb89a
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
