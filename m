Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D39E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0060881FBA;
	Wed, 11 Dec 2024 19:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBtOjxQ3mL3v; Wed, 11 Dec 2024 19:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1859E81FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1859E81FBE;
	Wed, 11 Dec 2024 19:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0918962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ADF742F61
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNSJzzbelwhA for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35C6240104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C6240104
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35C6240104
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BAA5A4C2545
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:28:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37262)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSNt-0000000050r-2oz8
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:28:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:28:33 +0100
Message-Id: <20241211192833.1661364-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945314;
 bh=7+0tAwuolXHX9bHQ+VzNNbxWTGC8LlXu//eY5gpmXN8=;
 h=From:To:Subject:Date:From;
 b=dweUhhgqg7igchqiCFzOaANFx5jWD4l1PROmMiqPa7PNDu/sHzdk15ndNI5Wv/vQz
 nSiLG1HK1PpeoQxuzBW825Aken+2xuAhuDmX/lTkzTpq3yj9pt3vGeC4UGWF9fQWwC
 pn1cPAaZ2+5aj8mlZjnlxNrpdO51jWGr/IQw3pTiBqHlQzHlQsMMYYmaHyM+WCmlwz
 xuTZ080hbsvGKOZwtneWgbvot4mY7FGxvrICPOc/VY2oVsA9uOgwjRm6O7whaVk+xT
 3i1Tntk1xkWiEdBhmvlwrawjuRIvXkiD6wvoIGiRD9hnppJo77iumUiueXQ8gIiR8L
 oiCNNdqpgeNpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=dweUhhgq
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.6
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

Release notes: https://www.samba.org/samba/history/samba-4.20.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 2c867a03bf..cf97560e54 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.5.tar.asc
-sha256  0697a8a57ff8b268cc268d508ee4f9ec86fd82350e84eba47a709242b71f6962  samba-4.20.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.6.tar.asc
+sha256  8fe37f9e7817b6583fa55a0a15568b8e6be8875513741312ef805484b102ccf7  samba-4.20.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4cece4b477..e5b348a3b7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.5
+SAMBA4_VERSION = 4.20.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
