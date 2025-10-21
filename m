Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F5BCCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 036898235A;
	Tue, 21 Oct 2025 20:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Tk33yNkgIX4; Tue, 21 Oct 2025 20:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E94480892
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E94480892;
	Tue, 21 Oct 2025 20:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A984277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EECCC40440
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCouT_gV40fZ for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FFB94043D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FFB94043D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FFB94043D
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:08:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52C3AA4C2DA3;
 Tue, 21 Oct 2025 22:08:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vBIea-000000002Lh-1MD6;
 Tue, 21 Oct 2025 20:08:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 21 Oct 2025 22:08:19 +0200
Message-ID: <20251021200819.548265-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761077300;
 bh=uR+5vDvVYcmBwo+pqYAiN4rpWUwoW3q+k2a5d7oDMoc=;
 h=From:To:Cc:Subject:Date:From;
 b=CWtTESqlubXRTv68BuKa+A5E9DxhxE99nPHc5Q1VwbRcO49CtsZsfVkt74WP+8J+E
 e7e2rwVXYCuP4h1C/bDOHVRb+zpeC05ROuWvOTn01LaZ8o3paiz9ASdrUQ0vnHyxhp
 Zqif80H7Pj9nTVNYFiumEHw6vtorv3UtS5t12qMkD4pMhiTqHzp0abKIqwhX6XfmcR
 xVr14LMMZYyZx2DQ+1os6PHP8gdyovh3lhmfxjoeTn0HsXo0pFg5WqYA/ls/xibtVA
 psBQYjSP6geUixi0PSJRplLEeT6AkFEQBXYqvLTZlfbNk74ZcYtke7EQObYznfjxYK
 ibm79zEOiSN7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=CWtTESql
Subject: [Buildroot] [PATCH 1/1] package/libucontext: bump version to 1.3.3
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

Changelog:
https://github.com/kaniini/libucontext/blob/libucontext-1.3.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libucontext/libucontext.hash | 2 +-
 package/libucontext/libucontext.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libucontext/libucontext.hash b/package/libucontext/libucontext.hash
index a8e1e23e36..dc6ef3dfb1 100644
--- a/package/libucontext/libucontext.hash
+++ b/package/libucontext/libucontext.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3  libucontext-1.2.tar.gz
+sha256  06fca63bc00a236ea7e2ce4fe984d7203b1f9ea046f5c8c815d280da4ea281e3  libucontext-1.3.3.tar.gz
 # License files, locally calculated
 sha256  ecf4be354bbb6ccebdf150d1a8f2b3caeb10cf7c8a580f278a30799372f9e037  LICENSE
diff --git a/package/libucontext/libucontext.mk b/package/libucontext/libucontext.mk
index 75c4f9b9e4..64ffa2ec37 100644
--- a/package/libucontext/libucontext.mk
+++ b/package/libucontext/libucontext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCONTEXT_VERSION = 1.2
+LIBUCONTEXT_VERSION = 1.3.3
 LIBUCONTEXT_SITE = $(call github,kaniini,libucontext,libucontext-$(LIBUCONTEXT_VERSION))
 LIBUCONTEXT_LICENSE = ISC
 LIBUCONTEXT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
