Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D990AC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE5160AC0;
	Fri,  3 Jul 2026 10:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ctb6CQV7yY5; Fri,  3 Jul 2026 10:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6AC60C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783074518;
	bh=18yfqtcZbxiwJrdTkw7oZyF4DwA+7gwHP7u8/s2SuEU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvs0lkFFOpOd73YASTZ1X81J7ar37/ul87c/BKxyTYnew0ntzTkfTtIWU0/Ie9iGv
	 5BJLnNPoqGKJJw4s5v57huGgDqjU4qJy7qTE04IXF9MZ5aYiMD8n9w85KcrDI6fiDE
	 N+ptGHkbaM3YqPZNPx4Itx3qJ5tlZ784TWwviCuELdsFjWq4mBaWBSpSjh45jtlIEJ
	 ovmJ8FrrtWm5YBNyRwO9aAiEhLB0Nip8E7O7/170aMR0wW121FkJEwwEUP5doyYBMs
	 7eEUxMhRRfsD1s1ZjUPYUd6jEW/rFkJEfuxJQHtMIVl8sFkyiPYTElriicgs35hYpv
	 mZ0oeCBe2DUaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6AC60C01;
	Fri,  3 Jul 2026 10:28:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C21114F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B576411BF
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCQkcWzs9VIT for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 10:28:36 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E07541146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E07541146
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E07541146
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:36 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id AD7E5BDE0C78;
 Fri, 03 Jul 2026 12:28:33 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Fri,  3 Jul 2026 12:26:53 +0200
Message-ID: <20260703102732.782347-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703102732.782347-1-br025@umbiko.net>
References: <20260703102732.782347-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783074514; bh=QTsve5vfBXkSGUqaW7qN+6kD9lIeenxk6xacxziUE4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YdyP9on9z9vyRaedhdTGqLKDDk1mW9hPhnq30X4SjGGfB4F8FLYXThBm9ReXP46/Z
 Wk0ezuyLCqeNVAVO7pMJKnZPeFjWkAUBxDvGWCFgwaxULnlQhxia3cJuT2ijzgZM/5
 lYq35FX50jRKd6LsxvCvl7AdLPBuppgWbvSvS3lE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=YdyP9on9
Subject: [Buildroot] =?utf-8?q?=5BPATCH_2/5=5D_package/mpd=3A_remove_depe?=
 =?utf-8?q?ndencies_from_sub-=C3=BCptions_that_are_already_satisfied_by_th?=
 =?utf-8?q?e_main_option?=
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
