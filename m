Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F2AC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD2741199;
	Sun, 19 Feb 2023 17:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD2741199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNrv7JNcKEuB; Sun, 19 Feb 2023 17:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBC1741195;
	Sun, 19 Feb 2023 17:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBC1741195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F01C1BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7916E81801
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7916E81801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv5k40BdzfgB for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:24:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E5F814C9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49E5F814C9
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:24:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b11so1409103wrw.5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 09:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BZf8DZ/JlaYsxfVcyDamLaZSNe2M2PQVNHv/U/zBCk=;
 b=KdMG2QT/iLnkh3raSUqQMKoasjFzzO/JM38f/F6kOkQ+btUx0Mm9SdANepu5MAAREE
 qGJ/KCYxEPn0pXjWB4j8ENTDnk/KSFhFVx+DRLIg2ElUM0nM20OhBQBQFSZ8w/ZYKzqk
 yX/1fLMO9zyx8g5GxOkagIjeuflmp8OwCoyrOTUD63w1cuyhocf/8Du2ZyoLsmDm96la
 WUotbTgJBg4fQLVqLjvaKj8ySVcKjg8rvUw9kR3LWL/FYNsUflWW1oF24TKGKrd9j6U1
 TOumuRs7CEswZ69mjpWN0HzoyTZvGwlasyI6t/J81qdCOLWsj3n6+PV7+XiU5ogm957C
 U4IA==
X-Gm-Message-State: AO0yUKWY2BHU/uEtA+2qCXlH8Ayp/Q++6whezLqU6j5p6DoaXSNpglwb
 dDfhIynY7EXVcBnD2PNp5HfDst7ZSXU=
X-Google-Smtp-Source: AK7set8nI3gNaVUFojqh6afdfvMoKFXr8sJRnF7yGQ7muhBEoX2HjR6fp69LPjMFogJWAwUzM/onvw==
X-Received: by 2002:a5d:4e8d:0:b0:2c5:519d:7993 with SMTP id
 e13-20020a5d4e8d000000b002c5519d7993mr891579wru.27.1676827483097; 
 Sun, 19 Feb 2023 09:24:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q9-20020adff949000000b002c56a7872f4sm646907wrr.82.2023.02.19.09.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 09:24:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:24:40 +0100
Message-Id: <20230219172440.519540-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5BZf8DZ/JlaYsxfVcyDamLaZSNe2M2PQVNHv/U/zBCk=;
 b=Lz5a93bmR9TRkAotzPo/5WVPoIIBu4p53KtEWO6zaq8YqBgu9cwl0JqCzF3lcF2B+K
 JiklP0v8UEgDx0bloc9iu05lYpoqwmElrG1VctyhOKWitU3EJF9dA+SVs4ikKiWlmqQt
 rmI8lIG0WCvXWWMcPD6z1NybWJkqHs8DptePVN8dE3xCfZC1LTsgwUhNxU3inAixLa9T
 7WpibaSTKeROdQ5J6a5NDh+J2oo8TIYFKjbGi/wua+UB/8bNvTWB+h47xAqRGN5JjBdG
 lL4zMVRIcadvk7M+X0DQJwR8PMP0ddQ88v11HpHcSDlAB36bYdAkyP39x0TYKC8eZkxh
 xFrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Lz5a93bm
Subject: [Buildroot] [PATCH v3,
 1/1] package/libmodsecurity: needs dynamic library with libcurl,
 libssh2 and mbedtls
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
mbedtls can be pulled in libcurl through libssh2 resulting in the
following build failure:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_init':
md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Fix syntax
Changes v1 -> v2:
 - Update nginx-modsecurity

 package/libmodsecurity/Config.in    | 6 ++++--
 package/nginx-modsecurity/Config.in | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index b15d808759..027c62716c 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBMODSECURITY
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
+	depends on !(BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS)))
 	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -21,4 +22,5 @@ comment "libmodsecurity needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libmodsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS))
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 5cbe57a866..96ef7e88d5 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
+	# libmodsecurity
+	depends on !(BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS)))
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -18,4 +20,5 @@ comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 
 comment "nginx-modsecurity needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
