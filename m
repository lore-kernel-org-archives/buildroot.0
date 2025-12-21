Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA36E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D518C8227E;
	Sun, 21 Dec 2025 22:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNNomput_SHA; Sun, 21 Dec 2025 22:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0283C82275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356740;
	bh=3Kn6UfrvLKdA9jF5bZgH33TfCG85CEsrdQ1prlitIQc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WiWwVRwLHC+mkVQz6d0LSS9EVm9hWVTZvJnGBM26Cbb4g99LbTuawS0TK5rEbqPdN
	 Uy6wcXtYxiXzoJU/gkq747k1gNglmAclH5ngjkXcYYDcju56DQ/UjJK8Eyf9311IGp
	 tMBB1Dc/wHT3Lkz5Rj9b+lBhv8wRECSUgIUvSKAXWfJBspWFoFEGhiQ4XBt8SDRXoH
	 FK5Ip4IsjxiaPOPMvo0MKStSy9o09VtwxtNCC4E95WDIo+bykG4pGQWOmw90uFGyan
	 H9NF61lwz6bp9F8Sy4xnRW5ojHe4m9XLBqn3OG/LfjPq24vrbZMkPljAICmc7Fpfz8
	 dqPFkazl9NSpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0283C82275;
	Sun, 21 Dec 2025 22:39:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F40AD119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3CFE60810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5PHqZ2__QY9 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5DA8607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5DA8607F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5DA8607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD8B0A4C4E68;
 Sun, 21 Dec 2025 23:35:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-3Pfj;
 Sun, 21 Dec 2025 22:34:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:40 +0100
Message-ID: <20251221223441.185169-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356506;
 bh=FpxycKm1WaEu7qFDozGckOTjEQWHj9ks8aVKf6LPiBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eqGw/eK+iIaR7YBBhjPk147QNQVlqMXxb1kjcGV/nWwXlfP5ow6wNeo7Ap4su9+HR
 2PRnABi926koxrFmsrFVo5eP/fYLwRrfPlTuYRYTQ/DtIY86RT4p0IsYT2KSfMV/KZ
 3aiQ9BI89VNL25o/DkTPwxvBEnOzZVWoaTqsUum7d+o7fSKMqff6ljLfQpUbR5VtXe
 lgj7OirbgR54PvfpTIapQEhbcl0nd6t/xQ++g2nxlOuFffsgkr+fkNuu6cjvk5zX4p
 ZJS6uRmjv361gwu5XcU4d9dL+AqnwAqR1WRPMIh4sT0aOouflhpFWgrEfuiqCidpsL
 N8VZv+SAbEk6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eqGw/eK+
Subject: [Buildroot] [PATCH v2 22/23] package/python-pysendfile: update
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
 package/python-pysendfile/python-pysendfile.hash | 6 ++++--
 package/python-pysendfile/python-pysendfile.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
index d1aff6aed2..2b5b8a9714 100644
--- a/package/python-pysendfile/python-pysendfile.hash
+++ b/package/python-pysendfile/python-pysendfile.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysendfile/json
+md5  e7b301eddd703ab74a48c59a8fda1f97  pysendfile-2.0.1.tar.gz
+sha256  510a414b270986fba3c79cb76d90a4c910c701bfb43ff983a5d4e92846050e17  pysendfile-2.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  259f433563cfe0296c84c00381c600e82e0ab1b617ce20fe6e7f555a2b95af26  LICENSE
diff --git a/package/python-pysendfile/python-pysendfile.mk b/package/python-pysendfile/python-pysendfile.mk
index bb8f057d3d..6c2d06e367 100644
--- a/package/python-pysendfile/python-pysendfile.mk
+++ b/package/python-pysendfile/python-pysendfile.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYSENDFILE_VERSION = 2.0.1
-PYTHON_PYSENDFILE_SITE = $(call github,giampaolo,pysendfile,release-$(PYTHON_PYSENDFILE_VERSION))
+PYTHON_PYSENDFILE_SOURCE = pysendfile-$(PYTHON_PYSENDFILE_VERSION).tar.gz
+PYTHON_PYSENDFILE_SITE = https://files.pythonhosted.org/packages/cd/3f/4aa268afd0252f06b3b487c296a066a01ddd4222a46b7a3748599c8fc8c3
 PYTHON_PYSENDFILE_SETUP_TYPE = setuptools
 PYTHON_PYSENDFILE_LICENSE = MIT
 PYTHON_PYSENDFILE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
