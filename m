Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58554D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3113461535;
	Mon, 12 Jan 2026 08:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2jP1Ohhi3eU; Mon, 12 Jan 2026 08:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B64C6155E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207768;
	bh=Zwrb1qRKMCEa1QAVCvjkWCBGmM53xnYrAVGRCIfwohk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnmSiIlMShiTrPjhnLBevVbwpF57HThxKAbUjOGut6p2nxCL5n3FFGX9WgmX3EWUu
	 xKZtw9u+ZERxQmbJbL2Y5zBr1v+F6gSkcJgFTP+pXaeoY+/M/WtgV4JGMmer6fqLIz
	 6VFSQjBxfoipra0s2sclN9azPFJBOZUVbXeskxeWFX3qmOaH8F9yCerqcvZzoT/EpQ
	 RV5P1oPdovlnDkA+GjDior6ICniAnJoAxAhZoU/cb0r3oBFcWmC5D0B9klNVdnw4z1
	 Lsm6TfDTgF7pk+2txP4LQNu9cYib2P0ghTZMrAgB5K58iHjBBpDsqlOvs89oMnvkcl
	 eqjezmDPeVITw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B64C6155E;
	Mon, 12 Jan 2026 08:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32D9F1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258C5415C0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5u9jXhIm0yZ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37DDF415BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DDF415BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37DDF415BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94822A4C4199
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-0Ezq
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:57 +0100
Message-ID: <20260112082950.2528445-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206671;
 bh=nlg/FuLEanukwF6LHJiFg5JBZTUZ4R2wVa9ikWuYeaI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=uMCpeKi1EeKJznTH9K4sdV/TB03OfzFZUOSb0mGvqVAQJ4RGlI7PaujMqLa1Gp05c
 vfqzyhp6hMbJXN7qGW/gznReQgx99aOXukszbWlgL2EDfk9RVyJDo0umGLhefulJ4c
 dnzd98RjV73J903rUKuU4b5pSBcp3hiRoMsdFkjqpGOnB/DZvLkoEqJbmGeNXR0OJl
 5uQB3ECgWDHqmkYcieq5d+v5a0B9JqTNWAU1wktlAQ/3d14FHgunSaB8vZ2HDLyHwT
 aK4G1BWKpRkwGG7y4OOiofjXusxstym/y2gLI8gL4QsM8U/n/3QrZhgqWPUxSJ7SQv
 re3Y6SBTo6/Og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uMCpeKi1
Subject: [Buildroot] [PATCH 049/102] package/x11r7/xlib_libXcursor: bump
 version to 1.2.3
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

https://lists.x.org/archives/xorg-announce/2024-November/003549.html
https://lists.x.org/archives/xorg-announce/2024-March/003465.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 6 +++---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
index 11575edbf5..6a0a2eeaf7 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003136.html
-sha256  46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104  libXcursor-1.2.1.tar.xz
-sha512  ebb42a39855aab86d0c11fe6ad33d011cf56a6dc5c309bef643460319c03df239b7e09fe88777bb25c0e9ff8aceac6bf66e51cc04a2d5ee463b3bc3bbf1674e3  libXcursor-1.2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003549.html
+sha256  fde9402dd4cfe79da71e2d96bb980afc5e6ff4f8a7d74c159e1966afb2b2c2c0  libXcursor-1.2.3.tar.xz
+sha512  069a1eb27a0ee1b29b251bb6c2d0688543a791d6862fad643279e86736e1c12ca6fc02b85b8611c225a9735dc00efab84672d42b547baa97304362f0c5ae0b5a  libXcursor-1.2.3.tar.xz
 # Locally computed
 sha256  ad2e9d279088c5d612fb0e506ea8bb7d9f01b411e7f4b97b64589c3cd48a68f1  COPYING
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 4a1ffcce9e..44319cc804 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.2.1
+XLIB_LIBXCURSOR_VERSION = 1.2.3
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.xz
-XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
