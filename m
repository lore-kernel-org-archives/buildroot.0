Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC04E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB29B82251;
	Sun, 21 Dec 2025 22:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2edaGgxGbTR; Sun, 21 Dec 2025 22:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B49821E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356716;
	bh=es2TLMpDNVv0MC28zg1ENMZbTd4j1WFF5D2lxYwI/Hg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rFJeyxCytOMRRFy4UsnDDDp40PfkYnsh9dPOXjKxOTAdwznakWwBfpHmLX6eiAhZe
	 P7ExAjA+XCrIZSQfehfh+Xit/yBS3o15tdY4+HyHWm2q6POEan7QrgsXsA4rQcihiW
	 XOHMsvV85vVErJ0wU6tAFI63+yVA1Gf7xUejgAPDwyAQBqwNl49oXjGBi99WCo7+vS
	 9dSk9AXizDDF3qnLz1bYHsll8CLU6ZkYF1Ao0MgU3M/L2/jPmRXZwZSG1IIr+RrWE1
	 MexrQVPJQVI8draQNMwH5po2JAMDzLoFDMskYdl2mXqOj9RB12dwS53LcLEq8qHJl+
	 1oiPqVxu8gw4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B49821E5;
	Sun, 21 Dec 2025 22:38:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0694195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6EA9407B9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEaPEbZ7YhQ9 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF713407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF713407A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF713407A9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DB8BA4C4E63;
 Sun, 21 Dec 2025 23:35:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-2ohW;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:38 +0100
Message-ID: <20251221223441.185169-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356506;
 bh=7aLIAZLibjhGr7Aiy7cSXWIHsuqvrHLPtP32skrUzmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mXNaKT9Kdr1MtO3jCGye0CDlmHzwbszwDkXu7tJPyrGnXAKYht19SDa0hB/exWILN
 mkggtaobDD6XHUKFRiMzNPLWJvwgl80fvDkqPgCzgMbOIIcH00kITaZ5MEr+suzuQT
 n6PPAIbymtg80RCQaCmXoy6T3j9b/NN/U2tVhlt8UUCMxSjpm8cS3Qi6JQ2V/BHMzr
 dKxJuKLINoEvFIPjTRWEB+kcD9UpEwT4FMkzibM43evjnMt57B+xXHhK2qpprm7Ocn
 toR7n95+efn3JwsYJBw2UX40m+PgdZIZm3uuPSdJdbEeO82jMMSqrPLBdwgyQt2ePN
 pnxo/9jSx5VNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mXNaKT9K
Subject: [Buildroot] [PATCH v2 20/23] package/python-pynacl: fix sort order
 of dependencies in Config.in
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
 package/python-pynacl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 0553d82ce9..51623a0a70 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
-	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBSODIUM
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
 	  library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
