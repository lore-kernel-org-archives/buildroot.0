Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61EAC001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 17:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCE361091;
	Mon,  7 Aug 2023 17:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCE361091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeuL7hdvmx_T; Mon,  7 Aug 2023 17:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EDC6108E;
	Mon,  7 Aug 2023 17:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EDC6108E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4297C1BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75A3640A5C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A3640A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evmBzBdGkqpJ for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 17:45:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ED2F40620
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 17:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED2F40620
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFD4DA4C0C84;
 Mon,  7 Aug 2023 19:45:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34072)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qT4I8-0007Xl-01;
 Mon, 07 Aug 2023 19:45:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 19:45:15 +0200
Message-Id: <20230807174515.3261136-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807174515.3261136-1-bernd@kuhls.net>
References: <20230807174515.3261136-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691430316;
 bh=FM1cKt71iP1477uKTKeo2TaH2PYBFP8e3wVQTkzqgoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YKYbgY2WDgBWb5VBZyjmHAjJKfkUWp1aO2iFpMYjM+0888hbANet9A1g+6XgpgbpK
 S6CHUdRBi+5GV5CoeXMUZC9TCCn/+d867qr8s/ftXAY2qdMm+DSIli32wJMN6k3mSH
 +yPMoJ2oqlxG6N6b//SOvJ4gkbOISHpfSb9q23nZeCy4nSH6XmxgnplJuWYb9FDh3J
 TRg7W6yGRUXHebvnAnEoyS2MGu0IJDRq5eQeCatLSoPwFIzK7jqMGrSBb7YwktQd7L
 OkzjqzmyJ+lJ6U1g2sJ6ghAiWS5Zxyr4+qA9cN77AeAeTqQXj7cV0I+Y4KF2jXbYjN
 xe8VJ925RtNqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YKYbgY2W
Subject: [Buildroot] [PATCH 2/2] package/python3: berkeleydb support needs
 the dbm interface
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Berkeley DB support in python depends on dbm, when missing python fails
to detect libdb:
https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002

quoting configure log:
checking for libdb... no

quoting python config.log:
conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

Only with this patch python builds a berkeleydb module:

  output/build/python3-3.11.4$ find -iname *dbm*.so
  ./build/lib.linux-x86_64-3.11/_dbm.cpython-311-x86_64-linux-gnu.so

since python 3.11 (added with buildroot commit
738500c296c8b1206f20e94ca3e7c5932a6a0486) changed the way it detects libdb:
https://github.com/python/cpython/commit/0a9f69539be27acf1cddf1b58d02a88d02e5008d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 761c38c850..38f0580aa4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_PYTHON3_2TO3
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_BERKELEYDB_DBM
 	help
 	  berkeleydb module for Python3
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
