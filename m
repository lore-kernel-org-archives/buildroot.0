Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2437CC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A52402FE;
	Sat,  3 Aug 2024 10:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l63BnjfwKUsR; Sat,  3 Aug 2024 10:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A6E402BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97A6E402BB;
	Sat,  3 Aug 2024 10:46:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6001BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3702581ECF
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id val_LGKt9hdN for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 222CF81EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222CF81EC8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 222CF81EC8
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:46:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75D75A4C02CE
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44318)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHT-000000003LO-0GNi
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:34 +0200
Message-Id: <20240803104634.2574205-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104634.2574205-1-bernd@kuhls.net>
References: <20240803104634.2574205-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722681995;
 bh=o+zMPz4Bjd7bb/yybNx9Qu0GfoX263Kz8YUphCsFWwA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qwxb4OtDc4cbZI1qRmk0dUxkpSktckjjlBTkGxKt0/PAUP880PQPg+hlEdJ1JEms0
 3jkz1eCiT2p4G4b4MN24RPgF82PaYSWfCwAsYOXIHHa/I9OWy0CqqeLkvqYFmTbwmA
 kXl10a85Xf2n4S6lHRDainhzIoQ8M+T1fSVOUrUvS78iSOLx573ULwZmqOF7CE0Zsk
 6O7AXWFuJTSdmaDB+YNwq4zY4Ri/LFlyGO6XVZVe3apuVWLofjSBaV5HABw9Yv/zOM
 SejB6DZwkVhU1ZSQz7vrc2Tn4SU/744H8Z3FoSaKahokgO0T3lLyI7puBOLuCLmVnQ
 dDCXGhdBJ6EVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qwxb4OtD
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.9.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

The 6.9.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a746f682cc..94092d38f4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_KERNEL_HEADERS_6_9
+	bool "kernel headers version 6.9.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.9.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_x86_knightslanding
 	bool "knightslanding x86 architecture support dropped"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index b6ab8b3267..4e05f4a765 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698  linux-6.10.3.tar.xz
-sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
 sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
 sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e235689700..83b8d1267e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_9
-	bool "Linux 6.9.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
-
 config BR2_KERNEL_HEADERS_6_10
 	bool "Linux 6.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
@@ -433,7 +429,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.12"	if BR2_KERNEL_HEADERS_6_9
 	default "6.10.3"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
