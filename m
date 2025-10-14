Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627E9CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 19:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B35183DE2;
	Tue, 14 Oct 2025 19:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1bzlfLq5WYX; Tue, 14 Oct 2025 19:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3C883E02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C3C883E02;
	Tue, 14 Oct 2025 19:08:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3269B4C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F9F7612FC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeJJehHTk7XO for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 19:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 471CF6109B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471CF6109B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 471CF6109B
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:08:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 434E9A4C6B1E
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:08:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49292)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8kOA-000000006yL-2eCy
 for buildroot@buildroot.org; Tue, 14 Oct 2025 19:08:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 21:08:50 +0200
Message-ID: <20251014190850.3594120-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760468931;
 bh=azix+jSuvRLGAVcHm6KBAD5cUzOT6HWDg1JhX1yNLmA=;
 h=From:To:Subject:Date:From;
 b=ePt5FCY2Ut6USqodbx2c6jqmz4oYPfraoJp2fdvzQLUz46iXx/j2Tli4TQlqugpRk
 K7lrj/PMX6WzH96nJbPz6K8zR6ple7mfj6wYi3pjedaYYrx9iENxTP67LbCYWThdee
 JkkysQoULWm1JwdAxbMXqD4ZboxolkRf5QYUvnbconJXakwqEKk4VH8YRDyxvHewb/
 qHzhXzDkBjjGXOPUUlUnvO14c0+AiFjuNBzc7sv2lZEt4BdVRTmfhms7BT0g/FleUw
 lhLvxfhZXY3r+LFAwTW/A7/v1GN20r85XmiXcFsmh/aZzQjMuP/GLfJPQBzlTJi9RC
 Jlx/VQHVfN2ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ePt5FCY2
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.127
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
https://lists.x.org/archives/xorg-announce/2025-October/003634.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 67a66ece0d..22fb8a039d 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-October/003632.html
-sha256  6cab16d4d259b6abc9f485233863454114a3c307eca806679aad3edbe967bf42  libdrm-2.4.126.tar.xz
-sha512  7cf2e2904025165562f0bf56faa57f3c3cca6f739c2afc299952bcb7bb1dcb86554c8060a7dbe070f2100d036b0ece615e0a55d9df00885679ae30b7e6ef0f0b  libdrm-2.4.126.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-October/003634.html
+sha256  051aeb3e542a57621018ffc443fb088dd69b78eef0ce4808b604ce0feac9f47f  libdrm-2.4.127.tar.xz
+sha512  2b1e9bdc864d1d8b890763a5154708bd44ee0cab5cb9156a7ec473d1d83b9fae7f4f66f660a68a3d1839ecca010163439c9991d9360f9be03be7ed8823a73ec6  libdrm-2.4.127.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 89a1a16eef..c2350dec57 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.126
+LIBDRM_VERSION = 2.4.127
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
