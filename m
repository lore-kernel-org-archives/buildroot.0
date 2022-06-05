Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84291C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 15:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD4F60F71;
	Sun,  5 Jun 2022 15:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEmGgL_6bVtO; Sun,  5 Jun 2022 15:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290C660D93;
	Sun,  5 Jun 2022 15:12:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 908311BF34D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 15:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70FEE41815
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 15:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7CvXIJkM9pZ for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 15:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CA0C416A5
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 15:12:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso781108wms.2
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRfCYTI40gAzpMsvfqgszd4d52iHeTj9i6V5yp8rvmI=;
 b=S31Drr45M5sfm0ir1RgB5Ib3WbL3M3Gw27TgmLMholXPsU1LDQ2fZ0iXe8hvX5w8CO
 MTL7EJN2wJubo6Q/bPMm/nXUbNsJYOgOO/UfIEjFJvXs6W78UrKJJDnn6B0welUWlDdP
 2cKuzQee8/6cNkmQpiwB+g5/42OnBYfqAOnVUMdl/rhxdcb+WGfPbotOLwHBkGkBc011
 Vx/6rZhrrgBqSRogWpIYmFDkCz4/GHat4BVnPlCMKLSpRoyuQnW91gjdw7kB9l5ACiOA
 /4T43e+v5seTkcH4T4zj3yoMHLcFTzUF+DQKuS4NfH7xppEWnPhbzd5zN10/1Kt53q/b
 DUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRfCYTI40gAzpMsvfqgszd4d52iHeTj9i6V5yp8rvmI=;
 b=TzNOei2OD+BP07ziAfi4glGZIKXkqO7tSgSN4Vsw4AzbBGflKopQb3/+xg2ZU3LDF3
 2hDxRCVyvaSHSvLyJW+Lr0hivRWfQB5DFLv1J6XQLLjmScx+MUlHq/R0QO71bV+tqwgJ
 mUTpJ0KGAZ8TCBTVOx8jRvII2ktL/qWQaQHCgNRW7Mnc4SYpJC9zM9fiCgwFRXtY0GCZ
 gVZnuV1USiMcY6Olez7FxC9KfFUDP6cG++KkMHsuRnEQ6djUXyhr1FYEvc1o62ol7OTy
 gCWrlXef/8tIOIQVZ1jLFmOVlP9h+Z+jxk/YvESKpEazx/HWpWSv+2j8jzV6adZILlPL
 n6ow==
X-Gm-Message-State: AOAM533qWUjXUwDarYwo5ekuUvmHtJb4tSG6sXz51Pp8nieFAbKNnxyQ
 YPf2w9zIZFqUOl5ieLnIeHcS7sD3RXw=
X-Google-Smtp-Source: ABdhPJx/AcDGQc0nyoF/ORTxLQ45gj8diQgG6gvdsmo7waInNv9+5eiazkljhMDPB+nixsACTYw0Qw==
X-Received: by 2002:a05:600c:2d09:b0:39c:4ec6:f259 with SMTP id
 x9-20020a05600c2d0900b0039c4ec6f259mr1209101wmf.86.1654441942721; 
 Sun, 05 Jun 2022 08:12:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0039c4f0c827fsm614861wms.26.2022.06.05.08.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:12:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 17:08:07 +0200
Message-Id: <20220605150807.1668716-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nginx: zone modules need
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
