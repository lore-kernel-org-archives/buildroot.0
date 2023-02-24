Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8402EC64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 09:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1979405AB;
	Fri, 24 Feb 2023 09:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1979405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Z6mjOLThYcB; Fri, 24 Feb 2023 09:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07FFB40575;
	Fri, 24 Feb 2023 09:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07FFB40575
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4B11BF2C8
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2663080D2A
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 09:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2663080D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLhQn0PokUr9 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 09:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE6080D04
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE6080D04
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 09:50:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1689760wmb.5
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 01:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hHWXYprXmxZAUMoQPxk30e+vb3IZX7BGdIR6FRvLs4=;
 b=YTrI23mHewlGUD0zV62wS6ON97YpvF3tboBxSA+pjntntFvqLO00KsQt04Ea3usR3S
 FDZe5I3XpB9xtrhiaKwF/XjpwwLk3K3MkGuXkFi0g8y9zcy0c28EfNwbj7KqtAf5h5C9
 5OF+/iYLJMGlIm+TVOJ0EAsH8wxz+kq8/zfOlgUlx6BYFm5ab0k09xNnwHX768bWsySL
 vatR2a9ISnhDj9JE4e7F/WoBAHQtP0yJ6J4o3occkr8AS3ZETJeAXJ5VLpfchwNFOW+V
 prPDj/81rIVDIHS4p/iLrk8B9rl6ZQVZjTKPV4vXFRp+P0o2B7NZfuom0BN0tVjDVfIm
 UAxA==
X-Gm-Message-State: AO0yUKUPofNCURF+tD+ohkkZGu3urz5tyjL6XoU+nd8obMR/m+JgLf3o
 xaAJgWUBNheaJrBrkxax1RJfaYEv0hA=
X-Google-Smtp-Source: AK7set+Yadt7tg13bBkELejQAXO+6TH+Y28o3fMs0Ia1iohqxudpz2ie5igdSfPWj/f+lK/OBPHEBQ==
X-Received: by 2002:a05:600c:16c7:b0:3ea:25b9:c518 with SMTP id
 l7-20020a05600c16c700b003ea25b9c518mr4663620wmn.5.1677232248909; 
 Fri, 24 Feb 2023 01:50:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b003df7b40f99fsm2421172wmq.11.2023.02.24.01.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:50:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 10:50:45 +0100
Message-Id: <20230224095045.782119-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5hHWXYprXmxZAUMoQPxk30e+vb3IZX7BGdIR6FRvLs4=;
 b=ehFPQeqP8FBSPU6xqqtiFq0XdkZLB414yiMYENewQGw9KiZWdXM8dZ0PjBDXFrYhWS
 sT7P5TLPvS6xrOMhsbSm39wWp/zFZcT/wZUUa9dy7yqt0yRJJFZAo3k6M6Ms2w0ChjLc
 +6bq7NAe4at9M5vy2l+dK96GEfxVAA0c1nZ/ShUZGDNsmsp2CugOyY8D2V0JivUUkWh8
 IU57bnuEZ/BjkCNJjoE7rlnXwt7VxXHhvruhTl8OqFC+wuWTDm7hQmjDnwb/g8DhrLXf
 1/c64mEzDFvETmaw+igNZlOwsxcpEkslasBGXCExlJBfnx5YSgKgjXPdBxH1+KAob07+
 BheA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ehFPQeqP
Subject: [Buildroot] [PATCH 1/1] package/asterisk: fix build with libressl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl by using SSL_is_server
which is available since version 2.7.0 and
https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8ac6570f63b458f7:

iostream.c: In function 'ast_iostream_close':
iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  559 |                         if (!stream->ssl->server) {
      |                                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-iostream.c-fix-build-with-libressl.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch

diff --git a/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch b/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..cdd3aa8cfb
--- /dev/null
+++ b/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
@@ -0,0 +1,38 @@
+From 9569fa20fec49f530170a3042afb99556cf66a2e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Apr 2022 10:52:42 +0200
+Subject: [PATCH] main/iostream.c: fix build with libressl
+
+Fix the following build failure with libressl by using SSL_is_server
+which is available since version 2.7.0 and
+https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8ac6570f63b458f7:
+
+iostream.c: In function 'ast_iostream_close':
+iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
+  559 |                         if (!stream->ssl->server) {
+      |                                         ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ main/iostream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main/iostream.c b/main/iostream.c
+index d060b6d6d4..b8ab80ec91 100644
+--- a/main/iostream.c
++++ b/main/iostream.c
+@@ -553,7 +553,7 @@ int ast_iostream_close(struct ast_iostream *stream)
+ 					ERR_error_string(sslerr, err), ssl_error_to_string(sslerr, res));
+ 			}
+ 
+-#if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
++#if !(defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER < 0x2070000L)) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
+ 			if (!SSL_is_server(stream->ssl)) {
+ #else
+ 			if (!stream->ssl->server) {
+-- 
+2.35.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
