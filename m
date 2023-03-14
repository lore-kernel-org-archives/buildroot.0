Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB772C74A5B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B535418F8;
	Tue, 14 Mar 2023 12:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B535418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncZdAhaUN2Fs; Tue, 14 Mar 2023 12:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC72D41912;
	Tue, 14 Mar 2023 12:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC72D41912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E41E51BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA156104C
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA156104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BWs0HBPe-aq for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48EAA61048
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48EAA61048
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:15:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso9963681wms.5
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 05:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzvWSh+LBMeRJZtzTfwL5kQ6rJdpTpvug1Uq48H8T1A=;
 b=1NRdgnbDCMkmcjukNotOgy2xvl2HHBWR9fwsSxWNFPD69CGrkpPo1mm/QhITlIqJT0
 LTjwiSsJ0PbdrSRRFr5c6XdluDG5puBqUAuugmbRPgbq97ClsXKTNS12kMfQnR3Whu/U
 /xpnYJKorRKfb5nCr9WZyeJNtClX3fazkJPveMCDVHzKKO4TVkb6NST7u4tOHeTUDzuc
 sB7KAN4IBJ0WnCBEY6CcjzPBpFRBEuinudkfYGmOJiJeHPg+7J2s0vKrgwu216u46Ajk
 tcMD0ksKoVQE/3l2xqsUQDUYxuPTgW1Sita/codlcs89hQs9WQtGvTxNweWm4vPcoitP
 V2hQ==
X-Gm-Message-State: AO0yUKVONVCnifp64B2tbzCaCJCNSv212Rv9xTIVkdo5hOJ5hfD1+EUW
 kowuLSGDPQ4fLM8D8shhOAMtLDuLtpxHVDEDAT4=
X-Google-Smtp-Source: AK7set8TKhdZdlYb1aIsbMyaGlfmuuehw0Lt3ESjAvVLVpVMKBbY/+nI6FAFrYFfQ94gtXmk+4lIwg==
X-Received: by 2002:a05:600c:a04:b0:3eb:2b69:c3c4 with SMTP id
 z4-20020a05600c0a0400b003eb2b69c3c4mr15275007wmp.36.1678796117099; 
 Tue, 14 Mar 2023 05:15:17 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:61ee:d4ee:9412:e29a])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6501000000b002c54241b4fesm2011504wru.80.2023.03.14.05.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:15:16 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 13:15:05 +0100
Message-Id: <20230314121507.2597723-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678796117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzvWSh+LBMeRJZtzTfwL5kQ6rJdpTpvug1Uq48H8T1A=;
 b=u/JMDJ+SLJTHHkXshYk1P00dYeEYh+xjyBtbSjtomG2/c/a/42S0W+uboCPhvV2I6z
 t860Bh5TRn5EGp1RRmNHe9cwuKuHuthtamNm1RIgTWLnmMCLzBk6d1PZdKzNZdNtufvv
 iIuNrU3NX8xw2mxkhvQoPATN9ZZcVr+vP7M3sHs7kkV8a9qUxCTCHzH/hC/qX7HV7Omt
 ZWlwEm5KYGneki/Z+x0Pn0eLd3SzparXjVlbsJ7bStV8ebtwsKWW2Db0dN8TTCeogLEP
 exyxMch/vv43PrtVXcz2c0ja72uGHi9EXJzWsATxU1Iud+Fu2v1/vtnv0hmVYIy7vcXk
 GpnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=u/JMDJ+S
Subject: [Buildroot] [PATCH 3/4] package/coreutils: rename package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, Julien Olivain <ju.o@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In preparation for the addition of a virtual package providing the
coreutils functionality, the package package/coreutils has been renamed
to package/coreutils.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                             |  2 +-
 package/busybox/busybox.mk                    |  2 +-
 package/e2fsprogs/Config.in                   |  4 +-
 package/glslsandbox-player/Config.in          |  2 +-
 .../{coreutils => gnu-coreutils}/Config.in    |  8 +-
 .../gnu-coreutils.hash}                       |  0
 .../gnu-coreutils.mk}                         | 84 +++++++++----------
 package/opkg-utils/Config.in                  |  2 +-
 8 files changed, 52 insertions(+), 52 deletions(-)
 rename package/{coreutils => gnu-coreutils}/Config.in (88%)
 rename package/{coreutils/coreutils.hash => gnu-coreutils/gnu-coreutils.hash} (100%)
 rename package/{coreutils/coreutils.mk => gnu-coreutils/gnu-coreutils.mk} (62%)

diff --git a/package/Config.in b/package/Config.in
index 79bbe0b44d..6a0c3fd049 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2634,7 +2634,6 @@ menu "System tools"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
-	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/crun/Config.in"
@@ -2655,6 +2654,7 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
+	source "package/gnu-coreutils/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d8000ddbb4..00c1e9695f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -27,7 +27,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BASH),bash) \
 	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
-	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
+	$(if $(BR2_PACKAGE_GNU_COREUTILS),gnu-coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
 	$(if $(BR2_PACKAGE_DCRON),dcron) \
 	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 23c4ef30b3..945e147769 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -34,14 +34,14 @@ config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 config BR2_PACKAGE_E2FSPROGS_E2SCRUB
 	bool "e2scrub"
 	depends on BR2_PACKAGE_BASH  # runtime
-	depends on BR2_PACKAGE_COREUTILS  # runtime
+	depends on BR2_PACKAGE_GNU_COREUTILS  # runtime
 	depends on BR2_PACKAGE_LVM2  # runtime
 	depends on BR2_PACKAGE_UTIL_LINUX  # runtime
 	help
 	  Check the contents of a mounted ext[234] filesystem
 
 comment "e2scrub needs bash, coreutils, lvm2, and util-linux"
-	depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_COREUTILS \
+	depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_GNU_COREUTILS \
 		|| !BR2_PACKAGE_LVM2 || !BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 530c158fc3..4bbec9b53a 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
-	select BR2_PACKAGE_COREUTILS # runtime (timeout)
+	select BR2_PACKAGE_GNU_COREUTILS # runtime (timeout)
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime
 	select BR2_PACKAGE_JPEG # runtime
diff --git a/package/coreutils/Config.in b/package/gnu-coreutils/Config.in
similarity index 88%
rename from package/coreutils/Config.in
rename to package/gnu-coreutils/Config.in
index 705013bae0..9a15c0ee8b 100644
--- a/package/coreutils/Config.in
+++ b/package/gnu-coreutils/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_COREUTILS
-	bool "coreutils"
+config BR2_PACKAGE_GNU_COREUTILS
+	bool "gnu-coreutils"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -15,9 +15,9 @@ config BR2_PACKAGE_COREUTILS
 
 	  http://www.gnu.org/software/coreutils/
 
-if BR2_PACKAGE_COREUTILS
+if BR2_PACKAGE_GNU_COREUTILS
 
-config BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
+config BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES
 	bool "Individual binaries"
 	depends on !BR2_STATIC_LIBS
 	help
diff --git a/package/coreutils/coreutils.hash b/package/gnu-coreutils/gnu-coreutils.hash
similarity index 100%
rename from package/coreutils/coreutils.hash
rename to package/gnu-coreutils/gnu-coreutils.hash
diff --git a/package/coreutils/coreutils.mk b/package/gnu-coreutils/gnu-coreutils.mk
similarity index 62%
rename from package/coreutils/coreutils.mk
rename to package/gnu-coreutils/gnu-coreutils.mk
index 931859b0ac..3373021cf5 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/gnu-coreutils/gnu-coreutils.mk
@@ -1,26 +1,26 @@
 ################################################################################
 #
-# coreutils
+# gnu-coreutils
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.1
-COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
-COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
-COREUTILS_LICENSE = GPL-3.0+
-COREUTILS_LICENSE_FILES = COPYING
-COREUTILS_CPE_ID_VENDOR = gnu
+GNU_COREUTILS_VERSION = 9.1
+GNU_COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
+GNU_COREUTILS_SOURCE = coreutils-$(GNU_COREUTILS_VERSION).tar.xz
+GNU_COREUTILS_LICENSE = GPL-3.0+
+GNU_COREUTILS_LICENSE_FILES = COPYING
+GNU_COREUTILS_CPE_ID_VENDOR = gnu
 
-COREUTILS_CONF_OPTS = --disable-rpath \
+GNU_COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
-ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
-COREUTILS_CONF_OPTS += --disable-single-binary
+ifeq ($(BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES),y)
+GNU_COREUTILS_CONF_OPTS += --disable-single-binary
 else
-COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+GNU_COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
 endif
 
-COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
+GNU_COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
 	ac_cv_func_euidaccess=no \
 	ac_cv_func_fstatat=yes \
@@ -58,51 +58,51 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	MAKEINFO=true \
 	INSTALL_PROGRAM=$(INSTALL)
 
-COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false \
+GNU_COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false \
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
 	vdir sleep stty sync touch true uname join
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-COREUTILS_DEPENDENCIES += acl
+GNU_COREUTILS_DEPENDENCIES += acl
 else
-COREUTILS_CONF_OPTS += --disable-acl
+GNU_COREUTILS_CONF_OPTS += --disable-acl
 endif
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
-COREUTILS_DEPENDENCIES += attr
+GNU_COREUTILS_DEPENDENCIES += attr
 else
-COREUTILS_CONF_OPTS += --disable-xattr
+GNU_COREUTILS_CONF_OPTS += --disable-xattr
 endif
 
-COREUTILS_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+GNU_COREUTILS_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
 # It otherwise fails to link properly, not mandatory though
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
+GNU_COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 endif
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-COREUTILS_DEPENDENCIES += gmp
+GNU_COREUTILS_DEPENDENCIES += gmp
 else
-COREUTILS_CONF_OPTS += --without-gmp
+GNU_COREUTILS_CONF_OPTS += --without-gmp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-COREUTILS_DEPENDENCIES += libcap
+GNU_COREUTILS_DEPENDENCIES += libcap
 else
-COREUTILS_CONF_OPTS += --disable-libcap
+GNU_COREUTILS_CONF_OPTS += --disable-libcap
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-COREUTILS_DEPENDENCIES += libselinux
-COREUTILS_CONF_OPTS += --with-selinux
+GNU_COREUTILS_DEPENDENCIES += libselinux
+GNU_COREUTILS_CONF_OPTS += --with-selinux
 else
-COREUTILS_CONF_OPTS += --without-selinux
+GNU_COREUTILS_CONF_OPTS += --without-selinux
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-COREUTILS_CONF_OPTS += --with-openssl=yes
-COREUTILS_DEPENDENCIES += openssl
+GNU_COREUTILS_CONF_OPTS += --with-openssl=yes
+GNU_COREUTILS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
@@ -110,53 +110,53 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),)
 # coreutils being built as multi-call binary, we do so by re-creating
 # the corresponding symlinks. If coreutils is built with individual
 # binaries, we actually move the binaries.
-ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
-define COREUTILS_FIX_BIN_LOCATION
-	$(foreach f,$(COREUTILS_BIN_PROGS), \
+ifeq ($(BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES),y)
+define GNU_COREUTILS_FIX_BIN_LOCATION
+	$(foreach f,$(GNU_COREUTILS_BIN_PROGS), \
 		mv $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin
 	)
 endef
 else
-define COREUTILS_FIX_BIN_LOCATION
+define GNU_COREUTILS_FIX_BIN_LOCATION
 	# some things go in /bin rather than /usr/bin
-	$(foreach f,$(COREUTILS_BIN_PROGS), \
+	$(foreach f,$(GNU_COREUTILS_BIN_PROGS), \
 		rm -f $(TARGET_DIR)/usr/bin/$(f) && \
 		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
 	)
 endef
 endif
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_BIN_LOCATION
+GNU_COREUTILS_POST_INSTALL_TARGET_HOOKS += GNU_COREUTILS_FIX_BIN_LOCATION
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
+GNU_COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
 
 # link for archaic shells
-define COREUTILS_CREATE_TEST_SYMLINK
+define GNU_COREUTILS_CREATE_TEST_SYMLINK
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 endef
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
+GNU_COREUTILS_POST_INSTALL_TARGET_HOOKS += GNU_COREUTILS_CREATE_TEST_SYMLINK
 
 # gnu thinks chroot is in bin, debian thinks it's in sbin
-ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
-define COREUTILS_FIX_CHROOT_LOCATION
+ifeq ($(BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES),y)
+define GNU_COREUTILS_FIX_CHROOT_LOCATION
 	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin
 endef
 else
-define COREUTILS_FIX_CHROOT_LOCATION
+define GNU_COREUTILS_FIX_CHROOT_LOCATION
 	rm -f $(TARGET_DIR)/usr/bin/chroot
 	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
 endif
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
+GNU_COREUTILS_POST_INSTALL_TARGET_HOOKS += GNU_COREUTILS_FIX_CHROOT_LOCATION
 
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
 # them does not gain much at build time, and is a loooong list that is
 # difficult to maintain... Just avoid overwriting fakedate when creating
 # a reproducible build
-HOST_COREUTILS_CONF_OPTS = \
+HOST_GNU_COREUTILS_CONF_OPTS = \
 	--disable-acl \
 	--disable-libcap \
 	--disable-rpath \
diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
index 2973055baf..c93afb32ed 100644
--- a/package/opkg-utils/Config.in
+++ b/package/opkg-utils/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_OPKG_UTILS
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_BINUTILS_TARGET if !BR2_PACKAGE_BUSYBOX # runtime
-	select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runtime
+	select BR2_PACKAGE_GNU_COREUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_DIFFUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_FINDUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_GREP if !BR2_PACKAGE_BUSYBOX # runtime
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
