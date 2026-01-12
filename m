Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72022D25055
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E4F76159A;
	Mon, 12 Jan 2026 08:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7k6s_2vvslrD; Mon, 12 Jan 2026 08:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F9C5611C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207104;
	bh=soK9hjkXOQCMSycQJnV9pYYqSlNkue2OnOUBjvJJo1A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsOyMMgKDT5IggJVI7POAdEnViT6FjMBaJoxrEmP2iQnaGWB8NfPZzqdgh6HfGx12
	 z0AjNaQpRraXLGMtAX3138aZScqjxQvad4qNxp3DU4Kk9FFtni3MpvO1m4Oy0xNpxw
	 GzMO3Is3nTIo4W8HuwSrId1YhZl75bzjh8bjlt4dyL0saiZusEDb5Jddvr/eTh4sKO
	 nEPJtsB6i+Bgax6QeB8AHdLEkX3pfik/ScDkJpO0tdegdo0DyrxzwthX83/L9enYdh
	 tfiBpWiPLEBW9MCmaK7wnBMV2N7wsAMtqgGukPAg5QsKXgKR0JRbkktj3cixLARVHc
	 xo2BJc9r9mXqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F9C5611C3;
	Mon, 12 Jan 2026 08:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F8A18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5584441574
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEJ0i4gntlSA for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A3D441572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A3D441572
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A3D441572
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71384A4C3CC3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-09lj
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:41 +0100
Message-ID: <20260112082950.2528445-93-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206634;
 bh=p4XvjiPQcpw2jXLfzYaKZjRZ9nJhJK28VOCtvbAo9iw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=JOnkAuqUR9kYptLWRHwQzN9uKtYZb8+xEuWRdKjw1PodsqpXaJj3NmM65TInWIRBh
 ilJa/PLyg5gBY4AsD4R/RmK4wUH3uRzj9Oob4QLtMPavOKZ84WC76IJb42OuLQlklq
 tXVSxjtt8vX8uFZvZRocBji4tqfSz8g28DEGzMqWDho9HmizmIcaN0vTlakwXggOAs
 72j8jqxiVPGK3Ztlsop2D7N0IWV0sSa4vtniir8vXotWU4wFpp9Nq4gZbQx/vnR8ih
 9y0npNRqcp1uNVR074yrkNCAqmt6aOlL+pnQEwaY5OXydKkKXb+vVZQcFiVn08fKQc
 H+mXmNZjIftTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JOnkAuqU
Subject: [Buildroot] [PATCH 093/102] package/x11r7/xapp_xbiff: bump version
 to 1.0.5
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

https://lists.x.org/archives/xorg-announce/2024-January/003445.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.hash | 8 +++-----
 package/x11r7/xapp_xbiff/xapp_xbiff.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.hash b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
index 690c932e37..20fb16ca0f 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.hash
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003009.html
-md5  66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
-sha1  193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
-sha256  e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
-sha512  0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-January/003445.html
+sha256  cffb10e2488b09695da8377f395a4fed6d33f5eb9691322ebaa969e8ead7b0c2  xbiff-1.0.5.tar.xz
+sha512  4dd8943daf670dffb6e108b192977f6ad313d6b0535da0c809699e05f0509aba45be81c72af341e1fef31f59d0a5f209d87441230b3fdcecb4a7a8fe7a9c0658  xbiff-1.0.5.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 2c3975c167..5c626acf19 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.4
-XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
+XAPP_XBIFF_VERSION = 1.0.5
+XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.xz
 XAPP_XBIFF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBIFF_LICENSE = MIT
 XAPP_XBIFF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
