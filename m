Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD7F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 16:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA6160DD8;
	Sat,  7 Mar 2026 16:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W86yRZrRrvYB; Sat,  7 Mar 2026 16:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E495F60E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772899451;
	bh=DDJW7AUH2Ra8wikbuk259ko6fOOyHdHlll4Nm8TvBI4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qQcMDlYAkKXfJkuHP0za1IzHH3jfknsj12Qln+pwTrPZxXRuhti/KMcF/uu7kFvZ2
	 KfXP+qDbrK1sbzpEWyGNQa2UjveNPk1aTCfyebS7tQgVT9v+HZy9oXZUFPmTVPNvbi
	 zC5bm7GThHbDt0H/6e3V0SrpiiYaM/4UgRE6L8H1JmE99FSr+RHgfCQOzsHwJlBrFy
	 bXEmDpzfdLUDwtGVOXNfUOh1JLIsxFG3ByI/o+Cx1lZdX7f7MclBBR2GpUiIc4CxeA
	 uJlOnJdriHnqSzmgOdugkdKgCHSV7bad1kWgdLhrFFLJMC/+lEUnqpAqCBTzhDaBrd
	 tGBCFGed6Irew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E495F60E0E;
	Sat,  7 Mar 2026 16:04:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEA9725B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49BD41D92
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcYmTMjcV0cJ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 16:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A88EF41D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A88EF41D91
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A88EF41D91
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:04:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90C61A4C2FFF;
 Sat,  7 Mar 2026 17:04:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyu8L-00000000433-10nA;
 Sat, 07 Mar 2026 16:04:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sat,  7 Mar 2026 17:04:05 +0100
Message-ID: <20260307160405.1745633-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772899445;
 bh=4lHIrUWfNDx0t37qDdUk01FJSoQcq77095LRRN4KoII=;
 h=From:To:Cc:Subject:Date:From;
 b=o0DIDlml8wKUsDYOKNUCx4hgqdLFcbjtmdhzW+7OtREtlsqz6H8WAgHB6j8lfi++M
 bU+EGm5oHx+bx0+N2wKTLNh8SLkhYxrpiVTk3xDhxAqi+weBBU/4xchubSaIawol02
 +TdoHZMzhcjJyMW20QTNUtlwfDPcoa2zNGgY2BXlgMJtD1VA7owoUsLSHefaVrVhcf
 P624j8SaNIlLsXAVzWE5JkuVdIznC2h5PmofrrNF6TPTvpXj7SYWSNmDQeb9LNIq9K
 XHMIxstwh0Ky9IFBGS0b/u++vVwpF49MvFEyqq/4w9w3IvtPxnP7sk+UzZohOUZl4h
 Jrk7N2vyloR7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=o0DIDlml
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to 3.1.3
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

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.3/ChangeLog.md

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jpeg-turbo/jpeg-turbo.hash | 3 ++-
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index d6373f4998..cb5dd5b71d 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,4 +1,5 @@
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.3
+sha256  075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0  libjpeg-turbo-3.1.3.tar.gz
 # Locally computed
-sha256  8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf  libjpeg-turbo-3.1.2.tar.gz
 sha256  2189dc45a8fe96204069f8124caa53a148dfdc193f50f584c6ca7849a6072872  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index a25f9e3f38..eb981793f5 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.2
+JPEG_TURBO_VERSION = 3.1.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
