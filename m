Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33ADE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7835C82016;
	Sun, 21 Dec 2025 22:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exLrWXGl9kLI; Sun, 21 Dec 2025 22:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD90817B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356535;
	bh=VvyBatO/WY8mHasZXTSsbD3fVc2aAaFrys6Cm6WUAmU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dcPsNV+p+JxeAf9At3IV2C24IviQQduHFBBNU0W3jpf4UiOMo7xksHIqz/I5HZXrd
	 8aeCKvWrVByk1cS9ouMQqn7ZsYKNvNZI6+5JKkeXR/3dNd1nWSxwhi5AfXqKTDYxTi
	 ltja9HLU7xrlGBgdu/rAbJ48wGe7vWKzuK7QlAjlMMrpEqFyzOr/TzqGteljiBJwnu
	 otS5W+P+FID1XHTDyYSpoaMZ2wjS079ugwAO1f64OmjK33IxG49Wg9nJBuqlCKEv4h
	 JEBNXmAzHAXsuL9Tp1kN280erpmlq5E0R5yMx/jO1lTQAoexTKdmdXQabPHYn9mmIW
	 BgUl00ugWAQyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD90817B5;
	Sun, 21 Dec 2025 22:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F320F195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E506660857
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0DNxUtGFfUW for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:35:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF1A560810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1A560810
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF1A560810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 396FEA4C3E8A;
 Sun, 21 Dec 2025 23:35:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-2z7H;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:24 +0100
Message-ID: <20251221223441.185169-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356503;
 bh=9perd4Nz1gm4/vHSDBTWMzHSqTD7CZdQZpnoCFGVw4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fIIdr1KjFpPIotur2LsL/5abTo3njCxNviPQaRAgaWO+ZJt0rgmHLceOQX7s+7yDv
 DDiSOLXf2sodU9jBSCR/7eCmkyV0gDpixLxrgsiZBkU6HkCYR1jAEjXW0eQKL09Jzx
 SIEwPVSE4SswlQtehQAk2qUCYLCjSwngFnsSvc+VUrMSxYQAU1GQAC1enJ5OOJD31U
 M5aLMYmHRBIsjZgOPcaMMV3uSYsJBJvWFzvKpyqJQsaWXiOJHc3x0r8A4jtrudsvNJ
 fNU6Irk//ZUBKfKfWXUVqbBYYLtcWQiM99UFbPXp9CVpV4StYCsSdKRSnnEfRYQLYJ
 zqHmQH12ii4+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fIIdr1Kj
Subject: [Buildroot] [PATCH v2 06/23] package/python-dockerpty: update
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
 package/python-dockerpty/python-dockerpty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
index e6fe6e3b49..7ad98c6b94 100644
--- a/package/python-dockerpty/python-dockerpty.mk
+++ b/package/python-dockerpty/python-dockerpty.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKERPTY_VERSION = 0.4.1
 PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
-PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
+PYTHON_DOCKERPTY_SITE = https://files.pythonhosted.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
 PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
 PYTHON_DOCKERPTY_LICENSE = Apache-2.0
 PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
