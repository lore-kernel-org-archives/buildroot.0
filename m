Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FA9C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2410605FA;
	Sat,  5 Sep 2026 16:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0ZNoq8WHcNU; Sat,  5 Sep 2026 16:20:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 051B660613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788625221;
	b=aglpbJCH/iLEMn5h8h/STpxjhJ5qdw4ytWGnaLDp90NhTpDV3Iikdcnt5XSGrDiKAMNP
	 /zVUpWyw/pE3j/LADvckJdevrH8YOLbsEPoKBCeumOeD5wGwZsXDPDMqWXq7+0a1PAqRA
	 S3J+SZrMJOlxiXxQoJ8t5FsqOTFnxa5XZMOZsxZ2M19+zWI9gxLLbikDaiaFux0xOr+kF
	 cz+aWwIfJF65NXBxyB3TKptChsY229VJX1jim1rSrEhxPR4CQLCHdTf7D0hY6t7UmQ5Ne
	 suvqMiKGtGNjjVNyEeuWTMsKNXqkDHRf7Wpk8yOYO1rh6yaYZeSxMHkiaYXI/GY4C0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788625221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wRjpu0GAEhN1Jyx8D7cR2OV1onn6y1QXXSV9v53wWgY=;
	b=nUVIH2AGHhSq5L70MoD7efosxmw2giq+RSLMPaxyVOY7V3sOovH4qGb/NbocxYVdjyJg
	 1dObKLZlPCnga1aKF80DW6BK8ZnvxpCExQAU/Xaysg5aGusMBUOq2Xfta04+5lF5PJigD
	 3fpQv2fgbIq7/CyXCBg1wWy6iwsgTaj1KhlTOHwl/aBrHgmWEGkskBMy6GQ80HQbDrv19
	 16UTJtWQy0+5Xqy4fApyXw2sykhrMNjTsAcQRyhcFivR+pYZp52gFHeUES4Noc9WSiGVX
	 2iMJCGDclgRGwcegf/qBTdf6zacTaiWCz3LbUcH/mqXBM3yacGOzZhp033R2X38URaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788625221;
	bh=wRjpu0GAEhN1Jyx8D7cR2OV1onn6y1QXXSV9v53wWgY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PVabEz4SQcOuTbI2EGSVarIaRd0WT6lOOFB7fIU8r+ZbHTDh/UU8PvwSUrG3hBGLA
	 WJQEwfsY5vSM+lteuQngq1V7ZKMsEBzuy1RIXjsy887bBAe1kK27fJcuWf4Ud8uPoo
	 6RukhGwx+DpsGxCOWaLsHnPq1VaR4mfnZbY7qg0kzTIJCzni30ADvDePoWiIQxA4hF
	 GWc6u1XodN9JdNja8rldC8SysR4qVVTBg6SlIphWQmnnQBStJIayGUdaMyj0z5RbYR
	 +eszRf0/iJySvqWvYsWBaGG5JDeInAXYqt9kd1Q859cqfO8/C7pHbUALzX5/699KDH
	 z+0kunXXAcyaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051B660613;
	Sat,  5 Sep 2026 16:20:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B879118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F196B80F79
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06-tKr5dQRsn for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:20:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F197C80F7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788625218;
 b=EezqHvSideLUmoS/vOdBntbtdVONKOCxPSyU8rFdJLaulEktLaC2bIHUuwzRBvA8yexu
 m6PTCxGbJ4Ul6gMXgGGQ5j8XyIY8ZkN7bR6yXMwlOWKGICCGs4lZ6jkQUygXug7oiccEq
 ZjCGCs7p90v/FRJVj3xRHBqkZJHffHzFN7QLxT9RDPiUKtbxkslqYTtfTNPJrGqz+Dz6v
 8NjO4GZVlfc5RH8WbcMm+EjlK8UVn/37S57LAd9bclDK22bw5f0wyTG1snyR6k5Do6st1
 BltvRn4Kyq6o4yjrZp9erS5qbY+/wc6UPIk0j6g6SDgbDl+amdEV4DVno9lBhkEHdPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788625218;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aLSOOzz/U4zGnpwJpWF71V/SZqUVC69htgOdu08Lo2k=;
 b=a0YlTG95oWnPYOLVBWWs+myYqjc4dPFpQhmc4kN9o4l+h6YHH5NoXy1jXTiCuHSNglEB
 Nf2OUfZqD7PuUJ2YbgHY06JlO4BF6km1vMHx+lKAZV7OPyqjTsjayQJV1zdYsuR4Hj6Ve
 hCpDCDPhh69tmPiGHLXQ7gU3qipcAoBrIZBaGw9Eqflt1hnemYmwIEIBL71SXrsFhjKOA
 rtqRSgtl9Yy4E2tviZnbdUiBNiZVYvnhDPKlv9BY7jLx2HWjhrz2z13ppAmZbgH+wb554
 ugQ7/MR4/Vs30bm6sqM2MCSU2mB25cBkg0fsmz0JQ97gEATaXy9FMJE9tX9T7QGN2Yw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YZZ8OuoI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YZZ8OuoI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F197C80F7E
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788625177;
 bh=aLSOOzz/U4zGnpwJpWF71V/SZqUVC69htgOdu08Lo2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YZZ8OuoI3YdpgUMR/+2FZ5tOSEoOIH0jfZlAy9xCZ/gtZo4Bz4ZuLD2fzlj10TFUT
 QyvTlhJZ9gQ2L4FkXrVYosWw+VwLl9qtjTxgr+kcDIW7SUkM0uRq2AMJFw0GqHMFeX
 Aoou8HESwhC9PVN+WRz375STfoTjkBo5Lsd3oxuF1rzUVA5VtSYkQJ8gpZ5U6TCBoB
 mpiRAZXPmx5HvWPC8tcF8vQhWPCFR6zWbLYTuid/QjbtARds0oKQWH95/s4+PSjk9b
 vDQ440ROHGtvbvfenUh5wXZ3DlYYHtNGA476gXphf5Ye9eACMKIFC0O/y6q6Q5lIUM
 tj10RHZJP3TCA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35E67A4C3448;
 Sat,  5 Sep 2026 18:19:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42882)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t7A-000000006l8-3man;
 Sat, 05 Sep 2026 16:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:19:36 +0200
Message-ID: <20260905161936.549476-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905161936.549476-1-bernd@kuhls.net>
References: <20260905161936.549476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 7.1.x option
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 7.1.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 9 +++++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.1.13         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 9 insertions(+), 7 deletions(-)
 delete mode 120000 package/linux-headers/7.1.13

diff --git a/Config.in.legacy b/Config.in.legacy
index aeb9b9676e..d23033a9a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.11"
+
+config BR2_KERNEL_HEADERS_7_1
+	bool "kernel headers version 7.1.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.1.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2026.08"
 
 config BR2_PACKAGE_FLUIDSYNTH_SDL2
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3aecea4fad..f362bced0d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
-sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
diff --git a/package/linux-headers/7.1.13 b/package/linux-headers/7.1.13
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.1.13
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 365fe11931..2ba298090f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_1
-	bool "Linux 7.1.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
-
 config BR2_KERNEL_HEADERS_7_2
 	bool "Linux 7.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
@@ -486,7 +482,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
