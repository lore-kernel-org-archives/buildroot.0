Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF65C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F74660723;
	Sat, 10 Aug 2024 17:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_A0c0qvHCa4; Sat, 10 Aug 2024 17:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6687B60729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6687B60729;
	Sat, 10 Aug 2024 17:46:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B13291BF831
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA7EB812E9
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCGy-gs6Ac0r for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 17:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E81B812CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E81B812CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E81B812CF
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:46:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5ed.dip0.t-ipconnect.de [84.161.181.237])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B03CA4C03FE
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 19:46:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36280)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1scqAw-000000005X3-15K7
 for buildroot@buildroot.org; Sat, 10 Aug 2024 17:46:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 19:46:45 +0200
Message-Id: <20240810174645.709425-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723312006;
 bh=nmPg5KpfPWNo4KTEX3SVwGCWt7m4CuB1qZ6+aukgJPY=;
 h=From:To:Subject:Date:From;
 b=hmbu7VD+9OLMYPspVZ0HRfMnAl4s+Qsdl7magJYff2xnGrvEvOw3iYRRPKTiXdzcF
 a1aV/JP7reqq+hZvFX41/IEpEmd8vrlXNE09oz1OawZl5YECmWFB5vBGKvjwHIvFp5
 1Hu0DmsmnP+0tWAydK1bU0PefyThqM/DQIvwrR9s2Y3K3KGaU1i6pAVrvERWqpqOTR
 LaVonzv2hJvJzQzf2BqO2shWtKJnBjHGaVLfiQKFOr/1ukRxm469xxoxUM+Ysx6nP/
 GqVD5/42y3xuBIrJ+QVPRbVC3rceTssKEHuhCg+NioJHgmoUW7OREtWjujpQutuK+1
 1i8GZl6RbnF8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=hmbu7VD+
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump version to
 3.8.6
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

Version 3.8.4 fixes CVE-2024-28834 & CVE-2024-28835.

Release notes:
3.8.4: https://lists.gnupg.org/pipermail/gnutls-help/2024-March/004845.html
3.8.5: https://lists.gnupg.org/pipermail/gnutls-help/2024-April/004846.html
3.8.6: https://lists.gnupg.org/pipermail/gnutls-help/2024-July/004848.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 47fb34ea7c..d9f830ec92 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.3.tar.xz.sig
-sha256  f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e  gnutls-3.8.3.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.6.tar.xz.sig
+sha256  2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5dd61a7e81e0ebcdd  gnutls-3.8.6.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index eae017aac2..479922ee5d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
