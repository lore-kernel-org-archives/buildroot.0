Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F7C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 030C7607DA;
	Mon, 19 Aug 2024 08:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVuTGDY5JBBJ; Mon, 19 Aug 2024 08:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EFD607DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EFD607DC;
	Mon, 19 Aug 2024 08:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFF241BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD7AF4029C
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OepPoYkTkzbO for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E1FC4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1FC4020C
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E1FC4020C
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:07:46 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-70943713472so1735365a34.2
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724054865; x=1724659665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dv09AjrkIujtAjJCA+AmoIGxi6i0bbdSSa/GvxgiXjM=;
 b=dZjbXagGhRf7rias13qA8xvLlJvF/ZL7SwFbPlCs+4nFTgQyZYQLNvWmN0cN+IZLwG
 pM1OgTN3Y2bTArDpxNojEO0B0ZQUncULuWO6aURZCpK9UyIyylZ/Xe+T0rpE7NxUM4BW
 d4RkO+xYoYK30HaF/k9bE/7HbMn99NxsM0jYKyrQdOug1zBcb8A8tgEVaxKus4R2Kkps
 jNXktXCyJRMAghqjuZHd8AwifKYmC5D1l8dXa3hKnVZ1BADxab6CY/J0WCduZFZKxWF9
 WRqmf5rjFBtiRQL1KD7pOAEHHBnrJEpvgspiI+Dj9c4OdQLuU+CSMMZ99VNbuEhjjWck
 QJtg==
X-Gm-Message-State: AOJu0YzNgjPUpk78b86PJDlh7p0THnI1RjKBt20AB5yQwBFxsfikWwK7
 LslOQfhjMfSiQbtNGoY9z0t/bMdZNHlB8rYTLr+wldPr5ecMM5aYbGG7s80c
X-Google-Smtp-Source: AGHT+IFeC4fHwqGltlU8GW2tdHDvzw+o+++VLA9+Q+aTmvS2blnlGhoa23RNS+B6yX1McoQx/5K/GQ==
X-Received: by 2002:a05:6830:4125:b0:703:7a17:f24a with SMTP id
 46e09a7af769-70cac7de927mr13154951a34.0.1724054865174; 
 Mon, 19 Aug 2024 01:07:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70ca6629868sm2097533a34.65.2024.08.19.01.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 01:07:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 02:07:39 -0600
Message-Id: <20240819080739.147305-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724054865; x=1724659665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dv09AjrkIujtAjJCA+AmoIGxi6i0bbdSSa/GvxgiXjM=;
 b=mgDFlYfuKoLUofJKnnkOu1oGSh1R9a2Sg+BHr4ustqjyI5Z6Y2k1yOY1soAEJH1N+e
 LTCmMTzPmKmLmD1e2FbMtXDsgQUDXL46AJIojpMUm9biTfi1ZPcvsHF+EJL1BYnrfyMS
 bPiOPOHvDwrYCUAl+azPTcpr5zspH9BczN3ayEjp7nAsQIpij3KzDaQ9FouJP7OTNE3E
 4OotKN1dLFfSBRYOMM0lP9hsDFemHIlaFzzE+/Zkbvp3hewraGYUSC79giiYXGeRKlBb
 6sVdXAFOSGxHrtCLsoqOeaEtwoRKQ8ik11mkmllHUeHH/2kWtBbg6tpaXNfSTV6sVc7+
 fkVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mgDFlYfu
Subject: [Buildroot] [PATCH 1/1] package/superiotool: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/superiotool/Config.in        |  8 +++++++
 package/superiotool/superiotool.hash |  3 +++
 package/superiotool/superiotool.mk   | 36 ++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/superiotool/Config.in
 create mode 100644 package/superiotool/superiotool.hash
 create mode 100644 package/superiotool/superiotool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..84a4aab4f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1503,6 +1503,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/superiotool/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..b284889c63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -632,6 +632,7 @@ endmenu
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali-utgard/Config.in"
 	source "package/sunxi-mali-utgard-driver/Config.in"
+	source "package/superiotool/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/superiotool/Config.in b/package/superiotool/Config.in
new file mode 100644
index 0000000000..e27ac99bf0
--- /dev/null
+++ b/package/superiotool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SUPERIOTOOL
+	bool "superiotool"
+	depends on BR2_x86_64 || BR2_i386
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  Super I/O detection tool.
+
+	  https://www.coreboot.org/Superiotool
diff --git a/package/superiotool/superiotool.hash b/package/superiotool/superiotool.hash
new file mode 100644
index 0000000000..985e54b2a2
--- /dev/null
+++ b/package/superiotool/superiotool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e22afdbac40068ba687fd975f03f6b958599a32e70f539d9d0c74d16a63d7cea  coreboot-24.05.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  util/superiotool/COPYING
diff --git a/package/superiotool/superiotool.mk b/package/superiotool/superiotool.mk
new file mode 100644
index 0000000000..a73be1d6e7
--- /dev/null
+++ b/package/superiotool/superiotool.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# superiotool
+#
+################################################################################
+
+SUPERIOTOOL_VERSION = 24.05
+SUPERIOTOOL_SOURCE = coreboot-$(SUPERIOTOOL_VERSION).tar.xz
+SUPERIOTOOL_SITE = https://coreboot.org/releases
+SUPERIOTOOL_SUBDIR = util/superiotool
+SUPERIOTOOL_LICENSE = GPL-2.0+
+SUPERIOTOOL_LICENSE_FILES = util/superiotool/COPYING
+SUPERIOTOOL_DEPENDENCIES = pciutils
+
+SUPERIOTOOL_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-I$(@D)/src/commonlib/bsd/include \
+	-DPCI_SUPPORT \
+	-DSUPERIOTOOL_VERSION=\\\"$(SUPERIOTOOL_VERSION)\\\"
+
+SUPERIOTOOL_CONFIGURE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(SUPERIOTOOL_CFLAGS)"
+
+define SUPERIOTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
+		-C $(@D)/$(SUPERIOTOOL_SUBDIR) superiotool
+endef
+
+define SUPERIOTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
+		-C $(@D)/$(SUPERIOTOOL_SUBDIR) install \
+		PREFIX=/usr DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
