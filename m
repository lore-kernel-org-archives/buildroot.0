Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2C4D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F6340AEB;
	Mon, 15 Dec 2025 19:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LS50A2-covqL; Mon, 15 Dec 2025 19:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2059F40AEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826348;
	bh=XQbIkOBYiVlqynY6EHBI68XWBONBtjsak+1y4HFJjjU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=areUPnMNsEEZ31UkHDmpa3SmfF1R1VYYHBoSYhp8+G5Y3Uatm06BIXWxqpKt+X3ee
	 tOAiSlTI6RhEwEQlcrac75inUbbmb6lwJzGIRfBo5PwdAkWpoEZ1/VeDHkXMKAEyyJ
	 Kqvz0GIiIR/iXGSd9NsZPIaghMtMXqscLpXJDEpnCN5ukME/ZahFXZzth1lstI1UXo
	 qGeu823l3V1DMLEN6z/91JOLhpUaoqwn3MO0+T2eTWZ4Ou6a0DMhDHQu6+wPXC5Qjw
	 evzpTT57/GyOLemkdkPk9LVZiq6H2j0L+2oFTqFy+2yYzgrPBUecxf20YyEmzZD8GK
	 2U89Qoc1eKNeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2059F40AEC;
	Mon, 15 Dec 2025 19:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F25255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885E840AED
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YdMZY444Wvi for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8378540AEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8378540AEB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8378540AEB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 071D9A4C4154;
 Mon, 15 Dec 2025 20:14:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1S-000000005ED-0bEC;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:13 +0100
Message-ID: <20251215191416.421755-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826071;
 bh=oiNnf0jbY0E791lsgLryuzH/0+OEfH7wFfsx2NOS2YA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZwyN8L0yzyvzw0qaaFPGCS8d1pmmfVRWTHXhKELHhfN6iwGXow6uB3cSmxnRPW+ZQ
 nb6LucUFXvJEVtiLagRtfNS+g+u/yl7HuHPQ6jNd78w83pi/NZbHN+sghYQPUHbfeu
 6BXPkCmQzVwjHBvo1eo/QCg7luboNcuZopP/VLqVBLIQn0MhgaKkzyGzCznofnvNeK
 pRH0yLE0KUj0KkCDXkMQzD9dM8OCMenkXgs3BPuHKSsEH12UzX3uvURF+kCLgApylw
 Zhyyp+62svvM51Jo/l3m8JXc/Y0ZQANCKV92QGKrsVuxucUJvje1oVsEcoYbBogsl+
 jNaWX06CCj3VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZwyN8L0y
Subject: [Buildroot] [PATCH 24/27] package/python-ruamel-yaml: bump version
 to 0.18.16
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/ruamel-yaml/code/ci/0.18.16/tree/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 4 ++--
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index bda0946e33..db511b90fa 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml/json
-md5  ee73a2076f7ca2ee7258af129a7ef8da  ruamel.yaml-0.18.15.tar.gz
-sha256  dbfca74b018c4c3fba0b9cc9ee33e53c371194a9000e694995e620490fd40700  ruamel.yaml-0.18.15.tar.gz
+md5  ebfbf2a54d9a5b768bc849f4b2c43efc  ruamel.yaml-0.18.16.tar.gz
+sha256  a6e587512f3c998b2225d68aa1f35111c29fad14aed561a26e73fab729ec5e5a  ruamel.yaml-0.18.16.tar.gz
 # Locally computed sha256 checksums
 sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index 1d3619caea..aaabee7be5 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.15
+PYTHON_RUAMEL_YAML_VERSION = 0.18.16
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/3e/db/f3950f5e5031b618aae9f423a39bf81a55c148aecd15a34527898e752cf4
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/9f/c7/ee630b29e04a672ecfc9b63227c87fd7a37eb67c1bf30fe95376437f897c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
