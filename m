Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BDC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E33424B1;
	Thu, 30 Jan 2025 18:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H86MeoIE3bHZ; Thu, 30 Jan 2025 18:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC9C4249C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC9C4249C;
	Thu, 30 Jan 2025 18:23:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99F1112C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95D534249C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHGveRR8uKgS for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B750424AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B750424AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B750424AA
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca57.dip0.t-ipconnect.de [79.214.202.87])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFE88A4C042B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 19:23:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43988)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tdZC6-000000001Tz-0lU5
 for buildroot@buildroot.org; Thu, 30 Jan 2025 18:23:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 19:23:14 +0100
Message-Id: <20250130182314.189205-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738261394;
 bh=AqBk4H2cfnsZm92simQacDV3EFEEIclUb6bAH6HVn7g=;
 h=From:To:Subject:Date:From;
 b=AAPz4fWWJJ8ZgBeNU8riBTbKhhXQ0fLObJbXmeS2NmBh5f2mINpc846JJK7DgKT8D
 T9+xRsBEqPY1dbkZmBkfZ7BGoi29ElofZ17EEDuIOFEo7R9E8ph3wbS2ZzcTZV4uDw
 MyNkmZF6AOrAqIkncGu0bdl0TcEyyvDkiw0wdHFjLlIQP7bmfnMQgrjkTxCcEZ96iM
 U7Tx7Xcz/re9BPXm6nUbgTJsLOg5v2Bmj2vjg2hWE4r1/fDQ5vCuABXYN94Rtq7skT
 K+/6Gb6BdGVTm88DcwqpJ6tdJa440KV+AhYpHRzawUZXHdebwjVdA27Vz5EELgshJL
 FXCL1kWMmdEeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=AAPz4fWW
Subject: [Buildroot] [PATCH] package/libpng: bump version to 1.6.46
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

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.45/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.46/ANNOUNCE

Use sha1 hash from sourceforge.net and locally compute sha256 hash due to
missing release announcement:
https://sourceforge.net/p/png-mng/mailman/png-mng-announce/

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/6f786ff0f6bf4b971a7159d2b4a95e8a0770892f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 7 ++++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3fd4033f83..3fae82b5e7 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,5 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58815959/
-sha256  60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e  libpng-1.6.44.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.46/
+sha1  11423f5ea270e7bb42dd2d519696adcd016d5df3  libpng-1.6.46.tar.xz
 # Locally computed:
-sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
+sha256  f3aa8b7003998ab92a4e9906c18d19853e999f9d3bca9bd1668f54fa81707cb1  libpng-1.6.46.tar.xz
+sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c0b3ad24d5..e73e0bb686 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.44
+LIBPNG_VERSION = 1.6.46
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
