Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C240CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E0F83F2C;
	Thu, 28 Aug 2025 20:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZ9Tl2NaTzRt; Thu, 28 Aug 2025 20:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B928983F55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B928983F55;
	Thu, 28 Aug 2025 20:36:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D91928
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03FF1411DA
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yvs8FBvdVJHa for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C471941218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C471941218
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C471941218
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:36:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c081.dip0.t-ipconnect.de [79.214.192.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E17FAA4C0733
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 22:36:17 +0200 (CEST)
Received: from [192.168.1.144] (port=58250 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1urjM0-0000000020g-48AU
 for buildroot@buildroot.org; Thu, 28 Aug 2025 20:36:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 22:36:17 +0200
Message-ID: <20250828203617.1130735-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1756413377;
 bh=4gWG5jETfEAYTw/hHpTfH7324IUenoDlglgs+8r6BKk=;
 h=From:To:Subject:Date:From;
 b=IguCTLxY0K46qOCvZIeq+yQuNBR+l1ejqVpvAt0PJ/jEeGLXXwlZEyzWBKhNY1gMx
 Ggz56Fo7vQ031Ct6JkOPyaxw1PGkM1jyWWnE4TFMLbbsJs+cB5RaO855GNbY06rMVi
 0Duk/YnBFrWTdANyB9Epmj9sPrMglzOR20LEtT1iqKM8wNphWOwSQTU3nYOY03b9hH
 oE+qaYggX0pDWRdj/KksxqrLOSl/tXt4T778hX9zzp8g4dU1FZgrSGBzjPdNJ0RWDw
 v1s3UZykCtTBf+J+f/8U43P73R9Vs2OWNcEHd6ukYeVWk7WU+WpPfbuONgLZ+AN5oB
 GMRWca7XvlRlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=IguCTLxY
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 16}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4cab438250..afcebe78b1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6aaa163eb2..0613a0d909 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b760a6fa793d774fbd3b7fa0bea3efd5c4f5294dfb98ef1bd5f6d5f7cef4f06d  linux-6.16.2.tar.xz
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
-sha256  80d2feb7334c30bacbe1e7dafa9ea415efb2c0ea4f4740ecbd1467cf5d94de5c  linux-6.6.102.tar.xz
-sha256  d9a03d3a2771c60fc726c58d3bba61123e5fd22d45ed27f6cf7a308c171180a1  linux-6.1.148.tar.xz
+sha256  d6a5e3c71a10b533a756251387cc8bf48bbd5c76d842ba5e957d8b1c316ab622  linux-6.16.4.tar.xz
+sha256  b650210ed3027b224969d148aa377452a9aad3ae7f2851abedd31adfef16bdae  linux-6.12.44.tar.xz
+sha256  d288dd38c3e62ba576ba6b3ad2a84cfba65cd43b702f6c50d1f701aee942b18e  linux-6.6.103.tar.xz
+sha256  c4e906b8d39a5866d25e06371d4de4454fbfaaeb67979a04e4137e807877be39  linux-6.1.149.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
-sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
-sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
+sha256  62b814f1a48e1d67764a28611f23ca1f1ce1084ad7f1d319acc05720a9a68604  linux-5.15.190.tar.xz
+sha256  08c1e982064c81f8445a8fff2293d430c716c11fd3185606b8275718d696d8d6  linux-5.10.241.tar.xz
+sha256  f10cfcea7acf7588087d7cc17ebeeb7d3ff783c040536698c544eed7c5e8a841  linux-5.4.297.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7ad66c33f0..f7c015725f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.148"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.102"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.43"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.2"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.297"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.241"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.190"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.149"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.103"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.44"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.4"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
