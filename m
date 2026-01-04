Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C8AC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21126076B;
	Sun,  4 Jan 2026 13:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh3d52-HSPGk; Sun,  4 Jan 2026 13:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19F86060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532645;
	bh=cRNyXSd6OOXO8cQMmtXMjVDb0nTX7GtMi0FjKXLKdM0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eGp8Sw1+1s6bd2hbVyj/rGgBj/tOWYg97WrNvleO4eUT26Ed0+i9XHmZFO4j5dv6g
	 D9v8V7l7leDo8Vvf5N7/wDPh+U4ymPPbGmk3cwyaNjshxsn+xsF+8oXq/FjAR0JEtg
	 d/T+QBDgXAGz431jWPDhmrhuzZHn0EvSuC7F4oeSUxGcEmqaupxwNGZh0ZcgFtlIC0
	 m7sUCfJw7Wrkth/69s01s16CP8LitewWtK3JZQPpoQSyAhqRlUiafJMHHp058UEKck
	 5nIRnRgbeYb2JYSeNY9Sj4wl9sPynJTlSDA4XUB1FzLOmeMx4PDj2e02+HvmRuCpik
	 tLyzzteNv8tWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19F86060C;
	Sun,  4 Jan 2026 13:17:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5D52DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCBA06060C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQ8i1hhbCvUc for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16183605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16183605F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16183605F9
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:17:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5F17A4C246C;
 Sun,  4 Jan 2026 14:17:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58796)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcNyw-000000007YI-2LWv;
 Sun, 04 Jan 2026 13:17:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Jan 2026 14:17:16 +0100
Message-ID: <20260104131718.1613605-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767532639;
 bh=MKzLWEogNLaiaTtS0NW8ep3QtHfrBlJ1pgx4TvA1ScE=;
 h=From:To:Cc:Subject:Date:From;
 b=Keyk7bxJ2dwDseVbTZkvSHBFYFGXhaKdhjE0BnDqgzxQ97qPSYD+i1Pi7UgfvL4Ln
 IaNpSgyn0RSA+a3G7Cxxm2J4mKaVTxYTIgAonrUUQ2cYWRWAup1q2JSWwLYphvVuKH
 PlfCrj5K5HGOilpW79oAoNVpFAN73Rw6q8raY4dHUpuxU4RFYB5s45KL3Qmhro5TOb
 2wcsqJ1wT7NyHau1ITfJAnFOONeTR7SEVM3riKz37EBdKtasd0DGOLSPekR9HohbJP
 5ZaFj6yCtVCrlWXT5Ky8OW6u6DIBqOdh6vt2TEnyVuXkdZw7/HOlNP6ORB/AtdeiOp
 zRgI70EOSs34A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Keyk7bxJ
Subject: [Buildroot] [PATCH 1/2] package/zeek: fix build with cmake 4
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

Fixes:
https://autobuild.buildroot.net/results/d92/d92e7280203f62e9baf94161a28b68c3c899e4a0/

The upstream package is currently at version 8.0.4 while the buildroot
package is at 4.1.1. Due to the huge divergation in the codebase the
cmake 4 fix needed to be handcrafted based on upstream commits.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Bump-minimum-cmake-version.patch     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/zeek/0001-Bump-minimum-cmake-version.patch

diff --git a/package/zeek/0001-Bump-minimum-cmake-version.patch b/package/zeek/0001-Bump-minimum-cmake-version.patch
new file mode 100644
index 0000000000..27c453078d
--- /dev/null
+++ b/package/zeek/0001-Bump-minimum-cmake-version.patch
@@ -0,0 +1,42 @@
+From bab553abf0dddc9e8fe90baf4c3b0b7ac5e5bfdd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 4 Jan 2026 13:24:31 +0100
+Subject: [PATCH] Bump minimum cmake version
+
+This commit fixes buildroot errors after cmake was bumped to 4.x.
+
+This upstream commit removed CMP0063:
+https://github.com/zeek/libkqueue/commit/34cc1fea01e2f1d49238e1c58997c09bfa241568
+
+This upstream commit bumped cmake_minimum_required to 3.8.0:
+https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
+
+Upstream: https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 835e211..7b3dadf 100644
+--- a/auxil/libkqueue/CMakeLists.txt
++++ b/auxil/libkqueue/CMakeLists.txt
+@@ -16,13 +16,7 @@
+ 
+ set(PROJECT_VERSION 2.4.0)
+ 
+-cmake_minimum_required(VERSION 3.0)
+-
+-# This policy doesn't exist until version 3.3
+-if (${CMAKE_VERSION} VERSION_EQUAL "3.3" OR
+-    ${CMAKE_VERSION} VERSION_GREATER "3.3")
+-  cmake_policy(SET CMP0063 OLD)
+-endif()
++cmake_minimum_required(VERSION 3.8.0)
+ 
+ # Both variables used in include/sys/libkqueue_version.h.in
+ string(TIMESTAMP PROJECT_VERSION_DATE "%b %d %Y at %H:%M:%S")
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
