Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC2AC5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 19:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 546C5810D0;
	Wed, 12 Aug 2026 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9ORoHZZ9kV8; Wed, 12 Aug 2026 19:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E55E2810C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786564409;
	bh=ae/4Kp220dRC8y6Vx8t4seJNeQRdRgKWCrYA5TV9C2s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bAR8asnSQygiE8JZfLMFPpw8374i36QMAn2djMbvgqBmrHK1WxFFhXIDkCtbYe57+
	 WeVbppusAAdfz4MfoFXFC4gqyoBsQkhAiWAmQXmwVxTJT8VmJ+SvnqQCpL71u+bvbD
	 PHlbhBDSeBWtZttaALk2PqkRJa89hWaEBRJJEo7wDu9ZBF23931L91cvA07ffOAHtF
	 hxSy7eOwHOo/A+oSt6u9nhqcAhoz2EQPlXPHYEGeoZ/SVAQtuOce5LUdNX9Vg2j1/H
	 sixAtda64v7+3Yt4cvyfc7GldRcYwXJWhYr24ro/zduwEKEFmck9joQm0TQIdKLpOX
	 yonZK1yXj/Sxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55E2810C4;
	Wed, 12 Aug 2026 19:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F01F73A4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E200340956
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIJE6k8CWx59 for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 19:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FBF34095C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FBF34095C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FBF34095C
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:53:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90CFAA4C4AD4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:53:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44972)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuF0t-000000003Qm-0VIj
 for buildroot@buildroot.org; Wed, 12 Aug 2026 19:53:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 21:53:23 +0200
Message-ID: <20260812195323.3862462-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786564403;
 bh=3YQxt5tTsikC7Z0WZ3PKRVB0RjWgcZEffDJ4OjD64CM=;
 h=From:To:Subject:Date:From;
 b=TdupkWi4WegngTTDe2W++c+gArHc+omyJto0AlHYUony/qcLxC6uptn5JwOfKLUnT
 iG7PpNIbgKab+0WN9Q5Ayr/LTJpmSYjlSvgDobEaZjBDYH8pHpLHYWr/9oSg6+IcPg
 i/XXbD53uH4lGbmZ59dMLaDTaJcPHCckbfy2MgCChBiGteMrkq5nMGuSvSHqt+Ap99
 lbmKaSk2F4hnVb5jbidLOwL/FqFimme6p3Dzc6yGopX3JpHo2I9YMbPFIWjoQcJovw
 6WDv/DWUgV4w/YmKLgoWESSVfOx2DPn0nrP/92nA7vqmhYw6b2HzdHpJzkaeAQA7na
 wuvqw6ynQSBsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TdupkWi4
Subject: [Buildroot] [PATCH 1/1] package/libaacs: bump version to 0.12.0
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

Changelog:
https://code.videolan.org/videolan/libaacs/-/blob/0.12.0/ChangeLog

Switched URLs to https and source tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6e6d7703e8e13b7416766e64b6dba5140c4cc5cf

 package/libaacs/Config.in    | 2 +-
 package/libaacs/libaacs.hash | 4 ++--
 package/libaacs/libaacs.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libaacs/Config.in b/package/libaacs/Config.in
index d59b6da64b..de36290534 100644
--- a/package/libaacs/Config.in
+++ b/package/libaacs/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBAACS
 	  NB: this project doesn't offer any key or certificate that
 	  could be used to decode encrypted copyrighted material.
 
-	  http://www.videolan.org/developers/libaacs.html
+	  https://www.videolan.org/developers/libaacs.html
 
 comment "libaacs needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index d4977727b0..395bc3631c 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.11.1/libaacs-0.11.1.tar.bz2.sha512
-sha512  42dcba5fd593c9a8ec7af11251006b083ad2c49ec198734d1d66f67c2ded4557d77617600edbf0c5250e9b0407ef9a2f906d59d154bda8ecfc8adfd234fb2c42  libaacs-0.11.1.tar.bz2
+# From https://download.videolan.org/pub/videolan/libaacs/0.12.0/libaacs-0.12.0.tar.xz.sha512
+sha512  5848e68a1d8e6125af1a02b878ccaa05128ae752722ff245d79918d5b3a0589b486e87fe3b3af9cfda18b04742003e197727aa211cf8c03a505c1336d3a689d2  libaacs-0.12.0.tar.xz
 
 # Hash for license file:
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index d4e90be26c..c10972dc3d 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.11.1
-LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
-LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
+LIBAACS_VERSION = 0.12.0
+LIBAACS_SITE = https://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
+LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.xz
 LIBAACS_LICENSE = LGPL-2.1+
 LIBAACS_LICENSE_FILES = COPYING
 LIBAACS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
