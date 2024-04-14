Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361B4C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 14:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB44D605C5;
	Sun, 14 Apr 2024 14:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1ti4917tIm5; Sun, 14 Apr 2024 14:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D311D60685
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D311D60685;
	Sun, 14 Apr 2024 14:17:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C64FD1BF3D6
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 14:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF718176D
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 14:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uVQF0uiAa19 for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 14:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CBD0813FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBD0813FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CBD0813FA
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 14:17:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b92e.dip0.t-ipconnect.de [84.161.185.46])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84BD3A4C1459
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 16:16:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51496)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rw0f7-000000005Xn-1kQ4
 for buildroot@buildroot.org; Sun, 14 Apr 2024 14:16:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 16:16:52 +0200
Message-Id: <20240414141653.1376138-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1713104214;
 bh=J89RcfijeR/WIwK7VmBQJv+548ee/CuseQ1eLx2MgvQ=;
 h=From:To:Subject:Date:From;
 b=ZDlQf3O5oXfZqIg9PHn69D7JQ6S5hZV0W2VwlpGNuuVisqcdDiQb9T9JZFyXZ2QGG
 0XJosnioLzcttNF8jerRZNiWS2KYLthZEXSJJm0A/qiTclPQcbWID6tmGpdnU9Hj0p
 xgSQ6YMlqPjQJznHqdj2nMiyqKSh7Jzs39REPeNDUUDj2geMTZE7qDNObM8tMqrky2
 DExSyFaISiDOI+3TF9E18ZXyjvFb9p+/XMEAPqnoZYfewecrvqx1w/BAKn4/zBgPju
 2JfdqPKF7lM7GKhBqkXlnpaR0z4tiIB7SL7fo1OYnkotW+bsc3VmZWdqZBswg99Arr
 c35WOyXZYDX9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=ZDlQf3O5
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: drop 6.7.x option
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

The 6.7.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 76af1da348..98a4125f4b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_KERNEL_HEADERS_6_7
+	bool "kernel headers version 6.7.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.7.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 4fa9f701cd..d66bb54b5e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
-sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
 sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
 sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4c3651450e..78ba644c95 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_7
-	bool "Linux 6.7.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
-
 config BR2_KERNEL_HEADERS_6_8
 	bool "Linux 6.8.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
@@ -425,7 +421,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
-	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
 	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
