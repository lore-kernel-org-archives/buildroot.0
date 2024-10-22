Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD9CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B3F960604;
	Tue, 22 Oct 2024 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbUVCtzvVPxK; Tue, 22 Oct 2024 20:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B91760640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B91760640;
	Tue, 22 Oct 2024 20:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD93759F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE09F80C87
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypsnueHwlKJq for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18C0680ABD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C0680ABD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18C0680ABD
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:51:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4314a26002bso67020885e9.0
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630271; x=1730235071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i4jixVc0nW4hrD7N3ybrE5nvQKRdQrwvJBqsrexdLP4=;
 b=Tb97BlQ75k7YPStvzcFRlPSFSdXoiOZqnemS/rVOycSj5LdgL6HJLn1t1QUTD8DATV
 Q1tlkh0LRRVhc4tlvBZjmUDIbDK4wsDuqWW2Pn9HCAWbeIfqAH4wbKtx+oIFJKSdjeUi
 fpLH5jTtk/pSyb9u/d7PZ+GuuAWO7S2EsoMP3IOVYvoPp8cZP7CzKkxaNN94ybLWaO4y
 oNyzqlmD3Szds3Y8cRdB8qWoH0/CdsHHBfCWxNIsZgIfoKuaO67Ty5UUmMNm3uq8P95R
 V9j9iNaZX/RJk/NHVayjz8rnzyN1AEZgf43KPsEHFd7orfw6vjeFjj6ppBJA1yBVFh4K
 6knQ==
X-Gm-Message-State: AOJu0YwLHURdXFobBR+4I6eImggDC8lUQJuy38thTXwq2mZTMpyA/NDg
 x+YaBmGXps0um0/m/g22IEagUYrSVtf4hvDp8OCc8epdT8VI7g4DYplkXZkW2yCU8tdrkUtnY+U
 dVQ==
X-Google-Smtp-Source: AGHT+IGmNZaABe0rPqiQUabQGVKs3Fp+UZXryfIebvgwI3DKvfyhnOjiuLaKhrR7dOpAPE6UaxfrkQ==
X-Received: by 2002:a05:600c:4f0c:b0:42c:b7f9:4bbd with SMTP id
 5b1f17b1804b1-431841890b1mr3825895e9.26.1729630270975; 
 Tue, 22 Oct 2024 13:51:10 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57fa4fsm98009035e9.16.2024.10.22.13.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:51:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:51:03 +0200
Message-ID: <20241022205103.532134-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630271; x=1730235071; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i4jixVc0nW4hrD7N3ybrE5nvQKRdQrwvJBqsrexdLP4=;
 b=TVz3Pm0as76Uukq3/nFvkKdfhvgkAbu1qBZxCrTo/oUB6wsZXkEGQuj5tbox+2O96G
 LRqvVyZV5Kr46JC6GDZmI6ycTqVI3HjAlfS4chD9uvKW948PXGSNPHeiFjP8VylC7K0b
 pQOIMs4rA+ooAj064hTh6DUrkhRKKyJ5esSrdxXyNdUkJJKbUQxEdTd6/pGHym/pupNQ
 mP5xcfBmXl9uQUk6tYmgARwY3Mj5UVtjl6CUMN1ddONRlZpdScFLgDBZK7OmCxSUfjez
 WbeHgebcUbRiCo/9ujrWXlSs/PQnEWeKScTiRsKxfDV37pa/a3u1kAAoaZ6tu2mLDmVI
 6S9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=TVz3Pm0a
Subject: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.7
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...1-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch | 2 +-
 .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
 package/libarchive/libarchive.hash                              | 2 +-
 package/libarchive/libarchive.mk                                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
index e630c51fe..31ac4b0b5 100644
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 93f7af94..204a4e69 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -449,9 +449,7 @@ if test "x$with_iconv" != "xno"; then
+@@ -455,9 +455,7 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
index aca2dab9d..a5b4c86a2 100644
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bff20d1..f245d0c55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -449,7 +449,6 @@ if test "x$with_iconv" != "xno"; then
+@@ -455,7 +455,6 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 08920b61c..c0b04b0f4 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  0a2efdcb185da2eb1e7cd8421434cb9a6119f72417a13335cca378d476fd3ba0  libarchive-3.7.6.tar.xz
+sha256  879acd83c3399c7caaee73fe5f7418e06087ab2aaf40af3e99b9e29beb29faee  libarchive-3.7.7.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d3a447552..70123ee2b 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.6
+LIBARCHIVE_VERSION = 3.7.7
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
