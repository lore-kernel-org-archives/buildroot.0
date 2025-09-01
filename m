Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CFCCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813AA414C8;
	Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7kYRJhL2xFE; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68CE41492
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68CE41492;
	Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 892BB169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5F683C50;
 Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtuKdEIhrwTA; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7F7783C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F7783C48
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7F7783C48
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b89147cfbso10416385e9.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717294; x=1757322094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OmI60nPfXE1+GPRxQeLhHCXXYmwUmzjyrMqe4wyVJFY=;
 b=GPc+cbn/fkxjZPKmURdqbSHLBLR/KwaQNRhqqcrPCREeO72pgCiJULj6DtN1KHs3Uy
 2mnqc3jZSNdPaUPA3v0RkopA63+rUb3uFCjOcLlR+7oyf8wnkAw+ylyqU3wXy5n55dJ+
 APoGMDIJFCfGBesVzkcm6XvySyRCOU1ptBjSgqP1VaOtNdt2Bk7+enrxFF4SMX1EHIYp
 UGh9cSA4bTdZX4v1XObiySGLhhdfUWo1lBTPXVvCqZpRWK4HwCVCACeAvMEfAIcarpUk
 Tw3U8b/M5paUM2r6njj41i2kzL2bxG6atDNbIK0rJEkkjdzringTwUxgM32pDu91eMap
 klPQ==
X-Gm-Message-State: AOJu0YylJMCphTCsyCKDamxZRAQlQ1ZkGl2G5j/mcJGgWwH9GSZqa56g
 oNafcjgqiF7V3Sfz/5HJQSWYTTBmAYX27HA9zDUIgkT4fHLjd9uzfbTM8266iw==
X-Gm-Gg: ASbGncvxfll6jSyQTs5uZkZ4hzJ/Glrn3FUSwSMBk00+WLEjLU5SAClNnyGYU9qisFX
 wGfkFyhNxzukpeJVZAVQLLT62Nq6fVtUkfrT92uMCB4INkVehe2NI7bsmK96sYGT2eBsBBVl4VC
 m6zZU1xAVvVcspL8jFYTPLl1yRwA4lkIiSG7lHAmr6dkDFb5Y3mDzhZ4n2KuFix1JWMeUumI5nm
 CsnnsFeJsHTFwtbT3VAa+Xiij8RhUotcGYTEoEq+hZNDo8SKILcTs+SiOwZtvjDyszfgTmU+V1/
 P2SrkMef5yKREdrUL1whMohR+QAgp/GlxY2A5XkIMMrC5je61i7kNwn139MHYj4u5VpRzSLWcIZ
 9u0dCVrHDFODRnbdLlbcBIhclETCxxkmP
X-Google-Smtp-Source: AGHT+IFHGDo+gv/AEfVrUbE/kBasuWQ/r4xzLNCyR95HQJ3UnpWUCp5JIHC8b+Zhu2+eAfzq9PxlIg==
X-Received: by 2002:a05:600c:a43:b0:459:d3ce:2cbd with SMTP id
 5b1f17b1804b1-45b8556a7acmr59815425e9.13.1756717293507; 
 Mon, 01 Sep 2025 02:01:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:19 +0200
Message-ID: <7962c5d21f58f906521958dac78b3a06239be180.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717294; x=1757322094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmI60nPfXE1+GPRxQeLhHCXXYmwUmzjyrMqe4wyVJFY=;
 b=TfxFnivqUsqg+FUua+eww+plQyGx4qWyYQ48InZi8bHNuEM44WYI95gQ8kknVg6kvR
 NlS5MCnfUWyj7v7iGtQljzbGVWRqPFbxOUaIon3iX9A3QVYdUaFI6QKPyEWLwAbIUgs2
 MD1I24TRclRSXfok6yJ6SGJ9QeuzrpqlI89/QdRWJDl62zSCQ/A010oKaJCkTfQT15Gu
 PiMFioZbfiaCnkby8CVJZ8g9gh16KqAqiF4EIvmStK/t8yX1FOJ63ITuZpi1eOUOpcNU
 jcYk33qHbJKqS39qY8QJgMrcNGiiy5LQv8oPbkYvy4lnU+/+bDIZC/FXY+Fd+fRkD64f
 xkGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TfxFnivq
Subject: [Buildroot] [PATCH 10/18 v3] support/scripts;
 teach check-merged what to check
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                   |  3 +--
 package/skeleton-custom/skeleton-custom.mk | 11 ++---------
 support/scripts/check-merged               | 22 +++++++++++++++-------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 5a60e71d32..2ff944f6f1 100644
--- a/Makefile
+++ b/Makefile
@@ -781,12 +781,11 @@ endif
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
 	support/scripts/check-merged \
 		--type overlay \
+		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
-endif # merged /usr
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		@$(call MESSAGE,"Copying overlay $(d)")$(sep) \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 82e1506156..5d65b95ecf 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -23,19 +23,12 @@ $(error No path specified for the custom skeleton)
 endif
 endif
 
-# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
-# counterparts are appropriately setup as symlinks ones to the others.
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
+define SKELETON_CUSTOM_CONFIGURE_CMDS
 	support/scripts/check-merged \
 		--type skeleton \
+		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
 		$(SKELETON_CUSTOM_PATH)
 endef
-endif # merged /usr
-
-define SKELETON_CUSTOM_CONFIGURE_CMDS
-	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS)
-endef
 
 # The target-dir-warning file and the lib{32,64} symlinks are the only
 # things we customise in the custom skeleton.
diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index 34e726b4fb..3cccd68dd7 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -13,6 +13,7 @@
 #
 # Input:
 #   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
+#   --merged-usr    check for merged /usr
 #   $*:             the root directories (skeleton, overlays) to check
 # Output:
 #   stdout:         the list of non-compliant paths (empty if compliant).
@@ -21,17 +22,22 @@
 #   !0:             if any directory to check is improperly merged
 #
 
-opts="type:"
+opts="type:,merged-usr"
 ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
 eval set -- "${ARGS}"
 
 type=
+merged_usr=false
 while :; do
 	case "${1}" in
 	(--type)
 		type="${2}"
 		shift 2
 		;;
+	(--merged-usr)
+		merged_usr=true
+		shift
+		;;
 	(--)
 		shift
 		break
@@ -101,12 +107,14 @@ test_dir() {
 is_success=true
 for root; do
 	first=true
-	test_dir "${type}" "${root}" "/" "usr/bin"
-	test_dir "${type}" "${root}" "/" "usr/lib"
-	test_dir "${type}" "${root}" "/" "usr/sbin"
-	test_merged "${type}" "${root}" "/" "bin" "usr/bin"
-	test_merged "${type}" "${root}" "/" "lib" "usr/lib"
-	test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
+	if ${merged_usr}; then
+		test_dir "${type}" "${root}" "/" "usr/bin"
+		test_dir "${type}" "${root}" "/" "usr/lib"
+		test_dir "${type}" "${root}" "/" "usr/sbin"
+		test_merged "${type}" "${root}" "/" "bin" "usr/bin"
+		test_merged "${type}" "${root}" "/" "lib" "usr/lib"
+		test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
+	fi
 done
 
 ${is_success}
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
