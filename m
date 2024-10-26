Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB7D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362A180DA4;
	Sat, 26 Oct 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8sv4QlyGuXK; Sat, 26 Oct 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6B380E92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6B380E92;
	Sat, 26 Oct 2024 21:36:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 905DD5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F35B60617
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkJQFshAQ0ER for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9C91605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C91605EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9C91605EA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:36:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02755A4C059A;
 Sat, 26 Oct 2024 23:36:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40272)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4oSZ-000000001jg-0zf4;
 Sat, 26 Oct 2024 21:36:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2024 23:36:35 +0200
Message-Id: <20241026213635.2793641-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729978596;
 bh=RH3Gj7bvCsv7BElrk07JtP2+pMRbo5Cpfa/wT1m6Vvc=;
 h=From:To:Cc:Subject:Date:From;
 b=cqNm1FjFmKqRRIO9deP7qUHwUa1klgPd/NHD+cXWESbw0bPX+D74sOTbxr8nxbcyV
 QDAIt8+aMREaNEXeNUPbJnRdI5rClaQzYQ6dJkM8FUugWRqpN1l+mdUcDRM/6zCz+g
 e5t8vpMPYS+C8tQINla4/qvN9cJxlM4uVUKGq7hMkhhail4nx1UzHveoaHou4MtT8/
 ZIOXT0w+urO1AuKAzI7RDUNnz5QXjHUJlT0umnesao/WelguFRtNBI4qIunFf2waPD
 VBJ7UxSkLs8o0ZtFhFhlaM0QlUyULHcrGPZtVNGY2NRv0W2mBZGg6TIvIf7T9hzXQL
 p6ZlRpeJBgDoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=cqNm1FjF
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 871fc9ca01..3f86b3ff3b 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  192cf8d181eb03cbf18e4fd4beb16edf89ef34aa25bc1c73c891bc904342aade  tvheadend-078a822cf548b37bc474475fa57e48e9604090ee.tar.gz
+sha256  f31cf06dcc40313e9b77331827201e74ed75c4d18156394581ca1a4ae55aa888  tvheadend-26ec161fb3c903f8b0d0be8b54d1b67c596fb829.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ee82ecb1e6..812ab4e9ab 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 078a822cf548b37bc474475fa57e48e9604090ee
+TVHEADEND_VERSION = 26ec161fb3c903f8b0d0be8b54d1b67c596fb829
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
