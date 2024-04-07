Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76346CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2904F60656;
	Sun,  7 Apr 2024 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRH8U2ybhA_1; Sun,  7 Apr 2024 14:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F7D9608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7D9608B0;
	Sun,  7 Apr 2024 14:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D734D1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0C9D40736
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HshgFCebK5QO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 823A34060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 823A34060C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 823A34060C
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:19:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343cfa6faf0so2492850f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712499562; x=1713104362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rnp/aE3YfLHLPQJi9+p83xKFSp7ZXqnGI2qlvGQhKc=;
 b=o3UwWP6jtnyQUg6zgn0pzROSUQGXXQERYLhdY4I9lAdUTwiCqiWsS+J9f9vtTaay2m
 oqedtkcT1yKQs6oOGOulx8lNSsscU/Q53kDQazXJVBSO1ZWN0K48QxTsnrCgHXUL3f7e
 mcbnoNqQefIlQfosa6zcUIAnlYDNdm9cQwxY9onQybzZhz2xkMDA7knYweebmXYz54DL
 RfJjg+YnD1Bcdd1QZPcUIw1xr+qpcFUEIm+g6I3Wco8dRQ6N0CXXvgqzbu1BPeNl4AJ2
 DTrRkrFuCeeOMN4Knhb7f8+vppPD34Hsx5aNl2gPty5nG1n32/+YIHiZJT5fMWzJI5jM
 lWjA==
X-Gm-Message-State: AOJu0YwvJbfpjCWWR7/QPHXd0zWc82OUrQQSkBeuqjTf/nwxQAbose44
 G2+zEppbzBOJ5oQ2QgPHo0HOx3oqmDaXol1HhF3yVe0oU9n/Y7ZjRjd0cp9l
X-Google-Smtp-Source: AGHT+IFOL7W1AUmWnUH/3tDQaEFiM30RudvUOIWn8k4Lh+ctCltHe15zgRoioDzV7WbAVC+LMwKBwg==
X-Received: by 2002:a5d:5047:0:b0:343:68c5:a07d with SMTP id
 h7-20020a5d5047000000b0034368c5a07dmr5679315wrt.61.1712499561646; 
 Sun, 07 Apr 2024 07:19:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d64cd000000b00343e97150d6sm6193338wri.32.2024.04.07.07.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:19:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:19:20 +0200
Message-ID: <20240407141920.1879500-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712499562; x=1713104362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rnp/aE3YfLHLPQJi9+p83xKFSp7ZXqnGI2qlvGQhKc=;
 b=UxAkHciPGDtsoVoZlfScC8jxQu+gYo5lYqPI0QoMr5WxZy6+u9Aq46d0QQqAI1DpcU
 GSWWO2+wdvc+Z7rD1XkE3RoI43UGvLMy23jEpjfwT06k2jdw130+Df9pFaRPRnXm4kf5
 O9x58AqAuBSUg5kmlastSEo9/avjqwI654ke7Pa7Gu2gN7XXFRk7MgYSuOcSoU/fnhH1
 GGYkcxKSVriQO/jKe2iQRsgqol8npNweBPlUjpRNuu5QKd4pHwNm8AVX5GTvSemKOzwA
 CAtoz/EmpE6M9bkY2wbiD7kiTTy5pxAt54nNDBmI4laCG9D71PX0exWO5n6cK5nZJ38t
 3Hlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UxAkHciP
Subject: [Buildroot] [PATCH 1/1] package/thttpd: add libxcrypt optional
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

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/12.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libhttpd.o: in function `auth_check2':
libhttpd.c:(.text+0x3d50): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/bfb8a115edf71b1852cc8585c00eb9f0e801a955

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thttpd/Config.in | 1 +
 package/thttpd/thttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
index 66537aa270..bd97bc7a75 100644
--- a/package/thttpd/Config.in
+++ b/package/thttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_THTTPD
 	bool "thttpd"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  thttpd is a simple, small, portable, fast, and secure HTTP
 	  server
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 3815705b58..d9cb5c9071 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -12,6 +12,10 @@ THTTPD_CPE_ID_VENDOR = acme
 
 THTTPD_MAKE = $(MAKE1)
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+THTTPD_DEPENDENCIES += libxcrypt
+endif
+
 define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
 	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
