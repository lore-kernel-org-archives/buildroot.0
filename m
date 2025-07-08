Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E314C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 18:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F5282135;
	Tue,  8 Jul 2025 18:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnsgq_mDvma6; Tue,  8 Jul 2025 18:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 139AB82101
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139AB82101;
	Tue,  8 Jul 2025 18:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A07CB0B
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68DF0820AB
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8DVOzKccH3C for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 18:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 509BA820AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509BA820AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 509BA820AA
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:16:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7c8.dip0.t-ipconnect.de [79.214.199.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21833A4C2DF9
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:16:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41030)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uZCrQ-0000000084i-1xeo
 for buildroot@buildroot.org; Tue, 08 Jul 2025 18:16:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 20:16:08 +0200
Message-Id: <20250708181608.3524627-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751998569;
 bh=0nDugT7lUz0KAO4naf5eNCb0Hj+kIKrBOr4iYu4geq4=;
 h=From:To:Subject:Date:From;
 b=VRfMS+9HH+TrEBGT7AQRtiG8X3ZIctSt5d0hpQGNTYtKLyl2d4PUqEL7+l+A64jim
 iEemOrkabGv5q9AmypTpH7kSxl5+E8AjkaluKx66gweZyTejb22BStYgpQmQxGB7tZ
 Tb694uWZXl7wP3AxQoqnoAOu7kEbXgNrr1qNmn8EcpTw0bAxypWLHICm1OgnBTg0qE
 F4i/KNzbtLKYINGLy7GKWlImSnCPm9zGuUiiDjy/NmKm0U/ruzEM3iYCWrrmXBUf3U
 e5Dqr/7hIFG975Pukv8UBR7vKxnrgolvMWARM7Sz3tnJGQK4RTBFTBQD+HSpInw5eM
 9dxDPInlMdF/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=VRfMS+9H
Subject: [Buildroot] [PATCH] package/samba4: bump version to 4.22.3
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
https://www.samba.org/samba/history/samba-4.22.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e80ad7a87d..069b08feb4 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.22.2.tar.asc
-sha256  d9ac8e224a200159e62c651cf42307dc162212ec25d04eb6800b9a7ccfbcc3c1  samba-4.22.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.3.tar.asc
+sha256  8fd7092629a3596d935cd7567d934979f94272918ec3affd0cc807934ecf22ba  samba-4.22.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e94ff1d441..270a55593b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.22.2
+SAMBA4_VERSION = 4.22.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
