Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B8D1BDFC
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B24841066;
	Wed,  3 Dec 2025 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viUS3XBU75h8; Wed,  3 Dec 2025 21:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E01240FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764798436;
	bh=nG6kOYWPlT1YRbxJNEF6/NlTNYYmvIB9IJisIn0Qcuk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EjGSNejIKRQXbV9DAXXt6tBOI7mWNfH5z6RCYWh0926KVOhyTtIXcgrDIWrMsUbzg
	 BF8iWr41A6Yqk+fsN0PjXsF1cKHs7iSLAUbrjJ+jvFInKhN9TQ0SwAuy4soG3+WaBS
	 DN7evyiM1JwrUMqlN+ykdRlCTHpeCNIYf3EvnGCM8TY03555knMCjrBSa26JicweN2
	 YfyWeg0HO+q82NZBm+gB8o2qdh6hP/TfurkwUCaW/lX/Vz0dWM4iW7KevfM0qPalkr
	 CA/7LOoR376SrkB52XoOziIWk5S98+MdkD7N9G6HUYoJBLcgTSuCJZR5KMzXG07xJW
	 8dBjcCZo9/a1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E01240FDB;
	Wed,  3 Dec 2025 21:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06166E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB7A560855
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GELcIIVO49-i for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6519E607E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6519E607E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6519E607E8
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46FC1A4C78E9;
 Wed,  3 Dec 2025 22:47:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-1rIK;
 Wed, 03 Dec 2025 21:47:09 +0000
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
Date: Wed,  3 Dec 2025 22:46:49 +0100
Message-ID: <20251203214709.2321976-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764798430;
 bh=njCLaGEfg7qgHDUA9nyL+xf2HlGjUG0zm27A9opsGyw=;
 h=From:To:Cc:Subject:Date:From;
 b=Wgoa5VsJ1pELeOLhEi2UTTjcjVA/GC2U7fuUKdA1ZI8noQZCu62qumqSTNw8Lsa+s
 /0BRdYiYm36Gje5ffCL251hUsnaW9cqAK/4KikXn113u+1kE9jrTvU1u+XgNK3XvpB
 h2XWLxzd7P8Pzy71VM6ZmHuxIvpelHZQ2CdwZRl0RLNGXbhenGUFO92PvhvRQ+slVf
 8cb16mEXN9xZcSsQTV4WYwBtoJ+PhTR8DB1zpMCiUWKUlgYHYqG/AEknNCtivJDXGl
 K0ub+k/f1Qd59fMI9/fC1u3BVtekeTsKNxHcU5R+VrHVHDD/ZtmUxdOcGwTOH2b628
 9K43vn4vJ1Log==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Wgoa5VsJ
Subject: [Buildroot] [PATCH/next 01/21] package/azure-iot-sdk-c: fix cmake 4
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
 ...make-version-and-update-dependencies.patch | 30 +++++++++++++++++++
 ...make-version-and-update-dependencies.patch | 30 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch
 create mode 100644 package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch

diff --git a/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch b/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch
new file mode 100644
index 0000000000..7cef575532
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch
@@ -0,0 +1,30 @@
+From 1a9a5fd688d811ca7300edccbdfc623fdaa1b8dc Mon Sep 17 00:00:00 2001
+From: Dan Cristoloveanu <dcristo@microsoft.com>
+Date: Wed, 27 Jan 2021 12:59:18 -0800
+Subject: [PATCH] Bump cmake version and update dependencies (#65)
+
+* Bump cmake version to 3.18
+
+Upstream: https://github.com/Azure/macro-utils-c/commit/1a9a5fd688d811ca7300edccbdfc623fdaa1b8dc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to LTS_03_2025]
+---
+ deps/azure-macro-utils-c/CMakeLists.txt     | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 29b3416..3b82d4e 100644
+--- a/deps/azure-macro-utils-c/CMakeLists.txt
++++ b/deps/azure-macro-utils-c/CMakeLists.txt
+@@ -1,7 +1,9 @@
+ #Copyright (c) Microsoft. All rights reserved.
+ #Licensed under the MIT license. See LICENSE file in the project root for full license information.
+ 
+-cmake_minimum_required(VERSION 2.8.11)
++if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
++    cmake_minimum_required(VERSION 3.18)
++endif()
+ 
+ if(TARGET azure_macro_utils_c)
+     return()
diff --git a/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch b/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch
new file mode 100644
index 0000000000..c1076d70be
--- /dev/null
+++ b/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch
@@ -0,0 +1,30 @@
+From 02ed1852d45fda6994748118bab129e5d2527c0f Mon Sep 17 00:00:00 2001
+From: Dan Cristoloveanu <dcristo@microsoft.com>
+Date: Wed, 27 Jan 2021 21:35:21 -0800
+Subject: [PATCH] Bump cmake version (#189)
+
+* Bump version for cmake
+
+Upstream: https://github.com/Azure/umock-c/commit/02ed1852d45fda6994748118bab129e5d2527c0f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to LTS_03_2025]
+---
+ deps/umock-c/CMakeLists.txt | 5 ++++-
+ 1 files change, 13 insertions(+), 74 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f1a7a9f4..fc479cac 100644
+--- a/deps/umock-c/CMakeLists.txt
++++ b/deps/umock-c/CMakeLists.txt
+@@ -1,7 +1,9 @@
+ #Copyright (c) Microsoft. All rights reserved.
+ #Licensed under the MIT license. See LICENSE file in the project root for full license information.
+ 
+-cmake_minimum_required(VERSION 2.8.11)
++if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
++    cmake_minimum_required(VERSION 3.18)
++endif()
+ 
+ if(TARGET umock_c)
+     return()
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
