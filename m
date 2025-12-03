Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892FD1BDFC
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D729612BA;
	Wed,  3 Dec 2025 21:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcTuftwNgxWD; Wed,  3 Dec 2025 21:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F24608A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764798461;
	bh=D2oKXc+0vv9r/u4FqdP1N+b646XNSZziZ6lWMoDSneA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbDBRQa91aADcKN5s44l2wsqrA7UvjTGDp91CRlXwt075Q2kMQSZbkLxkV7B2lprd
	 W47LsL2BQCo6tFQnocu1yqe0sXJjxj/ROxycrWPkdUFuFb2rghg+6F6QLkP47CEvyH
	 EY8kOn+sJ37sy5j+MoGdcs1OnpYQrwn8GN9bU41MceIT6B75vj4HUrdQxpuT0ihl5t
	 WEJQFN1wJRv9Jbysplk5/m4blMWTKZg2UzX9r8lhEwuEvIwZIGLoNS3JmvHLJUIHXK
	 CKJpSdoxJ5DJ9XSsB8s37OgxDSP0JBHSWuGucmVFP1sy0G78Z9k7dac0zrfriEoBuE
	 fvj9SOE3MKYaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F24608A1;
	Wed,  3 Dec 2025 21:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4261E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64D741B50
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8cndps6kq4Q for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9766741066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9766741066
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9766741066
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AF4DA4C7986;
 Wed,  3 Dec 2025 22:47:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-2aHL;
 Wed, 03 Dec 2025 21:47:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:46:51 +0100
Message-ID: <20251203214709.2321976-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764798430;
 bh=ehsWltKGJz0LOPlltcZWy6bNSVz/9fgeQ8/uBXzeNKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BEll1TSciNlvT1N+ycHNUu8DP3fXS4e135DcI9dCOQd6AFYgp+kk5GvvulpTx1eZL
 o1RNz7fw+ihuk2e3KSkSVOMd4U+P4czGkjouaz9r1zqJ9g0VydhZR2nnub/LMrEzoh
 EZMwzALfd8BXa3nKhRDHXEZkbPMcr3halS+h14ppcg3pZAjsR6/YtxJ8XuIz/4cKbJ
 lsFHfNtnDIDuhxomL2+Gp/ZGZDllFMS7bZ7RY8z1qgGeB7xFWVI/acdjwHWs1dd0ou
 89F2d+/24A+ZqLbhvqUTzembXUxAXQbwRAyOILBicldGtX89rMMKgPb2/zNcle/9m7
 06AI90qDD09Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BEll1TSc
Subject: [Buildroot] [PATCH/next 03/21] package/docopt-cpp: fix cmake 4
 compatibility
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...crease-cmake_minimum_required-to-3.5.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch

diff --git a/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch b/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..2bc7d33593
--- /dev/null
+++ b/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,40 @@
+From 05d507da0d153faff381f44968833ebffdc03447 Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Wed, 1 Nov 2023 13:39:42 +0200
+Subject: [PATCH] Increase cmake_minimum_required to 3.5
+
+CMake version 3.27 deprecates compatibility with versions older than
+3.5. Increase the minimum required so that the project can be built
+without warnings.
+
+Upstream: https://github.com/docopt/docopt.cpp/commit/05d507da0d153faff381f44968833ebffdc03447
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ README.rst     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 28da614..246e90e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(docopt.cpp VERSION 0.6.2)
+ 
+ include(GNUInstallDirs)
+diff --git a/README.rst b/README.rst
+index 5fe8b4f..6d7012d 100644
+--- a/README.rst
++++ b/README.rst
+@@ -87,7 +87,7 @@ Alternatively manual installation is done using (unix)::
+ To link *docopt.cpp*, the simplest is to use CMake. The general structure of your
+ ``CMakeLists.txt`` would be as follows::
+ 
+-    cmake_minimum_required(VERSION 3.1)
++    cmake_minimum_required(VERSION 3.5)
+ 
+     project(example)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
