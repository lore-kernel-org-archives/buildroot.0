Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A06C52D6D
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 08:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8441580F28;
	Tue,  6 Aug 2024 08:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcxceUxK8cZg; Tue,  6 Aug 2024 08:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8949480F19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8949480F19;
	Tue,  6 Aug 2024 08:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7DC1BF2E5
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 08:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2A180F19
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 08:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V14dSf7mRQlv for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 08:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BF6080F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF6080F16
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BF6080F16
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 08:09:05 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbFFd-008S2J-9p; Tue, 06 Aug 2024 10:09:01 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ec20a9af;
 Tue, 6 Aug 2024 08:09:00 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 11:08:57 +0300
Message-ID: <20240806080900.999109-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805115224.3473431-1-aperez@igalia.com>
References: <20240805115224.3473431-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iFBZg5ZiicxN9GyGb2WR6L0YYwyzgGgj5iWMdZhWSRA=; b=iBaAH0Eh9cwhQmRMD+QPqWauwZ
 2RLHFB+R5Xqlj8xVULZTXpMXugUSUR3+tVj0k/oc4uusd6Pc8dhIgXgf5YIUYo19a340g/G06lprL
 PNV01YV0rAptpzm3jZlr5Mfb9eIDDez/LMfVNN4Z4nLSZkm7i6Vpu9eIXkbDup+56aX2ocdzXPZrw
 1Publo9S7OqzahMT5ZiIimB463I9icI/3goMoEFW33vjgm91+q0V7QQw9w31FrP0cBtF5pKR3Zb7K
 i4OwU+GsARGhQWqBFUG4XbNPvj13K9Kv3vtPgWFqdUMJJuNc9rqKjqIji7IUGHgkkFCwpJF5rW99k
 /jzduBMg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=iBaAH0Eh
Subject: [Buildroot] [PATCH v2] package/libavif: security bump to version
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

The change checksum for the LICENSE file is caused by a path change for
one of the submodules, and the addition of the licensing terms for the
bundled libyuv sources. The latter are never built from the libavif tree
as there is a separate libyuv package, so BSD-3-Clause does not need to
be added to LIBAVIF_LICENSE.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libavif/libavif.hash | 4 ++--
 package/libavif/libavif.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

---
Changes v1 -> v2:
- Updated LICENSE checksum, added explanation in commit log about the
  change.

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index f4599cdb0b..b26e678abf 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146  libavif-1.0.4.tar.gz
+sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
 
-sha256  10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639  LICENSE
+sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
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
