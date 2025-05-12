Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B44C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06CDB80F49;
	Mon, 12 May 2025 21:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2LAb6cQBWO6; Mon, 12 May 2025 21:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED07810A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED07810A1;
	Mon, 12 May 2025 21:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 104C2150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C9940804
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz9rg8DfebPf for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6432240BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6432240BAE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6432240BAE
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22021A4C055D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 23:48:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39032)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEb0B-000000000JD-1ECd
 for buildroot@buildroot.org; Mon, 12 May 2025 21:47:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:47:59 +0200
Message-Id: <20250512214759.443958-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747086480;
 bh=tKNMtKtmF+lh1uKBJqz2JvRca4WySeFr4Nb++BvRE+0=;
 h=From:To:Subject:Date:From;
 b=Kg9waOrfJ+CndwD3QVOjofFIgxc1tAM5y6TYZBT/4084WVjnLfi57+U8Y0R/V1w7K
 46HLx6LqAo169M/0NqfXuUXaBDTnNlxhvE7ChkzhJWaG5Yk5Qkwew4I8F96AS6535H
 5C7J9gPZuDSWpDKXlRavKIdtsDdS3yxyvr2fv7glkf9ibkAcPjOuCyiQURtJPXIe1T
 ykEEd5xHSFkZuuPrx71EqySyf/LmzFIVIT+oJ2VT47YRlNu+CPtBrHGY4rMSWt6gxz
 v87QfoQGj6i6lVro2KEJX78q23ELHh7PWyXiMfD6jBG9nTBoUHvDIseQDm2Fm3P9zh
 i88kHxKa3Vpcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Kg9waOrf
Subject: [Buildroot] [PATCH] package/unixodbc: fix build with gcc-15.x
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

Inspired by
https://gitweb.gentoo.org/repo/gentoo.git/commit/dev-db/unixODBC?id=b5629b3aefd8633d378beea7e955d66ce709bebe

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/unixodbc/unixodbc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 28f1e5bc94..fa69776e04 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -12,6 +12,7 @@ UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
 UNIXODBC_CPE_ID_VENDOR = unixodbc
 
+UNIXODBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
