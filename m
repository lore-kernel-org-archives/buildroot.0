Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C9DC47DDF
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A129D400B9;
	Tue, 30 Jan 2024 13:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A129D400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uL01GgD-XhnL; Tue, 30 Jan 2024 13:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2AD4017A;
	Tue, 30 Jan 2024 13:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2AD4017A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 637BB1BF951
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 13:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D9341B94
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 13:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D9341B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDsFMKsqON96 for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 13:42:40 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D4B41B8F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D4B41B8F
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rUoNl-00BhYK-JR; Tue, 30 Jan 2024 14:42:33 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9d3436f6;
 Tue, 30 Jan 2024 13:42:32 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 15:42:29 +0200
Message-ID: <20240130134232.2781911-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=suXshiOtYq8i57WiSMDASS5Jv0URBad32pB+0DhOiPg=; b=EHz26VjPGB9dRBbF7+ipJo70oC
 BTrPud2OtuGJUe21Pm4AdFD/SH+2EXfwA7tmzu+p0f836EqOmItp9qW0mUIlv62+r0tPNigLJmicc
 Y85sIozOxAMKwQciRGSZws1dXIvdcsFYo5GabNS1aFIPoyjoJOqlhCCbv3VSIKQDQx8wvZgMHqRYw
 N9gyLhCuflrBXndKLYY2ybfeBW50M5oElQe/1HLLIatAA5TrqpoQ6iQ1kBc22aDKPnHLJ8107h6V+
 LVKMX0nj8QQg1OicC6fZ4fcP4RPsz/SiTBHvABxtrqh02uyzlZ0qxaoesVZ9bCShrihHpLe2JBljW
 Icp+rvnA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=EHz26VjP
Subject: [Buildroot] [PATCH] package/libpsl: bump to version 0.21.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The main changes are improvements to the Meson build system, including
a fix for a build issue related to iconv:

  https://github.com/rockdaboot/libpsl/releases/tag/0.21.3
  https://github.com/rockdaboot/libpsl/releases/tag/0.21.4
  https://github.com/rockdaboot/libpsl/releases/tag/0.21.5

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libpsl/libpsl.hash | 2 +-
 package/libpsl/libpsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index a35a609ff2..d800ba6a77 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f  libpsl-0.21.2.tar.gz
+sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
 
 # Hashes for license files:
 sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index ef3c524b4f..d1a12f864c 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.2
+LIBPSL_VERSION = 0.21.5
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
