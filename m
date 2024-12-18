Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA82E77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 08:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE67846BD;
	Wed, 18 Dec 2024 08:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdhbDPyI8D1y; Wed, 18 Dec 2024 08:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C649D846BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C649D846BF;
	Wed, 18 Dec 2024 08:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F48DE5
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8334A409AD
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvyy-kj7vRkO for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 08:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.45;
 helo=mail-wr1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4CC241605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CC241605
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4CC241605
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:43:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so331722f8f.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 00:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734511428; x=1735116228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FdI2QsVeaxdEEVuzOus+4Q7+x2MzdF7sfh/a4kJrP5s=;
 b=Yo4UAa0yYWiOLepGBk2RF3F0gW81Y0f+i+B+x5wimWEGniKJEkIVe+IRDoZfifcr3i
 tW4Rzr5gYBCFhRrgJU2ZwFY2zv0K5zNLODup00zeo0YZVgx0YFsfg40EFn6vh+5VNqCZ
 x6pmSWm0JIUNHrn+kGx5nLvBpN7aPp3WgbBA3NL0Uyvb1NhoC5PRVkQ+DU6/E0xt+vx0
 mpqr/+iMUbiaQtw7ybhGvRdFu+m7mXP9HexF2rO5titwS/AGjdI4KGTve1lKF55O+t8a
 0F/SONaayOnhbW9OZwm05QI7WkPNxu1si9LobzUCImX6k5tTxqWHmuLEO/X55HIuipQl
 S2zA==
X-Gm-Message-State: AOJu0YzuxSsLxEOx0GkkulVpjOsumXgKiKLF+iVnspeJeONGWO1z+rbA
 g16JudFd1rg5FYF/oqwzCIhwg9kFiFkv94Dbdk31iUHUemTwkugUgXisUeAI7Q3Eng==
X-Gm-Gg: ASbGncviP00Mu/G1MnIc2CgO0ugE6Q31oSjRAH2AnK1LX3jxKwB1pR8DcNtge8htU+a
 z7asaaVY52yj2LafZVW+8hHaAMjjJkta2p+PBdVnfN5IMlEZ1rcOvTJKspZHoOjxM6KHeu0pO1R
 DiNuWqhupw+eCsD9OE3cV/WENA/QF2wlqanHiccXNlSaG55At7M1L1W2sYSYD7CnhxpV2wAcNHZ
 zBzHxsU/2jmiFWdEiz3Twsl7/XPNmJiDv4S0HeXQeRd5xrvgC3ci/te0jgbl6KFko8g90TS/yjF
 W0mZ2RBA2wpJin8eCSPoFgYFwRbuTFuXsQ==
X-Google-Smtp-Source: AGHT+IGz+NbiCnQB3dWeO5Ajk9idETK4oBNqNWnCsWToOzGT+Vdqe52wBo5cJa1HNXNtLjlgtI2guw==
X-Received: by 2002:adf:fa0f:0:b0:386:4570:ee3d with SMTP id
 ffacd0b85a97d-388e4e79284mr1250999f8f.24.1734511428163; 
 Wed, 18 Dec 2024 00:43:48 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80122b6sm13704856f8f.7.2024.12.18.00.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 00:43:47 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org,
	thomas@devoogdt.com
Date: Wed, 18 Dec 2024 09:43:37 +0100
Message-ID: <20241218084337.3775491-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
References: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/pkgconf: fix sysroot being prepended
 twice to the pkgdatadir path
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
Cc: aperez@igalia.com, james.hilliard1@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building webkit, I got this build error:

>>> webkitgtk 2.46.3 Building
GIT_DIR=. PATH="/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/bin:/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/sbin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
 /home/thomas/.local/bin/cmake --build
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/
-j25
ninja: error: '/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/wayland-protocols/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml',
needed by 'WebKitGTK/DerivedSources/pointer-constraints-unstable-v1-protocol.c',
missing and no known rule to make it
make[1]: *** [package/pkg-generic.mk:289:
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/.stamp_built]
Error 1
make: *** [Makefile:83: _all] Error 2

The sysroot path is prepended twice to the path. This error persists
since a3b2bc8 "package/pkgconf: bump to version 2.3.0".

After digging into it, I found out that dropping "pkgdatadir" from the
patch does fix it. This is, in fact, the same, or similar problem that
was fixed in 3e74c13 "package/pkgconf: variable pkgdatadir also needs
sysroot prefixing, wayland patch III" years ago.

I was not able to find out which pkgconf commit caused the behavior
change. Commit a3b2bc8 bumped it from 1.6.3 to 2.3.0, which is a
considerable big change.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...th-the-sysroot-a-subset-of-variables.patch | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index d25039ade2..986058d400 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -1,4 +1,4 @@
-From c1f9e60f46f2207f9dd07dd290ad5a2da05ad41d Mon Sep 17 00:00:00 2001
+From c912e9bb8d5be414fda74b2019deb2a6d2d041a0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 16 Dec 2018 11:52:18 +0100
 Subject: [PATCH] Only prefix with the sysroot a subset of variables
@@ -22,15 +22,17 @@ Buildroot development. All other paths are not prefixed by the sysroot.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Updated to include gobject-introspection paths]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Dropped the pkgdatadir path]
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 ---
- libpkgconf/tuple.c | 65 ++++++++++++++++++++++++++++++++--------------
- 1 file changed, 46 insertions(+), 19 deletions(-)
+ libpkgconf/tuple.c | 64 ++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 45 insertions(+), 19 deletions(-)
 
 diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
-index 83f6a47..a2aa427 100644
+index 83f6a47..d56fcec 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -178,6 +178,21 @@ dequote(const char *value)
+@@ -178,6 +178,20 @@ dequote(const char *value)
  	return buf;
  }
  
@@ -44,7 +46,6 @@ index 83f6a47..a2aa427 100644
 +	"includedir",
 +	"libdir",
 +	"mapdir",
-+	"pkgdatadir",
 +	"sdkdir",
 +	NULL,
 +};
@@ -52,7 +53,7 @@ index 83f6a47..a2aa427 100644
  static const char *
  find_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars)
  {
-@@ -237,14 +252,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+@@ -237,14 +251,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  {
  	char *dequote_value;
  	pkgconf_tuple_t *tuple = calloc(1, sizeof(pkgconf_tuple_t));
@@ -74,7 +75,7 @@ index 83f6a47..a2aa427 100644
  	else
  		tuple->value = strdup(dequote_value);
  
-@@ -294,22 +315,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+@@ -294,22 +314,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
  	return NULL;
  }
  
@@ -99,7 +100,7 @@ index 83f6a47..a2aa427 100644
  {
  	char buf[PKGCONF_BUFSIZE];
  	const char *ptr;
-@@ -318,7 +325,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -318,7 +324,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	if (!(client->flags & PKGCONF_PKG_PKGF_FDO_SYSROOT_RULES) &&
  		(!(flags & PKGCONF_PKG_PROPF_UNINSTALLED) || (client->flags & PKGCONF_PKG_PKGF_PKGCONF1_SYSROOT_RULES)))
  	{
@@ -108,7 +109,7 @@ index 83f6a47..a2aa427 100644
  			bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
  	}
  
-@@ -381,7 +388,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -381,7 +387,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  				{
  					size_t nlen;
  
@@ -117,7 +118,7 @@ index 83f6a47..a2aa427 100644
  					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
  					free(parsekv);
  
-@@ -432,6 +439,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -432,6 +438,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	return strdup(buf);
  }
  
@@ -145,5 +146,5 @@ index 83f6a47..a2aa427 100644
   * !doc
   *
 -- 
-2.34.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
