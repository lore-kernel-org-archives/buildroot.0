Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DCCFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 07:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D10D60EB6;
	Sat, 29 Nov 2025 07:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXlp3lpPcx7f; Sat, 29 Nov 2025 07:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6288460E40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6288460E40;
	Sat, 29 Nov 2025 07:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBAB708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01E71814B5
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBXam1F0KaCu for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 07:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F37D4814A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F37D4814A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F37D4814A1
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:40:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89572A4C76EB;
 Sat, 29 Nov 2025 08:40:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPFYx-000000007N4-0zBA;
 Sat, 29 Nov 2025 07:40:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Brock Williams <brock@cottonwoodcomputer.com>
Date: Sat, 29 Nov 2025 08:40:11 +0100
Message-ID: <20251129074011.686916-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764402011;
 bh=3+MoUGOsIwfaz9n4DBFf3cdA/QAGGBiOV8hqdzM750M=;
 h=From:To:Cc:Subject:Date:From;
 b=l4InbOA0p0d7TUTr1TxXMEtEY2dn+sTXYUxVQ4iv0dSMLliXSab/e58aR4zi5c7Mp
 dT78aJOt8fgrpiZxkcPZoBcLqlJqjCBJta8XnGCLxza2H7s6CI+rpPxiKuWpiE4+4i
 IoWZD7nnNIh++kmw8NHpUuPqxenfHrYOXHveWzxF4uq5LUDY2vW5LY2vO28dRMBH50
 LNpUUmiLfLz/LKeimJ1jBSXvn+lETKG6Sv6y60GrWFvbDRMEEIN9m7r14VkBRvAszc
 XGe2ifwSEEKZ3IWA/sXpCo4ntxz/shKR4SbpBstKZhoPEHJC7AGvKvPfh8Xr2bI2+L
 Ynt8CfaopkNVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=l4InbOA0
Subject: [Buildroot] [PATCH 1/1] package/pdmenu: fix build with gcc-15.x
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
https://autobuild.buildroot.net/results/554/5545162ca0206cacfca1617280f074237e72aec1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pdmenu/pdmenu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
index 2691a67ef6..72eb95bddc 100644
--- a/package/pdmenu/pdmenu.mk
+++ b/package/pdmenu/pdmenu.mk
@@ -11,4 +11,11 @@ PDMENU_LICENSE_FILES = doc/COPYING
 PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
 PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+PDMENU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
