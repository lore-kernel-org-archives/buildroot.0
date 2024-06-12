Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17399C27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C314405EC;
	Wed, 12 Jun 2024 19:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR1zphAtFtJP; Wed, 12 Jun 2024 19:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9D0412F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9D0412F6;
	Wed, 12 Jun 2024 19:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4C8B1BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1508412F6
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_QJa9KG8F_g for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E333400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E333400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E333400B9
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:21:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd5a.dip0.t-ipconnect.de [79.214.205.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69F16A4C3194
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 21:21:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50180)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sHTXA-000000007cZ-3goF
 for buildroot@buildroot.org; Wed, 12 Jun 2024 19:21:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 21:21:25 +0200
Message-Id: <20240612192125.52199-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718220085;
 bh=yVLOBYU3a0fpRkHRTq0W27v1b/hm6ZAAVx+aOn2G4EM=;
 h=From:To:Subject:Date:From;
 b=MeydnAULDSC2aXxhuXw21EaBGA2SA8YorZ11/qjUSIZtY7gpgM/gEN5rQkS7UDhSD
 DxYflhZTA5s4atOA9wC7cKASxRe+Q1Hhf+oXcv/njsMJ3BhWcdNirxog4ZF31z2TM1
 g0Jmm2XZm9Fb8ZrKXy3yTxDkj5zAcmXzmK42/I95NNZZAFenIBFBryGTe/HkSVsN9B
 GkkUWKR6PafbmuMe/9JJxd6CK/cwtCtcU9njjpm6HruGKutg7VLOYX52OWaNzsSM/f
 ttrVbKEqihvho9m6JEB/jD0CmezGKQCEAs/ui48E9jmvyts70nFHTOVuqtOCcY9D9L
 pmKH4xNSeM+RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=MeydnAUL
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.121
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2024-June/003516.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index dd43a89d68..8b0f7c0d74 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003441.html
-sha256  3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a  libdrm-2.4.120.tar.xz
-sha512  6dc16e5134a669eeb59debb1dc2d15b857483ab7476dc2b94bd05a32d8953f046f5656f6cf9e1a63e97e7156fb65ebb58b6a29fe45cb6326058baaf820626e70  libdrm-2.4.120.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-June/003516.html
+sha256  909084a505d7638887f590b70791b3bbd9069c710c948f5d1f1ce6d080cdfcab  libdrm-2.4.121.tar.xz
+sha512  cc8816d61884caa0e404348d1caeb0b2952fb50e1dc401716adfe08121096e2a67826db0bda0d8b163d67c5ee048870177670d5eac28a5abe5792d09ba77ab2e  libdrm-2.4.121.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e0c1217b38..c87a225515 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.120
+LIBDRM_VERSION = 2.4.121
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
