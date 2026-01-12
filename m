Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812B4D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5924B6154A;
	Mon, 12 Jan 2026 08:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfREzDLRVxrQ; Mon, 12 Jan 2026 08:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801ED6156F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207028;
	bh=e9pXWAudr5gYG3dlgvXEwX/X05Y9+48D8ElGb9dpV7I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXdxOxk32K1lxh2ufNG3AqdnpwEDbEBhJ+UgVwi2I8EK3ViE8uSACqwB8TD1F/fqc
	 T1u3RvHb0UK7aNi4uXQE258TD8/xerYw/GNk6yL/W6ac+HgbAXZxIIHW+9mOEyEdDc
	 SyVBnaoFAgWCQ9pI/81GWkztnHnwacfiLI2JE83SsVpaIeyTtAyDSMgYFdVtay3sVi
	 Itfoh4f94NwNkxvWwBW5zlnFXUjtbG31KK5WPfXN6+H5Qj1X1ZNrf7bi0BSqpocx6P
	 U4xI/cjMdmUBGkXJxbub1ZznqQD0N/AadpcGoI71jgpVF/TvfTsCX39h5dgO2EDfob
	 fCz9PJ6OgYPyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801ED6156F;
	Mon, 12 Jan 2026 08:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62C611CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48F696154A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caZVs2BxL1ev for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B6076156F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6076156F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B6076156F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D1E0A4C3C75
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-2dXT
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:35 +0100
Message-ID: <20260112082950.2528445-87-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206633;
 bh=b6DeK3W/bIb9qJMMk55jN5OybufkFHxv91T8VBXylWU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=US3H3/PDy7QdfNAl3RgcBst0sqOg1iBAIXp/kAaD1pdKDARXQAKJFgY8XCW7yBd/n
 45b3JjcQugeN9yT5cO350ASsJlmdw6NcqEw6x8JBpoXpOYYhGvy0XPf2On1UaOwFdU
 HePPHe6Z4459ohnqfKysy6K5ITPmPHlcA0wFaq/N0R+537kN6Ry47xUFNiVHFtHEzB
 SR1AW96gBNHKmlvfkSXtEVdmtK+2e9RlDZgCQ8jMUsoGfcHebJUvN1xhlh018uj6QA
 +hnZr3+zWKsmPr9QRu2Y8hBjBzZPlCxoGZvmLirzwiIVuJafzDNPQQ8fho4uxuGpwD
 taxQBHAqTwUwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=US3H3/PD
Subject: [Buildroot] [PATCH 087/102] package/x11r7/xlib_libfontenc: bump
 version to 1.1.8
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

https://lists.x.org/archives/xorg-announce/2024-March/003462.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash | 6 +++---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index a061ca4a4b..36ba578c13 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003285.html
-sha256  c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2  libfontenc-1.1.7.tar.xz
-sha512  fd8578a81090fa938dd75ad9081ab62c6c54fa2535d1c6291afd799ac8dc7c344a43f07cea5cd4433af16df0d926c22e7c169877bc8b13d92584e7dec173d701  libfontenc-1.1.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003462.html
+sha256  7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6  libfontenc-1.1.8.tar.xz
+sha512  c9ddea9c0c6c6f4933b5b8ed2044e3dc259a9edbb3070a32f0335a6ad4d47b1858cefc01fa2dff9f29808bee311e9c677b05861200d2f2c4552c92b33fe027e2  libfontenc-1.1.8.tar.xz
 # Locally computed
 sha256  a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index e12086b125..d419a4ac8a 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.7
+XLIB_LIBFONTENC_VERSION = 1.1.8
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.xz
-XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFONTENC_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
 XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
