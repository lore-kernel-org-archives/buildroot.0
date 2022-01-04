Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4581E60EAE;
	Tue,  4 Jan 2022 20:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3uzAEBK6xL4; Tue,  4 Jan 2022 20:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CFB560E47;
	Tue,  4 Jan 2022 20:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB3D1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A84040308
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWbestqyMtFQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:49:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 354BB40201
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:49:26 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id h1so24635918pls.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEFgGzwb6rjmz3wNsbSdHwA4FmBLjB5MTG8g6jU8zm4=;
 b=PNzb6PDbDIVzrtL9UeuX1NjxuHwsVFkP8EKI498OQQ01efuSpzX3L8cJt3eYPpMjch
 0rU4ReePvcnPYyt3YuesqHnoa70e+/kHS8jExH/bKKApAQxX8rZE7d//y7OLAfe4DN5A
 L+podzgiIuq/U1EtzQL2l3tcWgUsLN0b9u11ijbfscyTu7jHzaLZBzoDm9zfrxOadGlR
 fGJDjPizqKDXzivegrBP2ofFUyXF2DeHLyQGoJ+6Ho4Y8iLGf8x0a+/4U0mZD/iNaZ17
 RNFhSgFe7bUPwmcfgyVafB7buqlwa7m3Ighsm0Pdpb3JdjqRXU1Haocm+GRidzDtoYtQ
 e4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEFgGzwb6rjmz3wNsbSdHwA4FmBLjB5MTG8g6jU8zm4=;
 b=rBaiwKBcWTvah3aM0GtXwSBF3ZDABmMrn0B76FUQoxTAyKWzoZ831E64sYkGMlQsCE
 98CrMTVj6PCUmyNBykuq9ZglWRr7LStdLAISIWH0MLkqCBcvkwcr772zqq96qqjjK9V7
 n3yqxvJqJLkLcicl/bdiEA5KFBSp3tMrUsEHzu001+OjfHP6CYGVZ1VFV0oYaiMGvsrw
 hKwSBodmYpAx7pyGpK+uMGZXoehXenNHp6DU7vjVT+NbwddnHQvjIFMUrto+8QJ4Al13
 GdXD3M8+32Ysx0iKlvIRKugUzMt0Nq1+fpuL6EsYoCLRm3IaVzUtDeuolCmmgEG8r177
 tTxQ==
X-Gm-Message-State: AOAM533luXpJ6L2m36+DaaSRHhxCB+5UZIGxMtotmFrQeeULlBpMbS3x
 Z4MktS4nLzEDWZE5GjxmPJDzdRIWfCM=
X-Google-Smtp-Source: ABdhPJycw3xONuNIAkqkwkHsGg7DVGTy/14+PlHp/lgomqAYc8ALjxa4DUb2FSvjBz9SlRw26CEH6g==
X-Received: by 2002:a17:90b:1082:: with SMTP id
 gj2mr150482pjb.187.1641329365249; 
 Tue, 04 Jan 2022 12:49:25 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i1sm16442031pgk.89.2022.01.04.12.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:49:24 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 12:49:23 -0800
Message-Id: <20220104204923.2124418-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/pkg-generic.mk: fix absolute
 paths in per-package config files
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages (notably qmake packages) generate .cmake, .pc, and .pri files
with absolute paths. Unfortunately, doing so breaks per-package builds because
the paths in those files point outside the per-package sysroot for packages
that have rsynced those same files.

- Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in pkg-generic.mk
  to avoid more calls to ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)

- Add a new step which searches for .cmake, .pc, and .pri files in a
  given per-package host and staging directory and replaces the old
  $(PER_PACKAGE_DIR) directory with the correct directory for the given package.

This simple fix allows qt5 submodule packages to build with per-package enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v2 -> v3:
  - Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in
    pkg-generic.mk (Yann)
  
  - Combine FIXUP_CONFIG_FILES_ABSOLUTE_PATHS with FIXUP_PER_PACKAGE_FILES (Yann)

changes v1 -> v2
  - Drop patches 2 and 3 and combine them into a single macro in pkg-generic.mk
  - Move the PRE_CONFIGURE_HOOK to inner-generic-package so it actually runs
  - Rename FIXUP_PC_FILES_ABSOLUTE_PATHS to FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
  - Use $(HOST_DIR) instead of $(STAGING_DIR) to cover both stagin and host
    directories in a single step.

 package/pkg-generic.mk | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5626af1d87..65fe9baced 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -113,8 +113,16 @@ endif
 # fail.
 # So we just use HOST_DIR as a starting point, and filter on the two directories
 # of interest.
+#
+# When per-package is enabled, packages may generate files with absolute paths
+# that point to the packages per-package sysroot. However, this breaks
+# per-package isolation when the files are rsynced to a new package that depends
+# on the first package. because the hard-coded paths point to directories
+# outside the packages sysroot. Run sed on all .cmake, .pc, and .pri files in a
+# given packages sysroot containing the word "per-package" and replace the path
+# with the appropriate per-package directory.
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define FIXUP_PYTHON_SYSCONFIGDATA
+define FIXUP_PER_PACKAGE_FILES
 	$(Q)find $(HOST_DIR) \
 		\(    -path '$(HOST_DIR)/lib/python*' \
 		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
@@ -124,6 +132,11 @@ define FIXUP_PYTHON_SYSCONFIGDATA
 		\) \
 	| xargs -0 --no-run-if-empty \
 		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+
+	$(Q)find $(HOST_DIR)/ -name "*.pc" -o -name "*.cmake" -o -name "*.pri" \
+		| xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(NAME)/:g"
+
 endef
 endif
 
@@ -836,7 +849,7 @@ $(2)_EXTRACT_CMDS ?= \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
+$(2)_POST_PREPARE_HOOKS += FIXUP_PER_PACKAGE_FILES
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
