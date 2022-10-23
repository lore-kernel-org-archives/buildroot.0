Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42D8C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 09:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428D3401F8;
	Sun, 23 Oct 2022 09:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428D3401F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pck7tC9hj3G1; Sun, 23 Oct 2022 09:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 588414016A;
	Sun, 23 Oct 2022 09:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 588414016A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2108F1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 09:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B014016A
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 09:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B014016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9D4k63KNAz7b for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 09:10:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CC44013D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8CC44013D
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 09:10:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h9so44218wrt.0
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 02:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5oc5QAH+gREX1yl7eggYUTd7BibifZS9SpLJlg/eNs=;
 b=HRVvvgWThDTSog8BbeNd8nveIbMuyvPuhOpPypBijx/YOC6e1PDgiCHR80aOi+SodE
 Ki5oUifjmGLos2MffVf+40hks+iiVZa8V19KlUd9RyzbpwkxrlOPdq5X9dO60I5Q2pxb
 hDZ6g5QJBVW4riYcqLqoC/KyK3zUZTT6cMnAZiRfqxRR1MnECeIsva3H5+0GKzubjewf
 r0vR/oH8j5Pg7gBwGeRUYpq11aO3lMlvFjH4nFhiFEOHJlVUj6flZGF9dKaEPXFzgV6W
 3hf0SgPjpUvChajSYAqjgV33RZJ1TSsszDr7m8bszX2DnvadI1mr+BU4jiGZlEOStNlt
 Nkkw==
X-Gm-Message-State: ACrzQf1frQMryJqG7VCxnweOwcMmToURNgqg7o9biZBlULI+PtjYGs9b
 6CjAjFB8yE93OsWPknENeAxVlcvyIyE=
X-Google-Smtp-Source: AMsMyM4tIyKrQdUsHGg6589yzUucCZejJhfSqCV47CxC9+4WVnwjY7RwRUbCFns2q1mSf1mlS/9NPg==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id
 l15-20020a056000022f00b002364f8ea913mr8824967wrz.240.1666516218804; 
 Sun, 23 Oct 2022 02:10:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff049000000b002366824c230sm1707406wro.107.2022.10.23.02.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 02:10:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 11:10:09 +0200
Message-Id: <20221023091009.18544-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221023091009.18544-1-fontaine.fabrice@gmail.com>
References: <20221023091009.18544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5oc5QAH+gREX1yl7eggYUTd7BibifZS9SpLJlg/eNs=;
 b=W2dT4CzdnGKV3GtHPiSUJnpKjxs+r58sIbEBI4cCMBoL0q+bzG6jdqSvrA0ePrxguU
 zbvnrNhUyiM+dVAjivZQBOypM+GbR3S2TdYvGPjByGDQc9jj5JquoY4pvLt/DOZWdZx+
 7vIkL1Jp4U3X6fBAbGjle05XY00vAX/lgZKxS8b9Sn+j+Zkqlac9BI5oSjhT2eh0ogj6
 RdtClPZhl2oFi4IRL3FIuCzFR2/qyqa22M+LFUiIbzomTmbG0zc7VnerJc0X4xqCZx0E
 Z7/+toDWWKmu1fV7H6LZB5TZKo5/RhGwIdhuFJDNozEZgzvajXJYJLdp71WSycH9Kd2a
 4X3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W2dT4Czd
Subject: [Buildroot] [PATCH 2/2] package/lz4: bump to version 1.9.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LZ4 v1.9.4 is a maintenance release, featuring a substantial amount
(~350 commits) of minor fixes and improvements, making it a recommended
upgrade. The stable portion of liblz4 API is unmodified, making this
release a drop-in replacement for existing features.

- Drop patch (already in version)
- Update hash of lib/LICENSE (update in year with
  https://github.com/lz4/lz4/commit/87a80acbe7872b9da7d56f7005ffd1b715e87c93)

https://github.com/lz4/lz4/releases/tag/v1.9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mory-corruption-with-negative-memmov.patch | 26 -------------------
 package/lz4/lz4.hash                          |  4 +--
 package/lz4/lz4.mk                            |  5 +---
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch

diff --git a/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch b/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
deleted file mode 100644
index 57e4e38f84..0000000000
--- a/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
-From: Jasper Lievisse Adriaanse <j@jasper.la>
-Date: Fri, 26 Feb 2021 15:21:20 +0100
-Subject: [PATCH] Fix potential memory corruption with negative memmove() size
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/lz4.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/lz4.c b/lib/lz4.c
-index 5f524d0..c2f504e 100644
---- a/lib/lz4.c
-+++ b/lib/lz4.c
-@@ -1749,7 +1749,7 @@ LZ4_decompress_generic(
-                  const size_t dictSize         /* note : = 0 if noDict */
-                  )
- {
--    if (src == NULL) { return -1; }
-+    if ((src == NULL) || (outputSize < 0)) { return -1; }
- 
-     {   const BYTE* ip = (const BYTE*) src;
-         const BYTE* const iend = ip + srcSize;
--- 
-2.20.1
-
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 0b03089ecd..04bd118cfe 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256  030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1  lz4-1.9.3.tar.gz
-sha256  d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
+sha256  0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b  lz4-1.9.4.tar.gz
+sha256  8b58c446121a109ccf32edc094bba3010a3d85e4ee3702950db55e4d3e87736c  lib/LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 541a03473a..5da1ae2703 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.9.3
+LZ4_VERSION = 1.9.4
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 LZ4_CPE_ID_VENDOR = lz4_project
 
-# 0001-Fix-potential-memory-corruption-with-negative-memmov.patch
-LZ4_IGNORE_CVES += CVE-2021-3520
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
 else ifeq ($(BR2_SHARED_LIBS),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
