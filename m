Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE61CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C558C615B4;
	Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwTIpvIK-kh2; Wed, 10 Sep 2025 21:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 410306152D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410306152D;
	Wed, 10 Sep 2025 21:33:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A07A2BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C404843B4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juJIKXUkg4Zw for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36C908420E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C908420E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C908420E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 737AE1A0D98
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A587606D4;
 Wed, 10 Sep 2025 21:33:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81313102F29F9; 
 Wed, 10 Sep 2025 23:33:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steve Kenton <skenton@ou.edu>
Date: Wed, 10 Sep 2025 23:32:22 +0200
Message-ID: <20250910213241.1529448-15-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540011; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fqYjRquZK4bSUSCUpyyQoU4HBzWfGMr/xmCPdCfRXsw=;
 b=p4XXQsaULIfFHwA62CFKp5H0vDN61YznNfHV7uaWpAKeCAE50q2e7K2vNxnhOAUeRIOOa+
 DVQJhE9rmB0uqCA7x3k+RtR3kbCPE8pOebyz+kgV4FfWnUMinvT655GaC9TLcchEspk8Y9
 DOUn1+lA44P1zAy6DisR8t0ywNT+lBx9AAlVJrG7HP7IWu5a4W18puELnyMaz2sVC9ZSei
 ROkODvd3R9Z5F+NEgU/MRROGsdT+ngTlfQpSk4rgKIORHnUS/rbjzHRv0A8szBS+HHhJCd
 TUaTsjGKH7JXFiu2iKkcHzLpisE/U48LEBxLnKAznRmnT1KF62y3DfwX4VcF8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=p4XXQsaU
Subject: [Buildroot] [PATCH 14/23] package/mjpegtools: drop optional
 dependency on libgtk2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove libgtk2, let's drop the optional dependency
of mjpegtools on libgtk2, and forcefully disable gtk support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpegtools/mjpegtools.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 8d6c475518..871d1b8f36 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -10,6 +10,7 @@ MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_INSTALL_STAGING = YES
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
+MJPEGTOOLS_CONF_OPTS = --without-gtk
 
 ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
 MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
@@ -53,11 +54,4 @@ else
 MJPEGTOOLS_CONF_OPTS += --without-dga
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-MJPEGTOOLS_CONF_OPTS += --with-gtk
-MJPEGTOOLS_DEPENDENCIES += libgtk2
-else
-MJPEGTOOLS_CONF_OPTS += --without-gtk
-endif
-
 $(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
