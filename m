Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00BCD5B16C
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81248608E4;
	Tue, 16 Dec 2025 09:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGyzY2iZDrQ9; Tue, 16 Dec 2025 09:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BAC608FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765878948;
	bh=hADAcVjMZCuHqR+hZ3KrzUXR3kUD85scTtkUd3mM8JE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sWPQOT+E7RF4IawHNQ7ZgdQ3s4/uBott/Rq/a6gCkg3F/d2RtI8YBKBwQlgLlLruP
	 3ZJLtaxAm3bdRjcw/Vlsj1+QDedc+J1dKy3GCk1kdOW/huFQ5iFnATfimfgq47dqX2
	 VIU31SPrClYmyznIIvQCNIYCBgKV3jURMjj937UgRSQNCg1IVtjnrrUWaFZ8vhxGJx
	 nbs4DoiF0ecDAjp0LcnqWXp9mP9Glnf/Pjh4tg765SWpy6Xxf05zb+qRkkLdxIx7d4
	 5dACZ+OaDiFgRlj/jNjbX8VCb88ID3R+YAvDbKJqFwZ6/PDifrArIvgzgAx3I4R22a
	 6dPmpvwHBQjFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BAC608FE;
	Tue, 16 Dec 2025 09:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD2D372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A74BA822A2
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SohQkHO9bsbQ for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B80B881E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80B881E79
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B80B881E79
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:55:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E519E1A2222;
 Tue, 16 Dec 2025 09:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD4A26071C;
 Tue, 16 Dec 2025 09:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE2D211943319; Tue, 16 Dec 2025 10:55:40 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 10:55:30 +0100
Message-ID: <20251216095531.1381197-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765878941; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Z6erH5ciwLNfaSpB95uPjkmvNLP2vXe2HblmCOrYzK4=;
 b=tHaorOWlrFvZvA0pUtg3lBu3fzcqwMJ9E1e1KdhjQx0c5rWtOooy8PbaxQBAKx/ZfSN04j
 v/ROk68lbMBE80Al49fe7R1/vTqo6ncwv2aK1MdJFEpN917bQSZ1OpFvsMTMBoH4qh3Z3H
 +zId4oRS4wfszzpdniOmfZ/x3i4CJxoH+XKoO+DuTDpD7D/InlLvSAU7bZhr9uvfhG15ZG
 KjwexwHtbCslheIcOR3Ao7+/ccDfNdFmvIVcB0eUuH32+BagTBZe7dJ7h+VEKPjsQ8IRt/
 bbkQ8Vd6H6peqI+UZqbZvU0BMlc8jbn13VhaQVH8T5ErEm2YeFtEaeTHzwZ4SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tHaorOWl
Subject: [Buildroot] [PATCH] package/zxing-cpp: drop support for Python
 bindings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of zxing-cpp to version 2.3.0 in Buildroot commit
fb032bd34acf57f86f62bd474cbabd4e1e750e67 ("package/zxing-cpp: bump to
version 2.3.0"), the build of the Python bindings has been broken. We
tried to figure things out, but couldn't, and nobody bothered fixing
this since February 2025, so let's drop support for the Python
bindings for the time being.

Fixes:

  https://autobuild.buildroot.net/results/93ffa69b9f92f142c65169f9c3a7c7ad0e733551/

Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zxing-cpp/zxing-cpp.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 515daf590f..8c44e8ea9a 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -14,17 +14,8 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
-	-DBUILD_DEPENDENCIES=LOCAL
-
-ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
-ZXING_CPP_DEPENDENCIES += python3 python-pybind
-ZXING_CPP_CONF_OPTS += \
-	-DBUILD_PYTHON_MODULE=ON \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
-	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-else
-ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
-endif
+	-DBUILD_DEPENDENCIES=LOCAL \
+	-DBUILD_PYTHON_MODULE=OFF
 
 ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
 ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
