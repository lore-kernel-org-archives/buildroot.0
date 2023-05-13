Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD5C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 15:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB540409F9;
	Sat, 13 May 2023 15:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB540409F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtYizA8H-Zds; Sat, 13 May 2023 15:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD90341C8B;
	Sat, 13 May 2023 15:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD90341C8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254D51BF5D7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 15:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2BBF41C77
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 15:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BBF41C77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLfVieydqE6q for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 15:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39C4409F9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D39C4409F9
 for <buildroot@buildroot.org>; Sat, 13 May 2023 15:51:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so82900985e9.1
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683993077; x=1686585077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y00Cuu6e+jPGiQleEtzfmQFN8rLP529OdnXgdSYdeeY=;
 b=bbgNEE0TOhBPUgNsulBY9kVOrHkj4yURxcL52+suWChdMcU6m8K+2mW4mEmIBapoBn
 DGkTqrKn01yzdE7b74bIH0csS0fp3LM8D2Ce5ZBKUrAjNNmqoBQgHu4sHGTTecxAw9K6
 UpJ3jX8BQl/Cxb3ibYZcaamE8km7ZoVraZLV58GCz2RZIAZsFJvkxL2TsfV9VmmrnkeP
 HNrFIEFqKonGsIoHe4BR/1WdSwCvSuNCNCEeQdvcRlc+EF01bre6UKahnibnH/Ae9uhP
 e6kbV5L32yi9DKDn5W3jH7OBIIxCmh0cTkSW8jIzwof+ZmfIiA7OyiQ2HLQC8hfO6H/A
 XhnA==
X-Gm-Message-State: AC+VfDx2ERFkLDuhGjGO5pJyZqyONTB1yej+5+3SLyVkszeAMjSKJ7BB
 T+/fXgYbWqla3rU/4dZg+nE80wp8Pr0=
X-Google-Smtp-Source: ACHHUZ4LsmhdNHx7AMAbxFdBr6Q1eO3dnX2rLUUE1KRZ2YqbAluzDu1H3xiB2hdOa8Q0sfzMccEV/w==
X-Received: by 2002:a7b:c7da:0:b0:3f4:2df7:e332 with SMTP id
 z26-20020a7bc7da000000b003f42df7e332mr11566798wmk.13.1683993077253; 
 Sat, 13 May 2023 08:51:17 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm31604737wmc.14.2023.05.13.08.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 08:51:16 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 18:50:30 +0300
Message-Id: <20230513155030.3207472-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230513155030.3207472-1-bigunclemax@gmail.com>
References: <20230513155030.3207472-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683993077; x=1686585077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y00Cuu6e+jPGiQleEtzfmQFN8rLP529OdnXgdSYdeeY=;
 b=g0UMveQ4MRvpbTDmCcwv0VksEVJqryyD9GMMutiYW5yWr4AH9013vb0lUK740vMLva
 0zNqGa7UaaZDRMYW4g4T3eJRBM3680eIMo4aadh+twmaHlQBEwHtnxlaL7wQsdudqnWe
 9shKTinx7F1LMKLXzGzykzm4OHXUM4SD3jy1KZFUHnBYK3SGRfaCWsU0xTPWm/KIuIvV
 TXsFfAPblCiRDI8Vot5aJvQ0SjRb+3nWlZmshqXJR7fIcWlIJMGzkY47k58NLo9x0zaK
 OGDDhlDYh5XXuUj+G/O5zpYY6i046gAnO6n/58OF35B4fi7ezV5VvogTgpJ8r5sBGoYe
 h5AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=g0UMveQ4
Subject: [Buildroot] [PATCH v2 1/1] package/libdatachannel: new package
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new package for libdatachannel.

libdatachannel is an open-source software library implementing WebRTC Data
Channels, WebRTC Media Transport, and WebSockets. It is written in C++17
and offers C bindings.

This library has a lot dependencies.
Some of them, such as libsrtp and libnice, can be resolved with standalone
buildroot packages if they enabled. Otherwise dependencies will be satisfy
by git submodules. Nlohmann JSON dependency will be skipped at all because
it is only required to build the examples.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/Config.in                          |  1 +
 package/libdatachannel/Config.in           | 10 +++++++
 package/libdatachannel/libdatachannel.hash |  3 ++
 package/libdatachannel/libdatachannel.mk   | 34 ++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/libdatachannel/Config.in
 create mode 100644 package/libdatachannel/libdatachannel.hash
 create mode 100644 package/libdatachannel/libdatachannel.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..957039940b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1888,6 +1888,7 @@ menu "Networking"
 	source "package/libcoap/Config.in"
 	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
+	source "package/libdatachannel/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
 	source "package/libest/Config.in"
diff --git a/package/libdatachannel/Config.in b/package/libdatachannel/Config.in
new file mode 100644
index 0000000000..103d933b50
--- /dev/null
+++ b/package/libdatachannel/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBDATACHANNEL
+	bool "libdatachannel"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  C/C++ WebRTC network library featuring Data Channels,
+	  Media Transport, and WebSockets.
+
+	  https://github.com/paullouisageneau/libdatachannel
diff --git a/package/libdatachannel/libdatachannel.hash b/package/libdatachannel/libdatachannel.hash
new file mode 100644
index 0000000000..14361d8cc8
--- /dev/null
+++ b/package/libdatachannel/libdatachannel.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  734e062dbdf5de0cc0b8c7bac8a454ca34f99f6966d8687b531af39b028308ef  libdatachannel-v0.18.4-br1.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/libdatachannel/libdatachannel.mk b/package/libdatachannel/libdatachannel.mk
new file mode 100644
index 0000000000..b8f25fc1c1
--- /dev/null
+++ b/package/libdatachannel/libdatachannel.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libdatachannel
+#
+################################################################################
+
+LIBDATACHANNEL_VERSION = v0.18.4
+LIBDATACHANNEL_SITE_METHOD = git
+LIBDATACHANNEL_SITE = https://github.com/paullouisageneau/libdatachannel
+LIBDATACHANNEL_GIT_SUBMODULES = YES
+LIBDATACHANNEL_INSTALL_STAGING = YES
+LIBDATACHANNEL_LICENSE = MPL-2.0
+LIBDATACHANNEL_LICENSE_FILES = LICENSE
+
+LIBDATACHANNEL_DEPENDENCIES = libopenssl
+
+LIBDATACHANNEL_CONF_OPTS = -DNO_EXAMPLES=1 -DNO_TESTS=1 -DUSE_SYSTEM_JSON=0 \
+	-DUSE_SYSTEM_JUICE=0 -DUSE_SYSTEM_PLOG=0 -DUSE_SYSTEM_USRSCTP=0
+
+ifeq ($(BR2_PACKAGE_LIBNICE),y)
+LIBDATACHANNEL_CONF_OPTS += -DUSE_NICE=1
+LIBDATACHANNEL_DEPENDENCIES += libnice
+else
+LIBDATACHANNEL_CONF_OPTS += -DUSE_NICE=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_SRTP=1
+LIBDATACHANNEL_DEPENDENCIES += libsrtp
+else
+LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_SRTP=0
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
