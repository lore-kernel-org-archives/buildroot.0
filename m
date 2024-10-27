Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CF1D13586
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 20:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D483F401E1;
	Sun, 27 Oct 2024 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbTa1bg-D-rV; Sun, 27 Oct 2024 20:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE4AF402A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4AF402A9;
	Sun, 27 Oct 2024 20:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6D25124
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4844056D
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CM0Tcx65EBV for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 20:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EB7340562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB7340562
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EB7340562
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:42:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CF53A4C0D00
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:42:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40378)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5A5X-000000001IZ-1XG3
 for buildroot@buildroot.org; Sun, 27 Oct 2024 20:42:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 21:42:15 +0100
Message-Id: <20241027204215.3416364-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730061736;
 bh=/9dhmStmX4WgGFm2IEy3pCff8H6qKvY8C5XZTG9sjWg=;
 h=From:To:Subject:Date:From;
 b=A+ZapUMswAU07WDajWWb8tOELdxPtOIfdLOZ3wRlmQDSxBQazy1SIyxj3zRui6cb+
 1YZYZFqN9qXnLGVE4DXV286hO+bdSJsU+W8W7JqVQhvZIO38HblBtycsfPNIzWtoCr
 GAKYKrpJgUgjcBGCROCxZy6Fxx6pSy5ozuG03KPppPWXZXLgAt8gYKuxuwXOCr+5Ki
 oBR1053REe6NmwLnl4ku+Xv6Cn9N/vJ6P/a/ntV3diHrJpXPqHx4kHUTJlyba3xIan
 sJMIVkgRVKZ/SPyk5v5mErMeyRHLAehlrzVTBL7aimZ4BrW04d2udBj4A1rGntK2Kh
 Hi0OhicAQ3o9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=A+ZapUMs
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.22.1
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index b7d201a1db..b9d3cc387c 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a5b047cbbb67e508fd5c2cfb75e138d36b1eb19aaadcbe59a5034ca9af0ebb0  xmrig-6.22.0.tar.gz
+sha256  189e4bf604f8b569cd15894439a4ad0209b64184c8ccb5a2119a4f07c16da448  xmrig-6.22.1.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index b83ed7dae8..83d9636643 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.22.0
+XMRIG_VERSION = 6.22.1
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
