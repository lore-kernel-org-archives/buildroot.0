Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0AD6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1AE816E7;
	Thu,  2 Apr 2026 18:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiG_zh6e13gR; Thu,  2 Apr 2026 18:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A611817B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153016;
	bh=HITlyyz/8ABO88AoqAREnyO9v0wg/6EDkNqrO5Mxk/k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YkMwEayp6LPJtycGjxabvsLrpv0ggh1ETy09y6c9Gi9umrbynUAEf48b1xeT/XkHF
	 Qe8H0mR4Pe1PpDy/Hn8s6Y8Cs2XgzoEgIeSM0eclRMDGzOfjttdzXUKrvPk6Ke7I/N
	 2NtEyMjB80aalpbHVtCIVoZV0B2ivacCV0gyrbmK6kA/Sue/0bfcwyMSIKmIfOiKzE
	 q+OPqq7rJ9PVLo9+GHdBug8+iFCihjoI86XMlsjR53CjFlRkFepFV1D4cX51N4SwLL
	 p5A5ODf4dhnNRE93RTKrmzkxlnxBUcy5iNPXNFfBf26KzjwuBhDB2pBeQgR5Y/q+vq
	 cfOxrryMlSfUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A611817B1;
	Thu,  2 Apr 2026 18:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D720D2D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C902360777
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auQvAM2HQOla for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9DCA607FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9DCA607FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9DCA607FE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FD41A4C32CE;
 Thu,  2 Apr 2026 20:03:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49660)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MOC-000000008QY-0GiD;
 Thu, 02 Apr 2026 18:03:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Thu,  2 Apr 2026 20:03:32 +0200
Message-ID: <20260402180332.2779951-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153012;
 bh=a8LjhaTT+gqVOFG1UJc8h6zhPd+f4q+PmAYXgbOGugY=;
 h=From:To:Cc:Subject:Date:From;
 b=N8UCWmKsCPA/P3IjO7nXAtmnYn6fWJGJfiNVyEA/Ot69AK51KVI8FFb+yCaoYspH1
 9ShV6V0BvZ67RO0dnplu5yYcXT0idFoWiQx8gY5yEXbSNnKsidiWsBkQSeitEmvwv6
 epDD1MZ7Xj+1WtXz8ujmh0pl8N06nsTnm7jPOUMnPfMxmdo7IRCApBpPYd5aNZ3m5d
 mDFGJKZ/UoIsiF14g3xVxao4NFpzoGYyii+Xx3JeyYXL0XRrZb+mTDiaauHVU9RIZr
 cNQv944ESiRu30qmwviT5PzaOdptXfp3BffLZPBg1AoHbcX8i6GfK0597xELVKVYh2
 xzaQp7pntTp1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N8UCWmKs
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to 1.0.3
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

https://lists.gnu.org/archive/html/info-gnu/2026-04/msg00000.html

Switched project URL to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/Config.in          | 2 +-
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 8477ef6668..4ce089bf6b 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
 
-	  http://www.gnu.org/software/libmicrohttpd/
+	  https://www.gnu.org/software/libmicrohttpd/
 
 if BR2_PACKAGE_LIBMICROHTTPD
 
diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 59c87a738d..bd5d0b3e8b 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
+sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 335234c14b..b74a7a1338 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.2
+LIBMICROHTTPD_VERSION = 1.0.3
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
