Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44FCC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6452A60EEA
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6452A60EEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FA6040164;
	Wed,  4 Aug 2021 20:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmaD0KM8Njoh; Wed,  4 Aug 2021 20:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FFC140203;
	Wed,  4 Aug 2021 20:24:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61FB61BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 501BA40164
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3iUlPTOLCs6 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AE1F40203
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:24:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m12so3546702wru.12
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUwHXLulhFurZr0gG2EQX+9eF34FXepZVuBbUmYI0TY=;
 b=ueItYrdH4KfVAgeVga5WkCxt4rifzOIfkrWDRG9vlDeKtnm4HakE7U0jKswpuBxZe6
 p4yDJLaBm5TLFzh6ocM+QijZlSXFwOVo7IfQFWyUVT1cUGZChwGnKLRVfrv8xftgDkTs
 haNDWU77GUu/iHE4UdXs0SRGd088ydf4fD/8x33JaL+cyKUDHglBgTQVeNYRYf8bCGXX
 4SSSbm/6seJByd1xU18UbFDBs8d6tCm2I2e4firf5rJl2k+Mnd7khcKA6LPT7mxd+Wnr
 nMRQqTG/gavNXzrRxtfQzJfnpHKsy4tRKgc6FVt4iDtwZDgfAO6AucHb4S0rmEOeBaLX
 WYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUwHXLulhFurZr0gG2EQX+9eF34FXepZVuBbUmYI0TY=;
 b=ctNP3lzvBOOG2joHxcugBxE6AkeHxrPcMoltqJWvK0nqz9xd12gaS/cvghf3+0FOhk
 2wG+u47+r40b5207ttfI3x5LVEtt9+DAuZ8f9Zxe2V/VhlzKvGCu+JBTpAFaXrII0/hl
 uVZK3NQHPoogEV/Iv4r7Y6WAh8uNzEFUzMIuqn3s5c5TSHBjWseO6Y9m5tLRtEx9zqNI
 OhaLSdDSdb3a3xBYfWOq3GDSSLkq+iXLJkJAAcBMLbGzqVFy5IZ6YwRe4lR2lhNLjOvF
 fHU1cGl69tkfWyNLIllcg4JAmqvk6FaHHi/uXPq5JeLdpdKeMl+qElgWURYsxlasXL2B
 OC9A==
X-Gm-Message-State: AOAM5314HJ2WGeg8IpLKhWkBL0VONIJWh5VrUczsP5LpvsqyGQ9HvctG
 MydraCxI2wBVTkUuzA/nQ5r27ESI4MBgCQ==
X-Google-Smtp-Source: ABdhPJzB2KFfifoWk+iW3zst3UTuzSa2jfThSTl01PBMw4s+YnmOoukV9jSCK6kQSO9FRVZn4oRvwg==
X-Received: by 2002:adf:ef85:: with SMTP id d5mr1130532wro.372.1628108642949; 
 Wed, 04 Aug 2021 13:24:02 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id k1sm3781403wrz.61.2021.08.04.13.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:24:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:23:54 +0200
Message-Id: <20210804202354.1160141-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with wolfssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with wolfssl raised since bump to
version 3.12.1 in commit 4d85defa7103aadc74223868fb83ed0bed144f4d:

/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
      |                                 ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25db1e999950bbee069ba7364a228184a6a77808

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-openssl.c-fix-build-with-wolfssl.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch

diff --git a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
new file mode 100644
index 0000000000..deb1a0f93b
--- /dev/null
+++ b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
@@ -0,0 +1,47 @@
+From e5c5ed1c64cfc715729c9bfbfdcc4be225f344ff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 11:32:39 +0200
+Subject: [PATCH] openssl.c: fix build with wolfssl
+
+Fix the following build failure with wolfssl:
+
+/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
+/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
+  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
+      |                                 ^~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d0fb629b40b05ad828775894fabed878692bb222
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/ssl/pull/1]
+---
+ openssl.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/openssl.c b/openssl.c
+index 8f3d8b7..c42638c 100644
+--- a/src/ssl/openssl.c
++++ b/src/ssl/openssl.c
+@@ -71,14 +71,14 @@
+                 "TLS13-AES256-GCM-SHA384:"		\
+                 ecdhe_aead_ciphers
+ #else
+-# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
+-                "TLS_AES_128_GCM_SHA256:"		\
+-                "TLS_AES_256_GCM_SHA384"
+-
+ # define top_ciphers							\
+                 ecdhe_aead_ciphers
+ #endif
+ 
++# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
++                "TLS_AES_128_GCM_SHA256:"		\
++                "TLS_AES_256_GCM_SHA384"
++
+ #define ecdhe_aead_ciphers						\
+                 "ECDHE-ECDSA-CHACHA20-POLY1305:"	\
+                 "ECDHE-ECDSA-AES128-GCM-SHA256:"	\
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
