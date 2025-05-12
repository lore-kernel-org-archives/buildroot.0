Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB87C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3118A810B4;
	Mon, 12 May 2025 21:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGSutFzQ6mej; Mon, 12 May 2025 21:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73398810E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73398810E0;
	Mon, 12 May 2025 21:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F74671E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25C2760EBC
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z66onP0ccokN for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7524A60EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7524A60EBB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7524A60EBB
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA960A4C055D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 23:48:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37406)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEb0s-000000000RC-3fcV
 for buildroot@buildroot.org; Mon, 12 May 2025 21:48:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:48:43 +0200
Message-Id: <20250512214843.470210-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747086523;
 bh=utN4fLGWPPmCu2BbUKZe1d6Vyh3j9/LsMqqce7syGAs=;
 h=From:To:Subject:Date:From;
 b=bYRk0g7nkMF8GkjbxtoSMOdH4q5a/dfUXh5hlPW4ES30JCoAwx7bPVvSb537/Hi4C
 1TiedoB/m6z97ZeKDnQI2bo22ufKWJ6lYY2r3QvPoAMFUp0bYvHTpcgXYEI60zIi2f
 pFRGf6z+h76fXg2XI+BoJ/1zd4QB89qBxFElDy37qh5xWK0hVBMDaqgImoPDAYcS5a
 0QsYeb/av67FAEFO+XWxUQC/GAS6Fj0hMzIYNBbGJ+7ph/l7Dskhr7NhDbn3QROLh2
 WTwMmqhBWiykO+ADxtz79ji6APokqPfcrKc/+jyS/f8HGCerCTbCZ5haT4dnHnbzmC
 oPW9TxaecNP2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=bYRk0g7n
Subject: [Buildroot] [PATCH] package/dhcp: fix build with gcc-15.x
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
 package/dhcp/dhcp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b3b7fe3203..ab3150ea6a 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -30,7 +30,7 @@ endef
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1 -std=gnu17'
 
 DHCP_BIND_EXTRA_CONFIG = \
 	--build=$(GNU_HOST_NAME) \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
