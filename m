Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1213DC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 11:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C9240F83;
	Thu,  9 Jul 2026 11:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ7GdQwPkz1K; Thu,  9 Jul 2026 11:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CBB4078F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783595347;
	bh=18yfqtcZbxiwJrdTkw7oZyF4DwA+7gwHP7u8/s2SuEU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIlPFj9PCTbZvY1IT9v9yUJhycD3eWavPjHMtFlIKQINiCRC/snV5AyDoYv6R38Ye
	 4X0vGCaOCa3+fCloOthr4w2lUx7BP08OcqpLs+Z+JG9VUt9NCxmBJStPdOMoFf/8cI
	 WbN2oTmO5zrzRV/E+lotRQ07kL+/H92pzY5wKA1f+3VsmJJ6VM3cMgB0nw5x+3x7xw
	 lgQGxDfDo5MXn+YpRfb73hDw2xAG7zTgx1DyecRZpz145b7Y/R1t8lPhQV9Wq1ZgUu
	 BufJAClctUYUbe1UmhxqCOLylPc1SMAZDoozYi0gLzniXnuGkORGl3SiTxJoPphvJp
	 0KM9JWNxdcveA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CBB4078F;
	Thu,  9 Jul 2026 11:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91F8A315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D2560E4D
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf83fPgoVwY2 for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 11:09:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7785960AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7785960AEE
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7785960AEE
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:09:02 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 81BF0BDE3CDB;
 Thu, 09 Jul 2026 13:09:00 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 13:08:06 +0200
Message-ID: <20260709110822.305873-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709110822.305873-1-br025@umbiko.net>
References: <20260709110822.305873-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783595341; bh=QTsve5vfBXkSGUqaW7qN+6kD9lIeenxk6xacxziUE4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ctz/NYERCYahA83Bz1B/8KOFvSuFPK2Fdu7MojjD1QPlZ7Oz2DVtULNvfIgMrHQ2h
 pH0p+8Hv2ObLKycv67USzf4MRvy9xPQN3BOGkKtd2sfTOhCyhc/4XEbgBF2Udw/xef
 YUH6ZuYYq88zsY/469yCPnw1kHJ2zTeieXgnihzs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=Ctz/NYER
Subject: [Buildroot] [PATCH v2 02/11] package/mpd: remove duplicated
 dependencies from sub-options
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

After various updates since version 0.20, most dependencies placing
restrictions on sub-components are now superseded by restrictions placed on
MPD itself. Example: io_uring needs kernel headers > 5.1; MPD needs kernel
headers > 5.6.

Remove dependencies from sub-options if they are already imposed on MPD. 

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/Config.in | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1b6815e904..e0ee7fa533 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -217,15 +217,10 @@ config BR2_PACKAGE_MPD_LIBMMS
 
 config BR2_PACKAGE_MPD_LIBNFS
 	bool "nfs"
-	# libnfs -> libtirpc
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBNFS
 	help
 	  Enable Network File System (NFS) support.
 
-comment "nfs support needs a toolchain w/ threads support"
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
-
 comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -295,18 +290,14 @@ config BR2_PACKAGE_MPD_OSS
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
-comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+comment "pulseaudio support needs dynamic library"
+	depends on !BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MPD_SHOUTCAST
 	bool "shoutcast"
@@ -333,14 +324,10 @@ comment "avahi support needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_MPD_IO_URING
 	bool "io_uring"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBURING
 	help
 	  Asynchronous I/O using kernel io_uring subsystem
 
-comment "io_uring support needs a toolchain w/ headers >= 5.1"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
-
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
 	select BR2_PACKAGE_MPD_TCP
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
