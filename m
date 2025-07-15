Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD356C83F21
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 12:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5336540FB5;
	Tue, 15 Jul 2025 12:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1JwPQ1Vc0U3; Tue, 15 Jul 2025 12:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B9140FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B9140FAE;
	Tue, 15 Jul 2025 12:57:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5411311AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45FB940254
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxjtol4i0LTQ for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 12:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36B3B40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B3B40106
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B3B40106
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:57:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so1075914466b.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 05:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752584263; x=1753189063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvC5p4haSHPBMw4/16J0TESS5nkm5dix2psm4uRw93w=;
 b=DwQCXkxAeQIISmt2Q72fUoKcLlPszdcCQM/3Rxh1bPvHTARG7VTi+U/YkFyKQxnibW
 XFiUqAXRXUTKIMu/TEr3tGOU/OeSCkSwSvg9Cu+6xIu08VL1tLZkFOt1Beubg+rn71BT
 v2rIXE6pFfUjMGrPfgd//reHJbu9X+E+EXbAjnL9ydxjQfjAdxQgdh8WCKR2JL74kwsG
 0bdToRFv2xXqw7YYog70yBFaEz1xjeBwx+hJdmvyUc8jWN0l0oHZmukiS94m2eqAkSDK
 7V+ltUwTnTRr9ThRvPvgM31QHqzFnsQmG3bm+brhLCaLlt2sMz1ZidFsbmMtRMTk+GVt
 ckqg==
X-Gm-Message-State: AOJu0YyOIECN5jnHULjrW8r/rfPdunCUu1oxoT9jT+FiiJSo1v7/wNlz
 aq9bQHJQHdzh14AZK0BdiTjUgo4g2IZ6yeQfOJ+AYGm0yB/Gmt/wFYCbJlN95SU=
X-Gm-Gg: ASbGncubp8nWKtG3aZQs8tk3Bm9QycvaqkubXniH9UUlDHfl3DBa6IFZJ5Iz3/ZbG3+
 arJbj1xFKTndPtjVDGfxqYwPJBjIbcUoQ6RTLq4D8SvQWeBGpsvWk4YVXycA+RYo25+DrNyIWef
 1R3vHmi6Wg7BUQRXCO2Tby5jzIf9ApBA7NDRRoGpwFkxCZ14GK3QutWymQ8ykNiwLIz+fZtWIPp
 u/GaXZ/ubrrS023ewTXFy3ySZtKUEGq9YhJ1iDs83FIaqZYcr4Fbw9ChbbDs3TtmKOJM+GEaUGg
 +ZqzU+METsnOftHcBVBV6JcUvMsQMS2XyCQvlMqNgOVX2fmiurN66/8HxCCYBfz83B4OYDf6Tw2
 r5l1ZZUIOuXMGMfzLgXARmXte81vTO6OkpcBe
X-Google-Smtp-Source: AGHT+IHeRCvtxwsoTG11WTSvha5d+IPkLbyx01GZEOkGQYGcO1DDRNVHDgfBbaKmfIYztqDf3d3kYA==
X-Received: by 2002:a17:906:4fc5:b0:ae0:d332:f637 with SMTP id
 a640c23a62f3a-ae6fbfa7d6amr1885269966b.31.1752584262497; 
 Tue, 15 Jul 2025 05:57:42 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82ded59sm986945266b.169.2025.07.15.05.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:57:41 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 15 Jul 2025 14:57:37 +0200
Message-ID: <20250715125737.798491-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752584263; x=1753189063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OvC5p4haSHPBMw4/16J0TESS5nkm5dix2psm4uRw93w=;
 b=LWKSNlTLi27SLru+IB2kdLFAKFSyLC3FNYFBDawu1ZfrvmkYQX8pAN3iM+B1B0C/hS
 Xve3HsXQt77tzkGy6XamAfRKsfpyREIsmGJsN3rhIwC22dq++zODJ7doWOwb2yb4zKNw
 yKckqiv1YxbvxU/SrLULX6ievB7VYbpsvwYW/2Oe7Jk8vtC3vzKv8qqS7Z2rj/z/2+S5
 HUKRAp/dQvUK+AOHK6zgCGWa7YiWnH5GxBkU3FfStgpgxNmlfAUWi5jrpRKv1ca2Q+bw
 xla9IBiauoynHT6wfvWm4HPNOtgb4FI77+J8O6EoqRkajtKPB0x4vpTqHig3Y836IV39
 MNOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LWKSNlTL
Subject: [Buildroot] [1/1] package/nnn: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

nnn is a fast and minimal text-based file manager. It is written in C
and has minimal dependencies, which makes it portable and suitable for
embedded systems.

Project page: https://github.com/jarun/nnn
Wiki: https://en.wikipedia.org/wiki/Nnn_(file_manager)

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/Config.in     |  1 +
 package/nnn/Config.in |  9 +++++++++
 package/nnn/nnn.hash  |  3 +++
 package/nnn/nnn.mk    | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/nnn/Config.in
 create mode 100644 package/nnn/nnn.hash
 create mode 100644 package/nnn/nnn.mk

diff --git a/package/Config.in b/package/Config.in
index 9a841082c6..c21c5a6332 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2805,6 +2805,7 @@ comment "Utilities"
 	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
+	source "package/nnn/Config.in"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
diff --git a/package/nnn/Config.in b/package/nnn/Config.in
new file mode 100644
index 0000000000..9c9db748ea
--- /dev/null
+++ b/package/nnn/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NNN
+	bool "nnn"
+	depends on BR2_PACKAGE_READLINE && BR2_PACKAGE_NCURSES
+	help
+	  nnn is a lightweight yet powerful terminal file manager.
+	  It is written in C, has minimal dependency, and works
+	  out of the box.
+
+	  https://github.com/jarun/nnn
diff --git a/package/nnn/nnn.hash b/package/nnn/nnn.hash
new file mode 100644
index 0000000000..0b93ebbdcf
--- /dev/null
+++ b/package/nnn/nnn.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3  nnn-v5.1.tar.gz
+sha256  829f485dc4f2f51c2471b36a99e22f15ff214966e16b72cd79768b2338b4132b  LICENSE
diff --git a/package/nnn/nnn.mk b/package/nnn/nnn.mk
new file mode 100644
index 0000000000..019c098761
--- /dev/null
+++ b/package/nnn/nnn.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# nnn
+#
+################################################################################
+
+NNN_VERSION = v5.1
+NNN_LICENSE = BSD-2-Clause
+NNN_LICENSE_FILES = LICENSE
+NNN_SITE = $(call github,jarun,nnn,$(NNN_VERSION))
+NNN_DEPENDENCIES = readline ncurses
+NNN_INSTALL_STAGING = YES
+NNN_BIN = usr/bin/nnn
+
+define NNN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
+
+# Install the binaries, manuals, and other items described in the Makefile to the staging directory
+define NNN_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+# Put a stripped binary into the target directory
+define NNN_INSTALL_TARGET_CMDS
+	$(INSTALL) -Dm755 $(STAGING_DIR)/$(NNN_BIN) $(TARGET_DIR)/$(NNN_BIN)
+	$(TARGET_STRIP) $(TARGET_DIR)/$(NNN_BIN)
+endef
+
+$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
