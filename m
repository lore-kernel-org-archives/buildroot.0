Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12549CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A9B81366;
	Fri, 29 Aug 2025 14:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtxCNSYp2lca; Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3951812D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3951812D1;
	Fri, 29 Aug 2025 14:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4409B69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2818480C76
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWc94NAFoaAB for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 180A8844BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180A8844BE
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 180A8844BE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3ceb830dd58so831987f8f.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756478058; x=1757082858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwhaWb+iokEeDGn93sTe2TGbHvX4sV3cJDN4gbarzc4=;
 b=sgs2FtCsAbXe0/2XbPpNud+o160rKYRM5Tw4CVOQXcAjOvcddxdICPKeBSwMGgxXps
 YyZqFf3qk8OcDJKpryGwuWC/ebb0vwsAqpGHr44eH5zR/uSas6VbPVMhGielsaKsNLqt
 WzUeQhcDlw+s8Uh+D1IwVQyXuT4w9dLuMM4X6w8m/CM9DgVc3VyeKAzEZkMcY+27dhJq
 h+tWPilk35Y0WkH4yMLRl0wGOrHCINWmBPZjC8iAvEWmXxGP/L37yIFsk9+hQ4dpjkRC
 d/So02Qqf9aybUeWNr+hlvNEmbOzIif2yCYSigXwM1xp+yHxpCW+ucpo3ESiLiQ76okz
 /xnQ==
X-Gm-Message-State: AOJu0Yz5ral05JHY/jm4VhGvRFfLkHJDgGOYRWPCMm3ki4e2LN5KDGhq
 +ofcc9kkqqaXdmPuChyMmGvHUUGuUsHQ/iVadt+kmr+waFoONpkZX0j86FpQsgoVk0J3LAY/Qpr
 wMw9jR6qEEIWubZI=
X-Gm-Gg: ASbGnctmrF+WEvjhCiTiyis80pXoyI8GBUoCQeOGwuW8XdHdoxyFGX0wEhGEp35qYsN
 t8T36mTp/5KoZlPciVGEYx4mgjyL8UEn3HsZ8qxtJnlP5ZVIktvPmKp5w6/0qsEC8SM2I76vZCQ
 qaiBvTVQ/SoL53Rov+WFVaJkmreof4PN1IqJ/I7IRHxW+V/5AsShu8PeaPVbMwGAtH3+HN6+w1i
 +z/1dJ6qHKnaSvMqE5g6CDfzNfOgIR4GYlmScAEpykkbnvtUxoKMjjDlE5KfyShw6/I86m+h6xH
 oSFHy+vf8Qo9J4pTCY5q13v+6Qp4HCgdcFASnVH2DdhGyplm5SfPRJI9oZHojvJnTlTU33gdc+4
 /J0rhuQ1c4zCDHN2+jZTozFgrzeTj7pw+4Nn5GGHMSf1+IeHU0ZA60mSDaGi0Hic1OX73+2tf5o
 C7xAh32g==
X-Google-Smtp-Source: AGHT+IGIHTfMaHtI+YiLmzv+kjtzUKBVOIVYjON+27CISI9AoZHhv1c2Ss3ibDAiV8zUqoydPRPIBw==
X-Received: by 2002:a05:6000:2408:b0:3d1:2828:c2f0 with SMTP id
 ffacd0b85a97d-3d12828c99cmr1219029f8f.6.1756478057550; 
 Fri, 29 Aug 2025 07:34:17 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34493bbbsm3598105f8f.60.2025.08.29.07.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 07:34:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Fri, 29 Aug 2025 16:33:58 +0200
Message-ID: <20250829143358.151035-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756478058; x=1757082858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fwhaWb+iokEeDGn93sTe2TGbHvX4sV3cJDN4gbarzc4=;
 b=iWioMP3sIYa66s88I11tRs9db3ZQ2uq1aZVnibHfOyzZhrt+JGE7NDzzh5bSDcR/ww
 LMyYpFdmC7AG5T9V79O/dGdi/hoRf4XCKSEkG1cLVDxql2JB8ywe8Or+Ee8E1mc8+rBJ
 fqZoKLJnjvKO/TDNyFYrog+5e3U2jKTspLPR66N2p4LxaShl8YQd/PlnZ/NCtWmMmhy3
 NAtYKr1Xaw1L/jSkqK35q+HhX55y4Hnni03H4YuUtAFUxES8QOQVtcl1/QgHsEJkendD
 okp8M4/qTqyke5ukveIcAuVJdi7osvSC7kw9AmJK6j5kahRZ1jaxHGwAgte6mQf5536m
 /Yhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iWioMP3s
Subject: [Buildroot] [PATCH] package/aufs{-util}: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove support for aufs, as it is outdated and unmaintained in Buildroot.
Users are encouraged to use overlayfs in place of aufs.

This patch removes support for aufs package providing sources for
the kernel extension, the related Buildroot kernel extension configuration,
as well as the userspace utilities.

This also allows to remove some special cases in configuration utilities.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                           |  3 -
 Config.in.legacy                              | 12 ++++
 linux/Config.ext.in                           | 62 -------------------
 linux/linux-ext-aufs.mk                       | 21 -------
 package/Config.in                             |  2 -
 .../aufs-util/0001-remove-user-settings.patch | 16 -----
 package/aufs-util/0002-no-check-ver.patch     | 24 -------
 package/aufs-util/0003-no-strip-lib.patch     | 18 ------
 package/aufs-util/Config.in                   | 36 -----------
 package/aufs-util/aufs-util.mk                | 59 ------------------
 package/aufs/Config.in                        | 16 -----
 package/aufs/aufs.mk                          | 24 -------
 utils/checkpackagelib/test_lib_mk.py          |  3 -
 utils/genrandconfig                           |  8 ---
 14 files changed, 12 insertions(+), 292 deletions(-)
 delete mode 100644 linux/linux-ext-aufs.mk
 delete mode 100644 package/aufs-util/0001-remove-user-settings.patch
 delete mode 100644 package/aufs-util/0002-no-check-ver.patch
 delete mode 100644 package/aufs-util/0003-no-strip-lib.patch
 delete mode 100644 package/aufs-util/Config.in
 delete mode 100644 package/aufs-util/aufs-util.mk
 delete mode 100644 package/aufs/Config.in
 delete mode 100644 package/aufs/aufs.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 31ca7cdcc1..4f3aa98d76 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -237,9 +237,6 @@ package/asterisk/0004-install-samples-need-the-data-files.patch lib_patch.Upstre
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_patch.Upstream
 package/at/S99at lib_sysv.Indent lib_sysv.Variables
 package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
-package/aufs-util/0001-remove-user-settings.patch lib_patch.Upstream
-package/aufs-util/0002-no-check-ver.patch lib_patch.Upstream
-package/aufs-util/0003-no-strip-lib.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
 package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index f761c9063a..7c2dbbbfc6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_LINUX_KERNEL_EXT_AUFS
+	bool "Aufs Filesystem Module patch is deprecated"
+	select BR2_LEGACY
+	help
+	  aufs is no longer maintained in Buildroot
+
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util is deprecated"
+	select BR2_LEGACY
+	help
+	  aufs is no longer maintained in Buildroot
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd has been removed"
 	select BR2_LEGACY
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..c724854a90 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -86,68 +86,6 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
 
 	  https://github.com/notro/fbtft
 
-# aufs-standalone
-config BR2_LINUX_KERNEL_EXT_AUFS
-	bool "Aufs Filesystem Module patch"
-	select BR2_PACKAGE_AUFS
-	help
-	  Aufs is split in two parts: a kernel part and a userspace
-	  part. Enabling this option automatically selects the aufs
-	  standalone (module) package and patches the Linux kernel
-	  built by Buildroot with the aufs kernel part (ie fs/aufs).
-
-	  It is important to use the correct branch of aufs-standalone.
-
-if BR2_LINUX_KERNEL_EXT_AUFS
-
-choice
-	bool "aufs-standalone series"
-	help
-	  Select the major series of this version. This must match the
-	  major version of your kernel (e.g. for kernels 3.x, select
-	  aufs3.x; for kernels 4.x, select aufs4.x; for kernels 5.x,
-	  select aufs5.x ).
-
-	  Note: neither aufs1.x nor aufs2.x (both for kernels older than
-	  3.x) are supported.
-
-config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
-	bool "aufs3.x"
-
-config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
-	bool "aufs4.x"
-
-config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5
-	bool "aufs5.x"
-
-endchoice
-
-config BR2_LINUX_KERNEL_EXT_AUFS_SERIES
-	int
-	default 3 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
-	default 4 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
-	default 5 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5
-
-config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
-	string "aufs-standalone version"
-	default ""
-	help
-	  The version you choose must match that of your kernel.
-	  Usually, the sha1 of the cset you want to use; avoid using a
-	  branch name as this yields non-reproducible builds.
-
-	  See the following resources to see what versions are
-	  available:
-
-	  For aufs3.x:
-	  https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
-	  For aufs4.x:
-	  https://github.com/sfjro/aufs4-standalone/branches/all
-	  For aufs5.x:
-	  https://github.com/sfjro/aufs5-standalone/branches/all
-
-endif # aufs
-
 # kernel extensions from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.linux"
 
diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
deleted file mode 100644
index d4bbb07196..0000000000
--- a/linux/linux-ext-aufs.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with aufs extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += aufs
-
-define AUFS_PREPARE_KERNEL
-	if test -d $(@D)/fs/aufs/; then \
-		echo "Your kernel already supports AUFS."; \
-		exit 1; \
-	fi
-	$(APPLY_PATCHES) $(@D) $(AUFS_DIR) \
-		aufs$(BR2_PACKAGE_AUFS_SERIES)-kbuild.patch \
-		aufs$(BR2_PACKAGE_AUFS_SERIES)-base.patch \
-		aufs$(BR2_PACKAGE_AUFS_SERIES)-mmap.patch \
-		aufs$(BR2_PACKAGE_AUFS_SERIES)-standalone.patch
-	cp -r $(AUFS_DIR)/fs/aufs/ $(@D)/fs/
-	cp $(AUFS_DIR)/include/uapi/linux/aufs_type.h $(@D)/include/uapi/linux/
-endef
diff --git a/package/Config.in b/package/Config.in
index c22978408c..6131bb3344 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,8 +208,6 @@ endmenu
 
 menu "Filesystem and flash utilities"
 	source "package/abootimg/Config.in"
-	source "package/aufs/Config.in"
-	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/bmap-tools/Config.in"
 	source "package/bmap-writer/Config.in"
diff --git a/package/aufs-util/0001-remove-user-settings.patch b/package/aufs-util/0001-remove-user-settings.patch
deleted file mode 100644
index 7eebc95dd4..0000000000
--- a/package/aufs-util/0001-remove-user-settings.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-install: drop setting ownership
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -21,7 +21,7 @@
- override CPPFLAGS += -DAUFHSM_CMD=\"/usr/bin/aufhsm\"
- override CFLAGS += -O -Wall
- INSTALL ?= install
--Install = ${INSTALL} -o root -g root -p
-+Install = ${INSTALL} -p
- ManDir = /usr/share/man
- 
- #
diff --git a/package/aufs-util/0002-no-check-ver.patch b/package/aufs-util/0002-no-check-ver.patch
deleted file mode 100644
index 5fe692072f..0000000000
--- a/package/aufs-util/0002-no-check-ver.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Makefile: do not check version
-
-The aufs-util package tries to ensure that its version is compatible
-with the one in the running kernel. However, this test is flawed: the
-version string in the aufs4x branch for aufs-util is aufs3.x, so it does
-not match the version in the kernel when it is aufs4.x.
-
-Disengage this check, ion the assumption the user knows what he is
-doing.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -62,7 +62,7 @@
- $(foreach v, CPPFLAGS CFLAGS INSTALL Install ManDir LibUtilHdr, \
- 	$(eval MAKE += ${v}="$${${v}}"))
- 
--all: ver_test ${Man} ${Bin} ${Etc}
-+all: ${Man} ${Bin} ${Etc}
- 	${MAKE} -C libau $@
- 	ln -sf ./libau/libau*.so .
- 	$(call MakeFHSM, $@)
diff --git a/package/aufs-util/0003-no-strip-lib.patch b/package/aufs-util/0003-no-strip-lib.patch
deleted file mode 100644
index 15830503b5..0000000000
--- a/package/aufs-util/0003-no-strip-lib.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-install: do not strip libs when installing
-
-We want unstripped binaries in staging; stripping is done by Buildroot
-as a whole in target-finalize if needed, anyway.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/libau/Makefile b/libau/Makefile
---- a/libau/Makefile
-+++ b/libau/Makefile
-@@ -37,7 +37,6 @@
- 	ln -sf $< $@
- ${LibSo}.${LibSoMajor}: ${LibSo}.${LibSoMajor}.${LibSoMinor}
- 	ln -sf $< $@
--${LibSo}.${LibSoMajor}.${LibSoMinor}: override LDFLAGS += -s
- ${LibSo}.${LibSoMajor}.${LibSoMinor}: override LDLIBS += -ldl -lpthread
- ${LibSo}.${LibSoMajor}.${LibSoMinor}: ${LibSoObj}
- 	${CC} --shared -Wl,-soname,${LibSo}.${LibSoMajor} ${LDFLAGS} \
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
deleted file mode 100644
index a426343fd3..0000000000
--- a/package/aufs-util/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-comment "aufs-util needs a linux kernel and a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_AUFS_UTIL
-	bool "aufs-util"
-	depends on BR2_USE_MMU
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Aufs command line utilities.
-
-	  Needs a kernel with aufs support. A kernel
-	  extension package is available.
-
-	  http://sourceforge.net/p/aufs/aufs-util/
-
-if BR2_PACKAGE_AUFS_UTIL
-
-config BR2_PACKAGE_AUFS_UTIL_VERSION
-	string "aufs-util version"
-	default ""
-	help
-	  The version you choose must match that of the aufs support
-	  in your kernel. Usually, this is aufs3.x for 3.x kernels and
-	  aufs4.x for 4.x kernels.
-
-	  Usually, the sha1 of the cset you want to use; avoid using a
-	  branch name as this yields non-reproducible builds.
-
-	  See the following resources to see what versions are
-	  available:
-
-	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
-
-endif
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
deleted file mode 100644
index 32f3bca151..0000000000
--- a/package/aufs-util/aufs-util.mk
+++ /dev/null
@@ -1,59 +0,0 @@
-################################################################################
-#
-# aufs-util
-#
-################################################################################
-
-# linux-headers
-AUFS_UTIL_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
-AUFS_UTIL_SITE = https://git.code.sf.net/p/aufs/aufs-util
-AUFS_UTIL_SITE_METHOD = git
-AUFS_UTIL_LICENSE = GPL-2.0
-AUFS_UTIL_LICENSE_FILES = COPYING
-
-AUFS_UTIL_DEPENDENCIES = linux
-
-# Building aufs-util requires access to the kernel headers of aufs,
-# which are only available in the kernel build directory, which is why
-# we add -I$(LINUX_DIR)/include/uapi. These headers have not been
-# prepared for usage by userspace, so to workaround this we have to
-# defined the "__user" macro as empty.
-AUFS_UTIL_HOST_CPPFLAGS = \
-	$(HOST_CPPFLAGS) \
-	-I$(LINUX_DIR)/include/uapi \
-	-D__user=
-
-AUFS_UTIL_CPPFLAGS = \
-	$(TARGET_CPPFLAGS) \
-	-I$(LINUX_DIR)/include/uapi \
-	-D__user=
-
-# rdu64 is supposed to provide the LFS variant of readdir(),
-# readdir64(). However, because Buildroot is always LFS-enabled,
-# readdir() is always the LFS variant. Drop rdu64 from the build, as
-# it causes build failures due to multiple implementations of
-# readdir64().
-define AUFS_UTIL_REMOVE_RDU64
-	$(SED) 's% rdu64.o%%' $(@D)/libau/Makefile
-endef
-
-AUFS_UTIL_POST_PATCH_HOOKS += AUFS_UTIL_REMOVE_RDU64
-
-# First, we build the host tools, needed to build the target tools.
-define AUFS_UTIL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(HOST_CONFIGURE_OPTS) \
-		CPPFLAGS="$(AUFS_UTIL_HOST_CPPFLAGS)" \
-		HOSTCC="$(HOSTCC)" HOSTLD="$(HOSTLD)" \
-		INSTALL="$(INSTALL)" c2sh c2tmac
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CPPFLAGS="$(AUFS_UTIL_CPPFLAGS)" \
-		INSTALL="$(INSTALL)" all
-endef
-
-define AUFS_UTIL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
diff --git a/package/aufs/Config.in b/package/aufs/Config.in
deleted file mode 100644
index cc5ff365fe..0000000000
--- a/package/aufs/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-# Automatically selected by the corresponding linux extension
-config BR2_PACKAGE_AUFS
-	bool
-
-if BR2_PACKAGE_AUFS
-
-# Both come from the selection of the linux extension.
-config BR2_PACKAGE_AUFS_SERIES
-	int
-	default BR2_LINUX_KERNEL_EXT_AUFS_SERIES
-
-config BR2_PACKAGE_AUFS_VERSION
-	string
-	default BR2_LINUX_KERNEL_EXT_AUFS_VERSION
-
-endif
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
deleted file mode 100644
index d00e7a1a21..0000000000
--- a/package/aufs/aufs.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# aufs
-#
-################################################################################
-
-AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
-AUFS_LICENSE = GPL-2.0
-AUFS_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
-AUFS_SITE = https://git.code.sf.net/p/aufs/aufs3-standalone
-AUFS_SITE_METHOD = git
-else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
-AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
-else ifeq ($(BR2_PACKAGE_AUFS_SERIES),5)
-AUFS_SITE = $(call github,sfjro,aufs5-standalone,$(AUFS_VERSION))
-endif
-
-ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
-$(error No aufs version specified)
-endif
-
-$(eval $(generic-package))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index c86c55b9cb..3f97c25b2d 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -75,9 +75,6 @@ def test_Ifdef(testname, filename, string, expected):
 
 
 get_package_prefix_from_filename = [
-    ('linux extension',
-     'linux/linux-ext-aufs.mk',
-     ['aufs', 'AUFS']),
     ('linux tool',
      'package/linux-tools/linux-tool-gpio.mk.in',
      ['gpio', 'GPIO']),
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 67f0ea9f73..31bece0ca8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -149,9 +149,6 @@ async def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
         configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
 
-    if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
-       'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
-        return False
     if 'BR2_PACKAGE_A10DISP=y\n' in configlines:
         return False
 
@@ -252,11 +249,6 @@ async def fixup_config(sysinfo, configfile):
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
         configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
 
-    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
-       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
-        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
-        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
-
     if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
