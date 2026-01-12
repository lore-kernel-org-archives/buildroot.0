Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A7D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B2180F7E;
	Mon, 12 Jan 2026 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiKa-963yogW; Mon, 12 Jan 2026 08:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9EB84529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206204;
	bh=AdIsJeMHPkyTyVuWY/2SbwNMrt+iCIed1HXAnm6CdlI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPPiqJloVjEz9FXxKGpvFC+Y1mxOXQqPyU2FQ0e8T3EACEmvVotpjlEtiykGotMPR
	 Umhak3nGrQLMCgBtPDNCAM2E7SMjHkGbufp4b2smRMoDSo7fN94rGdqAJJEIdScES5
	 emUJWGrFPGeBOSGKNzF7iOnoNqfqlRBMdlQu4RNn5RpLTq5yZKGDcB30f4iNcIgF0g
	 Y/9881ejB4lKysyTl9od3R8/Hy2qyhHyst2xUC7VDEdseSX4K8FzIMGBPQmqAA3glC
	 4grGob1s9iu5olkq4joPOPC4rNJE7bUqdND2jsSAnSTj2s1uTkqfc1HBOtwsaknFv3
	 74fQ3R+TgQwzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9EB84529;
	Mon, 12 Jan 2026 08:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D792218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDC42612BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a44eR3tXNoFK for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B555F614D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B555F614D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B555F614D8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EDAA6A4C4229
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-2Q0m
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:19 +0100
Message-ID: <20260112080419.2516889-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205147;
 bh=9APImWnUgf7o5vl7t170mwWypnlZbJYRQ9oR6rkpxyk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=oENPyF8+E7pkVlEHnXQk7SAmq165IhewOTqQ7QSjCNKsVEV6Z6Qk0D63LcfnHDqb0
 YFKlBLxLIvvdSf0zFPq+ECsSXm9Mawv/J/X5Xt8e2RnXVDRrhINZyjAkFbc7G8t0rP
 HvQLwNMBebtpL3HzTlWMzkJ9GEQHx2HlWD4YyTcCoFZQzREDfr14dbloYZrZ3w5WJl
 x1Njii4TbdmYCv8Y6ozoPGJk99P91sLGdN1dqpUGG8IrIg6ZbEAT65zxxSc9MEH1dR
 QiQWUfywk/0uL8lKsQ5A0j8cTkJIIE8hCRZ6b1oDcFr7k/AP99psDDq1+x/ekgLij5
 FmuaZgEoS9lwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oENPyF8+
Subject: [Buildroot] [PATCH 044/104] package/x11r7/xapp_xlogo: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-November/003557.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xlogo/-/commit/c31ea299ed8e2915361dc4109d7720bb32992413

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xlogo/xapp_xlogo.hash | 8 ++++----
 package/x11r7/xapp_xlogo/xapp_xlogo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index 58f2ac4028..7dc7580b36 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003257.html
-sha256  c16ae461a7f7ea275f55c82acf3ee86ce0eb5e406f3a91ab2bb4d332693f32a0  xlogo-1.0.6.tar.xz
-sha512  f0c921e0e34d2c0959d95ca0fcb7488395043280b8b35bcad4e8a528224f2b38581fbf60e82239d06760ecd637692cb29c3b1c0c46ac7f269f692a139d954ea0  xlogo-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003557.html
+sha256  8a3f67b20407a53286a7de1a04dbda12d272234d59ef35e68ecfaf7633d83624  xlogo-1.0.7.tar.xz
+sha512  dfea0d42aeec7394c487e009c22ebb24af9501fa8144079d4fe1f32931cfad6bd1eb3830a1d211b9785a9f89fe22c61d4d4b6d6b881af42f3f916ccc5eb9ce66  xlogo-1.0.7.tar.xz
 # Locally computed
-sha256  972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
+sha256  29bfb0a3200dfa6868639a6ab313d1049d0aee6c2de2752c2c279a6be6121b1e  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 27d693bec9..84f464204a 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOGO_VERSION = 1.0.6
+XAPP_XLOGO_VERSION = 1.0.7
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.xz
 XAPP_XLOGO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOGO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
