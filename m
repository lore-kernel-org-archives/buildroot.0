Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90204C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE3470312;
	Tue, 21 Feb 2023 02:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE3470312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVuGQPhDpYiN; Tue, 21 Feb 2023 02:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683CD7030D;
	Tue, 21 Feb 2023 02:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683CD7030D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7661BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C33D58175D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33D58175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIa9_cRq2PTZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:31:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6BE7813F9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6BE7813F9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:31:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso2123854wmb.5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZBg1AnTx3e5iXyxYqeA5kGcGkNT/dTz8z/3/PguI74=;
 b=laRlzsJ3BvXWgXiG9kaYfFDlAUzWQBhKbGEDh/v3LZLwofPuvxQVqrnVtPfGngHy3o
 nrBJF7fKUIKd5c4tMNR2FzM3DwVkpN23gwoArul+pw2Fcgn8kBOxLH5CelSUyLgZAslr
 Z6eVCVdQ6pgdN9aW8EOal3vDDo7F/FzEumJ9XeW9hjmSWoDc9FSkYghqc5DsBcknPBR7
 gU+Kksz8OMBjxuVh+CH7GJo8fFwokBj2ZzM+q+zeqSphftHr56yPKajbbP7i/wK1YW22
 TcZGuZrHvuRjZPVSRCHkflngmT8ZjDKEcBnG30Fyv86oMWQ/SnJvIWi3vzDLBh8nB0zL
 486g==
X-Gm-Message-State: AO0yUKWlp/jDhIVLnkgLgSXpPQB81bfHlljFCiLl5Qfmd469c+6wZXoz
 npPN9TgkClx1CWmXZAVBnZyiIXVxTHU=
X-Google-Smtp-Source: AK7set/OsUyin7XHfKIPvhEgxn5aPFGXs9YMrSzgbYRFA0sC97pmZN/DtZ8xtOe1U+lHmXbbEJF4qw==
X-Received: by 2002:a05:600c:1895:b0:3e2:589:2512 with SMTP id
 x21-20020a05600c189500b003e205892512mr2027936wmp.21.1676932316342; 
 Mon, 20 Feb 2023 14:31:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay38-20020a05600c1e2600b003dff870ce0esm11726650wmb.2.2023.02.20.14.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:31:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 23:31:51 +0100
Message-Id: <20230220223151.12965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CZBg1AnTx3e5iXyxYqeA5kGcGkNT/dTz8z/3/PguI74=;
 b=jf2msOGB7MndtV/AgxTaeXgy70Zg4yDH1kivAvZZPUmZcRaViFSGH0d/eF5q35yCIZ
 svt2hbXybk7/5dO1ydnNmxPLs6gLeaVrqncd3sn2J04aAKaW+MepRdyVgCLZCgyyaUHG
 CbQSKPcuw4+gwZ2SMvtPYksokRghVvmy/YFZY+SXXS7jjY0GGwpvqO2LlaVRyPhEjz7r
 MaNktF29eSf5x3z8sftSInNp8ojDthLgOqgWAA76bV8Len2O7Xz4cp+QpM1yymvXB6qt
 YivX+d4dcHelmvmOKwaywsWyBo2F+eXMPaXcrcYvf1ta2ts8nNwZSAQ8Aize3cYkT9EA
 aGGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jf2msOGB
Subject: [Buildroot] [PATCH v4,
 1/1] package/libmodsecurity: needs dynamic library
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
Changes v3 -> v4 (after review of Thomas Petazzoni):
 - Disable building statically
Changes v2 -> v3:
 - Fix syntax
Changes v1 -> v2:
 - Update nginx-modsecurity

 package/libmodsecurity/Config.in    | 10 ++++------
 package/nginx-modsecurity/Config.in |  9 +++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index b15d808759..2186d216f4 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -17,8 +17,6 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity
 
-comment "libmodsecurity needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "libmodsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 5cbe57a866..f3c270ff31 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
+	depends on !BR2_STATIC_LIBS # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -14,8 +14,5 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 
 comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "nginx-modsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
