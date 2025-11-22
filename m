Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7144FCFD312
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 22:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0723340B77;
	Sat, 22 Nov 2025 22:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MXYOfjnOKYx; Sat, 22 Nov 2025 22:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D52540B75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D52540B75;
	Sat, 22 Nov 2025 22:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8EB0158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF9040B72
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8qoLeC7ZhSB for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 22:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DD6A40B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD6A40B71
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD6A40B71
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:25:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77789A4C220A;
 Sat, 22 Nov 2025 23:23:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39642)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMw1N-0000000046b-45mz;
 Sat, 22 Nov 2025 22:23:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Nov 2025 23:23:58 +0100
Message-ID: <20251122222358.1913345-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763850238;
 bh=Kn9QqS1yt4Q0iwtKkuL2ckeoEpIPz9ew399bUdMJANg=;
 h=From:To:Cc:Subject:Date:From;
 b=fGyXM7i8pHamWHVJDC0rMe6TQeTeeXtTI99DSWBasldTWyorzphyhlPkKT0Sw4E/q
 MOwbHqlIbf9IewbbZCU2fxlB/T2mAEc0G2htoPNCexkp9+d9SR42cyzZGzWfEdpVIF
 u76PWk5RJ8S3xPn4afQVI1Ffvh3dCngLyluuzLTaw7DOPWGqtBcLpSPgosf4cDgole
 oBxVbraCguAlVx6GXftdWkiZ5NWJmIXb4y02fRSsW28MlR23UUABErhSfTPq6T+S9O
 Mt0j7/MDx2R+N0USd1dK+C9ga1+MhZ8AiaDO6jMgYoErACKZvolurJ5SXmoMh2Sb8p
 0Z2O+V6o2UXVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=fGyXM7i8
Subject: [Buildroot] [PATCH/next 1/1] package/libupnp: bump to version 1.4.25
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

Changelog: https://sourceforge.net/projects/pupnp/files/release-1.14.25/

Added upstream sha1 tarball hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libupnp/libupnp.hash | 4 +++-
 package/libupnp/libupnp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 86437a7339..d04fbd5b98 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/pupnp/files/release-1.14.25/
+sha1  664b3981f6a54dd3b921af4ab2ecdfb6d1feb626  libupnp-1.14.25.tar.bz2
 # Locally computed:
-sha256  b6423c573b758d09539f5e6c4712c1a9fd35dccf835f81d99473d50a50ad49b0  libupnp-1.14.19.tar.bz2
+sha256  36fdf15767573f4f92320f01b3fd3c1cb41732b91cfc24d10d1e6a55969c9f56  libupnp-1.14.25.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index cd148d14d0..f29275d2b5 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.19
+LIBUPNP_VERSION = 1.14.25
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
-	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
+	https://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
