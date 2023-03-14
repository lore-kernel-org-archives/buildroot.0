Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71876C74A5B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24DC41901;
	Tue, 14 Mar 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24DC41901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8G8Rvsk6jej; Tue, 14 Mar 2023 12:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D10418F7;
	Tue, 14 Mar 2023 12:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2D10418F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 044211BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1C086104C
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C086104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPSlmqU9n2KD for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9F561048
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C9F561048
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:15:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v16so14190104wrn.0
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 05:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2vHrf2/HnzauuL+iOWBfLfngu2/tojNtL8gHpq93U8=;
 b=wBxJcsoSC2GlbStl4QNqja3ZFb+4BcMQUXYpb5qi42IJG9XA49OmPD8ypXQ3QKH2HB
 lE6ctULjQhxAx6SG6lILkeey7pBibTPPmnZ4ab95wMNlIs+NgpnBEY0sY4SAUKrugWMR
 Uby9+OQJoICBexWNSxhl52QfMqPROxEfpdewp6tFoHHlh1VJAwkGAnlFT76amKjcOvl7
 PPMGeATFlZ92hwr4aj6BKkHwJAMPOPoDVzGzgMNa0MW6bRXszV+NrZsY2QWd+eH5jNFO
 J8HaPVcS141qcjqrr4rsi+YJ31osBrCxS6R0lvbkmNJr0hg9zSYxcYYAuJINhD6eBRSU
 UEOQ==
X-Gm-Message-State: AO0yUKUGkKpQwWeYWI4aghLwVeIQIVqTHn6+9yttBg6d6c1fXEKFHmJ0
 ShpICjbWQIMpp1YARfteo3YaXK/GBiyisHvsyeQ=
X-Google-Smtp-Source: AK7set/we6k6sZGVj9IkR0tpn8vFGyLxo72HuRDB5QWoD7O7/0CLDN3K+jifoL7uXu0b8uP+XnbmpQ==
X-Received: by 2002:adf:f611:0:b0:2cf:ef5e:eae5 with SMTP id
 t17-20020adff611000000b002cfef5eeae5mr629462wrp.25.1678796114555; 
 Tue, 14 Mar 2023 05:15:14 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:61ee:d4ee:9412:e29a])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6501000000b002c54241b4fesm2011504wru.80.2023.03.14.05.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:15:14 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 13:15:03 +0100
Message-Id: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678796114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h2vHrf2/HnzauuL+iOWBfLfngu2/tojNtL8gHpq93U8=;
 b=AT/3aIlH47rzo1bu5W7g37J+L5yCMXSTwwfKoQMGtU6VhbGdTdGZwctKH7qOJmNmkB
 NtiqJcWi8kJc3An+7RhROEq6OxxiWkMlnnEwKIVBEkZLWlAwQTq0cAizDHupS/oJvQMf
 o4DPbf7P5C2FpHqn9tsF49JDCmGDjNXwtkRH4s3gyDcAeW353sVOxVGQBg7+kaSrYeyb
 ZoNYqa8bCVKc9bqEeV6bZwXZ79aTBtrGtSM0nixy2cWA5GOw1aHVIZPWDZS6RSHC6Eua
 6eFeZNEq151KhDMXfxyA0FtmPsZmnTDKpjx8kuAB8Fjt0zW5+apIMAMn3GiNhJDF/nX5
 Q6FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AT/3aIlH
Subject: [Buildroot] [PATCH 1/4] package/uutils-coreutils: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Weyer <sebatian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============8785521928974819816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8785521928974819816==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This package is an implementation of coreutils written completely in rust.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
The installation (creating the symlinks pointing to the main binary) is done
using the project's Makefile. A patch was added to remove the build dependency
of the install step in said Makefile. Since install is always called after
build, this avoids the install step rebuilding the application.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...ve-dependency-on-build-during-instal.patch | 29 +++++++++++++++++++
 package/uutils-coreutils/Config.in            |  9 ++++++
 .../uutils-coreutils/uutils-coreutils.hash    |  2 ++
 package/uutils-coreutils/uutils-coreutils.mk  | 23 +++++++++++++++
 6 files changed, 67 insertions(+)
 create mode 100644 package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
 create mode 100644 package/uutils-coreutils/Config.in
 create mode 100644 package/uutils-coreutils/uutils-coreutils.hash
 create mode 100644 package/uutils-coreutils/uutils-coreutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b49491da7a..14661f7944 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2580,6 +2580,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebatian.weyer@smile.fr>
+F:	package/uutils-coreutils
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..79bbe0b44d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2725,6 +2725,7 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/uutils-coreutils/Config.in"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
diff --git a/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
new file mode 100644
index 0000000000..0540d9becb
--- /dev/null
+++ b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
@@ -0,0 +1,29 @@
+From cbec6b8ee3c4418f8f04760678ec655f05e79220 Mon Sep 17 00:00:00 2001
+From: Sebastian Weyer <sebastian.weyer@smile.fr>
+Date: Fri, 10 Mar 2023 10:52:00 +0100
+Subject: [PATCH] GNUMakefile: remove dependency on build during install
+
+When we call install we already built the application so we don't want
+to have to rebuild
+
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ GNUmakefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index 81b90d32f..6b97a4879 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -334,7 +334,7 @@ clean:
+ distclean: clean
+ 	$(CARGO) clean $(CARGOFLAGS) && $(CARGO) update $(CARGOFLAGS)
+ 
+-install: build
++install:
+ 	mkdir -p $(INSTALLDIR_BIN)
+ ifeq (${MULTICALL}, y)
+ 	$(INSTALL) $(BUILDDIR)/coreutils $(INSTALLDIR_BIN)/$(PROG_PREFIX)coreutils
+-- 
+2.25.1
+
diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
new file mode 100644
index 0000000000..76ce5b174d
--- /dev/null
+++ b/package/uutils-coreutils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UUTILS_COREUTILS
+	bool "uutils-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  uutils is an attempt at writing universal (as in
+	  cross-platform) CLI utilities in Rust. While all programs have
+	  been implemented, some options might be missing or different
+	  behavior might be experienced.
diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
new file mode 100644
index 0000000000..b4855222fd
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.hash
@@ -0,0 +1,2 @@
+#Locally generated
+sha256  5bc773bcbc66851aa17979df44224c66c0b5323044c3c9cefb925b44ee9cd81b  uutils-coreutils-0.0.17.tar.gz
diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
new file mode 100644
index 0000000000..37a647a1f0
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# uutils-coreutils
+#
+################################################################################
+
+UUTILS_COREUTILS_VERSION = 0.0.17
+UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
+UUTILS_COREUTILS_LICENSE = MIT
+UUTILS_COREUTILS_LICENSE_FILES = LICENSE
+
+UUTILS_COREUTILS_BUILD_OPTS = PROFILE=release MULTICALL=y PREFIX=$(TARGET_DIR)
+UUTILS_COREUTILS_INSTALL_OPTS = $(UUTILS_COREUTILS_BUILD_OPTS) install
+
+define UUTILS_COREUTILS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(UUTILS_COREUTILS_BUILD_OPTS) -C $(@D)
+endef
+
+define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
+	$(TARGET_ENV) $(MAKE) $(UUTILS_COREUTILS_INSTALL_OPTS) -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1


--===============8785521928974819816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8785521928974819816==--
