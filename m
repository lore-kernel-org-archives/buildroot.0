Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235F0D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDA661292;
	Wed,  3 Dec 2025 22:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QZN5UGTTFPY; Wed,  3 Dec 2025 22:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD7361408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799245;
	bh=cxdp2NZcZMQgVICy6ptmZ0aQnuHj/2BZWPYPieurhJU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sk+TYXzlnon87iSdEyydPcGf56H6W9k0KxnWvTQlRFUy+JeQahpM5nTcHiASgxqqE
	 R5umvQuCve8CSg5Qp8K3XKwnndvkHTw8OnVuf0vSV06jpo7cuZlpGZw3L+OxYZBeWp
	 qnkCmaGAlGG8QcunJPfkCWo+Cz+GGAqche+acQEPcModAqSAgBXtJes6FLqK9iw50L
	 M3lH3wK3tFue0XiM9NX/cwu8ckYDJSd+OsLO7NtOaOf49Xu0uhqCcHQpo8gHd3/uxg
	 k2y/aduf0Fcz2wUN6LvvI9+AXKoJHVXX9RogIWNZ+gEojA3UYJaeWSwmlG1zJ9+CXj
	 /O9LDaWGvnajw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD7361408;
	Wed,  3 Dec 2025 22:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07BDBE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE00B616D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prqCTkmY0RgF for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE34E61292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE34E61292
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE34E61292
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 968F2A4C798B;
 Wed,  3 Dec 2025 22:59:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-0zYI;
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
Date: Wed,  3 Dec 2025 22:46:59 +0100
Message-ID: <20251203214709.2321976-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799142;
 bh=6XKFqrTX81OW69vwT/DyNjY3R5onitT4tMY6HA7fLxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LTO20G1YYQ75ewbcPF1dK1J1ZTyNTppJM5bT3Of6B1rj30bL0UzBB/vh5pIxevHVr
 iN+RVqYlFukJ4uKezpOCOqq0cSMa/ZMpTDwsAV5//8Wui/lhcdWZrRWXN+yjRCWJ/K
 O52/4J4iQ530BZYikp6jef11lys+xDMRKmSfmLa0f2KDaI1QfqPvxYjmUqvVHOaIuR
 eyLalfc5yx7HMVRxffSgOwwe4bmB+BzRigDs682Gu7d+TZXFA5oZvdKBzOx/Y8evyX
 tym2KthrAISG5jNzRUfCf4dVSSpT8uvB4IYwPlqTNrTqh+Ftz5fu9n+hzEusr6bH5J
 A7/jG6oIVzRUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LTO20G1Y
Subject: [Buildroot] [PATCH/next 11/21] package/libebml: fix cmake 4
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
 .../0001-drop-CMake-older-than-3.5.patch      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libebml/0001-drop-CMake-older-than-3.5.patch

diff --git a/package/libebml/0001-drop-CMake-older-than-3.5.patch b/package/libebml/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..3a9098f6b3
--- /dev/null
+++ b/package/libebml/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From 6725c5f0169981cb0bd2ee124fbf0d8ca30b762d Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:33:56 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2.
+
+Upstream: https://github.com/Matroska-Org/libebml/commit/6725c5f0169981cb0bd2ee124fbf0d8ca30b762d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.4.5]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11ee059a..c7b969a8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(ebml VERSION 1.4.5)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
