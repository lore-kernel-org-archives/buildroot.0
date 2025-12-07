Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E8FD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F278660A39;
	Sun,  7 Dec 2025 14:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYqgPYo9Bd49; Sun,  7 Dec 2025 14:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2784606D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117766;
	bh=cTe4VTi12qZwnJ9gijK9ql566ZdT9u7qGV91L+Ngue0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Efu2aTMutjUYzxgNzoGv2L/naGrO3ungRR64j5OLkfmn7A18tn/obpc18flk/VoMB
	 7AiTTgGLtsVbBqow1Rxo+0pY/Re/fSOAElmfcbbEtOFtFD/PLS4wz74KNQEsXy3yTs
	 QFtvMH594MB4sRM0HL1l9JELcyc9wZCxjI69tjndnrs83EdYabwwq8yArBgFPIgCFm
	 HUQvzKF3vAxe1OubjCuRVsyJjAD6qen+CpXgianzKras8ykBS8oE2dbuVD6KiCBDFO
	 N7wZevJI9P3a25pgeSRCUV/nwDr+uu1+jgxX98PWpUF6J/ATXAfAPvpDSQI5c+rGQ6
	 2hBaNDsD3R85Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2784606D9;
	Sun,  7 Dec 2025 14:29:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 773402CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6900140259
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEVoKk2EQ0Jo for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 491A940166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 491A940166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 491A940166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 223C3A4C07F4;
 Sun,  7 Dec 2025 15:27:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFiu-000000001Fk-05R2;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:49 +0100
Message-ID: <20251207142651.3695074-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117621;
 bh=nWXz1hg2RxkXd0XbIynzFjo2YQHG2oeNAr5OjH7sgHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EjcqHJrcZhElMBAgEcXlIp/L+axCUybYUnGOgu+6xn/c+huZKaQTB/PVjnkBoBQnx
 4bbHjZkzEhOMftBZzDjjLoZ0P6jzFmsES5BCTlLjLtbdrcGdAJAHndr2LD7uW+Lycn
 sqm1vUfE6EdTYmKF4NZUrjaxzEelZB7UNzxe6+5CniErfqzX7FoaSe4s4R8ADpJBdd
 0SvuqDoyS/l8YEcJWap8jTzCpSaaH4tT8D1aAkPntRL2ViM7jf/S4Sf6cmsSv+dQlD
 mhDtqF3fM/Nu2Wfw5/R0pNNW1uZGbq+OjNJiAaE6n2hRkJvrYhLcjwY9ul1e6rV4Hr
 wL41uqxzUXPwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EjcqHJrc
Subject: [Buildroot] [PATCH/next 12/14] package/yaml-cpp: fix cmake 4
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
 ...y-range-to-avoid-deprecation-warning.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch

diff --git a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
new file mode 100644
index 0000000000..6ab3df96cf
--- /dev/null
+++ b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
@@ -0,0 +1,26 @@
+From c2680200486572baf8221ba052ef50b58ecd816e Mon Sep 17 00:00:00 2001
+From: Craig Scott <craig.scott@crascit.com>
+Date: Thu, 17 Aug 2023 08:54:05 +1000
+Subject: [PATCH] Specify CMake policy range to avoid deprecation warning
+ (#1211)
+
+Upstream: https://github.com/jbeder/yaml-cpp/commit/c2680200486572baf8221ba052ef50b58ecd816e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 46dc18059..1ae92e2b7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+-# 3.5 is actually available almost everywhere, but this a good minimum
+-cmake_minimum_required(VERSION 3.4)
++# 3.5 is actually available almost everywhere, but this a good minimum.
++# 3.14 as the upper policy limit avoids CMake deprecation warnings.
++cmake_minimum_required(VERSION 3.4...3.14)
+ 
+ # enable MSVC_RUNTIME_LIBRARY target property
+ # see https://cmake.org/cmake/help/latest/policy/CMP0091.html
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
