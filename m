Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A1FF9D0E7
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DDA6F4A1;
	Tue, 14 Apr 2026 16:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzwvWuefJm8X; Tue, 14 Apr 2026 16:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF2BF6F49E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776184481;
	bh=B57lOVmNZGhJKp6WHkymFoM2OJd6iidiFOUN6GZqXo8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOyMbjx0LUwrHTRQXscu5JWixtvDDZcOlpuS25ykeM/CR/0Fc3swqqGvIIaYd22dC
	 qI4YmP+QK30hhcPPB2Nw/bcQb6MIOq2P+/ywI/9uNNIw9PxG15BmYdRWBM7hdYKyMy
	 AbDxe1rv5nlfF5qdMa9BjCSb1Eym2AyKetRcTWitKn37EoU7kcvDNlCJ5+V98RNDX2
	 c7YGh+U2lPhQdvbEE08G1f/hXkwBBNFiGvnRdety3en6uGNKaz0vaTu2Hia7nhqJZi
	 QvbV4Dgo7kw2/htnOBkE9+NUavQLsShpOkNfceeJ7vNj9IrVu0Pcqh6UuXizujtI+t
	 MlpLjJ28okFEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2BF6F49E;
	Tue, 14 Apr 2026 16:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C835375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E48B403F0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3QohYeeevIz for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1232E4012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1232E4012B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1232E4012B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86835A4C234F;
 Tue, 14 Apr 2026 18:34:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgiV-000000008Pi-3lK2;
 Tue, 14 Apr 2026 16:34:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Tue, 14 Apr 2026 18:34:24 +0200
Message-ID: <20260414163424.2355464-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414163424.2355464-1-bernd@kuhls.net>
References: <20260414163424.2355464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776184464;
 bh=UpurXloHz7XaWRiG8yhcnUmfvEV2ijCwLnHIs/11EfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qU0oKzoEDrN0eI6YE//ecLP9SPyZweQuEVJF5IPyAm+A0xWbvDEwaFbUv0SCFLAsI
 pAX+/B5Q6dnuPU/I5AGvIk6y4mWjKnw2+gU3MfFf4e0mGemHw7iHYNsX6ab2uyJYJO
 /mG++APlR8ph7pV4toPNWqrOgz8VFWVr7/YpCRGC35L0qsReL0pPZSXHKwlvW37W1/
 9MWK8jRkjY3n3v1UGHFIpHLLDaKeV+oKy/Ko4jUEgGc64tYuHk/U5tTMQ7P/dYZMYm
 pxYrH1/3+LNfVdcSRTfxrxRWNhvYj2CdDsUaliQp5FPd6fB7d9ZyYzLq24nMwwe3fK
 w531yIHQoCrMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qU0oKzoE
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xwayland: security bump
 version to 24.1.10
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

https://lists.x.org/archives/xorg-announce/2026-April/003679.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/e5c6a5ab905e0158ec22877b4117f10bef6e4140
https://gitlab.freedesktop.org/xorg/xserver/-/commit/89f82cce4a4ca480501c130231968a72cafa952d

Fixes the following CVEs:

* CVE-2026-33999: XKB Integer Underflow in XkbSetCompatMap()
* CVE-2026-34000: XKB Out-of-bounds Read in CheckSetGeom()
* CVE-2026-34001: XSYNC Use-after-free in miSyncTriggerFence()
* CVE-2026-34002: XKB Out-of-bounds read in CheckModifierMap()
* CVE-2026-34003: XKB Buffer overflow in CheckKeyTypes()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xwayland/xwayland.hash | 8 ++++----
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 0d1df29b43..ba84d20b9f 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg/2025-October/062148.html
-sha256  f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0  xwayland-24.1.9.tar.xz
-sha512  7438a572651dc77c1fd749879abccdc9a245c7b75143668d5561a8e99d41063f042a8eb3f9b931a2a12be1fc3cb9d197eee6794d0702a19e56c20f55acb35a26  xwayland-24.1.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003679.html
+sha256  459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0  xwayland-24.1.10.tar.xz
+sha512  bceba1db7f4d7ac92d2b2a3c8f6f7ab0cc093f396fe89406f8dba25e32ffc3edfa552df246cbfb3b0708c1d28b3e179694d11870b063d5b8f9ab2db9fb861a8f  xwayland-24.1.10.tar.xz
 
 # Locally calculated
-sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
+sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index d4fd47413f..1c90447aef 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.9
+XWAYLAND_VERSION = 24.1.10
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
