Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F61C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 16:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AB781312;
	Tue,  1 Apr 2025 16:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udGkg4t4BNuC; Tue,  1 Apr 2025 16:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4288580F5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4288580F5C;
	Tue,  1 Apr 2025 16:10:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C85217F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E35B60909
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvvDbjsViCJ9 for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 16:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5702260C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5702260C09
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5702260C09
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:10:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a823036so54439675e9.0
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 09:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743523800; x=1744128600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gvGxuzdYKPCb1F0ALpzPsoXPuhQQbQUt2bpfbvoWtew=;
 b=bo/l2gfMbMfWWhq58URpu/mlia0368NIwUVnCh+k5f0Kz4kUPlyqrD1+ehUbirgxVg
 15TfIUhP+Ti66rtqdWyfFHuC6VkDGz2goy0pJ4zy8MenfUTryMqp8v2sochH6c/27Sgu
 hIFX+1d1ecJYz9zuVVA4sNxsYKqGv6pInFIS+DZt8HB11pu8UIAFk5XB9hGB70EB1yiq
 tNUZKRL0uuV1dKEB0T20NeewoZNVskmct8zjOt4fSDsAJBn1pvA5JKJ4YRlPRDLA9JJL
 aUme6VzBWnXw8RkyUC8k5EM9Ri91dMYuNHf07qq82JfhrIJCCorF4yeb5h+4ipp6CCd7
 uLGA==
X-Gm-Message-State: AOJu0YxF837sQWfU5eQNKYiA+cOYBrDZXrygmXD36hBSHy+0plDmoguu
 c3SmB5ysVvf0DpMRK3eVG6z9wRh5HxFfR6XUy1Ch9uEtyTEyJTpqBh7nr/Ele7aRz7PtgKtfm/T
 P
X-Gm-Gg: ASbGncuy+W7uRJ+SJAda+ft6S6+9GlU7WQwPYrZo6m5v/FB5hQwkBxsBOxwJKbjvAiY
 6VDATsqVQu6ejrXYfZG+L3opzeHcIIhlKQT7oWsMYfcVBawQ/HaRzfdre15m1ZZZkmcaLPXwMtX
 +xgdwynV3hTFwjhVLu3P6zUUVRWWd7N18P1qYGlobtEEni4wQF8Oh+h6K+uGDZmjGWeJ2BJzY+Q
 lCA94iZu+d7qYC8p6+6m5OCvqgQuBw/NTfee6QVMYVw3JL/uQ2qqVbTuVPaLFUhbTsdwa6BTmhK
 dXJmHNHHT764RsiIvQgxFrbwuTqQr/Po8/0r90odMcs1X6r7vUgpA0L+iVpFG+XSbYuVn8YB9e6
 vyX/ELY1v5w==
X-Google-Smtp-Source: AGHT+IGt6MwzvU/ZlgyndpIUmaKBP1fLsecsjM9tNB7cspA3O01fs617I1xJ8P1CG9HUoWjNi0tlMg==
X-Received: by 2002:a05:600c:198f:b0:43c:fb8e:aec0 with SMTP id
 5b1f17b1804b1-43db61dffcamr96052425e9.1.1743523800124; 
 Tue, 01 Apr 2025 09:10:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000a09sm159019715e9.35.2025.04.01.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 09:09:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Tue,  1 Apr 2025 18:09:57 +0200
Message-ID: <20250401160957.4020794-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743523800; x=1744128600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gvGxuzdYKPCb1F0ALpzPsoXPuhQQbQUt2bpfbvoWtew=;
 b=nzw/7RKfiDBmYk9+MWoPU2cBFboecQBzdkrD/TZWMtxqgZyl7UKndPHYqVhbEFq6ji
 DyqSiSAmxuzRqkiYn0wqSr54L2XRdsFHDB09a4LvBEgpYbRqIEM5ENen4ous16Gz6KJ5
 zqbQqNRg8V6bK5k8l4jfho7xGU0Ig/JRmd6A0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nzw/7RKf
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: new package
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

It's a tool to access UFS (Universal Flash Storage) devices from user
space.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/ufs-utils/Config.in      | 11 +++++++++++
 package/ufs-utils/ufs-utils.hash |  3 +++
 package/ufs-utils/ufs-utils.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/ufs-utils/Config.in
 create mode 100644 package/ufs-utils/ufs-utils.hash
 create mode 100644 package/ufs-utils/ufs-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c974c..e4b8085ca634 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -805,6 +805,7 @@ F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/sscep/
 F:	package/tinyinit/
+F:	package/ufs-utils/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index 4b7e474cac68..eb22c81d1db7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,6 +249,7 @@ menu "Filesystem and flash utilities"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
 	source "package/udftools/Config.in"
+	source "package/ufs-utils/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
 	source "package/zerofree/Config.in"
diff --git a/package/ufs-utils/Config.in b/package/ufs-utils/Config.in
new file mode 100644
index 000000000000..438eeaf7a6fc
--- /dev/null
+++ b/package/ufs-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_UFS_UTILS
+	bool "ufs-utils"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	help
+	  UFS utils is a set of utilities for managing Universal
+	  Flash Storage (UFS) devices.
+
+	  https://github.com/SanDisk-Open-Source/ufs-utils.git
+
+comment "ufs-utils needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
new file mode 100644
index 000000000000..c6ef91a025b1
--- /dev/null
+++ b/package/ufs-utils/ufs-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  66259581b13e33edeccb08edd2389627121adf9b425ba4545f6a84d7292ef4fa  ufs-utils-4.13.5.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
new file mode 100644
index 000000000000..504f87f375d6
--- /dev/null
+++ b/package/ufs-utils/ufs-utils.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ufs-utils
+#
+################################################################################
+
+UFS_UTILS_VERSION = 4.13.5
+UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
+UFS_UTILS_LICENSE = GPL-2.0
+UFS_UTILS_LICENSE_FILES = COPYING
+
+define UFS_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define UFS_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/ufs-utils $(TARGET_DIR)/usr/bin/ufs-utils
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
