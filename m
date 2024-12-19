Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C65E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDD460716;
	Thu, 19 Dec 2024 15:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFhbY37YWMd8; Thu, 19 Dec 2024 15:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4737B60715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4737B60715;
	Thu, 19 Dec 2024 15:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1447275B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0309B838B6
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gjojw5dMPuS for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F07781B70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F07781B70
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F07781B70
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa662795ca3so396345466b.1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621693; x=1735226493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bT+a2tiZv80qKdos81jRCRWySHr7YMxxNx6CSnygpOw=;
 b=eRFzxC+s+b/h+U6Ve3kCd0tgEIJ3cB4XVBWJNEAtbU8GzSlZIb9aoUqRWCqiRWEChK
 uSxUrmNI4ctHnw+NaJU4O7mUQ9+han3guqwzljk3cZC4X3SAnz07tgcT4ilaJBVYOg40
 YToQMGncX1fYgQfSe26u+I/cj8e+/Eql95O7luxzGHxukn5t72+NzFx4SAOVO9RTT3Wr
 sUZKpStz1H8upFVGnlAIGTJgq/hX27jnbHi9nZd8SDnzwfhS8+NODmkGKg0mtJSFavwU
 QyLp6RfwshZzRQMrBYLQfrJ98+r0AUgsn4dYR6YctO9nc+4xhYawPnaMm+no5qDXrQTG
 dqOg==
X-Gm-Message-State: AOJu0Yyu0gJI//zPe8mgGN202saIAGPSO1l4mWKYcjCgxpEc4hL86hJQ
 2XZ5rRhlNvbyQUroKr7LPNe8Si0k6yBL5La3Gy5bBmtzzXXrTVr2JwNlDw==
X-Gm-Gg: ASbGncv+XwJsrQryK4mw+X8tiPnA7uxXEV4iMBrpgqrV418z0ET0dq1aIXCeMG8Bb5B
 KuI1Pm68YX2sav1xc5MAAUgjVxA725WUfxDKIbA9kRNve5pKwUA/BV/NILAnsCaAaYiyYTJL2Bg
 6mLND6XO2VOraZ2uY18jGBk67EM3GAUY+IifHmvJpJ2cONGdvuDj7W5nuxqmzfPqmKxYfrL+OKw
 aYWJtc5UKf4E5fakY1ZHgA7GD3NC29tVxlSWj0HtZcRBQZUrFC+r0YZFnZBnGtwqgpmxdqpOw==
X-Google-Smtp-Source: AGHT+IHqa+ClzUsX9tzNYO+VMFwwsTwJ/Mce5Jkf/anVYhX+A5sX7u/4MHgDuWctj3ELzOKjhOCvIw==
X-Received: by 2002:a17:907:72ca:b0:aab:f971:1f73 with SMTP id
 a640c23a62f3a-aac0822823bmr248282666b.22.1734621692450; 
 Thu, 19 Dec 2024 07:21:32 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:21:31 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:03 +0100
Message-Id: <20241219152105.298310-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621693; x=1735226493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bT+a2tiZv80qKdos81jRCRWySHr7YMxxNx6CSnygpOw=;
 b=Mct3THOLLoGpv84AP44bx8xX+rPE2IvX6ZObRA0oJzqH1t3gDCk9i7vv0kOFWfgGzH
 7NiAMkAUE05KiFKankfSKL7KBbQ+8ENqGa11snStLMsfSVC5fPY7kvfsoFNFKGKf0b+X
 jBF4DrdBo1SNkbKcqh/nk+K9DOl7BrvSgpinQURccrdYwUT+MvCcvKp14xpyR0PufL81
 b89ZeD/yUcr3+encV9mr+0ZetXvPIrtiR3jUP2gKfmsf5Wjpyyv9/uWY/zooth8uzos0
 +IMo2t9+v2W/30aLxKy81ZtzwRhiEKXYjN5Wjnxfj+tGpix2UEixsZ/fHep05PuAdXHS
 B+9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mct3THOL
Subject: [Buildroot] [PATCH 2/6] package/libnetconf2: bump to version 3.5.1
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

Since version 3.x the options for TLS and SSH are merged to SSH_TLS. Thus
we also require LIBCURL. The openssl package dependency is now mandatory
and only selected when libssh-server and libcurl is selected.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libnetconf2/libnetconf2.hash |  2 +-
 package/libnetconf2/libnetconf2.mk   | 26 +++++++-------------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 675c76a500..78fc5c8400 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
+sha256  0d49e796798015e35a08bfbd53a3dd4004cb9a26d4b1dd1f90940a427d483bbb  libnetconf2-3.5.1.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 88163926c0..40812cc0f0 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,41 +4,29 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.28
+LIBNETCONF2_VERSION = 3.5.1
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
-LIBNETCONF2_DEPENDENCIES = libyang
+LIBNETCONF2_DEPENDENCIES = libyang libxcrypt openssl
 HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
 
 LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
-LIBNETCONF2_DEPENDENCIES += libssh
+ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBOPENSSL)$(BR2_PACKAGE_LIBCURL),yyy)
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
+LIBNETCONF2_DEPENDENCIES += libssh libcurl
 else
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
-LIBNETCONF2_DEPENDENCIES += openssl
-else
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-LIBNETCONF2_DEPENDENCIES += libxcrypt
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
 endif
 
 HOST_LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
-	-DENABLE_SSH=OFF \
-	-DENABLE_TLS=OFF
+	-DENABLE_TLS_SSH=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
