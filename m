Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2D3C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDD2600CA;
	Thu, 11 Apr 2024 17:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-KqpvBIjjNN; Thu, 11 Apr 2024 17:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B94A612A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B94A612A7;
	Thu, 11 Apr 2024 17:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0017E1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1074822EB
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HeS7KV0wW3b for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AE96822E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE96822E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE96822E0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:33:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be10.dip0.t-ipconnect.de [84.161.190.16])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D567A4C317D
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 19:33:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58794)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1ruyIg-000000000hV-2tzh
 for buildroot@buildroot.org; Thu, 11 Apr 2024 17:33:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:33:26 +0200
Message-Id: <20240411173326.2498113-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712856807;
 bh=BUqIpJMwa9LUe3PMK1ScdeeImWZ1+IwieytV27xrMMc=;
 h=From:To:Subject:Date:From;
 b=MLnL2JAN4JxiOksa2ipF+8BxtxpQqjI4WONaZ+v+Bo/z1rewKlX692YmSWRLvra3L
 VVBH+oMJyi0xWfL6j8gsvN3FgZg9Ujs8VdtZoMcKuuUfTVBmOJwJ7EchfPHVy3JBHW
 1Ra3vs07e+vbV410P6+4wpAThDQosmY5rdb3/qxbqw/21DLc5D+0Q/pwTBfhyKTJJJ
 2PvEHXNFMzisPLEIuAcMfKPeC2w8cJjoXVa+S7NO1Qpa6SkmVyIhuJGlufiyE0wTya
 olw6EjxGKor9WfkobhlwS/hz0JRko3RP09wTMG+wZP9HjY4Nb2zf5GogQOrUocSl62
 1SuMLYR7qq5mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=MLnL2JAN
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes: https://www.samba.org/samba/history/samba-4.19.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4e74e07bd0..49ce47705d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.5.tar.asc
-sha256  0e2405b4cec29d0459621f4340a1a74af771ec7cffedff43250cad7f1f87605e  samba-4.19.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.6.tar.asc
+sha256  653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1  samba-4.19.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0980d03175..994037c84b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.5
+SAMBA4_VERSION = 4.19.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
