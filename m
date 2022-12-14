Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A3160E1B;
	Wed, 14 Dec 2022 18:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A3160E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0MLbsUBEOgp; Wed, 14 Dec 2022 18:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935FB60F24;
	Wed, 14 Dec 2022 18:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 935FB60F24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 240941BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F274181312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F274181312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3jGSDSHw0sv for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:50:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41D18131E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A41D18131E
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 18:50:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id bg10so12092829wmb.1
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 10:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cNCjuowogoHBmNCyZbwWxXOMqWI3ZkuONBiejFI15o=;
 b=HxDopb0ZPfAtb/8+sexLEYWoXtF62ZBmUBlZmxnJYy14BNF6WFR/bOZCksbAAokNl1
 pvkAY/6Erck2w6VjXrtoptypk5yc64ykIfqP3psJy8QTKFaecZ7eIdcLthqI+hcGDLCp
 HefUw293oF+4OMO5VKFsB7YubhQcTbXx7pwfz7ZwpogHZsjo11oudub6qhgwCY2lzUgK
 EaCj0tNOO4wOLVTiZDIDnC4C+GjdIR4ZZ2CHyfFXZva81t4dFBOS9k4eGfNThmScW1fn
 /dbysBEt5xwkTmb+yfzAw/QwVYGcxrJ9sw7EjSpbmvd+iVre8J6jNHdXwr7RaIh5CBMz
 C6Xg==
X-Gm-Message-State: ANoB5pkI/MEzrxoLW2KN3wfYIUSvvqR6JvS0ZoVasF4HSR4bMDrORPS5
 GXRf99kXW8iUZh3mq9n/Fisq3mCbhP8=
X-Google-Smtp-Source: AA0mqf41jcmoWbkg7gql//dNYkxPni14O1zorwH22uS1cnU0T2YtYndU8VgJ2FXuyJfUHzlpkylzeQ==
X-Received: by 2002:a05:600c:3508:b0:3c6:e63e:816f with SMTP id
 h8-20020a05600c350800b003c6e63e816fmr18712890wmq.38.1671043833798; 
 Wed, 14 Dec 2022 10:50:33 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a056000170900b002549b649b62sm3815805wrc.50.2022.12.14.10.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 10:50:33 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Dec 2022 19:50:30 +0100
Message-Id: <20221214185030.3340131-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1cNCjuowogoHBmNCyZbwWxXOMqWI3ZkuONBiejFI15o=;
 b=KKh+ei/DtgvjI0oGepDG7SM/0ITZkGEQx+0lISoQbYtWrTTIyU8W9mEkcNZOdjJjX2
 7poLJxyGQoyYFbVGybwZeAjH6YF79aRcl6rHaNT77ZstApFpB3iYs5HApHkMS90rT3Za
 aklvjLxTnVcbt8eww4Ke6ktRQOhBTIITIY6NyCCSKL9HqzDu34i+pvaEwbz8E4u2GZJI
 /7yoZoPZssBs3zqrsC4CuOXnOkeHOBXYpI3wNlPfoTZM07hI+0QBUXnasoacX2cjvABP
 uH+hPNtqBzTzMFqiIxMjnAmszUz5iGhT3WextuQLIHcz7e23zf5q5U2ujntw85L8+8y6
 fp2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KKh+ei/D
Subject: [Buildroot] [PATCH] package/libarchive: bump to version 3.6.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...chive-Handle-a-calloc-returning-NULL.patch | 38 -------------------
 package/libarchive/Config.in                  |  2 +-
 package/libarchive/libarchive.hash            |  2 +-
 package/libarchive/libarchive.mk              |  2 +-
 4 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch

diff --git a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
deleted file mode 100644
index 75ce6112f..000000000
--- a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
-From: obiwac <obiwac@gmail.com>
-Date: Fri, 22 Jul 2022 22:41:10 +0200
-Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
-
-[Retrieved from:
-https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libarchive/archive_write.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
-index 66592e826..27626b541 100644
---- a/libarchive/archive_write.c
-+++ b/libarchive/archive_write.c
-@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
- 	struct archive_write_filter *f;
- 
- 	f = calloc(1, sizeof(*f));
-+
-+	if (f == NULL)
-+		return (NULL);
-+
- 	f->archive = _a;
- 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
- 	if (a->filter_first == NULL)
-@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
- 	a->client_data = client_data;
- 
- 	client_filter = __archive_write_allocate_filter(_a);
-+
-+	if (client_filter == NULL)
-+		return (ARCHIVE_FATAL);
-+
- 	client_filter->open = archive_write_client_open;
- 	client_filter->write = archive_write_client_write;
- 	client_filter->close = archive_write_client_close;
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index fd429acb6..ffa4cff7b 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBARCHIVE
 	  Libarchive is a reusable C library for reading and writing a
 	  variety of streaming archive formats.
 
-	  http://www.libarchive.org/
+	  https://www.libarchive.org/
 
 if BR2_PACKAGE_LIBARCHIVE
 
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index ca580b497..b03bef3de 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
+sha256  9e2c1b80d5fbe59b61308fdfab6c79b5021d7ff4ff2489fb12daf0a96a83551d  libarchive-3.6.2.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 649b7dd4d..00c80bbb6 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.6.1
+LIBARCHIVE_VERSION = 3.6.2
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
