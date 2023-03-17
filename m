Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBE1C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 15:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 381CC61AC0;
	Fri, 17 Mar 2023 15:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 381CC61AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcGWMf4w9Fbl; Fri, 17 Mar 2023 15:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C54961AD2;
	Fri, 17 Mar 2023 15:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C54961AD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A111BF21A
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE6958218C
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE6958218C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWCzm_szKRvW for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 15:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 527DF82179
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 527DF82179
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 15:18:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so3572886wmb.3
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679066285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6V3RILmiz2dmX5dHD7CipWS4rVo3xjAH8Zf0RrMIgw=;
 b=u1Db2qH7TikP/D/x1m8fSKKWk5ZK5odgp0W3JgwPr2WkSz+gKXCNsGUieQKw+TY9WW
 o2TzLFJD5CpUGFahBS5n66OoVxXaADbgL3HYwyXT1MEamxfE/gBTlGWdR4AxYRQJuNRZ
 3OyGTekCaASvfZ5s9giiVdP2VYMFp4ug2aPWvnoNMq6XqVNPQ2gCntmzoLFaYzyZfw2v
 iuOH59UvPOUHfMIF+8hVmHjYAzfOKr0FnoqQ3r2GLje8GnMqkoSUNqsChQJQNOgL0pEX
 7LqtNC8ouQBDZoThc+KTyQDQyxtmvC1YswPIWHe2CGS3iNg5GLo8nLZU6Qawsj0payrD
 pUSw==
X-Gm-Message-State: AO0yUKUWyJBHbuQkzjZjbRgj5c7Tp7H68C+CTdRNDaqWiNF6LrA9hUN3
 Rho/psmDG1L4wSCoun1PAcPtZA5Z2P9+QsY+iLw=
X-Google-Smtp-Source: AK7set+wbUskCorrigxq6+zBcZl3y1UoauYHTABbRpDMvLuJMK5KulQr6NbiAEnpbwvc+wXCDgL+hg==
X-Received: by 2002:a05:600c:a05:b0:3eb:29fe:f922 with SMTP id
 z5-20020a05600c0a0500b003eb29fef922mr25537716wmp.29.1679066285069; 
 Fri, 17 Mar 2023 08:18:05 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:536:f783:8f4c:a6f1])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003e1202744f2sm8487612wmo.31.2023.03.17.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:18:04 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 16:18:00 +0100
Message-Id: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679066285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6V3RILmiz2dmX5dHD7CipWS4rVo3xjAH8Zf0RrMIgw=;
 b=6cjYYEBkc8g5mHNOmPVjO/lKkDGdYs/i6UYlmb/newyN61zexHxElLJwZM1PXrwnPE
 SLWZE4EoIEdjbiSp78CGM25KhfT6FJtS9MBjr2GgGS0bAq72dJAF5l+lgBZd+nxEwZOR
 X6bEu+FJqXor9AhAeyw5Y+GoxIDqErFlSReoybLqERsYFnjPs8U3tvHqo4z/yaWf8FHy
 YTUDxp1aBt1qoNrB1GTBW+LVhjaMLmIfraZ5yXIqSILhKjYBu3JekjGY5NjsZlFW7TnX
 OVLjz73bezwUqnXmEc5rgU+YpboPkbqiL8uoVPvcylHclM4VH/5d43ulaFXqu5eGHAU6
 SEhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6cjYYEBk
Subject: [Buildroot] [PATCH v3 1/2] package/uutils-coreutils: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============2404750087428262170=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2404750087428262170==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This package is an implementation of coreutils written completely in rust.

Using the gnu-coreutils-testsuite on this implementation of coreutils on
the target is sadly pretty difficult since it is very memory and
computation intensive.
In order to compare the two implementations I wrote a shell script that
just extracted the command line options of every command that is also
provided by the coreutils package.

These commands are the following: base64,
cat, chgrp, chmod, chown, cp, date, dd, df, dir, echo, false, join, kill,
link, ln, ls, mkdir, mknod, mktemp, mv, nice, printenv, pwd, rm, rmdir,
sleep, stty, sync, touch, true, uname, vdir

The changes I noticed were that the command "stty" is missing from this
implementation of coreutils. Furthermore I noticed the following
missing/changed arguments:

chmod   -> --silent becomes --quiet
cp      -> -Z option missing
date    -> --utc becomes --universal
dir     -> -D, --dired, --hyperlink missing
ln      -> -d, -F, --directory missing
ls      -> -D, --dired, --hyperlink, --indicator missing
mkdir   -> -Z, --context missing
mknod   -> -Z, --context missing
mv      -> -Z, --context missing
vdir    -> -D, --dired, --hyperlink, --indicator missing
uname   -> -i, --hardware-platform, -p, --processor missing

In this list I didn't include arguments that were newly added since they
wouldn't introduce breaking. I can not make any claim about the exact
behaviour of each of the commands with their respective arguments. The
maintainers of the project provide a page in their documentation,
detailling the compatibility with the gnu-coreutils-testsuite:
https://uutils.github.io/user/test_coverage.html

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
The installation (creating the symlinks pointing to the main binary) is done
using the project's Makefile. A patch was added to remove the build dependency
of the install step in said Makefile. Since install is always called after
build, this avoids the install step rebuilding the application.

The optional dependency in package/busybox/busybox.mk is necessary so that
when uutils-coreutils is selected, it will be built before busybox. Then
busybox will see the symlinks that are already placed in target/bin and will
not recreate them (noclobber).

v2:
- created dependency between coreutils and uutils-coreutils so one can't
- be activated at the same time as the other
- Fixed my name
- Added a patch that removes the generation of autocompletions for some
  shells
- using cargo infrastructure for building now. Installing is still done
  using the project's Makefile
- implemented release and debug profiles depending on what is chosen for
  BR2_DEBUG_ENABLE

v3:
Added comment explaining UUTILS_COREUTILS_INSTALL_TARGET_CMDS step and
fixed PROFILE variable in UUTILS_COREUTILS_MAKE_OPTS

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/busybox/busybox.mk                    |  1 +
 package/coreutils/Config.in                   |  1 +
 ...ve-dependency-on-build-during-instal.patch | 30 ++++++++++++++++
 package/uutils-coreutils/Config.in            | 12 +++++++
 .../uutils-coreutils/uutils-coreutils.hash    |  3 ++
 package/uutils-coreutils/uutils-coreutils.mk  | 35 +++++++++++++++++++
 8 files changed, 86 insertions(+)
 create mode 100644 package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
 create mode 100644 package/uutils-coreutils/Config.in
 create mode 100644 package/uutils-coreutils/uutils-coreutils.hash
 create mode 100644 package/uutils-coreutils/uutils-coreutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..2d23667953 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2583,6 +2583,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
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
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1633ca525d..d8000ddbb4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_UUTILS_COREUTILS),uutils-coreutils) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 705013bae0..9c1af1dc25 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_COREUTILS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_PACKAGE_UUTILS_COREUTILS
 	help
 	  All of the basic file/text/shell utilities. These are the
 	  core utilities which are expected to exist on every system.
diff --git a/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
new file mode 100644
index 0000000000..a2e4a17ac0
--- /dev/null
+++ b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
@@ -0,0 +1,30 @@
+From ed387083221501aaf5d8752aab83669174e0bb43 Mon Sep 17 00:00:00 2001
+From: Sebastian Weyer <sebastian.weyer@smile.fr>
+Date: Thu, 16 Mar 2023 15:57:13 +0100
+Subject: [PATCH] GNUMakefile: remove dependency on build during install
+
+When building using buildroot, we only call install after having built
+already, therefore we don't want to have to rebuild.
+
+Upstream status: not applicable; Buildroot specific
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ GNUmakefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index b242bc8ce..faecf420b 100644
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
index 0000000000..97ddd4b096
--- /dev/null
+++ b/package/uutils-coreutils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_UUTILS_COREUTILS
+	bool "uutils-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  uutils is an attempt at writing universal (as in
+	  cross-platform) CLI utilities in Rust. While all programs have
+	  been implemented, some options might be missing or different
+	  behavior might be experienced.
+
+	  https://github.com/uutils/coreutils
diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
new file mode 100644
index 0000000000..ca90a0c9f2
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  5bc773bcbc66851aa17979df44224c66c0b5323044c3c9cefb925b44ee9cd81b  uutils-coreutils-0.0.17.tar.gz
+sha256  a836eb3360d0e80f6a1620495543ad2a4e20e4cf72af89ff528fccf9e63be81e  LICENSE
diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
new file mode 100644
index 0000000000..a0ea06ff5f
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.mk
@@ -0,0 +1,35 @@
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
+ifneq ($(BR2_ENABLE_DEBUG),y)
+UUTILS_COREUTILS_PROFILE = release
+else
+UUTILS_COREUTILS_PROFILE = debug
+endif
+
+UUTILS_COREUTILS_MAKE_OPTS = \
+	PROFILE=$(UUTILS_COREUTILS_PROFILE) \
+	MULTICALL=y
+
+UUTILS_COREUTILS_CARGO_BUILD_OPTS = --features unix
+
+#We are using the project's Makefile to install the application
+#If we were to use the cargo infrastructure, we can only copy the multicall
+#binary into the target folder. The call to the target's Makefile will do that
+#and also automatically create the required symlinks
+define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D) \
+		BUILDDIR=$(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE) \
+		PREFIX=$(TARGET_DIR) install
+endef
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============2404750087428262170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2404750087428262170==--
