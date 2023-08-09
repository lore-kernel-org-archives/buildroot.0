Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC47C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8E6417C1;
	Wed,  9 Aug 2023 17:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC8E6417C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k75uVZc7WnDG; Wed,  9 Aug 2023 17:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF774191A;
	Wed,  9 Aug 2023 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF774191A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56B0B1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8434741526
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8434741526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Putdho0GKSFW for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:34:14 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AEE240498
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEE240498
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5451CA4C110D;
 Wed,  9 Aug 2023 19:33:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3u-0001yu-1l;
 Wed, 09 Aug 2023 19:33:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:20 +0200
Message-Id: <20230809173334.2514813-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602415;
 bh=g+dGJxdu+mAijCbjqvNf1JquKNPu01koxG+NNJiAGlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SOfU8w9qi+pPk3cSaEvTowVUOc4Dkg+BE08zU2z3ynFjW5mm/urlsA0L9NT8aPLtL
 NafZPPxonWu9xazBKoCYKcRLU9y5HI5I700TZxSunJkI4aR3whBvV7J6TB++A4KSiL
 +iIZmP+oLAW1zsy13B1jYFigureAQFydUiCaRHt+18WxN8opW0lHcTMSrPm+UOoS9I
 NCMO3MzPKkUsSxodBHIBRS2y5fPj9uy3z2gOHG71UXphYVbJrhggsRZobRswF+MiUi
 MSxydXg+HalN6Ffzp7DNKP0lcHCxArrL3FQjEyoMkRgQ8TtG348e8eOYhyJ7VaFA9B
 w5+KSFaKvYF6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SOfU8w9q
Subject: [Buildroot] [PATCH/next v2 02/16] package/python3: berkeleydb
 support needs the dbm interface
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

With this patch berkeleydb produces a working module:

output/build/python3-3.11.4$ find -iname *dbm*.so
./build/lib.linux-x86_64-3.11/_dbm.cpython-311-x86_64-linux-gnu.so

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
