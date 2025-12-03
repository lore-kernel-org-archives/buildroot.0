Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7044D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB26B60DDB;
	Wed,  3 Dec 2025 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyqJIoy32apD; Wed,  3 Dec 2025 22:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D9561222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799282;
	bh=6yREdDrrXcdT67f7RCjZheA2WX7RyeBuA0TAjqdJ23w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEXWOG80S9+be7HbkMtWE+g5x5mx7+WZGDjYzviaaVxPWcB3Gd6yvSJJhbpI3sRJ9
	 4Hh+uM50ZZi3MgrxqeAk6wH2rHk7HyPb2jCbC6e7Fcsj/Km0lABak2DkvVsuT5CI/P
	 EPZ92GgntGRbbEZi/SoHMdxaaxKDXE4gx4wL3a4VK3TEb17VYtgBXJ5rCUJ+0d0jrC
	 oc1EN5VGkyqKSFQczjNlxITW2OBX+y2aRSQjG50ZvXHsTkHo8qEFRYOZaxa2chyCaW
	 3Y/ODUwgSfGcEYzuNLNS0sP4o2Jga7hX5uPnI+PgTEQetRIOxG+EUBvMzme54W6Toz
	 cK1mIUceFKqyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D9561222;
	Wed,  3 Dec 2025 22:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C79A3D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6A7401CC
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OaEnW0X0rJ4 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:01:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DBB1401B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DBB1401B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DBB1401B8
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38E3BA4C798E;
 Wed,  3 Dec 2025 22:59:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-1wxA;
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
Date: Wed,  3 Dec 2025 22:47:02 +0100
Message-ID: <20251203214709.2321976-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799143;
 bh=BSMNsioLdyOTATOrqJ7Fj0jpZGwvXI31UOGzOEF1VHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hOsos3oZKPWE8FjzNK9HAdTvFj3TUgk6cL1IHLAdGouWb+ISO9xgG9Vd9hfzyDn1a
 kdvmdf8MNKYUpw5cWNkJebkolHgK1ueMSKAhV73Pp8gvG6y197MBOGxct7yygR9Ves
 KlqvRhwm+bEgMSLBf8pibKCvMuU4M1pTpnPK6jMKUupUNcc+UiRX/sD7Z0kx/mRSkE
 bWMChpdYs3MoM01fE2zEkTmO7Q8Sb56StsiNjphdIro4mUejarMhNUiPpg8i4I6cgH
 LMPdaSZrc3FuPFNy193aJW3V+tsWR1+NZ0gsR9f9gqMJUehfn5vGtqoxEfLTzQvFci
 zZ9oE+z0UeghA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hOsos3oZ
Subject: [Buildroot] [PATCH/next 14/21] package/libsoxr: fix cmake 4
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
 .../0002-allow-compile-with-cmake-4.0.0.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch

diff --git a/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch b/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch
new file mode 100644
index 0000000000..34ec44b671
--- /dev/null
+++ b/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch
@@ -0,0 +1,28 @@
+From c157f862ecca9a0613e25c2058aceb127ee4ea4f Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 13:47:55 +0000
+Subject: [PATCH] allow compile with cmake 4.0.0
+
+Upstream: https://sourceforge.net/p/soxr/code/merge-requests/6/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ee48f6c..2eea1e9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SoX Resampler Library       Copyright (c) 2007-18 robs@users.sourceforge.net
+ # Licence for this file: LGPL v2.1                  See LICENCE for details.
+ 
+-cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.1...3.10 FATAL_ERROR)
+ 
+ project (soxr C)
+ set (DESCRIPTION_SUMMARY
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
