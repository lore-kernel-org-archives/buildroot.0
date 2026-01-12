Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6217D25048
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F44C614B1;
	Mon, 12 Jan 2026 08:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GF8g5qnpChfP; Mon, 12 Jan 2026 08:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A408614C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205552;
	bh=e9pXWAudr5gYG3dlgvXEwX/X05Y9+48D8ElGb9dpV7I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXSPo7tCJXCz3ADsB38VsC2C/U1R3UhQKiXiK5mI46OZQLI+9L5H+CFQvcyJfGTz6
	 rsdntIp3zTmY68M9LVObmhYOKyStoWgzF5eEH8KbY2FAXr4Ez3xQGHM4G5R8gWMUUF
	 7iEx8cjUnQnaA1Z5eKle7LO4d6obGfiA3EBPt2WmuyeXz5JVaB0w+/+1RkiPMEINLt
	 aHzHzmv/sIFb28iqJgU9TYhxQUkRaqm8F/J85nNE9ptA0IrJTFFa40dHaOKnMVhC3I
	 A5Vd+fe02jArR90s10C1a8K/HGrXFN+zCAVZv7pPZldrRhXgcR32E8IqR6ci7gjNhn
	 zyk+ultsdqvJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A408614C8;
	Mon, 12 Jan 2026 08:12:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4734818D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E1364031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKTDANzVcOS8 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 131C34013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131C34013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 131C34013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9666A4C3C14
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-31g8
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:03 +0100
Message-ID: <20260112080419.2516889-88-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205120;
 bh=b6DeK3W/bIb9qJMMk55jN5OybufkFHxv91T8VBXylWU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TJeuretp7g1IIibFEVTuU8Yl068bx/jJXQeErB2I9Lx0cdPUAbOaexkAW9EX9q2ER
 5kw8rWRJH3eOW22wFuM4zkL9hnT7yX3M+PUB5toO698LkMEozijrjoXHjnWXSBZMD8
 QBlH8P+cD2E+1UFN1wJzyrV4tomMMBMMPVmfCX1YjnS8MPrWDqr37ogWR4i7qmR0qg
 /QHk+B1/4d4YspSnSESeewOmqikSZTspL8+S437clwMTm4f1Au72yPe/GDERsI5snE
 LxZ/RvTBFkBS2PPe6HnYlFDhG1dMeO5uPbCyIkMn7FKLpf2CkmQCcPI3X2iOad8N4B
 xZ5kEGu8uq/3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TJeuretp
Subject: [Buildroot] [PATCH 088/104] package/x11r7/xlib_libfontenc: bump
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
