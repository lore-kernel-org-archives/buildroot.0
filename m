Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DD8C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5562281B7B;
	Sun, 18 May 2025 17:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mubRBB0npUny; Sun, 18 May 2025 17:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8258081BCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8258081BCF;
	Sun, 18 May 2025 17:36:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D106C1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C17B24047E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsaqP99wnHVV for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F34F74030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F34F74030C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F34F74030C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D5ECA4C2059;
 Sun, 18 May 2025 19:35:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53470)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGhvZ-0000000023b-1RZY;
 Sun, 18 May 2025 17:35:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 May 2025 19:35:57 +0200
Message-Id: <20250518173557.2147691-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747589758;
 bh=snHZWktY+QLqGZWpqgA2UmgWdEqvrcApV+0KfdX/f+M=;
 h=From:To:Cc:Subject:Date:From;
 b=irEdJ78l/mI8cYQLWUJ0svRCOxrYQBGbf+4FldUwIhnaZNKZRKXw/Xx2xQivkggz7
 Iu+Z7FBvzOnrCFb4PZ+5A4s/kPq1O3RvFwlcz07yX9SvtrgWVgFxwFdAheiVwELxBj
 f7or4SdUxRnkKxdD6QdWWWaTeCjmzhU5DjEilHXSSVeZYvQIwWtMzPjIcRccYokRQD
 DtirC58NfqxlI9thoAH+X+gB2lwPhJfG+ZLeyV3DtNSGStqCh9PjFKxpeCZ28Pglt0
 WJ0RHsLnsdUgIscHzS7vgjGOdBQdtgau6rgWx74dh7lT4prG1wJKe1ILRduzk8JfVD
 aExtYvGlwVZWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=irEdJ78l
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: bump version to 6.9.10
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
https://github.com/kkos/oniguruma/releases/tag/v6.9.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index ac1d375b7a..be49a4d4e7 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.9/onig-6.9.9.tar.gz.sha256
-sha256  60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf  onig-6.9.9.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.10/onig-6.9.10.tar.gz.sha256
+sha256  2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05  onig-6.9.10.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index e056048cb5..32eff4cc75 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.9
+ONIGURUMA_VERSION = 6.9.10
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
