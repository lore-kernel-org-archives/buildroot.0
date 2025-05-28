Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D8C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 11:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9BE080793;
	Wed, 28 May 2025 11:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syAPwwt1DWlf; Wed, 28 May 2025 11:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73A7807E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E73A7807E3;
	Wed, 28 May 2025 11:15:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A005319D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8364A40ADA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc5JW3POOBHq for <buildroot@buildroot.org>;
 Wed, 28 May 2025 11:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26B3F40B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B3F40B07
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B3F40B07
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id D36B51652A;
 Wed, 28 May 2025 13:15:32 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id InZcnvXrD_-l; Wed, 28 May 2025 13:15:32 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 3F2C716503;
 Wed, 28 May 2025 13:15:31 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed, 28 May 2025 13:15:14 +0200
Message-ID: <20250528111518.1961416-1-christian@klarinett.li>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1748430932; bh=Kc
 kHCK4BpE+JlvylAY6OEUQ0/BUKbQmiNOEPCvEw0QA=; b=iuhYfFfmVYX5/tJHGJ
 i4mp4NiHlufhQ1Ce4C2mzcrfboIxxhnXnSvnylIBKOrX114Z8+UPQQjL+GM0bOoy
 J8iPIdCL+P2sA4Iwv0EoxoBtc9csan5vUnJCzTEZnMhCYhaY2ZDiaVICaQk49ak1
 ObKxjiTe+mHYjcDxXn1FYaBRw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=iuhYfFfm
Subject: [Buildroot] [PATCH 1/3] package/libvncserver: bump to version 0.9.15
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Fixes building with OpenSSL >= 3.0.0.

For more details on the version bump, see the release notes:
  - https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.15

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/libvncserver/libvncserver.hash | 2 +-
 package/libvncserver/libvncserver.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 225c42e46a..127a163fe2 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  83104e4f7e28b02f8bf6b010d69b626fae591f887e949816305daebae527c9a5  LibVNCServer-0.9.14.tar.gz
+sha256  62352c7795e231dfce044beb96156065a05a05c974e5de9e023d688d8ff675d7  libvncserver-0.9.15.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 082f838f12..c6cbc834f6 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.14
-LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
-LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
+LIBVNCSERVER_VERSION = 0.9.15
+LIBVNCSERVER_SITE = $(call github,LibVNC,libvncserver,LibVNCServer-$(LIBVNCSERVER_VERSION))
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_CPE_ID_VALID = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
