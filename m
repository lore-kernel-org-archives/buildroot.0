Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3CCEBF86
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 22:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C29A828C5;
	Sat, 15 Nov 2025 22:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3ntsfPr4_a0; Sat, 15 Nov 2025 22:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58EC2807C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EC2807C7;
	Sat, 15 Nov 2025 22:53:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90F481A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8219760A90
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imUcI-VVJ9oq for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 22:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6426460A8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6426460A8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6426460A8D
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:53:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3200FA4C6AA3;
 Sat, 15 Nov 2025 23:53:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKP9A-000000008U0-3atu;
 Sat, 15 Nov 2025 22:53:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 23:53:32 +0100
Message-ID: <20251115225332.1826848-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763247213;
 bh=yKCnxATO5kPiSQXXhs6WesyAhbYefriqN91TpZ3gOtc=;
 h=From:To:Cc:Subject:Date:From;
 b=ODERJpBBHt87rqXQmi4UTi2Zy0NIPNyPzmMCL2ER8EAd0w1wBjkJgj0uVzICpZX4C
 Khh+A8fsa9rr35L1emRaGGNLYYoLSib4GXZkuBVwPDXNhCN4+VQCpbLa3MTEhd1xJc
 GaTk0XLTclB0nJ5M1SPE2F34SXUWtHb2U4aQn70VExZ6NX+BXndRl6rQ7cFsgKZIxD
 SvBVEgfdmUvIkqszx3Px9+mIFuwvM/noPMYHfox+BAJaFJQUrYV/Cjwk/WozFZEeSc
 lOXlRPsNeSMO514qgsa+8MqQdJLDzIK4o1sPtzq1pCaH85spUxbq4+vgnNMLsmeA4t
 EG3nvapPodtAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ODERJpBB
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: requires DES
 support in openssl
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

Fixes:
https://autobuild.buildroot.net/results/953/953210ed672559e63a96da729182af00ca02c011/

The build error occured already in 2024:
https://autobuild.buildroot.net/results/f93/f930c7b3219a57421c1b0a0ef3a4445c19b43e97/
so backporting this fix seems needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-net-ssleay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index d699e6671d..41c4669370 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Perl extension for using OpenSSL.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
