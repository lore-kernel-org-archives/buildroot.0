Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D9AE668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 602286076F;
	Sat, 20 Dec 2025 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zsGMBUBpVGs; Sat, 20 Dec 2025 21:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4AFE605D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266855;
	bh=F/GIkMK8xbYW+e9LZkKJXKOGuBUiZg0fbDnupW+jMtY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TFl+3EK48tXWl3hcMv1JyF6YRbN/FYNFECewTbxqT7aEHfqql4CvgJhQNrduDtbRR
	 Qv/mAYVEFCexIH1D246Dk3zsB4GUQVI5rZjutnf84pVnQqjuJhPDOBqTaW8iS9Hc0d
	 CiHNF+09FJk2K/oR5qN6LR/iMvOjwp/3LpUDv+1Mu4wRc3EmklUA2rxgKDx3vVtw+v
	 PEU9UuHpKFC8raa7EDmKRWyG+u9ZZHRtjacFdvYYPaEb1VkhpnvZHmKDWAL1DKM2HD
	 xRl9y8aa4fJfKPeXZd5GBB87mepaYOrkBFOhf1cQgI70jSOqLjsDQR5LkWTp5nzYoy
	 FTIpNojqFGaqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4AFE605D8;
	Sat, 20 Dec 2025 21:40:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA89823D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0DF4605F4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJ4kaBoIQ3Ra for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85FDE60067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FDE60067
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85FDE60067
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5915A4C4D56;
 Sat, 20 Dec 2025 22:39:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-0jGQ;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:39 +0100
Message-ID: <20251220213946.1088820-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266795;
 bh=HhxRiydqM9GIH4LAdfz3Vl/mlQyskl6JcGWVC/M1rdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q6xgV+eD8zpuZ0N35a55XM7d2b+e9VElwKzQyfmQJNtJYbBuB3JXfm2dfzG9TWou4
 zvwlPkoWdVZx7JUkd95Ij7onapM3BVJk7eDW6CWyT9mATbwoMuybXu5beg/qOgq2dp
 Mln/IpLdVmW+8fYAcpf0qIDTs77BXh5ESBKWKAUSRURVz+KelRQjAv0A6xGz5HTYLo
 a5dDgi2hK68pkrSXL7aatZ8qIG9KE89sgyv/dJzG/Ejim5kVwxsmx8WSFeIdRfPC78
 LuIbvTp63msobcXA+KtmgWDEQXwgZhW5389otQy9+AEiRQnN2omxIlIlepc2xpWUVp
 dVZsqr6J3+Vpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=q6xgV+eD
Subject: [Buildroot] [PATCH 08/15] package/python-httplib2: fix sort order
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
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
