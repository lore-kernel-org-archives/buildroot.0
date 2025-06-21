Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCDDC7115C
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 17:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB0060715;
	Sat, 21 Jun 2025 17:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JI1wdpyskmbg; Sat, 21 Jun 2025 17:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F1F606F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F1F606F8;
	Sat, 21 Jun 2025 17:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 416B2154
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2799E8195C
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3PqZP8zxYxv for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 17:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F8FC8194C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8FC8194C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F8FC8194C
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:32:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6538FA4C2537;
 Sat, 21 Jun 2025 19:31:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uT24M-0000000082o-26MB;
 Sat, 21 Jun 2025 17:31:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 21 Jun 2025 19:31:57 +0200
Message-Id: <20250621173157.4048801-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750527118;
 bh=i0SzIR8VO1w2aOOQe+/Jj0iLh+ZVc7jnX3Wh8PsIJ5k=;
 h=From:To:Cc:Subject:Date:From;
 b=YiriTFqhtMpWVcY1O0b7tTYsGazaIuCQCpgSAfCDPvqWZzjzoIENvgw0voHDQV7Y7
 EujkgVO/p68tsBWTEs4E1qdk26HU+bpWlUvy2E50EHApryHtQ++NWn1FoJm/pNBOqS
 xolwsGcPyi3ObVC2eqW7O8j0aF77EsD/zxSMLScyaMFeBBJbCF9wPl5jc3wDRz/B7b
 owWi9tljrXmtQ04ghDsH+vjO9H9mJPoO+Tma29zLmaaB34Po4K4/+otEaj6OsXYq1h
 m3CZ4XDpUTxDgPZr+Pl9APiBDHWhoMFxZqSmlwT7zfnFITPB2dVpNZV9fP+xZ8HUO4
 s+1AKq6cmDUlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=YiriTFqh
Subject: [Buildroot] [PATCH 1/1] package/squeezelite: bump version
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

Update license hash due to various copyright year bumps:
https://github.com/ralph-irving/squeezelite/commits/master/LICENSE.txt

This version bump is needed for compatibility with the upcoming bump of
ffmpeg to version 7.1.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/squeezelite/squeezelite.hash | 4 ++--
 package/squeezelite/squeezelite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squeezelite/squeezelite.hash b/package/squeezelite/squeezelite.hash
index 67ed4c8797..62cbe025fe 100644
--- a/package/squeezelite/squeezelite.hash
+++ b/package/squeezelite/squeezelite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f0342f4943d3c3498d930060f5a1e8d63ccb7282b9c21f964926e310449d592  squeezelite-71c012ad9ba102feb95823b7b9dc17e5305689c7.tar.gz
-sha256  dc01c3da33fea11ed918f9e437b88baa59c70401aab0dad747e33dd9e8035706  LICENSE.txt
+sha256  dae15fe640111895c99a3aa561a3448d3ce43ab695c2006828e621c51023b588  squeezelite-72e1fd8abfa9b2f8e9636f033247526920878718.tar.gz
+sha256  6c9ecc7ee5e0a793b04669128191cf1f250b4e9dc6e1130aa050619b39ab71d0  LICENSE.txt
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b0347c4df9..40fc6df411 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUEEZELITE_VERSION = 71c012ad9ba102feb95823b7b9dc17e5305689c7
+SQUEEZELITE_VERSION = 72e1fd8abfa9b2f8e9636f033247526920878718
 SQUEEZELITE_SITE = $(call github,ralph-irving,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPL-3.0
 SQUEEZELITE_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
