Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9722BC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 01:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B5240D23;
	Fri, 16 Aug 2024 01:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in5yhHBEegeH; Fri, 16 Aug 2024 01:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22AC140D27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AC140D27;
	Fri, 16 Aug 2024 01:40:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7833D1BF33B
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 01:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA6E40D23
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 01:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHytoWANJxij for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 01:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DDE640CFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDE640CFF
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DDE640CFF
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 01:40:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5CD923535C0F; Fri, 16 Aug 2024 03:40:54 +0200 (CEST)
Date: Fri, 16 Aug 2024 03:40:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr6uJlRPgiprr48c@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723772454; bh=lvrpglQVJ4DYVrHZ4dWNSuu3tLjvR3+DQmK0KeS4rJI=;
 h=Date:From:To:Subject:From;
 b=u9fiVe+X94BM/jvwA2+NKmXxZ/LjqsQYwvuTkSxgccdTr5OANLCqCME+GSWm7sfXv
 OH/f8jFd68hBWUcROSkazfk97v/PPtgwNuNeAPd4QSjRI0LIN715ONjgLhBWpA77pN
 Biw9NQIfZjpqunNMeKNeGoPfHl5P8zeZSfmoejk2O3F3VEJBZ++p0qxUQEct7Y/odX
 +R/hQqLHW3eYwyWIhy9korY9cJBIfB+1LHsvYVRpHmUt4jaUDgD0YUMTs0k2bhn0s4
 ainLMxJv2IXVjBfMAMOuvJtlLu0WckBUwlCPN80h0CqukqhE1LWqC25WxGde05YmSS
 dyTZuVfSvC3Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=u9fiVe+X
Subject: [Buildroot] [PATCH] package/nginx: fix static build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 761259c93400bc806611a242c7dc3df7ff67c231 the SSL patch was
removed, without testing any static compilation.
Reintroduce a small version of the original patch.

Upstream does not use pkg-config, so the patch is Buildroot specific and
not suitable for upstreaming.

Fixes:
 - http://autobuild.buildroot.net/results/a85/a85b00dfe9b55607390ebacc0e4e55c7cfbace3a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...auto-lib-openssl-conf-use-pkg-config.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch

diff --git a/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch
new file mode 100644
index 0000000000..05fb48b76e
--- /dev/null
+++ b/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch
@@ -0,0 +1,34 @@
+From 232ac61984720401b0c3854da1644ec20ed218e0 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Thu, 15 Aug 2024 19:47:23 +0200
+Subject: [PATCH] auto/lib/openssl/conf: use pkg-config
+
+Change to using pkg-config to find the path to openssl and its
+dependencies.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: not suitable
+---
+ auto/lib/openssl/conf | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
+index fdf430dff..c9fe4c8bf 100644
+--- a/auto/lib/openssl/conf
++++ b/auto/lib/openssl/conf
+@@ -63,8 +63,9 @@ else
+         ngx_feature_name="NGX_OPENSSL"
+         ngx_feature_run=no
+         ngx_feature_incs="#include <openssl/ssl.h>"
+-        ngx_feature_path=
+-        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL $NGX_LIBPTHREAD"
++        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
++			    sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
++        ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
+         ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
+         . auto/feature
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
