Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6BFCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1104129C;
	Fri,  3 Oct 2025 20:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6v0FdEBp0ZC; Fri,  3 Oct 2025 20:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FA641271
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FA641271;
	Fri,  3 Oct 2025 20:14:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 087EF226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D0440E91
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoEbyt_xwp45 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E950B400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E950B400E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E950B400E2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D08DA4C5BC6;
 Fri,  3 Oct 2025 22:14:24 +0200 (CEST)
Received: from [192.168.1.144] (port=51360 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4mAZ-000000007jX-2qPr;
 Fri, 03 Oct 2025 20:14:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:14:23 +0200
Message-ID: <20251003201423.2430485-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522464;
 bh=ykkL9u8ODY7P8BngcYMffIYSHUejnPbyMm9UQXQ+k+w=;
 h=From:To:Cc:Subject:Date:From;
 b=wyoW5x+N3ylwBNsRj6PeXB8w+oMPG2PgWxxGX64uHUXwnDS7X+4QUmthVrIXFEzBx
 BY1uT1qW0LIr5cygP7nwy1lno2KfIqheLpeqOCod4LN/h1/FBJlwaXGIpEENBu1BNA
 fg5qxadCrk//VXegJzEr7PfMKEGzfF1gD3O8x3U3CqnElHF434LA1M62Tzj+uc8X2C
 U8zdSGkIMzDs37LmQg0Bw+C+b06BCPa8mp3WF5YYbEc9mi49e0rjouqGU/LZ+36QP/
 MAOjkvM9CoIGdfWcXl6xQjcmkOBhTmVlcpoBAVfGoOxitzrJTrQq/W28HKJGl4dCoG
 eo4SnwnmZXxjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=wyoW5x+N
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.17
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

Release notes:
https://github.com/strace/strace/releases/tag/v6.17

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 515d1d296c..f6833d08f0 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.16/strace-6.16.tar.xz.asc
-sha256  3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa  strace-6.16.tar.xz
+# https://strace.io/files/6.17/strace-6.17.tar.xz.asc
+sha256  0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0  strace-6.17.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index aaa1b5b830..c693d15bf9 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.16
+STRACE_VERSION = 6.17
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
