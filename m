Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55DCE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7739F80A92;
	Sat, 28 Dec 2024 20:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyyXY7DcnOvF; Sat, 28 Dec 2024 20:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 793D280BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 793D280BA8;
	Sat, 28 Dec 2024 20:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73193C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429BD605E8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iyi3VxwAhFwG for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 20:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC5B960071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5B960071
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC5B960071
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AA4A9C0003;
 Sat, 28 Dec 2024 20:07:55 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 21:07:49 +0100
Message-ID: <20241228200754.4012273-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
References: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735416475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afG8kWj+Fx3SYcXiufwrcouvGOhW2BIX7jYo2BsFb7A=;
 b=O0EF/FBBRSGyEKSs1q0EWKVovb23wgr4Obi/koVCXim66xo7xKghlgaUAuL3a4pDhVuDyD
 R5H8D6tjjyegbzS1aD2s6FjWBYyy0PXKU/v2OU0pWeD4+fULaYw88akItXDHusBjstOa5p
 nc7bMbmfMO0enAovWNJpLentRdmCTBg9ZEGGrQ7h7DGrwgM2r8oUTN5w2om6XmntT5bed4
 iJDKQ/ZLj36aky9kF+2CXhMqhW7ftgo3tNlBStjbZvfgYU+Xh4nrx8dteVORJHuoX2R3K1
 OeodII11J+qMEYaETnFbNPT1OrZQ7kaFKedpGfqlMkcGAOj2v3TEkr2xkILlxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O0EF/FBB
Subject: [Buildroot] [PATCH 2/4] package/weston: bump to version 14.0.1
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

From
https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html:

This is Weston 14.0.1, a bug-fix release. Most of the fixes here are
addressing some build issues with a C++ compiler, but also addressing a
more critical issue that was causing the gtk4 test suite or other clients
to crash when using the headless backend.

Some distros already carry a patch to address that, but in case they
have not, this would be a good time to update.

David Edmundson (1):
      libweston: Send seat name before announcing devices

EatingSumo (1):
      libweston/screenshooter: Fix build when __builtin_clz is not available

Jan Alexander Steffens (heftig) (1):
      libweston/noop-renderer: Check shm_buffer for NULL

Jan Engelhardt (1):
      build: insert missing wayland-server-protocol dependency

Jeri Li (1):
      libweston/desktop: avoid weston crash while xdg_surface ack_configure

Marius Vlad (4):
      libweston: Move weston_get_backend_type after enum declaration
      desktop-shell: Don't attempt to re-add the view to panel layer
      libweston/matrix: Fix narrow conversion with C++
      build: bump to version 14.0.1 for the point release

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 2fdc6ec1f4..35fe608e20 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
-sha256  47fd0325b0b948e9b003a38fdf4eb3a8581f3fdc740b8932b35ae8793bf4e4a5  weston-14.0.0.tar.xz
-sha512  8bdeed91befd5cbb0bde0f1860ff7775c1835a5fa8c3bf26e99d2f0c16e81255fcf35bf338ae02d7826463d0efdf41ba3fe78e38e4c27787831dfa331acafc08  weston-14.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html
+sha256  a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3  weston-14.0.1.tar.xz
+sha512  2d782f98f28b39b990acecfc885f62ab34c9cdd22ef06b09c5d8df792112c47b365f89c2bf05d871e36ddfb4c49aa7e6d05ff60fe67a2657727162e4f564a412  weston-14.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d879dcc965..7d43132073 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.0
+WESTON_VERSION = 14.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
