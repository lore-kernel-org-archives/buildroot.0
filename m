Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602E5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F115660E3F;
	Wed, 14 Dec 2022 19:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F115660E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id go0jaZMwJoki; Wed, 14 Dec 2022 19:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2A460D5E;
	Wed, 14 Dec 2022 19:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A2A460D5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC8511BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8796E81F25
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8796E81F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GaQBTnAUvze for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:47:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FFF81F1C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FFF81F1C
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 19:47:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id ay40so12203633wmb.2
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 11:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4lm5lBI80xebFqUH7J6BbJQ80ZqH3z0eDjmKxIicoow=;
 b=L2uddF1D/hee0r9z0ZNqdJnbM84xulRTASiCuDJmCjeMAB7buBQi27iUnEmBCu25BN
 MskJkMoYUAU+mt0Tj18gdncKJQoojA581u6rgakyKnAzB9ph7xZpH7t/0XBDf+VBx9Ou
 95AryzOXw+9aQDc7ZPCc/0431YzvmwtDwBWuH+NdvuN4NHIXJJscyqap3Ain+duDAyRM
 FF7y00juKsfAK9iUpb6OAJCViEdw6m7YMujocJeeu0UB/iGQ1OS8fJQIVOdZ5R7RMIro
 gxXUdszT6mIPv/Pku9V+D7mmUW2CmvmEysaUato/MXdDX8OVaFb/N3kU0yxa4eAUz4ob
 Ui5g==
X-Gm-Message-State: ANoB5pmrAv4JnsDIg79F+hjJ72GvJLGTQuWPqvi0nQ4HaVQzIiNa+32v
 oP81CK7L7sJBfrLOPVf6qRv6JOX4XEU=
X-Google-Smtp-Source: AA0mqf7OCZM1wgEssytNr5M6oA13+o3QdqpctI1g58/ZiFH+7Uu+gBrKzriuzSNLsoGx72Tc9vD+Xg==
X-Received: by 2002:a05:600c:1f14:b0:3c9:2598:d1c5 with SMTP id
 bd20-20020a05600c1f1400b003c92598d1c5mr20704355wmb.7.1671047239496; 
 Wed, 14 Dec 2022 11:47:19 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b003cfa81e2eb4sm4271360wmq.38.2022.12.14.11.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 11:47:19 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Dec 2022 20:47:06 +0100
Message-Id: <20221214194706.3341298-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4lm5lBI80xebFqUH7J6BbJQ80ZqH3z0eDjmKxIicoow=;
 b=nVUuCHP9I6KphAh9fvy2vYG8DSlE+amYUELdDGpxHECqSgKm/nM/309UBMbdocAEgW
 Ai52WNxwuQuOfSjzVq28Nc/QWgjWvqn+FtA9DI2eRww4oJfJcquhCFsU2ANSsUoyVQsr
 Gx/FBOIRankyVnsfCSMEKEdZZJzF722hAZwhDmhByVqJcDq5pR5EeTrkqqYYerFAxqOg
 h09U1o1fpCSn6AQRHzKh5uLNUCOufl/eHE/ASuAGXPQXKfiRzwhC/YfpdB/WhSsFGoAc
 ssIIcPDYzuLH/v5oVKy8Pq4ndPOua1ao93S1sn2bjaypv024GJQbXrLWBpPhJS6LTzvh
 IjAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nVUuCHP9
Subject: [Buildroot] [PATCH v2] package/libarchive: bump to version 3.6.2
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
 package/libarchive/libarchive.mk              |  5 +--
 4 files changed, 3 insertions(+), 44 deletions(-)
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
index 649b7dd4d..cfc148d01 100644
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
@@ -12,9 +12,6 @@ LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
 
-# 0001-libarchive-Handle-a-calloc-returning-NULL.patch
-LIBARCHIVE_IGNORE_CVES += CVE-2022-36227
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
