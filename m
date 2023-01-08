Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68759C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0355181307;
	Sun,  8 Jan 2023 20:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0355181307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsKEKmABrAbo; Sun,  8 Jan 2023 20:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E718130E;
	Sun,  8 Jan 2023 20:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10E718130E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D95C51BF4E2
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 20:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B4540907
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 20:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B4540907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msyoSQ2QggEs for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 20:34:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92E340901
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92E340901
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 20:34:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t5so1865617wrq.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 12:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQBMZ0Q2YpPMTlpJJs7iJG4vg4c7ov+iWZtJyJkJn5k=;
 b=5BcYZz1d21Sh2PjfDRW83kDvcnIKPAfo4rx4sbZYyWWt/CYcERbU72ILbrGeAh+VKZ
 XsiNJhb75vr4rUDnKq5IGwSFNd3Wm3fJnEtTIUx+L1pmogNj+S2moAgO/tSkuPRKucEG
 PSjDBSbKuNIEkfiySf9lqGHrlpEV2iFO1CqYWEKGBrJZ00yc/OpQchGPHU6a80ZtWV1+
 Nextk37CwOxbcu0PF+JsPoP/K6EkqjJrsz8V8V8MvyvOc3zXv0py2f8L/DpDzqtOYXvK
 6EPoiZIsjIFG03SNzwnoHkjdSB8oI1+bqoOvsRmpKOeTdPZJ10xYhcza6xFjolGfdhhW
 zXhw==
X-Gm-Message-State: AFqh2krObP7oowJzj5cDhl0g4gsg3iG+kV5plS3pKHqhdNv6x5pOVpi6
 B0lADw9PvFCue9RfD4Dbk4Y2tAQIVOU=
X-Google-Smtp-Source: AMrXdXtjEX4/2SitVoMJ6GdMOW/Udr0BuP1iPo+2q8Re+w5DM1ra7vd54tJDT5JOpDYpJfmnjB9wvQ==
X-Received: by 2002:a05:6000:1c10:b0:25d:9954:3310 with SMTP id
 ba16-20020a0560001c1000b0025d99543310mr49389048wrb.4.1673210046802; 
 Sun, 08 Jan 2023 12:34:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm6844387wrx.97.2023.01.08.12.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 12:34:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:34:03 +0100
Message-Id: <20230108203403.667276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VQBMZ0Q2YpPMTlpJJs7iJG4vg4c7ov+iWZtJyJkJn5k=;
 b=nTUnCi+NH5XRwFoiim6mQ3wWyGR1rt19yS3UELNDYplgO/yqEeZHPCDWsVEjSSkNkV
 s+pqj+HjuhJnnpNN/ufQxe06TNueyhQIhKaqI2y4IHLbee35UVK6ePUwJs0fQrbhJJsY
 fyaFHlIKF8Jplvcs/2wT/HgJeRIKeCs5nY2MQlJ2e2Hg/SmNPiNCX8x8Nrob73+PGOlV
 C4amZKArxX+Ex7R+IA/bBiAIftJ+zFReXcENLXH/MJMnTxsNuLeTALU2y9PiNbPUCMP0
 IqV49heLSrhRUn9I9ZE0OXvo6TRPunn79sNdKce2c2+eDaDGGW+0gjfkLWT2jgvYj7tB
 5Y6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nTUnCi+N
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to version
 2.13
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-39269, CVE-2022-39244 and CVE-2022-31031:
  https://github.com/pjsip/pjproject/security/advisories/GHSA-wx5m-cj97-4wwg
  https://github.com/pjsip/pjproject/security/advisories/GHSA-fq45-m3f7-3mhj
  https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj
- Drop patch (already in version)
- libuuid configure option is available since
  https://github.com/pjsip/pjproject/commit/0b0488f17b41c5323028b522cc7323f2cd9b684c
- libupnp is an optional dependency since
  https://github.com/pjsip/pjproject/commit/82247cb8c0441d0eafd18cb69e6c7bf55fc6a088
- libsrtp is optional since
  https://github.com/pjsip/pjproject/commit/fe6cbbc39764cae8ff6789a98f8ef8e85c63445c

https://github.com/pjsip/pjproject/releases/tag/2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ull-request-from-GHSA-26j7-ww69-c4qj.patch | 44 -------------------
 package/libpjsip/Config.in                    |  1 -
 package/libpjsip/libpjsip.hash                |  2 +-
 package/libpjsip/libpjsip.mk                  | 28 +++++++++---
 4 files changed, 22 insertions(+), 53 deletions(-)
 delete mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch

diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
deleted file mode 100644
index 42b842a616..0000000000
--- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 450baca94f475345542c6953832650c390889202 Mon Sep 17 00:00:00 2001
-From: sauwming <ming@teluu.com>
-Date: Tue, 7 Jun 2022 12:00:13 +0800
-Subject: [PATCH] Merge pull request from GHSA-26j7-ww69-c4qj
-
-[Retrieved from:
-https://github.com/pjsip/pjproject/commit/450baca94f475345542c6953832650c390889202]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pjlib-util/src/pjlib-util/stun_simple.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/pjlib-util/src/pjlib-util/stun_simple.c b/pjlib-util/src/pjlib-util/stun_simple.c
-index 722519584..d0549176d 100644
---- a/pjlib-util/src/pjlib-util/stun_simple.c
-+++ b/pjlib-util/src/pjlib-util/stun_simple.c
-@@ -54,6 +54,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
- {
-     pj_uint16_t msg_type, msg_len;
-     char *p_attr;
-+    int attr_max_cnt = PJ_ARRAY_SIZE(msg->attr);
- 
-     PJ_CHECK_STACK();
- 
-@@ -83,7 +84,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
-     msg->attr_count = 0;
-     p_attr = (char*)buf + sizeof(pjstun_msg_hdr);
- 
--    while (msg_len > 0) {
-+    while (msg_len > 0 && msg->attr_count < attr_max_cnt) {
- 	pjstun_attr_hdr **attr = &msg->attr[msg->attr_count];
- 	pj_uint32_t len;
- 	pj_uint16_t attr_type;
-@@ -111,6 +112,10 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
- 	p_attr += len;
- 	++msg->attr_count;
-     }
-+    if (msg->attr_count == attr_max_cnt) {
-+	PJ_LOG(4, (THIS_FILE, "Warning: max number attribute %d reached.",
-+		   attr_max_cnt));
-+    }
- 
-     return PJ_SUCCESS;
- }
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..980fada3d5 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBSRTP
 	help
 	  PJSIP is a free and open source multimedia communication
 	  library written in C language implementing standard based
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index b1ccdb2f37..9935575567 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0feef6963b07934e821ba4328aecb4c36358515c1b3e507da5874555d713533  pjproject-2.12.1.tar.gz
+sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 4134d40da8..5cc0423f5d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.12.1
+LIBPJSIP_VERSION = 2.13
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
-LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_CPE_ID_VENDOR = teluu
@@ -16,9 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
-# 0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
-LIBPJSIP_IGNORE_CVES += CVE-2022-31031
-
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
@@ -40,8 +36,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-l16-codec \
 	--disable-g722-codec \
 	--disable-ipp \
-	--disable-silk \
-	--with-external-srtp
+	--disable-silk
 
 # Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
 # both enable it. But that's OK, epoll is better than the alternative,
@@ -103,6 +98,22 @@ else
 LIBPJSIP_CONF_OPTS += --disable-libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+LIBPJSIP_DEPENDENCIES += libsrtp
+LIBPJSIP_CONF_OPTS += \
+	--enable-libsrtp \
+	--with-external-srtp
+else
+LIBPJSIP_CONF_OPTS += --disable-libsrtp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+LIBPJSIP_DEPENDENCIES += libupnp
+LIBPJSIP_CONF_OPTS += --with-upnp=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 # --enable-v4l2 is broken (check for libv4l2 will be omitted)
 LIBPJSIP_DEPENDENCIES += libv4l
@@ -161,6 +172,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
+LIBPJSIP_CONF_OPTS += --enable-libuuid
+else
+LIBPJSIP_CONF_OPTS += --disable-libuuid
 endif
 
 # disable build of test binaries
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
