Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DBE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2313F812BE;
	Sun, 21 Dec 2025 22:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR-S0lrRxqIf; Sun, 21 Dec 2025 22:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C9681465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356784;
	bh=3lWPEfWIZN29p0i7reqpePUR+n6GkIpRuQy0pxKSRgY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MVi5PRLnHageY5u1ueBlUUQBHlAn7T9NjFTveoWXb81BDk9P7oSJKO2wGLcx1U58x
	 qigvH9L2Os56Vt4qD5CIOLcCCCokr3LM1cl2mbpRJsZ/cmlEMQ8Qo/t53xNKiF0iL7
	 FHwu7JnnQNjK5sMvJ+UeTPToMl9jOmf4AIII80dzh9yWHX/poHcViqVPuPvec5FY1p
	 hn5aYW0ksnzvvLHI2NC02Ab4wr8D26T386/z7m2518pYKIPYeOeJRLODJpSfOTd5Er
	 NXFPutWX6pkHFXMpr1tcfPalUO+thnwSLVWnP3Q7+thb0nggWwUmcK9weGImRlIEW6
	 JS/NSCNmZgRNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C9681465;
	Sun, 21 Dec 2025 22:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E821195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85AAC407B9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3yUl6qkch3B for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F2AA407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2AA407A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F2AA407A9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:39:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F09B3A4C4E7E;
 Sun, 21 Dec 2025 23:35:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-3juf;
 Sun, 21 Dec 2025 22:34:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:41 +0100
Message-ID: <20251221223441.185169-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356506;
 bh=0ip5liuWKEd5NFQxL1MJqdqEL/xW0/sp5zeKFl6t/FE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GimUlXaBpK0m3macMui7eAr1rX9qdoRdlBpOIcbjyPnQPffE5pW4nDlwDUeGL9obD
 4mm/TgO90+p6WnHAk3myI305eIeo/BVe+nqt88pxjUUjXwjNymmVNM44zTtatMZri7
 zbuTfJRi2JbZwRUc20r/TSiTH9OQyXTTQ4nwv2X/xyUxARvcEmKVNa64RkvDn2dUOf
 3yMlaUwbq1Tyf7fKasdtqp36U9LdL4LktRTLkjAxnnjY1LyXn79/V5yjWsP/DCudrd
 UPjMJuxhvEbB4wcAqlVT0wuiF2vRABSPQDDtYYcBVTNvYfls7f7FiePltlckpfyRoT
 kqS+UOsVc7Tfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GimUlXaB
Subject: [Buildroot] [PATCH v2 23/23] package/python-pysnmp-mibs: update
 tarball URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash | 4 ++--
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 52a507f4b3..4744963185 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
+# md5, sha256 from https://pypi.org/pypi/pysnmp-mibs/json
 md5  01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
-# Locally computed
 sha256  00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
+# Locally computed sha256 checksums
 sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index 9772b78c91..eb9119a352 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
-PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
+PYTHON_PYSNMP_MIBS_SITE = https://files.pythonhosted.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
