Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B83C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9653781ED3;
	Sun,  1 Jun 2025 08:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZCnbpnwPgN5; Sun,  1 Jun 2025 08:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E12681EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E12681EAE;
	Sun,  1 Jun 2025 08:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72AEA127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D1160A58
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXY9K1ucfZqm for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EA9C60A5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA9C60A5A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EA9C60A5A
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:02:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-604bde84d0fso5091593a12.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748764943; x=1749369743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nyu1Lpv0AAkYOtAii0kcKqiVgk3iD9kvA+6ZjAW0Ltc=;
 b=qCLSM9xh62RppKq9R/D6sCcpjWwrmEo1K0XGO9tC4JyTddIYy/8xB6DrevmexBV6es
 QE4wksOHqAhP4Noc5AAZSIfT2CwE0wmxJDy70LjeSUhi3HhISgJZTcPPkV80JyT0nv16
 xfYYQHoqQHDdyYFwyDo6bYw6obJ7yGbMhsChGzmVrcfCW+GJpDuvqUUq1bm6gWfC7uGn
 qPaqm0lz74BriCsZulq1zrGpvauDUZH3lptHJ32GvBY22HR9tb4pzHSMDyrf3meMgVzh
 NJZg5I0TpAcVw9kixjUf+iQiNtDPnFTifaHeVcP/lD7AQvab7/zYSH/3Mbmj4B2B6Smm
 7Csg==
X-Gm-Message-State: AOJu0YwCiAkOW4TcFqz9DZpExxIUmyd09ymaclwTeEDPEKs8OuS7IpAK
 STdXGL0oDN86ypf2ukhSti1sYQUh5bIKTfWFYPuOCqlyWQNHjxKW1bdJjXhD0W15n1y8WOQmk4i
 9n+Mh
X-Gm-Gg: ASbGncvZgniTcoiqLrQGHb5DV29Tsx7NYzvxkSnvcnmNQDUI/bJeM4oTtjNKAYHXqRL
 ZIhYZdveszQHqrOVvFckhmLuXbUHQYJ3rezQGHpxZuvPKA1+P3GA0VnaF6qRn9X3RDpIm8s1/SI
 HgxwnIMnwOLb8dqjsPVKhP2xMC6Ukj99JAtDCdX1jOmNwT/JpTugdRaLYQfFyEfz9HuWM9MwJUT
 h97bUoCWpQ7xhj9L0mUmxXb5b91VQh2OP8Gt5ECic/caQaJOrFzYwKd9N6bXpkJPR+a6S65N5Od
 VCRLGmGWuDta7u6/FJ/bJDFzkR7lPaQkUao1KEw/Xt7qf7F/OS1PDHlEMYjBb0JG2dW88lenmsR
 bDckHBkUE5SLQ8FYIbQ6K1mcQxBONuveozrnmtGKzHD0QtxhPNprLLDc+CrSRPHGwCVskKtY4/2
 6MOi78Yi+87mR+
X-Google-Smtp-Source: AGHT+IHrkIGGbJwbepgXdg3Pca31u0Lh1gl9bsQUcATDlOb01LYrH0X5ullexoxxw+VBbil++GIqrg==
X-Received: by 2002:a17:907:9691:b0:ad9:db54:ba40 with SMTP id
 a640c23a62f3a-adb322a3634mr910151566b.32.1748764942491; 
 Sun, 01 Jun 2025 01:02:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2bf051sm610866766b.122.2025.06.01.01.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:02:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sun,  1 Jun 2025 10:02:16 +0200
Message-ID: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1748764943; x=1749369743;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nyu1Lpv0AAkYOtAii0kcKqiVgk3iD9kvA+6ZjAW0Ltc=;
 b=S6LTVDyfJqx+OBbG2QMHuIKlBYeWoDhMhmUx7rcGwO3miqWSEkpAWgCZngu32RM4KD
 Klz7fv5TaK7QYEnoTFabm0Peq/iwB61TBwhjS7/QHAQoJNjmjHCtv2mCBTJykjnVsTIp
 2lupsLK3QofLRO7Ot9jhAd90H3oOuCRLp5rUw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=S6LTVDyf
Subject: [Buildroot] [PATCH v2 1/2] package/pocketpy: new package
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

It is a portable Python 3.x interpreter, written in C11. It has no
dependencies other than the C standard library, which can be easily
integrated into your C/C++ project

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - mv staging commands under POCKETPY_INSTALL_STAGING_CMDS hook.

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pocketpy/Config.in     |  8 ++++++++
 package/pocketpy/pocketpy.hash |  3 +++
 package/pocketpy/pocketpy.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/pocketpy/Config.in
 create mode 100644 package/pocketpy/pocketpy.hash
 create mode 100644 package/pocketpy/pocketpy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d471b9ab6f90..771c5cf31322 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/ufs-utils/
diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87d5..9aad65488a6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -968,6 +968,7 @@ if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
+	source "package/pocketpy/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
diff --git a/package/pocketpy/Config.in b/package/pocketpy/Config.in
new file mode 100644
index 000000000000..70ebf79ba1f3
--- /dev/null
+++ b/package/pocketpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_POCKETPY
+	bool "pocketpy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  pocketpy is a portable Python 3.x interpreter,
+	  written in C11.
+
+	  https://github.com/pocketpy/pocketpy
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
new file mode 100644
index 000000000000..aabd5f077a2b
--- /dev/null
+++ b/package/pocketpy/pocketpy.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
+sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
new file mode 100644
index 000000000000..20a8e9ad1e20
--- /dev/null
+++ b/package/pocketpy/pocketpy.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# pocketpy
+#
+################################################################################
+
+POCKETPY_VERSION = 2.0.8
+POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
+POCKETPY_LICENSE = MIT
+POCKETPY_LICENSE_FILES = LICENSE
+POCKETPY_INSTALL_STAGING = YES
+
+POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
+
+define POCKETPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
+endef
+
+define POCKETPY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/pocketpy
+	cp -r $(@D)/include/* $(STAGING_DIR)/usr/include/pocketpy
+endef
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
