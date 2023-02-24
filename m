Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5212CC61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 11:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E048660FBA;
	Fri, 24 Feb 2023 11:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E048660FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHlf-mQQvHo4; Fri, 24 Feb 2023 11:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C02860FA0;
	Fri, 24 Feb 2023 11:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C02860FA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3CE1BF36B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EA760FA0
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EA760FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oI10AszA0UV4 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 11:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87C9260F83
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87C9260F83
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 11:43:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id p26so11196814wmc.4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 03:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=miZwfDGw9tHw2vv1KS7OtdJRX+jWymbFnAKt09FYbAY=;
 b=S6+ZmBWV+orp2WsO/IpMN/UUUaAMtiEYKKZZi/YbN9grxPTB3BmLf7FEpsof3PUqNL
 fXfnnuSniBaF/p8gzlmQ3Q1vr7lnCH4jlpuSyAixXxl//ZLWpWEJLQfirKBn/HxsAOaE
 DO2Zonh07KQ5h5WCtzIi8mD6N8cG58Kc2isI6K2HNJm35yUjJMqHRVkWgR0k7lrxo4fJ
 6jd/OWkNlviam7p+2hPmp7GsSkd10KqvEhroDSfKcfYwKsm/B5DcHIDsg4Z00SA9fPAF
 H0CBxAYO/YlwBTn2PLMFba+/AxQpK5kA4zCvpPgAhr8J6YXeQYVPwP6yf1q6xMXOZMM1
 WcQw==
X-Gm-Message-State: AO0yUKU6cXe5VL9eGsRBkCX08L7XEXmL7/79jsSNynLRhKNyj2CUQEX1
 6QNEB3AWThKuayUVkY32jPjIAF9S+qk=
X-Google-Smtp-Source: AK7set9wOCttH8xhMjhkZuuvlkzlevgE+oFYlkTmdzEdMiV5ZPBpYy2gx4DTdZmz94yUHg76q9cstQ==
X-Received: by 2002:a05:600c:13d4:b0:3eb:29fe:70df with SMTP id
 e20-20020a05600c13d400b003eb29fe70dfmr544428wmg.35.1677239002871; 
 Fri, 24 Feb 2023 03:43:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003c6bbe910fdsm2618873wms.9.2023.02.24.03.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:43:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 12:43:20 +0100
Message-Id: <20230224114320.2152346-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=miZwfDGw9tHw2vv1KS7OtdJRX+jWymbFnAKt09FYbAY=;
 b=Upoz+z0wvow84xFctjjibY8CG4xqA7tz/piV/W4DAcrxQhkApoFLdhGp2tTFmG2NY5
 5SXY2tDe9MoMT8UH1h01m2Uit6rKdNuPjtoUWIEKPFAmDYimC+IJKjXtWtl1xTyv4N32
 jVym8oZlLR79PXeKM6XF3jc9McCgyVZ6TysgXdXgqI38fy8A44/UxXFuJDfwVEgpGtt2
 5638E0A4FlYy2kLktCABuvNMAyQKVrSiKXxP8+ahrGVBx6kCXZEiZhTStMNltyHf4wsP
 izHX9QdCgnfgF5aZ1U3RqH8xg6C8GiBhrVsckP3Aq8osp7jtfdtUxRsO8HXXxHyOYY+O
 hhBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Upoz+z0w
Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix build with libressl >=
 3.5.0
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 3.5.0 raised since bump
to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
  113 | static void     OPENSSL_cleanup(void)
      |                 ^~~~~~~~~~~~~~~
In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
                 from ../../../include/zbxcomms.h:65,
                 from tls.c:20:
/home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
  565 | void OPENSSL_cleanup(void);
      |      ^~~~~~~~~~~~~~~
In file included from tls.c:20:
tls.c: In function 'zbx_log_ciphersuites':
../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
  222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
      |                                                                           ^~
tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
 1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
      |                               ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-build-with-libressl-3.5.0.patch  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch

diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7e32ad5745
--- /dev/null
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,71 @@
+From 5c8511384f1d41f9c2a131604d5cb2dbc1c0aec9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Feb 2023 12:23:56 +0100
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
+  113 | static void     OPENSSL_cleanup(void)
+      |                 ^~~~~~~~~~~~~~~
+In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
+                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
+                 from ../../../include/zbxcomms.h:65,
+                 from tls.c:20:
+/home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
+  565 | void OPENSSL_cleanup(void);
+      |      ^~~~~~~~~~~~~~~
+In file included from tls.c:20:
+tls.c: In function 'zbx_log_ciphersuites':
+../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
+  222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
+      |                                                                           ^~
+tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
+ 1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
+      |                               ^~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent (no feedback on first patch)]
+---
+ include/zbxcomms.h      | 3 ++-
+ src/libs/zbxcomms/tls.c | 5 +++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/include/zbxcomms.h b/include/zbxcomms.h
+index e7d74dbd0f..d6efa358fe 100644
+--- a/include/zbxcomms.h
++++ b/include/zbxcomms.h
+@@ -253,7 +253,8 @@ int	zbx_telnet_execute(ZBX_SOCKET socket_fd, const char *command, AGENT_RESULT *
+ /* TLS BLOCK */
+ #if defined(HAVE_GNUTLS) || defined(HAVE_OPENSSL)
+ 
+-#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
++#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
+ #	if !defined(LIBRESSL_VERSION_NUMBER)
+ #		define OPENSSL_INIT_LOAD_SSL_STRINGS			0
+ #		define OPENSSL_INIT_LOAD_CRYPTO_STRINGS		0
+diff --git a/src/libs/zbxcomms/tls.c b/src/libs/zbxcomms/tls.c
+index 54ab0a6ef4..bd4075b3e4 100644
+--- a/src/libs/zbxcomms/tls.c
++++ b/src/libs/zbxcomms/tls.c
+@@ -30,8 +30,9 @@
+ #include "zbxstr.h"
+ #include "zbxtime.h"
+ 
+-#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+-/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
++#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x300000fL
++/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL (before 3.5.0) */
+ 
+ /* mutexes for multi-threaded OpenSSL (see "man 3ssl threads" and example in crypto/threads/mttest.c) */
+ 
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
