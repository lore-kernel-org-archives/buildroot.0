Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4E8C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E804B415DE;
	Mon,  6 Jun 2022 09:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WGskK4BkDw5; Mon,  6 Jun 2022 09:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3434154A;
	Mon,  6 Jun 2022 09:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 899E51BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77DDA840CD
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGw_dKzgZe8w for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:48:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD11D84081
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:48:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C803986C86; Mon,  6 Jun 2022 09:36:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:47:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c05de430eaff1d2839e15465ba821eea968a858
X-Git-Newrev: fb3fbb261b809cf8ce2d9b16984f0dffbc0c1147
X-Patchwork-Hint: ignore
Message-Id: <20220606093641.C803986C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: zone modules need
 libatomic_ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb3fbb261b809cf8ce2d9b16984f0dffbc0c1147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ngx_{http,stream}_upstream_zone_module need libatomic_ops since their
addition in commit 621ec32677082d901806338e6f50f03349dceb76 and
https://github.com/nginx/nginx/commit/cf31347ee84fdaa02f768e641d1a2f1352b6a56a
https://github.com/nginx/nginx/commit/79a03b3ff6d950e60a06c6d979bd7a909709e82d:

src/core/ngx_rwlock.c:125:2: error: #error ngx_atomic_cmp_set() is not defined!
  125 | #error ngx_atomic_cmp_set() is not defined!
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f7f6be00029d430dc575bc5b3e3e2031cea0460c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/Config.in | 10 ++++++++++
 package/nginx/nginx.mk  |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 1200b2bf4c..90a0822298 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -296,6 +296,14 @@ config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_RANDOM_MODULE
 	help
 	  Enable ngx_http_upstream_random_module
 
+config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_ZONE_MODULE
+	bool "ngx_http_upstream_zone_module"
+	default y
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  Enable ngx_http_upstream_zone_module
+
 endif #BR2_PACKAGE_NGINX_HTTP
 
 config BR2_PACKAGE_NGINX_MAIL
@@ -419,6 +427,8 @@ config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_RANDOM_MODULE
 config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE
 	bool "ngx_stream_upstream_zone_module"
 	default y
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Enable ngx_stream_upstream_zone_module
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 31b6e276b7..cff741ee35 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -203,7 +203,8 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_IP_HASH_MODULE),,--without-http_upstream_ip_hash_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_LEAST_CONN_MODULE),,--without-http_upstream_least_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_RANDOM_MODULE),,--without-http_upstream_random_module) \
-	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE),,--without-http_upstream_keepalive_module)
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE),,--without-http_upstream_keepalive_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_ZONE_MODULE),,--without-http_upstream_zone_module)
 
 else # !BR2_PACKAGE_NGINX_HTTP
 NGINX_CONF_OPTS += --without-http
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
