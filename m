Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3092C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 10:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F34821B1;
	Thu, 23 Feb 2023 10:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F34821B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjkWlRIBRCad; Thu, 23 Feb 2023 10:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CA2821AC;
	Thu, 23 Feb 2023 10:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CA2821AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E983E1BF35E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C334E821AB
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C334E821AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6uWvnxoTsVu for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 10:10:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DED821A2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57DED821A2
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 10:10:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k37so5358358wms.0
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 02:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gghlZTLUBGDhMB8SY7a7ZTfP3ikFNfiC29xJah2Kx/I=;
 b=UWNpOa1Vo5FufpdFLlv+vdMmwR87bk87Lel85+/tr/1FYEVMO9X5TOC8n8jfZz+Mq7
 LwLmJgGc56UAdGhdmO7shKpEODyuBXEmj8rU0hMaoJf83Zcq26Co6ZVtOiF7/rUxX+Kq
 NC13veZ0sr7jlO96f7X9WY7sz8hu4vpmuKrr9NyZ4JewfH1ZNNfyri0lHbh8O2j1jwyt
 DOeHfaO5ha6VJMzBeLpgFY83Sx09wSnhcXdWGGHp/+3Tb4bKSqAlAF7Fa3tRhEVsfJFA
 zk3VUYndoH4oRyEISycsQKeSDz2txEidIMEexWi2u9y0n+sGuP8cFG94e4N0bB7Kw+Pe
 nCkQ==
X-Gm-Message-State: AO0yUKWGdUHpf/OHuZ/g6qxI/+19aMqkQm0IeYhVgRGXSeuEWMOOUB+N
 LGWrfMw01zKucqI3I8qYeLJIt/EzWtI=
X-Google-Smtp-Source: AK7set+yyHXp65FY96UUO/zJch9f/Cp+TQqSv9tOcmSpiQtYCiH3LP/S7yVN8n0FHlHSqBmrOYOSew==
X-Received: by 2002:a05:600c:5013:b0:3dc:4313:fd1e with SMTP id
 n19-20020a05600c501300b003dc4313fd1emr8265077wmr.34.1677147036945; 
 Thu, 23 Feb 2023 02:10:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm10810728wmi.8.2023.02.23.02.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:10:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 11:10:32 +0100
Message-Id: <20230223101032.19265-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gghlZTLUBGDhMB8SY7a7ZTfP3ikFNfiC29xJah2Kx/I=;
 b=UYfsuhnQLlzC7m4Hal1s8aQEebg+4hf12X3c9EfbRpP+9NEWgh0nizDNXl2WZIfLw+
 rfKHDGZxbXhVhofzD3lB5NG53q2k0jjY6q/FA1aUeSktcMTKECCcfQj7nQERvKzx70Q2
 raYSj0PUQMD3qx4lQynx6b64XFFQ4doNpTDFVJKng814Ei+TctQ07EeOlM3zMMuUNjW2
 OEm4hI2JnQpUMbMJp1UXF+VaVcis0Q7+JhXmplx8rnzOOTPst8cIqoQzM/IIMjvXB/Vl
 BtzOhNPYqCMFYSRF4+8EfNC5hL7MkC1jRXaKhj5JAycqUd/Dc5MrTBFTmPMVq/XR84WU
 2BGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UYfsuhnQ
Subject: [Buildroot] [PATCH v2,
 1/1] package/libev: force arm mode instead of Thumb mode
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
Cc: Julian Scheel <julian@jusst.de>, Joseph Kogut <joseph.kogut@gmail.com>,
 Assaf Inbal <shmuelzon@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/ccHc3Awn.s:825: Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1c597c9da724d6cac06b09b1ecd456a28440a3a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Add BR2_PACKAGE_LIBEV_ARCH_SUPPORTS

 package/atest/Config.in             | 2 ++
 package/cfm/Config.in               | 2 ++
 package/dvblast/Config.in           | 2 ++
 package/libev/Config.in             | 6 ++++++
 package/libev/libev.mk              | 7 +++++++
 package/libpagekite/Config.in       | 2 ++
 package/libuhttpd/Config.in         | 2 ++
 package/libuwsc/Config.in           | 1 +
 package/lua-ev/Config.in            | 1 +
 package/mrp/Config.in               | 2 ++
 package/rtty/Config.in              | 1 +
 package/shadowsocks-libev/Config.in | 1 +
 package/uacme/Config.in             | 2 ++
 package/unclutter-xfixes/Config.in  | 1 +
 14 files changed, 32 insertions(+)

diff --git a/package/atest/Config.in b/package/atest/Config.in
index 647b2163ea..44caff1954 100644
--- a/package/atest/Config.in
+++ b/package/atest/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ATEST
 	bool "atest"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBEV
@@ -10,4 +11,5 @@ config BR2_PACKAGE_ATEST
 	  https://github.com/amouiche/atest
 
 comment "atest needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cfm/Config.in b/package/cfm/Config.in
index 1c2e92be67..81f8d8eb8b 100644
--- a/package/cfm/Config.in
+++ b/package/cfm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CFM
 	bool "cfm"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	select BR2_PACKAGE_LIBEV
@@ -13,5 +14,6 @@ config BR2_PACKAGE_CFM
 	  https://github.com/microchip-ung/cfm
 
 comment "cfm needs a toolchain w/ threads, kernel headers >= 5.0"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index 973eee88c6..93da42b785 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
@@ -11,4 +12,5 @@ config BR2_PACKAGE_DVBLAST
 	  http://www.videolan.org/projects/dvblast.html
 
 comment "dvblast needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libev/Config.in b/package/libev/Config.in
index 71abe7737d..820f01e8c0 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,5 +1,11 @@
+ config BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
+        bool
+        default y if !(BR2_arm || BR2_armeb) || \
+		BR2_ARM_CPU_HAS_ARM || BR2_ARM_CPU_HAS_THUMB2
+
 config BR2_PACKAGE_LIBEV
 	bool "libev"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	help
 	  Userspace library for handling asynchronous notifications
 
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 9f3c19d46c..cbd5433d76 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -10,6 +10,13 @@ LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
 
+# libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # The 'compatibility' event.h header conflicts with libevent
 # It's completely unnecessary for BR packages so remove it
 define LIBEV_DISABLE_EVENT_H_INSTALL
diff --git a/package/libpagekite/Config.in b/package/libpagekite/Config.in
index 0ecf4f97e1..11972d40c7 100644
--- a/package/libpagekite/Config.in
+++ b/package/libpagekite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPAGEKITE
 	bool "libpagekite"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_OPENSSL
@@ -21,4 +22,5 @@ config BR2_PACKAGE_LIBPAGEKITE
 	  https://github.com/pagekite/libpagekite
 
 comment "libpagekite needs a toolchain with threads"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index a552a88f0c..63cc246092 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
@@ -12,5 +13,6 @@ config BR2_PACKAGE_LIBUHTTPD
 	  https://github.com/zhaojh329/libuhttpd
 
 comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
index ae99b6d2dc..1675aca88b 100644
--- a/package/libuwsc/Config.in
+++ b/package/libuwsc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUWSC
 	bool "libuwsc"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	select BR2_PACKAGE_LIBEV
 	help
 	  A Lightweight and fully asynchronous WebSocket client
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 1e89c270a0..75c4862f8a 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	select BR2_PACKAGE_LIBEV
 	help
 	  Get access to the libev library from Lua.
diff --git a/package/mrp/Config.in b/package/mrp/Config.in
index ac42fa4773..56353baef2 100644
--- a/package/mrp/Config.in
+++ b/package/mrp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MRP
 	bool "mrp"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	select BR2_PACKAGE_LIBEV
@@ -14,5 +15,6 @@ config BR2_PACKAGE_MRP
 	  https://github.com/microchip-ung/mrp
 
 comment "mrp needs a toolchain w/ threads, kernel headers >= 5.0"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index 198d465713..ed154af6e1 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTTY
 	bool "rtty"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
 	help
diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index fefb27bcc1..25e7ea7b77 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	help
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 2c6864871c..94367cb220 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -19,6 +19,7 @@ if BR2_PACKAGE_UACME
 
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL \
@@ -28,6 +29,7 @@ config BR2_PACKAGE_UACME_UALPN
 	  challenge responder.
 
 comment "ualpn needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/unclutter-xfixes/Config.in b/package/unclutter-xfixes/Config.in
index 852a8cfda9..ed266c3f82 100644
--- a/package/unclutter-xfixes/Config.in
+++ b/package/unclutter-xfixes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UNCLUTTER_XFIXES
 	bool "unclutter-xfixes"
+	depends on BR2_PACKAGE_LIBEV_ARCH_SUPPORTS # libev
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_XLIB_LIBX11
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
