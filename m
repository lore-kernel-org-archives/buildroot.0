Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09DFAD41E
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 06:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192C381DF2;
	Thu, 23 Apr 2026 06:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgEuO9mCyJeL; Thu, 23 Apr 2026 06:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B41281DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776924862;
	bh=8PMNNDxyd6H5SWCgoRpeIwLGSZVIFonepO+/tUSGasM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfR45HcKTYzlRbQOAxaZDPILCOb+OLW551OPyWHjz4aE0uWUcE0v06gQ13TJkWmxF
	 Cs7yJMB3rFkkfhJaWOr3lLPpvYkeXJCP85ghw1wifGaDKHIQMduqfh/bJhJZ6zvT6g
	 FAnp2bMDkpgFH54bVYgNvkpLlN3/c8b7jFCSbAFI4PfvzUzAS755Pxg4w+9gLIKYFK
	 9d4jIhZlMzLsBOPyUMkko5qvBeSwsjSYzoBIZOZ2rixhSvdA9yb+sDeYvC3ZHMOCSe
	 i+vEtrrDDRuxXWNaHoU7w2bZZ9SaMwlRUwlaNfOtjlYRjY9ipyyLFGJAyB8/2qk+uk
	 4RdMY7JF1wC3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B41281DEF;
	Thu, 23 Apr 2026 06:14:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1334E206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECFEE60B93
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tErrjoVWuir9 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 06:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAF3860B8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF3860B8B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAF3860B8B
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48824A4C0CA5
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 08:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52274)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFnK6-000000004Bn-3waj
 for buildroot@buildroot.org; Thu, 23 Apr 2026 06:14:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 08:14:02 +0200
Message-ID: <20260423061402.39498-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423061402.39498-1-bernd@kuhls.net>
References: <20260423061402.39498-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776924843;
 bh=BAODv1kBWCNQ1U+Xa+H6ossu0Gosr93hbwnfCAO3K4E=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dUVnK0qU+FdtaotGCvJI1nbKrTMgPkSeHK4neh0n/mdWzuZisX+nLSjrv3pNZOChh
 aSsDAa8l8gtYhXcCE83g3+2tUHUnKzovPms+U7TDYTEa7bmjEZXRS4+QpTf1Isy2Cy
 5YlmZKt6RdMffqaj8rptJRC+812RuA2Q88ol4e82P61cvTYaoMFhoqqx8He5mCudBD
 GYG6rrW9srcsc2Fd3Iop4wZLQAEeGTDouxnTdow/+ZzJtmRV/1vY82tQ3sjWWdytdV
 s/AGqZDHJdb1wB6APhJypmZQmZMtsAZF5UchxTw78pbEuEKZGivuHdu368aYue0Qly
 SeqS0ZHKPV35A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dUVnK0qU
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.19.x option
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

The 6.19.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/6.19.14        | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 120000 package/linux-headers/6.19.14

diff --git a/Config.in.legacy b/Config.in.legacy
index af093ff3e1..ead9ceaa08 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_KERNEL_HEADERS_6_19
+	bool "kernel headers version 6.19.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.19.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_PCRE
 	bool "pcre removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 928ae172cd..a2e1be9d31 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,6 @@
 sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
 sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
 
 # Licenses hashes
diff --git a/package/linux-headers/6.19.14 b/package/linux-headers/6.19.14
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/6.19.14
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e38fc161e..0c1a90f920 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_6_19
-	bool "Linux 6.19.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
-
 config BR2_KERNEL_HEADERS_7_0
 	bool "Linux 7.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
@@ -478,7 +474,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
 	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
