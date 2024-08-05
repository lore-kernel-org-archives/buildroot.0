Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06144C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 12:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999A960729;
	Mon,  5 Aug 2024 12:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7BDxs1dEy2r; Mon,  5 Aug 2024 12:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF1360731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF1360731;
	Mon,  5 Aug 2024 12:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17F9C1BF381
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 12:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05B0A80C61
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 12:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaTIbMqs_KWd for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 12:33:24 +0000 (UTC)
X-Greylist: delayed 2452 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 05 Aug 2024 12:33:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1F8E80BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F8E80BF0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1F8E80BF0
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 12:33:21 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sawGH-00850U-Hb; Mon, 05 Aug 2024 13:52:25 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e417baf6;
 Mon, 5 Aug 2024 11:52:24 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 14:52:22 +0300
Message-ID: <20240805115224.3473431-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gl/6T51Y62ScQOT/D2nkvEbdMyK5ejT40x8lR571OiU=; b=OMapRyuUiz62ox9X7JYf0bxnfc
 mZaA5sLixdZ6u1GyyLYiL/QVKKyoKqNX/GltHQI9yb4HaxkUXBa9XogCmO/01RvYCwnEI7x9I+0jw
 TLbP9c1Orkfs8V+kBuflvbbLH4WU6NjesV/pk68wbmca0TQqi/P+LzjEzLM84/iOsJk88V66ruFeP
 Kn6o64MG29ZdbAjNtEEFGr7QbJ6cY0j97rvkLQwKnAvbV7YWUc9+KOkCCIFtYn0TJE5fLd9Sd5KY0
 Tc8qH6DMIpmpVhvzSJSPBaiMirJRs/KUaOoe+GVympkEuytCsIZgLrRdy5Ae7uYMcIeByNIw264jJ
 2v/ceczw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=OMapRyuU
Subject: [Buildroot] [PATCH 1/1] package/libavif: security bump to version
 1.1.1
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

The release notes for version 1.1.0 mention fixes for memory handling
issues and bugs found out by fuzzing, which is the reason why this may
be considered a security update, despite them not having CVEs assigned:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.0
  https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index f4599cdb0b..e9930b7f34 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146  libavif-1.0.4.tar.gz
+sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
 
 sha256  10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 1ca3add82b..0c2a8e4dae 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.0.4
+LIBAVIF_VERSION = 1.1.1
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
@@ -19,17 +19,18 @@ LIBAVIF_CONF_OPTS = \
 	-DAVIF_BUILD_MAN_PAGES=OFF \
 	-DAVIF_BUILD_TESTS=OFF \
 	-DAVIF_CODEC_AOM=OFF \
-	-DAVIF_CODEC_DAV1D=ON \
+	-DAVIF_CODEC_DAV1D=SYSTEM \
 	-DAVIF_CODEC_LIBGAV1=OFF \
 	-DAVIF_CODEC_RAV1E=OFF \
 	-DAVIF_CODEC_SVT=OFF \
 	-DAVIF_CODEC_AVM=OFF \
 	-DAVIF_ENABLE_GTEST=OFF
 
-# There is no CMake options to explicitly enable/disable usage of
-# libyuv, only autodetection :-(
 ifeq ($(BR2_PACKAGE_LIBYUV),y)
 LIBAVIF_DEPENDENCIES += libyuv
+LIBAVIF_CONF_OPTS += -DAVIF_LIBYUV=SYSTEM
+else
+LIBAVIF_CONF_OPTS += -DAVIF_LIBYUV=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
