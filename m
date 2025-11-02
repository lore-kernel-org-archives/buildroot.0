Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65444CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 12:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139CC414B4;
	Sun,  2 Nov 2025 12:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfW1Z3962taP; Sun,  2 Nov 2025 12:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314DC41480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314DC41480;
	Sun,  2 Nov 2025 12:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C728E436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B933241060
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxVFxh8uMSL3 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 12:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91F83408FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F83408FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F83408FA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:45:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9660A4C5F32
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:45:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50676)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFXSM-000000001La-3FdQ
 for buildroot@buildroot.org; Sun, 02 Nov 2025 12:45:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 13:45:14 +0100
Message-ID: <20251102124514.2343128-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762087514;
 bh=W43GxcpVXPtJ3tip0f5wawc0JfjFBLaaVKFAXKkrAO4=;
 h=From:To:Subject:Date:From;
 b=sDxwgCYyoHd5GHLL+c0nlcMw+Hu7xpADnEy+n9LaK/bVNgE8f443TqyrTHxqJ1g5o
 K40zOB3mHF++rQnS3ieO5b/MIAZmrsXQh/epk6a6UtakDIXDWOrBvKzhltDbGGMsaZ
 u+c2uj1V9DjFPsxacKLzsQcyyofG0Y8y6f1ZuZrvKzMHe02m4SB8GeoFjg3pef8oXL
 hoh72LOltZEGeVyJ6+qHrG/zAVvM/uE81sq6/jVXE9iyNo4QaIhVZl/rtc/5g08u/A
 eCogsgNAiuHps3QVM5+PYh6566Lq+53GaHqFyWJRljMfd2ciMAS57j0VattsmmY13P
 koBNMyBShFnDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=sDxwgCYy
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.128
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
https://lists.x.org/archives/xorg-announce/2025-November/003639.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please do not postpone this bump to 2026.02, quoting release notes:
"Versions 2.4.126 and 2.4.127 contain an ABI breakage in libdrm_amdgpu.
 [...] It's recommended to never package versions 2.4.126 and 2.4.127."

Both versions were added to buildroot after 2025.08 was released:
https://github.com/buildroot/buildroot/commits/2025.08.x/package/libdrm

 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 22fb8a039d..357f7d1366 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-October/003634.html
-sha256  051aeb3e542a57621018ffc443fb088dd69b78eef0ce4808b604ce0feac9f47f  libdrm-2.4.127.tar.xz
-sha512  2b1e9bdc864d1d8b890763a5154708bd44ee0cab5cb9156a7ec473d1d83b9fae7f4f66f660a68a3d1839ecca010163439c9991d9360f9be03be7ed8823a73ec6  libdrm-2.4.127.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-November/003639.html
+sha256  3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac  libdrm-2.4.128.tar.xz
+sha512  b80e6be1c9d0427e1c3ffd018213d7230333f037498cf98819a8a6c50d923ad3472002044e010ca9dc646ef79dbca241bd47eaa992014cb7063b31cdb84037c7  libdrm-2.4.128.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c2350dec57..ae0129fa48 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.127
+LIBDRM_VERSION = 2.4.128
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
