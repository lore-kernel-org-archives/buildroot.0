Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A4D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16DDF606D9;
	Sun,  7 Dec 2025 14:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkKnmo7PNv4g; Sun,  7 Dec 2025 14:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3653D60750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117694;
	bh=drHTymSEcLpVQ/Gb558dC/56VXnUA6vZNQhkwU+v6LQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MP2IdRxoJsJu8QG4xLbZEv8xGKe9Pr64HIeQ8BMPoK1YPEw/urTNIQ4aUTxQSXWal
	 v0JPNDBSBn6wR3iC2crbg9XkTzDrz+XcfE7K5BqQYnuCr4+hPSWIHXel2DG7+T5b09
	 MepEtdisqsziLcl27fcuWJBapyQiJGwVxCPu8WmRc0irKOK4IywTHNuVsqPwsqua+m
	 YjG/58Q/O6NeeJ1ndg1JJmGABDWYMZ9kGKdpa5uInTbq7rJLRlGPPJY2oWOG127pye
	 9u2Oh+4irJuiZzAzufAUN/CoChnvEmDGdduFFpalCsYWYJH9l2df+JEX0aSEXgoTZF
	 JR1OZTSMxmZkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3653D60750;
	Sun,  7 Dec 2025 14:28:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A922CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25F7C82670
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmqimyuHn0Ou for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DC3782317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC3782317
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DC3782317
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A615FA4C097B;
 Sun,  7 Dec 2025 15:26:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-2Fvt;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:44 +0100
Message-ID: <20251207142651.3695074-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117619;
 bh=Wbb8f5+x/0FK8/i+F+NRqsZYboNtB2eAB1N63WA0xLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ev9et20CcBaj3DYLnuZFDHOXO+LB04eUVzg7V9m3FfBE3San6ticzm3xvY8WWYiYX
 BydONlDVgSQ6zW7ujBrD7Vc22auAvCmtirwqI6bdIkw9HscQmKhejwx588EL9hetaQ
 oo/9BErUic24JPLswLhrkgG2dRF7p8U7p22TZymBZ9FZ9rcjTkhw+j0LChZRZtphVM
 uXlsA0qyLJRXon3KSsCiS2ggWYszpI0Y8xQsUNJPwHpszuMmJLehCQUWR02YOjbFCQ
 dqcrQ/jCtBPJ3oh3LBgmBc619AzngINZFEdcUjGmGEenlPBrFf8JYU8rT6q334qrdc
 o+6RQOp+N0IqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ev9et20C
Subject: [Buildroot] [PATCH/next 07/14] package/log4qt: fix cmake 4
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
 ...10-as-minimum-required-cmake-version.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch

diff --git a/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch b/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch
new file mode 100644
index 0000000000..311366b851
--- /dev/null
+++ b/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch
@@ -0,0 +1,28 @@
+From dd869e9c5a5e2d306b930b00487a488441131d9a Mon Sep 17 00:00:00 2001
+From: Johann Anhofer <johann.anhofer@meon-medical.com>
+Date: Wed, 26 Feb 2025 15:41:20 +0100
+Subject: [PATCH] Use 3.10 as minimum required cmake version set cmake policy
+ CMP0071 to new (AUTOMOC, AUTOUIC)
+
+Upstream: https://github.com/MEONMedical/Log4Qt/commit/dd869e9c5a5e2d306b930b00487a488441131d9a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported for version 1.5.1]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bf99ad8..2a02433 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,8 @@
+-cmake_minimum_required(VERSION 3.3.0)
++cmake_minimum_required(VERSION 3.10)
+ project(Log4Qt VERSION 1.5.1)
++if(POLICY CMP0071)
++    cmake_policy(SET CMP0071 NEW)
++endif()
+ 
+ #
+ # in-source builds should be avoided
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
