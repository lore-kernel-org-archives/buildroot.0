Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB32E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DACD580C66;
	Sun, 21 Dec 2025 22:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afAY9KlyXuIg; Sun, 21 Dec 2025 22:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CBEC80C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356559;
	bh=F/GIkMK8xbYW+e9LZkKJXKOGuBUiZg0fbDnupW+jMtY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FAvyAO/lSfI4qf8fjnl6G9dQw4LI4jEL/qlSXShASp05qRFSXoOpFHH3jNMjFdvQS
	 /LKEjQCoQFI3dciCcr+Gt/oV10fFIvpv8n7HAOWFsVXmgcbnlEZQOwDZc4GXEChO+Q
	 GjFlDqBjZlXh04AOkoGonBw1DE53/Oeq/EkAQso1dlbVh9sVDrpBUsiIbVwQH1duRn
	 fPoPzyThSgR/QmYd+q0FTNU/tqY+jz8WuhF5xFHpnoYxAzKOSXLw8t7/bPTxzdh9xr
	 XkYcOWD6azCGxFuVKdkpHm9WRl7xe73ev6cKEXDBYILky1VrtX/ECN/h9ybWCFKl6e
	 18FqQuh2b5nHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBEC80C6F;
	Sun, 21 Dec 2025 22:35:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7DA195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01B5960681
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KryF15E53ziI for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE3A060664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3A060664
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE3A060664
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A87F9A4C4E18;
 Sun, 21 Dec 2025 23:35:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-3VJU;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:26 +0100
Message-ID: <20251221223441.185169-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356503;
 bh=HhxRiydqM9GIH4LAdfz3Vl/mlQyskl6JcGWVC/M1rdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dPP9x5wZeRyXd4zkMRZWnJlNQ47KtOIQztu2eI8voK1IQcyIcSfhfT9eSSvrOHOWn
 bN+7LIl61Nr6o+w0bkvmzSex7f0IUNopsrAq6g3VLJb9uAjfXI9dgT1m/IqyjFYgbQ
 QTOY/7Th/OF5mIv9YcBgPrYOocDgbHfARybEgNCnawSDVdsIgF0krCGCPrJa3Cvx1/
 8/WXP2WvdAz2qLusg8tTsmXFhAHJuUToZAQYm4Iee08UvDN11YCW20lVLaPb/iiCjh
 ByFiZsve0r15KYKfNNSXTRIh2Q+23LotijskyW6cRBud3yJoDnCQKNEbRxknP+yTSr
 q6420xOXbaWjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dPP9x5wZ
Subject: [Buildroot] [PATCH v2 08/23] package/python-httplib2: fix sort
 order of dependencies in Config.in
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
 package/python-httplib2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index a029814f03..9647bd495a 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_HTTPLIB2
 	bool "python-httplib2"
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
-	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  httplib2 is a comprehensive HTTP client library, httplib2.py
 	  supports many features left out of other HTTP libraries.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
