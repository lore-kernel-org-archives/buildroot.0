Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB73C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D621561BA3;
	Tue, 26 Jul 2022 17:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D621561BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShX4STjWUvTq; Tue, 26 Jul 2022 17:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98D4361B9E;
	Tue, 26 Jul 2022 17:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D4361B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 282691BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD0561B9D
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD0561B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bRFmiPWETiQ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 535DD612EE
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 535DD612EE
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:33:12 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h9so21160411wrm.0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Tcp8Le5QpU8G96IR790YMezqgw5P0s+sdzuY3Y+5Fs=;
 b=XvjGny3Z1nXIfn2GbzYn8fczifjgsOo0HrrGJWziOJdaGz1Y0Es05vsTHFFZKMst6/
 C79JLVEullGRBFwjL7yRln5uH+HxoWkunx4xCt2EFMu41k4Vc8HZ18vguGI+OtN+Zr9f
 YRXAjy9qfs7+t4WmxpuJkLCe0LB8weJxZCR0537y0cspuFJya6trKqzwTZ84bFDSmTq4
 1+4DWVaMIqM4mP/pUaGMexp1zYZUWuANCK4STuwakVi9hx/hkvNSxEzZTnicJXivtmRU
 eyIfo4yu427j16pjTGOjxJQrrztZQWGLHjq5H9vIT0+XQ0PynVc+jmvyzbrwxbfhsI7k
 axGA==
X-Gm-Message-State: AJIora9XcpgyvlibHdgo+Z+ehkVwh7OTmFp/kn3gpX3mjlWKHamGoL7i
 mIIe2JTUawPWGsxwVJwnEtAyCbMFoGU=
X-Google-Smtp-Source: AGRyM1sQKGhu2yUKlLjfcmcFsX/WI+M7xxFqLKTKWXCm8+ZwGABLPDhhrV3VksMnZOzJe6Ofun1oTw==
X-Received: by 2002:adf:edc1:0:b0:21d:7157:f4aa with SMTP id
 v1-20020adfedc1000000b0021d7157f4aamr11699309wro.454.1658856790056; 
 Tue, 26 Jul 2022 10:33:10 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003a32251c3f9sm26510064wms.5.2022.07.26.10.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:33:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 19:32:35 +0200
Message-Id: <20220726173235.24338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Tcp8Le5QpU8G96IR790YMezqgw5P0s+sdzuY3Y+5Fs=;
 b=KlxC4xwv5gkDAukKCHDpzBIfeeIT1D16oy/hAE6OsaltbwQfGeJYKFm3QVySyJWj+S
 WNhRTT4A1Bo3GFKoymxiJ18B9akACyk2Wm6S42yrkAfWqYtOriG7mrI+tEItvrjRf/Vh
 HpXto3HnXjqhXhtG/SFlX5N8YbAXCe1E5XiRNcTLMk41/C2JrXiTQZhVgj6TG/thtnWr
 81Mrua2tWS0uyHyNkP1nUVpg/XLwItpieJWsiILYpa+rbD4BRlvi9xbFPJGJm9+C3Xvm
 OJtvLInbiF/sv9CtFV9cs9lMMWRQ9dYuqtEw9r+LvoNHXL9sgdKtpSul1SyWJMgDHOJM
 4zsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KlxC4xwv
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version 1.0.3
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Rebased second patch
- Drop third and fourth patches (already in version)
- duktape is an optional dependency since version 1.0.0 and
  https://github.com/meetecho/janus-gateway/commit/fab4215b7826638660eba2147bb772dd57fed10c
- gengetopt is not a dependency since version 1.0.1 and
  https://github.com/meetecho/janus-gateway/commit/c21500c02e93e4b08c5242d0f0066d26ffc9f1a9

https://github.com/meetecho/janus-gateway/blob/v1.0.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-test-for-Wunused-but-set-variable.patch |  8 +++---
 .../0003-Fixed-missing-XSS-mitigation.patch   | 25 -------------------
 .../0004-Fix-build-with-libressl-3.5.0.patch  | 25 -------------------
 package/janus-gateway/Config.in               |  8 ++++++
 package/janus-gateway/janus-gateway.hash      |  2 +-
 package/janus-gateway/janus-gateway.mk        | 14 +++++++----
 6 files changed, 23 insertions(+), 59 deletions(-)
 delete mode 100644 package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
 delete mode 100644 package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch

diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 2dfcc76d68..31796d6e28 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -18,6 +18,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[rebased against v1.0.3)
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: rejected
 (https://github.com/meetecho/janus-gateway/pull/1789)]
 ---
@@ -27,10 +29,10 @@ Signed-off-by: Adam Duskett <Aduskett@gmail.com>
  3 files changed, 79 insertions(+), 2 deletions(-)
  create mode 100644 m4/ax_check_compile_flag.m4
 
-diff --git a/Makefile.am b/Makefile.am
+diff --git a/src/Makefile.am b/src/Makefile.am
 index f961fdb..3ddbe59 100644
---- a/Makefile.am
-+++ b/Makefile.am
+--- a/src/Makefile.am
++++ b/src/Makefile.am
 @@ -151,6 +151,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
  	-DLOGGERDIR=\"$(loggerdir)\" \
diff --git a/package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch b/package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
deleted file mode 100644
index e1e612133b..0000000000
--- a/package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f62bba6513ec840761f2434b93168106c7c65a3d Mon Sep 17 00:00:00 2001
-From: Lorenzo Miniero <lminiero@gmail.com>
-Date: Wed, 15 Dec 2021 14:10:01 +0100
-Subject: [PATCH] Fixed missing XSS mitigation (see #2817)
-
-[Retrieved from:
-https://github.com/meetecho/janus-gateway/commit/f62bba6513ec840761f2434b93168106c7c65a3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- html/textroomtest.js | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/html/textroomtest.js b/html/textroomtest.js
-index bf95a260a..7d5ae832c 100644
---- a/html/textroomtest.js
-+++ b/html/textroomtest.js
-@@ -351,7 +351,7 @@ function sendPrivateMsg(username) {
- 				text: JSON.stringify(message),
- 				error: function(reason) { bootbox.alert(reason); },
- 				success: function() {
--					$('#chatroom').append('<p style="color: purple;">[' + getDateString() + '] <b>[whisper to ' + display + ']</b> ' + result);
-+					$('#chatroom').append('<p style="color: purple;">[' + getDateString() + '] <b>[whisper to ' + display + ']</b> ' + escapeXmlTags(result));
- 					$('#chatroom').get(0).scrollTop = $('#chatroom').get(0).scrollHeight;
- 				}
- 			});
diff --git a/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 6d75318a45..0000000000
--- a/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 8e450a097f5f0c7e9c034e954fbc709797521f1c Mon Sep 17 00:00:00 2001
-From: Lorenzo Miniero <lminiero@gmail.com>
-Date: Fri, 13 May 2022 18:42:38 +0200
-Subject: [PATCH] Fix build with libressl >= 3.5.0 (see #2980)
-
-[Retrieved from:
-https://github.com/meetecho/janus-gateway/commit/8e450a097f5f0c7e9c034e954fbc709797521f1c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dtls-bio.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dtls-bio.h b/dtls-bio.h
-index 92f06d7c0a..fbfd4c37bf 100644
---- a/dtls-bio.h
-+++ b/dtls-bio.h
-@@ -35,7 +35,7 @@ void janus_dtls_bio_agent_set_mtu(int start_mtu);
- int janus_dtls_bio_agent_get_mtu(void);
- 
- #if defined(LIBRESSL_VERSION_NUMBER)
--#define JANUS_USE_OPENSSL_PRE_1_1_API (1)
-+#define JANUS_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
- #else
- #define JANUS_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
- #endif
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5d711fe746..dedb53529c 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -30,6 +30,14 @@ config BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE
 	bool "audio bridge"
 	select BR2_PACKAGE_OPUS
 
+config BR2_PACKAGE_JANUS_GATEWAY_DUKTAPE
+	bool "duktape"
+	depends on !BR2_OPTIMIZE_FAST # duktape
+	select BR2_PACKAGE_DUKTAPE
+
+comment "duktape can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST
 	bool "echo test"
 
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 7aec3d2aa3..5d73ede87f 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5fe70d95b9288200df15d5f75cb8eb6db66484c6ded159422a81e880ecb7104  janus-gateway-0.11.6.tar.gz
+sha256  5b8a7304761783585bfa8db7471bf8c393fa2a0ffc346747afadc0c1a9d213f5  janus-gateway-1.0.3.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 381843a0af..9a74350b2c 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,19 +4,16 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.11.6
+JANUS_GATEWAY_VERSION = 1.0.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 
-# 0003-Fixed-missing-XSS-mitigation.patch
-JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4124
-
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl libconfig \
+	libsrtp libglib2 openssl libconfig \
 	$(if $(BR2_PACKAGE_LIBOGG),libogg)
 
 # Straight out of the repository, no ./configure, and we also patch
@@ -41,6 +38,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_DUKTAPE),y)
+JANUS_GATEWAY_DEPENDENCIES += duktape
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-duktape
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-duktape
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-echotest
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
