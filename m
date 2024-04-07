Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA80CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44F40406BB;
	Sun,  7 Apr 2024 13:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nMlwZ4EWp1t; Sun,  7 Apr 2024 13:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22868407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22868407FA;
	Sun,  7 Apr 2024 13:25:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 966D71BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BD981B60
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ej-VrD5KJ_wQ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7339C81ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7339C81ABA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7339C81ABA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:25:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so1676114f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712496320; x=1713101120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9cgw0Ywug9mFhlMqjv6RUSDSq/gfOryQr8ClormWWw=;
 b=qoSSAtiO2mo0uWpd22N+MiFD9xnHQjZNtvCPQnbDdKaerbSjISshrPns+2ie2WwfCt
 bnPHb2KeFnRe6YH1LIgRJQnd0v7zk5UkLDrJKS78dG4j1PbrpI5VtOrTrg/DeoYe+4fe
 WCFuTX2sVjonDjPvkqhpHt95qpeBqHVE0hAPSUSZICV2zo+C+Ks0sfHrSGzsxtx5Gd4b
 YEvIVc09pj5m1PYJSirhEbNJyGVm91kp8SM8ayp5E5++cad+KarQDbKyXEIxyZla6JgN
 YTB1cLxgEIHakBzVKi/fX359TY4zfwp/OV2YYfHw71glbQWZSjp2d9hsjpHJrnV2zVTu
 qLrA==
X-Gm-Message-State: AOJu0Yx/PQXovVnHtLBbH16cPCMfeo72Qz28pGY+hSiw+F6sSOHZYNkw
 WeGNFq/Aa6NuOjTr3L5sUJ+XFqyOY3Xi2czZyqI6Upx37wQYus6TWYl+GMd8
X-Google-Smtp-Source: AGHT+IEmdqoke8fS3ls0mRArykp/3kKNgWo49M7C5E9ifFEKMM2XIUrjTJNTKv5HWuy4VKRTlboG2Q==
X-Received: by 2002:a5d:4003:0:b0:343:c35d:1406 with SMTP id
 n3-20020a5d4003000000b00343c35d1406mr4596394wrp.15.1712496320090; 
 Sun, 07 Apr 2024 06:25:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b00343e760c637sm6191253wrn.84.2024.04.07.06.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:25:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:25:16 +0200
Message-ID: <20240407132516.1422205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712496320; x=1713101120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v9cgw0Ywug9mFhlMqjv6RUSDSq/gfOryQr8ClormWWw=;
 b=dTq16ULhoDC8GIUuUqVjKkHJH7KUysppr1bxPFe9nY1X/9u9SW8x3L9EyHGBZrphXa
 uZkPDZLy4waR7xyMF7yTd9fUPnJz7BSn8LTwW0MVGUE8uxUFT+e95jTb7bGHF08VXUGC
 gaArfyIRaAl1cQyq67aT4kCJ1W4PVL2xYdEAk2JRwHhcfgP4ucJZWFdcCk1uSUzhQz0N
 /1GS26sSfBwWSeZpxlTEdNgZ8uN+/K81JdFg1WFlk0jpB5rw0NypYW8EzkhUc7k3WQE5
 MwZC3csiVInneZJQORC65iIXIvMaFpVHgmYV2f0ZTrN2LFqt8llvomAqlDY7jabYdVfi
 mbwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dTq16ULh
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add libxcrypt optional
 dependency
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: modules/mod_auth_file.o: in function `authfile_chkpass':
mod_auth_file.c:(.text+0x3aa): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/4d39666854a0395e96c7b0c8339b6ac1b41c4348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/Config.in  | 1 +
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 7b9f74895a..9d99ff70c4 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  ProFTPD, a highly configurable FTP server.
 
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 0820822e17..242de38b0d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -31,6 +31,10 @@ ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+PROFTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 PROFTPD_CONF_OPTS += --enable-pcre2
 PROFTPD_DEPENDENCIES += pcre2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
