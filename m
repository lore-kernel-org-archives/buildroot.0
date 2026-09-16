Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F677C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCB580827;
	Wed, 16 Sep 2026 19:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16aKj7fbet7B; Wed, 16 Sep 2026 19:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C12A88086E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789587747;
	b=HvmFO2utirv5TOMC/VV08mpaP2WKvioX4Kn2pxVe/jh3yiW0tcsAkV0qxedGiVMxOuqe
	 IF/yciaBxlnAKVCarjfv8hdpJNGRKcNo0dL7xpxunPad0g8DGXRqw2c8zG+/0t8auNqNF
	 2r1ZXlYYq37dJYQuognCUtbvfUwD7ms2cVLmug3RY8D++E7+K4KwK4jYuBauIRSMAGPX1
	 OMgqdIPnrp/C4VEyyDtq+gg+mPWBtouqVVnCqHIvZYvtwM3EXCug8LU3OphaTb4wSZEZo
	 DTSXJjoAsk4CnBdRgZJ0PUfnSVzbhhGjM2iJcrEYBxgFGPNBjOInL1ANdoECdDQrCSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789587747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9HbFWry8qXCC5xutGpNcQcwugJi4il2exkvjauVX32w=;
	b=fUXBkWxKLmqiR9A/a8I/XIebbCNEustBtVC23tv8NSWsuIUsE9Q0LwDZvHGLRo0dEV7A
	 VJTWq8mKzbmSYjZeL4XrQJrw65dgP/IDRHJFp3Xu9DLoLW77HriJVCK3XosZMNCkeSGJi
	 VlOPL6/EEGrlrbZy9fe7uDeOVKLrs0g7SI63A9C9/i/N4j0Y0JDCR2yhlgJV/a2rNMzFn
	 TvVJ55Qufg4uLQ1NIEVdOhdh8/IkISqverlcOkUv4bIMtjGW/F/Mt+aQ6LDhz8QFbstxW
	 QoXvzeIBj0C8azorIhfXaXhGQTlcmBIgbCMqnOwkNuELVl/11Hfh2Y1D6B4cQlqL4yQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=I20SEVIc;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789587747;
	bh=9HbFWry8qXCC5xutGpNcQcwugJi4il2exkvjauVX32w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H5qIpRJJjmnrj7nzF5cxcl6zoKRHdzCF+C9EJyzwej1gp3sFCdMW6bnoy/xh/hnT9
	 umh2pIbTIf3w9FgzJNOSkiCGGuWhT3TuIVEz6fkCOm272Ic2oCIdUhKgBZh+n0nwZT
	 AL6fH/WM/z6uGppFUcbrUwksE0GtN+qBi91O/67PEPTxiXrvSw0x5LCKfz1wxv2bJC
	 n0f2klLQehCBDj3cnw2ZCTktDq005rF5f9uAzlBcQzMlxvAhXbK2+EUUjgeNWNZkYy
	 79RJ+RjTp2RAqPIHG7Fz8/LDL+1W7iJmsxAV/koQipWEVcP1EVgEaI5iRCUHWGOQA7
	 apgkrWp3C8syQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12A88086E;
	Wed, 16 Sep 2026 19:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E23012E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C818D8086E
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S1rcuFjvoU4 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F344180827
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789587746;
 b=pQL0VC1Bi4k5N3zPdmKotEvktWjfBRpe002s56va9Pwdu4S2SI2J4bHIrPLXvkS+46tP
 8mcgjKlGAnVaZ6dQYLtVmWuExT3scP5MBBq8MsjI8INeS+yBQBF86A3VHuOmBcC0HIXlC
 rIlGjqLycC1oWt8xn23rLlrRlesrLgZb2JlxB1Nt9GAp0J4H2JelSI625jYE/VSurlQ2r
 M5V2fYhNSRvUC+vv0O+tJa7aJmYzRL+7yozRMrmE3va1jr6DEV7r5ty5VzCwmVB3yGT5n
 p7WZwp13DN06lVifSi+h8/re6wCJSenR7VRj8ere4IH4G+rJWMq9R5jUxXMAmXvrfUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789587746;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RmKpI9+WGW2LDtQGgLSKA3Bskx/9x4WvoD2U5RKfeZQ=;
 b=O1tEw9DlHVaSQXvHuhigV+8rUFT7JpJBKQBlGCfmnJRnVZ8xmlhBWFDVyBTN73ndIjMP
 zwSKunuvjkzQZMX6gO/VP4GorTCZ3VZDnswkKEOh0Q5/PobIB8nhLRqqI2F0bHCdDRTmS
 cbP6VRkeZ6j+ABQdlW9850R2kfHuqN+qGuoh0X1h8zsEEV/mJfzxcVODIGh1Fzln27iAV
 FPePkmIeoPh+qewmKQIXZSWDXhYxQ9ZUCsFG8jpgt3kka7adbQApyPQAGgviuqpV1ysT9
 6az2+LMUZTT5wC1plYxVsanLKbKw4/Xbxs6i6P7k3A7/xj+QUXiuui5CMTUIIJDCO5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=I20SEVIc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=I20SEVIc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F344180827
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789587742;
 bh=RmKpI9+WGW2LDtQGgLSKA3Bskx/9x4WvoD2U5RKfeZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=I20SEVIc5DHOOXT4R0bNFJmy0BNQMkxJx/4ePCfQC7VnbrFtvDxqqXmCaccwNsyyt
 gsZ7JwzJRbLaVW7PSsnTig9hxJzoii9FVkquY4/vcq7TFyyo67ytVLDnlPE/f+Xaa6
 UHbjZPUvummmzq6RGqcbzQMU0cyBNwo6R2ABS+teo4kDlgy2ZFCAQhM3FL50aWS5Ty
 dRce1NlTIlMZCfCcUVYS+I5YVF/DRLiM4hbfyNkKVHB1PBWJ52l3/eDEMzBmPPaPQ9
 FbnKfU/b6S54/vDvau++9VfZvYOJ2mJ81kqkXAvndyXKnvXG7rPuPXJ9zHoDsYJQFL
 J07zWDceoMOUQ==
X-KAS-Sym: v3:f51bdf72230551df:M/F/F4sw3pHiw0IiYsbbih9x5OE3bVA5mgINleQLQFuHJnDKx3NKUEFbUDEeaIQ14PThXGL/S9h8Rivsr4sK2Uco8JKIW4YvOU7LHcI2Kpt00lj6mX+D7FoEjeWZKj93x5ky5seWoof0aWuZkJzq77wL/K+If1tR/Bjy8plQaG7ugdEH7EHnYE1xDuvHO8i1i7YFFoZBb/nGyba2y83nwcJqb38J6wtZ2HsiyvsdItAFJazXhYa4/B90yfrgLDLeJnfxIdsVhVODBphiGxZEswKVvXxU+iLoWtNEsferYnbZtOExRX4BADKntXL+Kjg+So24KgX6b+/zBbHUktAdWA==:l87fFDoDnxaxUbwVTMeiR9cPs+0o1PAKpaHCFlIYbF6G7jX7teF+wtHkIe5hZnW2AbL2xPS3EPWF9X+oQJ1Czd/P8Zl8oX0PhBpEcRl97bT4nX3cEf3jupS9Qm1OCVUS0e4+1EAgWLNG+hcpHCJQB3+AT3QAW2+/4KEe+sWIzXbbl36GRyS1edp313TKX1vmBVResM7PzRntf2dHkJjYaM/HOUyIl7CWrOhwtAS9PZ375OCJ83ToBrO3SJDeKodcVkNMOrdbjtctlWaj0sVZnQ4aMYVUcgnJM5w8bLSlkYVPhX114mMnBMhhr/kH2xVc2CTZw0kszKL0kqpDrq8idiQ4bzwAFn/D4nYWhWFSIveq5mTrTDqentwjFKz/kD8hVEjcUk3yyiDDJG2001EwGxi9gJTaXcsopwGlLlOuqX1SZcuo9ttFqBPsqxCz4k71z7idfJngJ+xJmU9dk3tW0ismO1pXS7M6L1VJTXR4ZqAiMWvEPzxU6df73Ak2NYOfoI6j3vJyWUxKDN2ixwtFDm4+OL4ZTKhDS2jdk/elY0pQ9p/wJyKTXde808n/owwqWG0BJUvtMlNV32jeFJ46PaEC0LUz
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 977BBA4C3BBF;
 Wed, 16 Sep 2026 21:42:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38832)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6vWP-000000005Dd-3Nhi;
 Wed, 16 Sep 2026 19:42:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 16 Sep 2026 21:42:21 +0200
Message-ID: <20260916194222.1478392-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/bind: fix Config.in comment
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

The commit should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security
 bump version to 9.20.24")

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index ab8ddcd0a2..4eb024b260 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -51,6 +51,6 @@ endif
 comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
