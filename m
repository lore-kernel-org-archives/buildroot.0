Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E9AD2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2874084416;
	Mon, 12 Jan 2026 08:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1-77VoDA17s; Mon, 12 Jan 2026 08:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451A784430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205371;
	bh=5T65uRz50bxZpXNntOUQaiOvgOJPSweLHihpF+PqWU4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mULaleGdkeKh7qnTUasNXj7wjslUaFMJE6E66ntA4KCS86LGchE3SUeZ+qM1W7F+q
	 DvYB2rGU3Ni32AI8iMf5DYB0/kRwmzxiab0CuKE4xBJ7jycw3X3IT4ONRlCdPe4ic9
	 9o8rYf5mKsHDPTGdaGM5CsedY6rTz2LCsiLgl8QnqR2M5Y1b7fi9eIHBrUGv+TASBk
	 LC+krBkcl+tN9MHo+zQdvAOhsUDJEDN0O7Y3aJICZs1fG+Skd6F+sVLACE8jMhCVWC
	 AeUt7PfJiobC8/W9vmEZ0LiUnyG5JWNZokgC+SEwbEC3vWjtoyDSbsx8cre7xU/YCz
	 TNhEzAZ02/HXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451A784430;
	Mon, 12 Jan 2026 08:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC83A12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B341C4148C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLDwAyxEE5AF for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C2784148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C2784148B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C2784148B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B67BEA4C3B35
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-2J8E
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:47 +0100
Message-ID: <20260112080419.2516889-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205106;
 bh=wC5aWicik0j5fwaV649NO2eAemAljzXRSDmPST08BZA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jzEXR/IahN5luk5LOLCAsJstH/ww6TkWcv6iN2eDptOMM3iGpyW7fNRg7N4cxlZV5
 3BhdR+mgbXGJA5LVteQ2M5YWToITI6PKoKBzVcx32mb7IN/hMRqQpd9iMin4eHWLoH
 mtq396VBRSjD41zqR+w79zP0oGQzx4sofBJheVPdlnRkEMr7DxIySDH2ZzdE4IIAgs
 P2VXZTil7uQ9UYIteN8+1ozXR1RrQcJCH1nWLIJY3SqOfnn7YWGvCA73bM8dQp1wcc
 7pooBngDtEr9X7stRqiZfHiwKBRw8atMyFK6L8dLZFAu573R3xaPd+oaAbidZpzF0n
 VlmAwjTWqynzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jzEXR/Ia
Subject: [Buildroot] [PATCH 072/104] package/x11r7/xapp_xload: bump version
 to 1.2.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003485.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xload/-/commit/ef450fb99630a406c4638d8ba251eac45e434411

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xload/xapp_xload.hash | 8 ++++----
 package/x11r7/xapp_xload/xapp_xload.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.hash b/package/x11r7/xapp_xload/xapp_xload.hash
index 9716fe1500..29a729a70d 100644
--- a/package/x11r7/xapp_xload/xapp_xload.hash
+++ b/package/x11r7/xapp_xload/xapp_xload.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003150.html
-sha256  8346b99120db24e0f42920f7f12e23e9b1b407d3a66ce419990387b608373031  xload-1.1.4.tar.xz
-sha512  114babe4e5a60f4713f9e4627ee0a1bbb2f1f238cb46f24c38aecff67f25e6b0f58cbd554c71095ddc2b01398adbfa379550a34c23c413db52157648028554f2  xload-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003485.html
+sha256  2c0fe6d624e1a25c1707e2d56407b979d6a78d64271df9ea0a89d99b81b59a80  xload-1.2.0.tar.xz
+sha512  b6143f796f7d24bb204e29f341f59c27a0eba00ae58e42bde0d1471e3e9357a0ce5e9e23de119d2540c9f5c71d28eb1e85dd766b6b28a7f066805b5f386aa716  xload-1.2.0.tar.xz
 # Locally computed
-sha256  a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f  COPYING
+sha256  c5fa9a1ea9032b1422d423b73fac9710a3e54c2d11d9c810ea5fc5585a53977c  COPYING
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index f219359447..4ef86dbb51 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.4
+XAPP_XLOAD_VERSION = 1.2.0
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.xz
-XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOAD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw $(TARGET_NLS_DEPENDENCIES)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
