Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE9CC83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 416E860B4C;
	Sun,  6 Jul 2025 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMN9OxU88vcL; Sun,  6 Jul 2025 14:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E9460A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E9460A82;
	Sun,  6 Jul 2025 14:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71CC819C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57CE640A29
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1MyJtcrkTAJ for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ACF940A17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACF940A17
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACF940A17
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:46:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4c9.dip0.t-ipconnect.de [79.214.196.201])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F9B6A4C38D8;
 Sun,  6 Jul 2025 16:46:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35002)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYQdo-0000000075I-1PRN;
 Sun, 06 Jul 2025 14:46:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Sun,  6 Jul 2025 16:46:51 +0200
Message-Id: <20250706144651.1605370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751813212;
 bh=uUdpgwRRk4LVReyUSmuL6MijK/h2dM0FUJ61UZ/oDS8=;
 h=From:To:Cc:Subject:Date:From;
 b=k+kWYUwO4EIT4lnoS8/9lhQVXI1gwFCwTJPwmE6uJgnDCiNJ76ckiX6DRyg+I6rNn
 hxBGlvhjsICJ6HpyFH9M+rYFLVGv7OkDTG6kAzyNZdqnBgmKoFraHq/vQMBKtaAGlY
 9Gd8/2i0Nti6Bd7cBAjWgx4h3DuCLCZgnY8io5f+IVuTEx4ISUEZyQ7gXMw2tTFYoo
 Wknz4icobX5hPC0DhtCVDAguQDRYoYjSUPdqjYxVKqoXSBOV58APrehBbCSozI8DGs
 lLvP9Jrml3TyquAMkDXsJOVH3EQxqXN/B/8J2sJUoswu04o0eXWH/bQp38kRcQNSqH
 T8WA8BwYL8rlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=k+kWYUwO
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.10.1
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

Release notes: https://github.com/znc/znc/blob/znc-1.10.1/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 985849acf8..6ffb5a3917 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  be65ad9b62ef545a7e9486f2f74134edc53ba513ad43a69d9d8b476605336b19  znc-1.10.0.tar.gz
+sha256  4e6e76851dbf2606185972b53ec5decad68fe53b63a56e4df8b8b3c0a6c46800  znc-1.10.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index c0614f3e87..3a0b983b09 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.0
+ZNC_VERSION = 1.10.1
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
