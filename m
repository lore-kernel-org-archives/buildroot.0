Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCCBD5E38F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 10:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82BC605F1;
	Sun, 10 Nov 2024 10:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzQmqu47QtZB; Sun, 10 Nov 2024 10:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ACB36069D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACB36069D;
	Sun, 10 Nov 2024 10:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8526C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 10:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59BCE4012F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 10:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk349v-qmup5 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 10:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8B0D40168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B0D40168
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8B0D40168
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 10:36:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a50.dip0.t-ipconnect.de [91.58.10.80])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 304D4A4C32F9
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 11:36:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40928)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tA5Iu-0000000014W-1Acl
 for buildroot@buildroot.org; Sun, 10 Nov 2024 10:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 11:36:24 +0100
Message-Id: <20241110103624.1041337-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731234985;
 bh=SUGHXdDMnjKxNxj1GcdJ0SsRsTE41LV3rHHeN1uUTtc=;
 h=From:To:Subject:Date:From;
 b=qlCEQd3h9sxUi54LDLcliBUAl19r4h+WorQeUbekt55EQeET3QSWmVrvufQSixB0I
 RxDqG8cfjJ64GR36+0y7cPauCED40zxdRahsMKbLo1Abq3KSN3MpFc/+cL6oRPJNaW
 WchaN3+avCC7Z99OiwU/ysZP89KVU248WOjyl7fX1jotbIFnbVNDZElhk2vTDiZGQC
 mcZYfFWMBohfVIHjXqJwR7wibkOEYMV4xK1zJQbJWOxGISjg61eliUV7eeJH9e5iCg
 0aaQoLhTgU0wKpA85cIUms7Msq3joeTsHT4QGGF1fpSziL9P7PBEGAjElu8i0XhsYF
 54aZAXKEB6k0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=qlCEQd3h
Subject: [Buildroot] [PATCH 1/1] package/libvpl: not supported on mips64
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

Although adding " || defined(__mips__)" here:
https://github.com/intel/libvpl/blob/main/api/vpl/mfxdefs.h#L71

would fix the problem, libvpl alone makes no sense and the only
dependee, intel-vpl-gpu-rt, is unsupported on mips anyway.

Fixes:
http://autobuild.buildroot.net/results/50d/50d64ab2d547c70b39e2421ee2763d8309873125/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index b9e9a20fd7..5a370ed2e3 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARCH_IS_64
+	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
 	default y if BR2_arm
 
 config BR2_PACKAGE_LIBVPL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
