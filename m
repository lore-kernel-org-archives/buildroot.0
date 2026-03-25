Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A537109C040
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B602821CE;
	Wed, 25 Mar 2026 18:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEGrUA4AgQrC; Wed, 25 Mar 2026 18:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE948195C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774461692;
	bh=WerWdSEqCJh16nE1KKI4e9jIsaYlar9JOOsLvco5iE0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F4ONiMWjMRSP83BKY9bF5WilGDoG9KFcQeDHpd10yTVOUJTB0u2c/LUkLM5YIQvbJ
	 yUyw3OMTfFMpXxDNzBvIxRvikzjpJxHk/p3uB/EGOGZyqq+Zkb9uXW3FdX/dXAnMjx
	 Obp9PAc3COy3mmJmVqgl3qrC1JryNlngH4yTY/JvBo8Xqt76VHwckkKBcI4pCBscmq
	 +NwAxxw+6EMwcL73s5M5P1IV8jQmIYsOUrQkx4zy3PVIVG2vGTolJzyrS4qXxX5RKA
	 ebja7JIpky7tSDiiqMnomRXFvmsHyLlyJt46ydkyaDesm8SyNYUleCssjtWlI5eOT1
	 V0WuJU0cZ6OTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE948195C;
	Wed, 25 Mar 2026 18:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3299F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CB8400F9
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuaFj4kRbZY0 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 18:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A67C94009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A67C94009E
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A67C94009E
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:01:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 5SXjwl759fibd5SXkwIYs0; Wed, 25 Mar 2026 19:01:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 25 Mar 2026 19:01:22 +0100
Message-ID: <20260325180122.2974279-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC8AGmcoQgLfPgdQdqWU30zs6OVEdRRzUbAIjyAZbMD1ozpkxeC1erF+p5XT31Xe1MbV6Sqz80NPAPs438TeOcETrhOJiSfICUHDVIvFHpxlvDjmWpDw
 mw2pP/LRghful+hibkd1+al28PtH6VciCfhnpFJiyEz2UQcQHu62Ak8LVX8/pZwUm/gyrp83kA5B8x7hsp7FyXVkCsI4Ri6UTiSoX5GFtRdS7whl1oL0R4pZ
 VLPz56tWJoJBG5yx4xJ7ELDnNCO+uchszg+DurPQGvE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774461684; bh=0wPY7auGOlR1YzUjHCTOgkPz4Z89Udm7CBH81+5rOU8=;
 h=From:To:Subject:Date:MIME-Version;
 b=VBq4G2ycXqh/TNcUpuCy2dWn+jVfAboH2n4z4ACo6k//xSuRLW6dTDAAnOEJGIcAY
 ZqbHVnFamG6Yg3nLLNdxpyYIBK4M8FdqAW4XZrjxgLVBTtvadYEGnaXNMKgm1CXDgx
 XZRNlZR+mirNiTuJckBX4Q6NBVFJxuMyafuBpMYzenroWBnyF4oyHvgk8QaurUbE62
 C1bvNUJsNl8JHmys5vdAOPDn3IXZT700ENiOSDZWXRH/Cemri5qKGqqMhlfcMvt3n4
 Np8Dg9sdo1P2Dz1yq+uvcffe+FKGpQl5SZjfIEM9FAIGoN4z7LmxELpYMtdYt4iGL/
 BEJx5J6yCnkqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VBq4G2yc
Subject: [Buildroot] [PATCH] package/bind: security bump to version 9.18.47
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
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/changelog.html

Fixes CVE-2026-1519.

Fixes bug:
GL #5708
https://gitlab.isc.org/isc-projects/bind9/-/issues/5708

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
NOTE: GL #5708 link is reported in changelog.html but it's broken
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4671eab985..09d35a3698 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
+sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e58dcda34d..b889f922b6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.46
+BIND_VERSION = 9.18.47
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
