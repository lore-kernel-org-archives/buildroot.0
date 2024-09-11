Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A2EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AA240FDD;
	Wed, 11 Sep 2024 19:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoYVbgbPKsKZ; Wed, 11 Sep 2024 19:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22D8340FDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22D8340FDE;
	Wed, 11 Sep 2024 19:42:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6AAF1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C430380CBA
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itrpRaIth7jP for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF7F180CCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF7F180CCE
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BB0E86FB7; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:41:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9515c8b63bc9bc84b52b731c2c72031acd240d2
X-Git-Newrev: 6cda3504086e4c4b6acd24212e4d568684442243
X-Patchwork-Hint: ignore
Message-Id: <20240911194152.8BB0E86FB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: fix static build error
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cda3504086e4c4b6acd24212e4d568684442243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 761259c93400bc806611a242c7dc3df7ff67c231 the SSL patch was
removed, without testing any static compilation.
Reintroduce a small version of the original patch.

Upstream does not use pkg-config, so the patch is Buildroot specific and
not suitable for upstreaming.

Fixes:
 - http://autobuild.buildroot.net/results/a85/a85b00dfe9b55607390ebacc0e4e55c7cfbace3a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...0009-auto-lib-openssl-conf-use-pkg-config.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
