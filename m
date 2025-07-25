Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E882FC87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 17:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3C76078E;
	Fri, 25 Jul 2025 17:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mM2X8ySUlES7; Fri, 25 Jul 2025 17:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA3A60649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA3A60649;
	Fri, 25 Jul 2025 17:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08ACB177
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E334D4087F
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQppZkaRKKqA for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 17:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A10640C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A10640C60
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A10640C60
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:42:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B584A4C0E41
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 19:42:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44116)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ufMRX-000000005Vg-03rL
 for buildroot@buildroot.org; Fri, 25 Jul 2025 17:42:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 19:42:51 +0200
Message-Id: <20250725174251.114514-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753465371;
 bh=NJ/6OfaJUKGAVhRmYdIIRLxn+/Su3+GP0Am8jz47Ltc=;
 h=From:To:Subject:Date:From;
 b=L9nkTF/7jPCCZfgt8WzTsyCQ/oN5mq1MCO1wmsgxr19bRIk/daxx7apJATO9WZajz
 33gKHUPDcleMWmFlCZCr3mg49oVSACGVZujFjc7qheuLVbtyhMnUdW9WGHEFdfMsex
 CPSGPZYIcwhyJ6mA1ij8l7+ICwB2xEll4K8m1pWKIkkecx0jLVE1lvxKrWXDg0Gk0r
 ReMmCutIWujBe/KAPdlSQS+CoSr7X3qKodTfGXij1scDRuWoOy9dxLjNCfdHQRLufT
 MIWSKSp1YJMGaSbFDzV3GkbxfDLTl+1Tun7o3k13qbcO3KJB6lm72o3lxxs2Vy3D0g
 4zXPkDD+5XW0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=L9nkTF/7
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.65
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

Fixes CVE-2025-54090: https://downloads.apache.org/httpd/CHANGES_2.4.65

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 748be01de7..ca9d1580ad 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.64.tar.bz2.{sha256,sha512}
-sha256  120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29  httpd-2.4.64.tar.bz2
-sha512  299cb0d87a7e0e0a99d22bba7349b6b07c69222897410f9670af29896288d1f4e1da81d22ac9e1d8d6ea096e88044ab1dd34555b40a4b1b1cb3fd4b1d1897a7a  httpd-2.4.64.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
+sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
+sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 7e9fb522b5..cb029274c5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.64
+APACHE_VERSION = 2.4.65
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
