Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E9ACD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE7941DE8;
	Thu,  4 Apr 2024 20:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymWW2oQvzOrp; Thu,  4 Apr 2024 20:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B0341E0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B0341E0E;
	Thu,  4 Apr 2024 20:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF0BE1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBA6835A3
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89sTG7lAaBJR for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 20:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A968483474
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A968483474
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A968483474
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 20:50:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343d6b55c42so325718f8f.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 13:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712263813; x=1712868613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DR0aw+kMC3jhu4U7pH64Mh7ELgriOIvgLq5bdN8HYUw=;
 b=jK6sNZIMkO72vBe5tEflX72J6P8gPxdxw2ONXvA8uKSz3ZL6OAggIIbYpdwp3ubbDK
 X5Q1zRkSEMZKlvnoEz+OPUXV+9TViuaVlmAByGTMqVkSZjsLWL96Mujo5+S2ta78AFXi
 l9fKkfUW/GnNbRw6vB0AIfe42LLHEOC1fd42NyMLAzWr9i0d43Bz3NKTUzU4oZ70ezjo
 7ZGPgApdEv6b6Hc92toJauLYiS/rehgwq7Jkn7hBTxAHFVeoRuMBcvtHOOiifRnOHRmG
 RI5U5QUqzrM/8ZJHwmo9LiPp9UdwhMIeiCtAerkBNYtiHLfZFmCv0dNC0nf8SpbUlClS
 40WQ==
X-Gm-Message-State: AOJu0YwEVGXY5KquznqfPQGUli6VRHiUpQUtMoKd3tcyPLrYBOQ5A5VB
 J379jlnQCz+B7pHyifrEJlMP8sqfLkQdjr2FVpqcYD8BtceaOIbLpms0gwyu
X-Google-Smtp-Source: AGHT+IHd19NIjrmAh63da9vMMqW5zUxiwLej/a1n6hCnWRL/+nVUYfnGXK7PGq4GhpZL+pgrEifhAg==
X-Received: by 2002:a05:6000:1104:b0:343:b9e4:8b48 with SMTP id
 z4-20020a056000110400b00343b9e48b48mr2453516wrw.10.1712263812708; 
 Thu, 04 Apr 2024 13:50:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d4ace000000b00341dbb4a3a7sm255178wrs.86.2024.04.04.13.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 13:50:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 22:50:04 +0200
Message-ID: <20240404205004.1797452-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712263813; x=1712868613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DR0aw+kMC3jhu4U7pH64Mh7ELgriOIvgLq5bdN8HYUw=;
 b=NF1jrb8UsdnK5Y8hZcGwrGi2OvHlLh99Bbp1dejo8HfYd5jMMRf/e/HOQeHgDg+c+u
 xymz8K7+5jVjRlHr4Q9s3Vpc3HeAAMuP4r58fJQRog/PgAyRHI1BMPLGa7GdlgZ5p5KH
 l/AUH7LS5tUTTvZo1M6JshXImiBfHaiqGySV9fPEQQ6jPjBsb8WZm+P8CNfXB2TOtdF0
 tfeNxWEQnzoHbM/Yla6KY23ZsMAA3Qvor0T3pMhw9k3fHIvMHdWfYuNk5b71nOs8dlHx
 rByIVGyaFe1cW8+P8vVXFECa0LybFn+zmbrz6yZtii06sudw/xKWnj8Uw2D1gR6HNVRR
 XDPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NF1jrb8U
Subject: [Buildroot] [PATCH 1/1] package/uhttpd: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: CMakeFiles/uhttpd.dir/main.c.o: in function `main':
/home/autobuild/autobuild/instance-4/output-1/build/uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c/main.c:437:(.text.startup+0x628): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/ccd789b301b6ddcca1b29e26d5cc48d54427a001

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uhttpd/Config.in | 1 +
 package/uhttpd/uhttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
index 8d5d8bee13..eeb169a96d 100644
--- a/package/uhttpd/Config.in
+++ b/package/uhttpd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_UHTTPD
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  uHTTPd is a tiny single threaded HTTP server with TLS, CGI
 	  and Lua support. It is intended as a drop-in replacement for
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index ba8e13ccb8..f4fcccfa67 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -11,6 +11,10 @@ UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
 UHTTPD_DEPENDENCIES = libubox json-c
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+UHTTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 UHTTPD_DEPENDENCIES += lua
 UHTTPD_CONF_OPTS += -DLUA_SUPPORT=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
