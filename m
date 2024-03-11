Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC80C5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 19:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2083440B64;
	Mon, 11 Mar 2024 19:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wWXMCjL7U2t; Mon, 11 Mar 2024 19:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2EF240972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2EF240972;
	Mon, 11 Mar 2024 19:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27D7F1BF86B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C1A4052E
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbstmNj_VQQl for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 19:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8D824052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D824052D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8D824052D
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:21:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0dd1.dip0.t-ipconnect.de [91.58.13.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C856EA4C2FF4;
 Mon, 11 Mar 2024 20:21:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56460)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rjlD6-000000004H7-1UFH;
 Mon, 11 Mar 2024 19:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:21:20 +0100
Message-Id: <20240311192120.252264-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311192120.252264-1-bernd@kuhls.net>
References: <20240311192120.252264-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710184880;
 bh=O/niSLRkYNp/QUlV3WJpaR+cpWsDvlcqzDZ6MSZRjh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jixmDzmEvAIj8/gfb8zykoBnIy82cZKZX0jl921D3X5ngVhtEQ+wVAsm53kgoNlS3
 wLhZd0IndAGTas0r2BvzCsBltHgVVUosZpu9uwe/nz6m8lxKQQfDFC/5F5arUBYVpr
 YwoWTaTP6frJIKJ/NByjW0hUwlWe+bOs8vffnrduWQW5GVOHVIjGKoBISKqfVGA0wp
 Dc2QNUxvQSUxXLnDq8aFizZe/YbwBNP7E4fqTCTcmQ2I6zBTN5CYnn08JlS3zR89vx
 49ajCII7TUd/pDi314dTYpTHbNFbjWKCJ+pt7rzTbwFsmPwkzaS6Jm57GnU5+FJVCG
 3sOE68U3oNQBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=jixmDzmE
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index df84cce539..d5c1fc85b3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.6)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.8)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.21" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
