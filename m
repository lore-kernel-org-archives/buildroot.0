Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B30C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B8D40A45;
	Mon,  2 Jun 2025 20:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bi-9Nh0tdvoJ; Mon,  2 Jun 2025 20:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4914A4097F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4914A4097F;
	Mon,  2 Jun 2025 20:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1AD71F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93BEB40E3B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksitZT3SbmOL for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 20:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94C9740179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C9740179
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94C9740179
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:03:36 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-231e8553248so46474915ad.1
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 13:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748894615; x=1749499415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2ruudWRYxPZ9DsiBuESwRMsRD22MNZeOc8c0fKL6Hc=;
 b=I7v4ktk6M6AQzrLx2AZP5qbIz1pekjwcjuXCJrZfmaUtY19M0GPm9YHHuxiea95V5x
 DQJzliNqGpmxwO42C/ZtZm1WtEQKIg/bLrtluBlE1TgxdtTQVfWO+UiqYcYpgnFiuMnE
 wYimkHKeUZp4Ja5HC7CNehwiViin1I4ZTIuIzulcEOJhRLbIJRMd2zeZsO1FKlIuOu6s
 UmHv1h/ls7oBfV0QAhACo+02OjKHWAx+24B+9mAPJVSyWtXF4bnzBhcuPylYq0cjNHBN
 HX6gs86TxSK0a94mNAJ6EUoFkmi0mm1Csy9b49gwQ+e2a4Ks1UH7mwKBHHRf0wPIamA/
 rhWg==
X-Gm-Message-State: AOJu0YyF1jWphoePXrYqYP1Hi3WDKjMkXCcN99LzMq/7oCTuSAnOpXMy
 hhW1Ju1TYapSCJ5ULivekWDcj9lKQRItZ1ka0BI0Dj/xR78KGeTLKMXsHCnlvC9V
X-Gm-Gg: ASbGncsTRiieuXUFl7QTEPht0yNsjx15x5Q/zUddb4luEKCfo1BCNlJ9wTumaZaHvVC
 axLyuntt7EPu5TgPXvvWPTNeR7361pWgdSBp4tA0X/bEuNi2aKiwk5A0jo0d7CnyoWqtjGpz8lS
 42WRpDSBAtgYBldLK28lWPFOtDqqRPlrtOeEH9d5zk9q+ky4GmrbhmngxZcxLGJXgEvV5dI1cil
 ZpA3GlAGWbUPAZrPUlKwckvIGJBWKcIL3E91uvNkuAzm2EJoN8kRnWWV2fBbVSOZj6cGJ/IMzSd
 3psOwNgFIfrIG005YDaxORLH1/OMIu9t8+7CRDkHqKkEvMNhiXmnEfpz8D0FT79Fzi4oGHFRrqU
 Ilnd5DA7dHr/c2RPVRXuSd68Ak9pI6ltBI4DnVA==
X-Google-Smtp-Source: AGHT+IHw73+B3vV28i/+CK63HeDMqC9agugn6jG+3sRSx2JVj4yksXc1r82n2ATJ4/rBShD1NizjQg==
X-Received: by 2002:a17:902:f610:b0:229:1619:ab58 with SMTP id
 d9443c01a7336-235396e2a84mr208757185ad.43.1748894614632; 
 Mon, 02 Jun 2025 13:03:34 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2e8e80sm5962900a91.24.2025.06.02.13.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 13:03:33 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jun 2025 13:03:30 -0700
Message-Id: <20250602200330.55351-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530213904.465152-1-kadambini.nema@gmail.com>
References: <20250530213904.465152-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748894615; x=1749499415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2ruudWRYxPZ9DsiBuESwRMsRD22MNZeOc8c0fKL6Hc=;
 b=fadrlMsHJZxd8DnDtMU4LaO69Ge89lNxQZsVo0Uqo+q9fY0jwfvwUIfWn0zGUIQ6I0
 Ge7F+2YDv0Yk3l3jx4KMYM7mOlRstQKyxAnSEkOj8IreKKRau2yGTwDhLm+wKIrULk7p
 wHRsRIMZUfLndbDodsUQWXU5+x/bxl1y5hxkBdjj+00jy81Y114e8ol6kkDjT4rE3AKs
 y4CXbApj4sfnkKCW28AkQ0Ha35b55SM54UJieg2Ok/cupNvJVOvFdL1x0iM4ecVBAfbU
 y2DfB7fZlmBfRAhB+GpEKffUO2qBc+n6WtzA1mOQoCnn0Y1oSJA4f+IJWk2WKw68gIMu
 /bEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fadrlMsH
Subject: [Buildroot] [PATCH v2 1/1] package/libcurl: security bump to
 version 8.14.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:
- CVE-2025-5025:
  No QUIC certificate pinning with wolfSSL.
  https://curl.se/docs/CVE-2025-5025.html

- CVE-2025-4947:
  QUIC certificate check skip with wolfSSL.
  https://curl.se/docs/CVE-2025-4947.html

Changelog:
https://curl.se/ch/8.14.0.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

---
Changes v1 -> v2:
- Fixed the build failures reported at https://gitlab.com/jolivain/buildroot/-/pipelines/1846597109

$/utils/test-pkg -a -p libcurl
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: OK
                    bootlin-armv5-uclibc [ 4/40]: OK
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: OK
                      bootlin-armv7-musl [ 7/40]: OK
                bootlin-m68k-5208-uclibc [ 8/40]: OK
               bootlin-m68k-68040-uclibc [ 9/40]: OK
             bootlin-microblazeel-uclibc [10/40]: OK
                bootlin-mipsel32r6-glibc [11/40]: OK
                   bootlin-mipsel-uclibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: OK
        bootlin-powerpc64le-power8-glibc [14/40]: OK
           bootlin-powerpc-e500mc-uclibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: OK
                   bootlin-sparc64-glibc [21/40]: OK
                    bootlin-sparc-uclibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: OK
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: OK
                            br-arm-basic [28/40]: OK
                    br-arm-full-nothread [29/40]: OK
                      br-arm-full-static [30/40]: OK
                   br-i386-pentium4-full [31/40]: OK
                      br-mips64-n64-full [32/40]: OK
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: OK
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: OK
                          linaro-aarch64 [37/40]: OK
                              linaro-arm [38/40]: OK
                         sourcery-mips64 [39/40]: OK
                           sourcery-mips [40/40]: OK

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 388ddc1418..1e908536a1 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.13.0.tar.xz.asc
+# https://curl.se/download/curl-8.14.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
+sha256  b3634cfc538c72c9c6ca794ef4c73d7fdbd171e8dee2db837d83a5e45231002a  curl-8.14.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5f04fc381f..7b522c1311 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.13.0
+LIBCURL_VERSION = 8.14.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -14,6 +14,7 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
+LIBCURL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
