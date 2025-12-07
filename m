Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736DCD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBAE605FF;
	Sun,  7 Dec 2025 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZCR9yPCrKvV; Sun,  7 Dec 2025 14:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C87460750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118665;
	bh=ocrulk2FADP4EQYDgtY9rG3x7YkLzDK6943YUu/350A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=knYMLOEQNDU4ySQ10PUHRBYiuJWZo5PfjYAT0HWMlnnZ1l7rdR3Oe0EoYEa4MhMYe
	 AKNQuXq55geCHw36KuBEvUXbJHztnQPK6tZZoK9CxXPN0lv5WK6/g3OPfevy0DWeHt
	 dksrIVQUqyXgMx480CgzaxAkACRkDHWZBn/ZnPHpqPca0PpJ9eu5Wk/uDD2VfcL2iR
	 zwzIIGmyQzC9P+IbYwwTQsWIWNrgfPPKXF3i/WtHWbwaAZJ+RetA78arepdxzTdVVS
	 hQpxE+hSJ/8D+GGySfC2dkqmqkohVRDtbnIXwwNlfXLQKXWeXm70jJuCt/zZb3oTp+
	 hz3Mu1v9976Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C87460750;
	Sun,  7 Dec 2025 14:44:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7F932CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CF040208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F3kBGlL3Si9 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5097A40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5097A40166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5097A40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 742B0A4C0984;
 Sun,  7 Dec 2025 15:42:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-0hSM;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:17 +0100
Message-ID: <20251207144243.3696572-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118574;
 bh=mkEuE7aCos+T9sH3S+X81QmEmN2+jh/3mqezwkRJzOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ca0CJmpwpYYl5GKeW4mXorsa37GybsXnFnL+KbkCp3UJHYvXzrfZGBHQI5nMn5LMa
 iXJTovFWiSfKK/SaqY7ZoaTqTjIgXmGvMUOfKCxat4RuqcvB5X+nmPDz7x1qCdnRaN
 xTr9M+u1zzN3CaOAEyxkbQxFuAbr3uoqFl7VQqEtBN1tYHHioR3lFNu7K0bfDHJyha
 4ioDZABxD1xKiIhk7EyX6MyNK2WCNu1IW9UWlt2cF8N2xrXHFDO1JyjBKCg04imrC3
 XqejE7QVKnHJH/b1Ps48i6hK2mk0giLne2imd3WO6D+aI/cIw91H+8hh3MqCkA3hbh
 sxOL6CKZmOnfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ca0CJmpw
Subject: [Buildroot] [PATCH/next 08/33] package/physfs: bump version to 3.2.0
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/icculus/physfs/releases/tag/release-3.2.0

Added upstream patch to fix cmake 4 compatibility.

Updated license hash due to coypright year bumps:
https://github.com/icculus/physfs/commits/release-3.2.0/LICENSE.txt

Switched _SITE to github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ke-bump-minimum-CMake-version-to-3.5.patch | 27 +++++++++++++++++++
 package/physfs/physfs.hash                    |  4 +--
 package/physfs/physfs.mk                      |  5 ++--
 3 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch

diff --git a/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch b/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..49db2061c5
--- /dev/null
+++ b/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch
@@ -0,0 +1,27 @@
+From f7d24ce8486d9229207cca1ff98858fe60ffe583 Mon Sep 17 00:00:00 2001
+From: Anonymous Maarten <anonymous.maarten@gmail.com>
+Date: Thu, 27 Apr 2023 22:39:41 +0200
+Subject: [PATCH] cmake: bump minimum CMake version to 3.5 in anticipation of
+ CMake 3.27
+
+Upstream: https://github.com/icculus/physfs/commit/f7d24ce8486d9229207cca1ff98858fe60ffe583
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 3.2.0]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dfe127a7..1194449e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -11,7 +11,7 @@
+ 
+ set(PHYSFS_VERSION 3.2.0)
+ 
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(PhysicsFS VERSION ${PHYSFS_VERSION} LANGUAGES C )
+ 
diff --git a/package/physfs/physfs.hash b/package/physfs/physfs.hash
index a56e7dccef..f2eea58453 100644
--- a/package/physfs/physfs.hash
+++ b/package/physfs/physfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863  physfs-3.0.2.tar.bz2
-sha256  d80c0b09a1c98c61667ea044eefa2fd98fb70bd5fe12c49ff52b1fc2289a6583  LICENSE.txt
+sha256  1991500eaeb8d5325e3a8361847ff3bf8e03ec89252b7915e1f25b3f8ab5d560  physfs-3.2.0.tar.gz
+sha256  111b286674ab4720fd1b693ef8628a94bca8f06484d5fe3d75bd6db22fdc1cb2  LICENSE.txt
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
index 9a3bd441a9..bfcb578521 100644
--- a/package/physfs/physfs.mk
+++ b/package/physfs/physfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PHYSFS_VERSION = 3.0.2
-PHYSFS_SOURCE = physfs-$(PHYSFS_VERSION).tar.bz2
-PHYSFS_SITE = https://icculus.org/physfs/downloads
+PHYSFS_VERSION = 3.2.0
+PHYSFS_SITE = $(call github,icculus,physfs,release-$(PHYSFS_VERSION))
 
 PHYSFS_LICENSE = Zlib
 PHYSFS_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
