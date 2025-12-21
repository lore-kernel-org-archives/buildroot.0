Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E53E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F8C80DD3;
	Sun, 21 Dec 2025 22:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEfOIAqQ_eHl; Sun, 21 Dec 2025 22:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D650081BD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356510;
	bh=VwHGOrrSyn5SFe32XiOWUaFymdwYLKCGOim5mIPJUK0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F/EZ+PNAu6Zv5fQkYAXpVDRVJzluxXRZdCr68RZ3Of5W3XJ5VPoEVsDS0EAI7K8p2
	 NHdOrLlWBzR0qEHdnHO/Ho+vFEQ+dnMEZFlVa1jMbF8VvQx9leASt+ljOcaYgBsezN
	 xayZVCEMr+D17QGqAEc4hzjqo029kEU/zer2a1hOWUn2T/08iZU8jWxzQAdGgMMXPQ
	 c3dyFqJUmYUuzbGuhmyzQdPkfiZCfDnYsTYbwnoEK4lZvtHpjP/xKZeJV45Qmkw8BI
	 1ICTPYrVktbjEZ8jB1OYPiGBs5vwBB6/lITDo6D1koywqhxWKeihxhcMU2h2Z3V0Tx
	 RqxU/SaRSoJCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D650081BD9;
	Sun, 21 Dec 2025 22:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A48195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C40B181CBA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSx7K_hIztgb for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCB4D81BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB4D81BD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCB4D81BD9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06924A4C4D07;
 Sun, 21 Dec 2025 23:34:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-1mGz;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:20 +0100
Message-ID: <20251221223441.185169-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356482;
 bh=FeQc6eE4eZ3yPGqLi4tFORH1TBtIIMNIFae0O/uGEv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RKZ02V3fyXfG9QTrgqD0ZqGMRC2XW7kdeIOz/hxPnDKAZlAzEcJ8G+09Mn+xd+lHn
 HHz2+3T0uSihxo3MAh//hgTv3xCTnqJgMCbXtcHxl/niqePUvirA++Ly/Zcm0v3VI4
 4QtlplZNQPOqiA8aF9jLlIW4jI3jFvOtiIsd7t4UCQ3C8yp1vzBcpM1pAEd4mEGjh/
 /FKxAIcmx2VZ4FAe2xLRdZ2YXSPtutp+4BtyftsYsG9BADVrBog9IywB5sEljd6HLC
 XGK/VFjvFV62bKjbOLPB8sNV+WMsNmDu3SperyW8HzzwIs1E8VSNLIdF3ag3vlwLB3
 1NVDoB/8j5t5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RKZ02V3f
Subject: [Buildroot] [PATCH v2 02/23] package/python-colorzero: switch SITE
 to pypi.org
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
 package/python-colorzero/python-colorzero.hash | 7 ++++---
 package/python-colorzero/python-colorzero.mk   | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
index fc2455c836..4a1b900453 100644
--- a/package/python-colorzero/python-colorzero.hash
+++ b/package/python-colorzero/python-colorzero.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  86c9933b004aec8ce1c476d1d1129e00325c7724df3c09aa353d5f8e883ed08d  python-colorzero-2.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/colorzero/json
+md5  e7f71e181b94754bcc5ca7c92c52c0d7  colorzero-2.0.tar.gz
+sha256  e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58  colorzero-2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  ee1c76f465410c34802ddf81d70e1ea7a4542cf58459425038498d8f4e36bb45  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
index f38c98a093..0ed6a90c61 100644
--- a/package/python-colorzero/python-colorzero.mk
+++ b/package/python-colorzero/python-colorzero.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_COLORZERO_VERSION = 2.0
-PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
+PYTHON_COLORZERO_SOURCE = colorzero-$(PYTHON_COLORZERO_VERSION).tar.gz
+PYTHON_COLORZERO_SITE = https://files.pythonhosted.org/packages/b3/ca/688824a06e8c4d04c7d2fd2af2d8da27bed51af20ee5f094154e1d680334
 PYTHON_COLORZERO_LICENSE = BSD-3-Clause
 PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
 PYTHON_COLORZERO_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
