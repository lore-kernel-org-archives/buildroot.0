Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA8C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A12F400C1;
	Wed, 10 Jan 2024 21:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A12F400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyFHqWUcPm8V; Wed, 10 Jan 2024 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45AA340143;
	Wed, 10 Jan 2024 21:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45AA340143
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 625211BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3937D40143
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3937D40143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQVDgUyuBBQ1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:55:25 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EB20400C1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB20400C1
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5cso43164165e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 13:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704923722; x=1705528522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3B6q/5gE5dFcBlAQaVsktO+Rocz5H9ryjVCZLSsmQyc=;
 b=IelVwTIcXZCcp6bJhjVobNN0IbhYeFMCoYBL30PeX3QTqSvZ4620Rm7ZHc88BnjZ8A
 swj+0eqNhCGKVphZawYOng1lqc2F+pvEG46YjwlZ+zfT/odL0DaNSPjDb+24/PxkW3hP
 2tJ+tYMVlJQennEm47RB6S8AL0YIPDEGrLaqhWCaCNnpYIyei5EnVW8Frnf+FIZLICyu
 dXRp5vRnVETryD4TLCzQZ+UQOolCMuIrAeR1e4SNbGVLtTtALwK585ABR0gXjohSmH6S
 0zHBZ/2VzO8zHb5extUO9vOUUeHYp++3156YdWOCCNI5esC296jemfawaS4IQQiMA4ZE
 MNVQ==
X-Gm-Message-State: AOJu0YwGJM9bgVf/7QOTS7N3GZwmkXDpyh+AQSuGE4hf1A421hYMTWqF
 dtv/M07xfPWBimtbhcHde+YV4/LKyRg=
X-Google-Smtp-Source: AGHT+IHzvoKAC5stT2+nAZxB3MrSlaw0NJP1K/DVTW5HWj0u/oPxxLwLFUBy+hXXr2g3E6kkMzDxPw==
X-Received: by 2002:a05:600c:19cc:b0:40e:52d7:a951 with SMTP id
 u12-20020a05600c19cc00b0040e52d7a951mr30230wmq.244.1704923722344; 
 Wed, 10 Jan 2024 13:55:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 je14-20020a05600c1f8e00b0040e3635ca65sm3486703wmb.2.2024.01.10.13.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 13:55:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:55:15 +0100
Message-ID: <20240110215515.1263859-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704923722; x=1705528522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3B6q/5gE5dFcBlAQaVsktO+Rocz5H9ryjVCZLSsmQyc=;
 b=mqbu82F5dC7LZMA6YlO3UZh7kMEeFXD+3iItUG1aCxOeyPVzzfW6WMeiS1bG5NQ4iH
 KoYzJvJTxyzWGzKzmYCTOhTyy+YBdarrjhiOiU/pDk14BfpDea4JgDhAOhSxQ77VAnVD
 0kum2Gv2Zj9YtP6dwxSdPLkqsSbWEx3uRwzFtQbhiwEmIaNKNmQLrgkJZvY4RUAFdbtJ
 Zm7HVDyZ6AHtiDPxYujz97NSZY8lxz4xDVR5Di2w/EHy1dUf+Ft1JG4e5wUGNqKmeuN6
 5r8bHM02a4EYQAGZLZFcnkZJQ3vyDq9vHNfusYnX/2zTksnjg4RC7EV2lr+84arGwRAD
 MDlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mqbu82F5
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-pico: fix or1k build
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
Cc: Alex Michel <alex.michel@wiedemann-group.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with or1k raises since the addition of
the package in commit a96361901dcc7b962a0c43f163e97a2de65687f3:

/home/autobuild/autobuild/instance-1/output-1/build/libzenoh-pico-0.10.0-rc/src/link/endpoint.c: Assembler messages:
/home/autobuild/autobuild/instance-1/output-1/build/libzenoh-pico-0.10.0-rc/src/link/endpoint.c:358: Error: unrecognized instruction `nop'

Fixes:
 - http://autobuild.buildroot.org/results/fd0b2c666a1dc1537162d15b27743abd270243ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Remove-nop-or-replace-with-macro.patch | 131 ++++++++++++++++++
 package/libzenoh-pico/libzenoh-pico.mk        |   6 +
 2 files changed, 137 insertions(+)
 create mode 100644 package/libzenoh-pico/0001-Remove-nop-or-replace-with-macro.patch

diff --git a/package/libzenoh-pico/0001-Remove-nop-or-replace-with-macro.patch b/package/libzenoh-pico/0001-Remove-nop-or-replace-with-macro.patch
new file mode 100644
index 0000000000..17692d60a3
--- /dev/null
+++ b/package/libzenoh-pico/0001-Remove-nop-or-replace-with-macro.patch
@@ -0,0 +1,131 @@
+From 7d79a14addcea972e801709413f5c9a5226e3ad3 Mon Sep 17 00:00:00 2001
+From: Jean-Roland Gosse <jean.roland.gosse@gmail.com>
+Date: Mon, 8 Jan 2024 17:40:03 +0100
+Subject: [PATCH] Remove nop or replace with macro (#314)
+
+* feat: remove nop instructions
+
+* feat: revert partly previous commit
+
+* feat: replace nops by configurable macro
+
+Upstream: https://github.com/eclipse-zenoh/zenoh-pico/commit/7d79a14addcea972e801709413f5c9a5226e3ad3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/zenoh-pico/config.h          |  7 +++++++
+ src/link/endpoint.c                  |  6 ------
+ src/system/arduino/esp32/network.cpp |  4 ++--
+ src/system/unix/system.c             | 10 +++++-----
+ 4 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/include/zenoh-pico/config.h b/include/zenoh-pico/config.h
+index c1bb5ad83..084981a3e 100644
+--- a/include/zenoh-pico/config.h
++++ b/include/zenoh-pico/config.h
+@@ -309,4 +309,11 @@
+ #define Z_FRAG_MAX_SIZE 300000
+ #endif
+ 
++/**
++ * Default "nop" instruction
++ */
++#ifndef ZP_ASM_NOP
++#define ZP_ASM_NOP __asm__("nop")
++#endif
++
+ #endif /* INCLUDE_ZENOH_PICO_CONFIG_H */
+diff --git a/src/link/endpoint.c b/src/link/endpoint.c
+index ff596a07b..035e646a6 100644
+--- a/src/link/endpoint.c
++++ b/src/link/endpoint.c
+@@ -360,9 +360,7 @@ size_t _z_endpoint_config_strlen(const _z_str_intmap_t *s, const char *proto) {
+     } else
+ #endif
+     {
+-        __asm__("nop");
+     }
+-
+     return len;
+ }
+ 
+@@ -398,9 +395,7 @@ char *_z_endpoint_config_to_str(const _z_str_intmap_t *s, const char *proto) {
+     } else
+ #endif
+     {
+-        __asm__("nop");
+     }
+-
+     return res;
+ }
+ 
+diff --git a/src/system/arduino/esp32/network.cpp b/src/system/arduino/esp32/network.cpp
+index c088f1ce1..cac67f77b 100644
+--- a/src/system/arduino/esp32/network.cpp
++++ b/src/system/arduino/esp32/network.cpp
+@@ -558,7 +558,7 @@ int8_t _z_open_bt(_z_sys_net_socket_t *sock, const char *gname, uint8_t mode, ui
+             uint8_t connected = sock->_bts->connect(gname);
+             if (!connected) {
+                 while (!sock->_bts->connected(tout)) {
+-                    __asm__("nop");
++                    ZP_ASM_NOP;
+                 }
+             }
+         } else {
+@@ -584,7 +584,7 @@ int8_t _z_listen_bt(_z_sys_net_socket_t *sock, const char *gname, uint8_t mode,
+             uint8_t connected = sock->_bts->connect(gname);
+             if (!connected) {
+                 while (!sock->_bts->connected(tout)) {
+-                    __asm__("nop");
++                    ZP_ASM_NOP;
+                 }
+             }
+         } else {
+diff --git a/src/system/unix/system.c b/src/system/unix/system.c
+index 28223b83f..de5e4e505 100644
+--- a/src/system/unix/system.c
++++ b/src/system/unix/system.c
+@@ -32,7 +32,7 @@ uint8_t z_random_u8(void) {
+     uint8_t ret = 0;
+ #if defined(ZENOH_LINUX)
+     while (getrandom(&ret, sizeof(uint8_t), 0) <= 0) {
+-        __asm__("nop");
++        ZP_ASM_NOP;
+     }
+ #elif defined(ZENOH_MACOS) || defined(ZENOH_BSD)
+     ret = z_random_u32();
+@@ -45,7 +45,7 @@ uint16_t z_random_u16(void) {
+     uint16_t ret = 0;
+ #if defined(ZENOH_LINUX)
+     while (getrandom(&ret, sizeof(uint16_t), 0) <= 0) {
+-        __asm__("nop");
++        ZP_ASM_NOP;
+     }
+ #elif defined(ZENOH_MACOS) || defined(ZENOH_BSD)
+     ret = z_random_u32();
+@@ -58,7 +58,7 @@ uint32_t z_random_u32(void) {
+     uint32_t ret = 0;
+ #if defined(ZENOH_LINUX)
+     while (getrandom(&ret, sizeof(uint32_t), 0) <= 0) {
+-        __asm__("nop");
++        ZP_ASM_NOP;
+     }
+ #elif defined(ZENOH_MACOS) || defined(ZENOH_BSD)
+     ret = arc4random();
+@@ -71,7 +71,7 @@ uint64_t z_random_u64(void) {
+     uint64_t ret = 0;
+ #if defined(ZENOH_LINUX)
+     while (getrandom(&ret, sizeof(uint64_t), 0) <= 0) {
+-        __asm__("nop");
++        ZP_ASM_NOP;
+     }
+ #elif defined(ZENOH_MACOS) || defined(ZENOH_BSD)
+     ret |= z_random_u32();
+@@ -85,7 +85,7 @@ uint64_t z_random_u64(void) {
+ void z_random_fill(void *buf, size_t len) {
+ #if defined(ZENOH_LINUX)
+     while (getrandom(buf, len, 0) <= 0) {
+-        __asm__("nop");
++        ZP_ASM_NOP;
+     }
+ #elif defined(ZENOH_MACOS) || defined(ZENOH_BSD)
+     arc4random_buf(buf, len);
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 90dfda6c98..bb68f4a1f1 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -11,4 +11,10 @@ LIBZENOH_PICO_LICENSE_FILES = LICENSE
 LIBZENOH_PICO_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBZENOH_PICO_INSTALL_STAGING = YES
 
+# __asm__("nop") is unsupported by or1k so define it to an empty value
+ifeq ($(BR2_or1k),y)
+LIBZENOH_PICO_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DZP_ASM_NOP"
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
