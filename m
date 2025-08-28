Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118DCA0FF2
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 07:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D3681764;
	Thu, 28 Aug 2025 07:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA-JyBSWm4bu; Thu, 28 Aug 2025 07:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF6D81F82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF6D81F82;
	Thu, 28 Aug 2025 07:14:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 134DAB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E98568204A
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7Jv1r38yjDh for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 07:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3E9981764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E9981764
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3E9981764
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:14:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso3042465e9.3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 00:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756365251; x=1756970051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipqT6jA7DsZKYizV3iWUAUFNKcF/BFvK5PdzvW8IEP8=;
 b=lPctXC3Q0qvnstTsy2/XRybFftBvy9S87riZSKja/xGbAZzcJ3myxJyt6exIExNKtR
 a9Tu/LMf0xpCqos/RiOHmmuE4p5mAW61B2sU6RHRWuB1wd6ennp7O48OOTGKcNrG4/1p
 cGMIz2QzzOG553Phxo6WL4DCcPf+yk3D9c3fH45wlw/ZoYBqxQ23H2MINs2hTCP5FO4c
 8n0sSFDUN8JrxFCIJW4pH5twtZ+PaOagF5yMzXZ3KuZST12kBQN2lYMhYdx7nqK8hDg5
 lBKvpOEcjxXVOvtUDXcOO1rFXd4DrSO+oxdEXK02HDTMy80RIcC+42114LoBHGwBDGNc
 5+HA==
X-Gm-Message-State: AOJu0Yx0HSxl9N+ZO173PZ6MI6zS9p3gycVsJ5GDM+4Ude5CUhT6UvxV
 g75q7EdTWmNpBZbO8vtpjuDQedZdXBhm429K3NZBTk1gmIeVP8AOVf8NoleNuw==
X-Gm-Gg: ASbGnctkbm8S24oM0DfY1mq0CxtpSIa4Gtj9B/Q40Z5/x/N79RiJ/KQNzHMve583Lik
 c++r06QP7/F7222iDdScAYdzvmwGxucyDX/MCtmY3/6/ZbDjkQJq1bgw7J2jCIQTofYBKrcUBjJ
 pvnasJSdE8lYdQ5hgwC9keC0wDLsYFyBfHOgf0KFI5XURvaKp6mpGyyTrcvm6ggErYKh6ONDvaB
 xYUO11QZCR+YZKvHO2zzSgm9XDzDgxSUtaFoJEfRh2/VA8ruFRPKkm700el0l6ozpMfwZ2h6pNg
 Bbfz16dxegtXcHNbc3Cm8BFhQ3ItFbhLfqw/XoguOEjoudo3xH5fIx2qT+mArMXpGJfSPp6yFFz
 afOyXDLuSNx6N62/rm2tNHBNYmLR9nD0khmZmq20h5oS3FFT9eGMZ2MOnQSP08BBMZEWPRam+Eh
 MCzQmsSos=
X-Google-Smtp-Source: AGHT+IEut7MDjfLmwp0b0DRzJdXhXOodBSfXjLUPg9q7EF6sjUCOAPXI+EcDo8NigUi3bH11Yaf1gQ==
X-Received: by 2002:a05:600c:6094:b0:45b:7951:92b6 with SMTP id
 5b1f17b1804b1-45b79519537mr13044065e9.5.1756365250327; 
 Thu, 28 Aug 2025 00:14:10 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711211cabsm24066680f8f.32.2025.08.28.00.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 00:14:09 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	thomas@devoogdt.com
Date: Thu, 28 Aug 2025 09:14:02 +0200
Message-ID: <20250828071402.175523-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
References: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH next v2] package/lighttpd: bump to 1.4.81
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

News:
- https://www.lighttpd.net/2025/8/13/1.4.80/
- https://www.lighttpd.net/2025/8/17/1.4.81/

See Changes from 1.4.79:

[build] remove references to libev; no longer used

So drop here as well.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 Config.in.legacy               | 8 ++++++++
 package/lighttpd/Config.in     | 6 ------
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 9 +--------
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..45b1807b9f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11"
+
+config BR2_PACKAGE_LIGHTTPD_LIBEV
+	bool "lighttpd removed libev support"
+	select BR2_LEGACY
+	help
+	  Lighttpd 1.4.80 removed optional libev support.
+
 comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 1a9a9a277d..fe2c7a2815 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -67,12 +67,6 @@ config BR2_PACKAGE_LIGHTTPD_LDAP
 comment "ldap support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
-config BR2_PACKAGE_LIGHTTPD_LIBEV
-	bool "libev support"
-	select BR2_PACKAGE_LIBEV
-	help
-	  Enable libev support for lighttpd fdevent handlers.
-
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 4adbd08648..a23af84c28 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
-sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
-sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
+sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
+sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5337042340..71c860a31a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -76,13 +76,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
-LIGHTTPD_DEPENDENCIES += libev
-LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
-else
-LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
