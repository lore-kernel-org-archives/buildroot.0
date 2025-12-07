Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5807DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5963406F6;
	Sun,  7 Dec 2025 18:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inOIksVHVafe; Sun,  7 Dec 2025 18:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756E4405D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765130636;
	bh=tV6L12khZC5cetHL104ChTBhWj9uTtFuHU+6bIdceSA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3un7iQt25E4mnMEEjbVWVwncnFjs73eDtgBPQPOG4rYynWMaU43fVmtvWUjZhWZ3
	 plLKlNGKD2xsCTVqrzGkBpvd0oX1dvSTfxpRsHo1Cna2sIjD8fR30oaucczFLoz7no
	 0rZC0s+ejb2qkpd24CmmlnP4sThZc9lMjJnW4y2DjHmT4cz49GeXcC0rG/3WB7FYtl
	 s174mPW2gm1JEO6dwy2+VqDxej4GogTHkT5lEIfByXtoYfgpZkCAqskTzeuoEpNh8n
	 cPvPkSMkbNkCj9UlKvcH/jCPdE55YtvHA6nmpBB3hbC+eIpeYFgt976QWTQ5h/9B1t
	 D9t9s+vmL6LdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756E4405D6;
	Sun,  7 Dec 2025 18:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B68151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A44C81DF9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrIUx2gaCuUb for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23F1381DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F1381DE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23F1381DE5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52674A4C00E1;
 Sun,  7 Dec 2025 19:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJ6U-000000005mO-2pBY;
 Sun, 07 Dec 2025 18:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Sun,  7 Dec 2025 19:03:22 +0100
Message-ID: <20251207180325.25243-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765130607;
 bh=gM87r/siK9EBP9bfQZmfAnT50T0Fy3qfKsn8vLLqccY=;
 h=From:To:Cc:Subject:Date:From;
 b=tv8OQgpihdgWaOqbtFj4JR+vIcr3roXdFdZ+IrV1bp7x62RF9M/dRFwsuCyRzv4AN
 94pdi+07EMqU8a4ow3wHO769cH59TlQztF5A/H6je7ED4/KiLh0TQ4HhjX9n08BTNg
 aJRv8teQxLpysMg4lLFYlOpNoMvEs+ls4PbyoUFfaLHtrU4h2CI8nL5ft5jbLkId5I
 PN32cfHZ2PZ7uizdBkb8SShF4Aw88wlOLuDeE6370zDH8YQbRu+HKPnSMQMca8tulK
 il34IcSrW1G4e1aOcFVqVedLj6Cwmmld0cx8INN38OcGyP/vUP3GsAW2gg24zY2U7K
 0QkGJtnCE733w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tv8OQgpi
Subject: [Buildroot] [PATCH/next v3 1/4] package/libvncserver: bump to
 version 0.9.15
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

From: Christian Hitz <christian.hitz@bbv.ch>

For more details on the version bump, see the release notes:
  - https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.15

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: removed comment about OpenSSL (Thomas)
v2: no changes

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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
