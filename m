Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37729D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E981607AA;
	Sun,  7 Dec 2025 18:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRUYre4kxDln; Sun,  7 Dec 2025 18:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668C1606EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765130980;
	bh=KamEe3S+bKqxPiiVXW8TqqEaCzn5tzaMWmbb88y8vOE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UM8ON/nuFlIFDzxY1utQuSAA/a/VmpP5AM9qCc91s1GCtpRQAWEBPGQboZtk9fv8m
	 NyDbvier3TilX+diPTrPalhWowbVlvavDzLIXH1akh5lVNvEH6MBmy1PUvhpr60xaz
	 iyqNfUCsvRp8b4ob8r76T1Fh5vhT7706jwac/sq/jYpGRkEZZaGie6QcG5dMWdwDuD
	 mxLsyO+OQw2TL7jKfuwDrK+/mukPO3tjRmV9uN5zwIVR/y/uiJ8HYdxUA4iGhSVtV0
	 Id+VpiHSQWdsndNEN3n8C838YY+inYdBV6Q7ilh2wULngtGNh3lkQF1euVgeaFeP4F
	 HbcGI44eAMHvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668C1606EA;
	Sun,  7 Dec 2025 18:09:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC067E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE03404B8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdtVWjMV_eo5 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B95C404A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B95C404A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B95C404A0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:09:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08AC4A4C00E1;
 Sun,  7 Dec 2025 19:09:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJ6U-000000005mO-3jl3;
 Sun, 07 Dec 2025 18:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Sun,  7 Dec 2025 19:03:25 +0100
Message-ID: <20251207180325.25243-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207180325.25243-1-bernd@kuhls.net>
References: <20251207180325.25243-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765130976;
 bh=IXydTKnrkvmirJpVfaR2nKtE14MiWqbwQlQMVctKtiw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pk23PumHAkRbzOC0jBP/tZNsPaDi2AS5ES8UzHL88QNMxjoZz5M6q+pQmwaDQqgZG
 eCZHNyZX2l4I+2U9cs/Iv9ecIVzdMUZsVCLu/19jddE5CqxUVFg5Nw6nMPBNI7N9gF
 1P1Jqr0LoVjvFzDRCyRzYvPl7LVMrO72O6rvlQzB9gjN5dzxhZ1MO22z54r7GANYpM
 OQLwKuEpJbCbXUR9DjmkFx4oz1YNKdKsV1SK+7XcJ65ggdsZd/qfBYFlfAH3g9UJHJ
 hyBF1PiLle4Vmq2luazpJtyU63VJmp4RamSFkhZ9RItMb+AQgQhIRPrstgpLsE8lWl
 gJ+YYa7jnd/uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pk23PumH
Subject: [Buildroot] [PATCH/next v3 4/4] package/libvncserver: fix cmake 4
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
v3: no changes
v2: no changes

 ...001-CMake-require-at-least-CMake-3.5.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch

diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
new file mode 100644
index 0000000000..e7b30e3db6
--- /dev/null
+++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -0,0 +1,26 @@
+From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
+Date: Tue, 13 May 2025 08:37:07 +0300
+Subject: [PATCH] CMake: require at least CMake 3.5
+
+CMake 4 dropped support for version requirements < 3.5.
+
+Fixes building with CMake >= 4.
+
+Upstream: https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 205f3928..9b8118c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ set(PROJECT_LANGUAGES C)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
