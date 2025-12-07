Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD89D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D654066D;
	Sun,  7 Dec 2025 14:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhkdGMrJc4bH; Sun,  7 Dec 2025 14:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B142E4068A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117778;
	bh=a3zcTd5OHSMBdEqtyRqSUKmwlytOJDBu0acb9lPMhNo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgutfd3ra3yFwmr57ui1I4+CHdU02s/Lhobj34gQojHbpYEaX5JjnyGobInp6NGJe
	 1Jb0yvW5ZZJAe1FZiHRdG172jADIPl6YV3cZGjpeCVprubocYWuMGPOryCQQPLYoGs
	 oqR0TUL0pJi3sRrXdr5eQHLj9BkCOaatznvUTP/mJof4N1qVZxgdgUq/VAiBmydS88
	 OOMSh+OfS+cKHeZwm5mT02PMTiGZgiZVbgzxruOGyZHW77pJyHbM7vdPlwE1Ag1DSN
	 jTT1tEACiJVpyWoZD8aY6RmZbSF0gumHxU999NZuPh8T0o6slimddfBKmPGtIOBejV
	 cZWHvqoxtVrRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B142E4068A;
	Sun,  7 Dec 2025 14:29:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB15DE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C22474069D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeDvg6tWy-Jy for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B26DB4068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26DB4068A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B26DB4068A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 596AFA4C09A8;
 Sun,  7 Dec 2025 15:27:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFiu-000000001Fk-0iyy;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:51 +0100
Message-ID: <20251207142651.3695074-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117621;
 bh=RkjoEatte++MiQLltCpzUq/S/9BrYrHel672jSYPHuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SULPAvRXs90Yn4CIhKvykeoRdvrDjG0MRzl4ORxMrPw7kxB6M0UzzO2cOlpgBVAN5
 RsVwSQcGXqBjfuYmzZ9cVGaSJkCYqmNuJCY0yEcBxoBd+Sr2Tzg4/fK6g8KK3lCKpH
 5sM/d3tzKwqY482EUASr58FGu2tplw/5Byaz1QZtdq04VrqiAGzyXyyR7dJjCwnd/g
 fdc3C8yjZetBAO/KwrNuFirwlPVDgUJ7P0ZKlffdIvW4WBjhnlt1vZi3GcF0dQWyM9
 8pjlgzuXR4D6yNkvGyM4VXt9vza4SLIq8zqICxKAj6rMj8GLGO+pR3iS7INz7PHgvp
 8IGT0ih80JEHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SULPAvRX
Subject: [Buildroot] [PATCH/next 14/14] package/zynaddsubfx: fix cmake 4
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
 package/zynaddsubfx/0003-CMake-cleanup.patch  | 39 +++++++++++++++++++
 .../0004-Modernize-CMakeLists.patch           | 24 ++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 package/zynaddsubfx/0003-CMake-cleanup.patch
 create mode 100644 package/zynaddsubfx/0004-Modernize-CMakeLists.patch

diff --git a/package/zynaddsubfx/0003-CMake-cleanup.patch b/package/zynaddsubfx/0003-CMake-cleanup.patch
new file mode 100644
index 0000000000..b8ced14b17
--- /dev/null
+++ b/package/zynaddsubfx/0003-CMake-cleanup.patch
@@ -0,0 +1,39 @@
+From ffe9ca1375168dd86c974dbe7c0264fce393150e Mon Sep 17 00:00:00 2001
+From: Johannes Lorenz <j.git@lorenz-ho.me>
+Date: Sun, 29 Dec 2024 03:22:44 +0100
+Subject: [PATCH] Add -Werror support, CMake cleanup
+
+* Raise CMake minimum version to 3.5 (due to deprecation warnings)
+
+Upstream: https://github.com/zynaddsubfx/zynaddsubfx/commit/ffe9ca1375168dd86c974dbe7c0264fce393150e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only cmake_minimum_required bump to 3.0.6]
+---
+ .github/workflows/ccpp.yml |  2 +-
+ CMakeLists.txt             |  3 +-
+ rtosc                      |  2 +-
+ src/CMakeLists.txt         | 57 +++++++++++++++++++-------------------
+ src/Misc/MiddleWare.cpp    |  4 ++-
+ src/UI/MasterUI.fl         |  6 ++--
+ src/UI/OscilGenUI.fl       |  4 +--
+ src/UI/PartUI.fl           |  6 ++--
+ src/UI/SUBnoteUI.fl        |  4 +--
+ 9 files changed, 45 insertions(+), 43 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e678d939c..9bae0b40d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,9 +1,10 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
+ project(zynaddsubfx)
+ set(VERSION_MAJOR "3")
+ set(VERSION_MINOR "0")
+ set(VERSION_REVISION "6")
++cmake_policy(SET CMP0072 NEW)
+ 
+ #Set data directory, if any
+ if(DEFINED ZYN_DATADIR)
diff --git a/package/zynaddsubfx/0004-Modernize-CMakeLists.patch b/package/zynaddsubfx/0004-Modernize-CMakeLists.patch
new file mode 100644
index 0000000000..3b2ccfd13e
--- /dev/null
+++ b/package/zynaddsubfx/0004-Modernize-CMakeLists.patch
@@ -0,0 +1,24 @@
+From c00fdb161004e06e52ef46ba921014bd15b1601b Mon Sep 17 00:00:00 2001
+From: fundamental <mark.d.mccurry@gmail.com>
+Date: Sat, 4 Nov 2023 16:32:42 +0100
+Subject: [PATCH] Modernize CMakeLists
+
+Upstream: https://github.com/fundamental/rtosc/commit/c00fdb161004e06e52ef46ba921014bd15b1601b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only cmake_minimum_required bump]
+---
+ CMakeLists.txt           | 276 +++++++++++++++++----------------------
+ cmake/ColorMessage.cmake |  15 ++-
+ 2 files changed, 131 insertions(+), 160 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e62af32..33d80ac 100644
+--- a/rtosc/CMakeLists.txt
++++ b/rtosc/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(RTOSC)
+ 
+ set(VERSION_MAJOR 0)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
