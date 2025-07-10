Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D0C83F20
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38BFD6137B;
	Thu, 10 Jul 2025 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D6qn7zApopB; Thu, 10 Jul 2025 20:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283DB613AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283DB613AD;
	Thu, 10 Jul 2025 20:23:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14BDA12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82CF780E66;
 Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c_v5Ij-1zsS; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C807080DC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C807080DC0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C807080DC0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so8061505e9.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178987; x=1752783787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OexmdTQG5fCnEvlPnGppFAgq5lX3oOn7N8pnk3vu+0I=;
 b=QclPWNbmxuOCw991oUf6XhmW8sN+kygRF3klEgVr3M5Wwf0b7FvDCD1T/bsAbiag6E
 oj7d/mOVhYA7aNdZnQXJs5ao4dxqqjZKurwpAvQfOGOxOYSKv7AY78EtzxW1qffNvGAK
 TDUjvldQcOEkuf0PsW12dizPwV8tgsTSyjVsu/+xRYmpegROWFccgO3iXTQjX6FwipP4
 f7Cu+ez2qqAR792QUXO+KrNQaLW7nI/8N5IKVLuroKouzBB/ep9cjcD88kps0xnjmefH
 ccvTkQMp2hBD3tbJES3gkRAHLrVbNsgVH0+6hEhygROjtky5HpbAmFF+1S1LfZ7gNalE
 Z+Hw==
X-Gm-Message-State: AOJu0YygQEG/+IvduvC0UfU4OFGHhD8cNVoCXylttS8SEy9MxA97KKPM
 ZvCmjmYaOpFkDZbtXihcLIx2t7/1TpluOTx5DDnjD7ULPXCg43iyoOc0hrhRkA==
X-Gm-Gg: ASbGncvE2DGptalNVwNcXHXlZrZn5BKO4Qp07IMWKFxSyBlU4YGAPX1FrXNFxKoZYVE
 YYsmer9tt+XKHqTZ5jSfU1dZIQKReasVZFlRjVPxN0/5vrK6ndHT3OV5DgnM1ROeMcrDgrl1HOi
 58A28YE5hMJ64VpuYtPZU+AAZadirJfAqpC1uqxviDWbIM6gUlNVUu87+TSS6RkzTsNkBqoxsqZ
 4pQ1upkMQM4fAyPdxsExTYDbu/lNadJ8OjRUHilOFufzGfccixr7304jnsOuL/jUJgYkgYl316+
 k0ta9aMs4j1EpKVNdH0+ihtEM4IrTdzNiDcXaYnYQFO6KYABxgqBT9eKpwopdo5Cq4K17fjSIVP
 v6Nc1log=
X-Google-Smtp-Source: AGHT+IEKVc6MoSfj0u/5VACbcrIjbvotngUdq/icRsD0+4c4N696RNbZVSHYcpdTZogZDPgc28V5mA==
X-Received: by 2002:a05:600c:820a:b0:453:6183:c443 with SMTP id
 5b1f17b1804b1-454ec13beefmr2011595e9.5.1752178986451; 
 Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Thu, 10 Jul 2025 22:22:53 +0200
Message-ID: <60de7be584b8ba31a450182f662c2c78cbeafe1a.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178987; x=1752783787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OexmdTQG5fCnEvlPnGppFAgq5lX3oOn7N8pnk3vu+0I=;
 b=eu8CMEnOtmhQChuLwQrksgL1o4MmBXoTMLDeTsE23ssGN0yOmTJVpV9JEnwJ6d+Rsd
 bpi1d9uuvgn9kDPedj4QFzmg8mA1NpPCtLpEhX854x/J6Td8o1ES9ShjC2m6MUuIFXiC
 YdnAp0ZboWYLFAGUeFNTyiAth08FPDKbUAhshEdLcxvtOA1VYx+EkfHT11giALcrHxoz
 vmP/fB8P4vzbINrbtt/lgoq9jsXa5UV77jJPGM2X8iORqm4z/N3ZePOfz8Qs5aUcMyww
 qft1PkNA12XjA1Tu2Ns9+XJObpCu2ziWwz8uFXLVOqqDhI8LSFdzqzt70O/+aL/bBgvZ
 FNLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eu8CMEnO
Subject: [Buildroot] [PATCH 11/17 v2] system: add support for merged
 /usr/sbin (aka merged-bin)
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

Starting with version 256 [0], systemd warns when /usr/bin and
/usr/sbin are different directories; in the future, it may even
refuse to boot in such a situation.

Add support for merged-bin, not unlike the support we have for
merged-usr; we also make merged-bin a sub-case of merged-usr
(i.e. it is not possible to do merged-bin without merged-usr).

[0] https://github.com/systemd/systemd/blob/v256/NEWS#L265

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>

---
Changes v1 -> v2:
  - fix typo  (Edgar)
---
 Makefile                                   |  1 +
 package/skeleton-custom/skeleton-custom.mk |  1 +
 support/scripts/check-merged               | 22 +++++++++++++++++++---
 system/Config.in                           | 11 +++++++++++
 system/skeleton/usr/sbin/.empty            |  0
 system/system.mk                           | 14 +++++++++++++-
 6 files changed, 45 insertions(+), 4 deletions(-)
 delete mode 100644 system/skeleton/usr/sbin/.empty

diff --git a/Makefile b/Makefile
index 2f5c43e1b3..2b81406b7e 100644
--- a/Makefile
+++ b/Makefile
@@ -785,6 +785,7 @@ endif
 	support/scripts/check-merged \
 		--type overlay \
 		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
+		$(if $(BR2_ROOTFS_MERGED_BIN),--merged-bin) \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 5d65b95ecf..7c79500046 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -27,6 +27,7 @@ define SKELETON_CUSTOM_CONFIGURE_CMDS
 	support/scripts/check-merged \
 		--type skeleton \
 		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
+		$(if $(BR2_ROOTFS_MERGED_BIN),--merged-bin) \
 		$(SKELETON_CUSTOM_PATH)
 endef
 
diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index 3cccd68dd7..fbda49f1c0 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -1,7 +1,9 @@
 #!/usr/bin/env bash
 #
-# Check if a given custom skeleton or overlay complies to the merged /usr
+# Check if a given custom skeleton or overlay complies to the merged
 # requirements:
+#
+# - for merged-usr:
 #   /bin            missing, or a relative symlink to usr/bin
 #   /lib            missing, or a relative symlink to usr/lib
 #   /sbin           missing, or a relative symlink to usr/sbin
@@ -11,9 +13,14 @@
 #
 # *: must be present for skeletons, can be missing for overlays
 #
+# - for merged-bin: all of the above, except:
+#   /usr/sbin       missing, or a relative symlink to bin (thus points
+#                   to /usr/bin)
+#
 # Input:
 #   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
 #   --merged-usr    check for merged /usr
+#   --merged-bin    check for merged /usr/bin
 #   $*:             the root directories (skeleton, overlays) to check
 # Output:
 #   stdout:         the list of non-compliant paths (empty if compliant).
@@ -22,12 +29,13 @@
 #   !0:             if any directory to check is improperly merged
 #
 
-opts="type:,merged-usr"
+opts="type:,merged-usr,merged-bin"
 ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
 eval set -- "${ARGS}"
 
 type=
 merged_usr=false
+merged_bin=false
 while :; do
 	case "${1}" in
 	(--type)
@@ -38,6 +46,10 @@ while :; do
 		merged_usr=true
 		shift
 		;;
+	(--merged-bin)
+		merged_bin=true
+		shift
+		;;
 	(--)
 		shift
 		break
@@ -110,10 +122,14 @@ for root; do
 	if ${merged_usr}; then
 		test_dir "${type}" "${root}" "/" "usr/bin"
 		test_dir "${type}" "${root}" "/" "usr/lib"
-		test_dir "${type}" "${root}" "/" "usr/sbin"
 		test_merged "${type}" "${root}" "/" "bin" "usr/bin"
 		test_merged "${type}" "${root}" "/" "lib" "usr/lib"
 		test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
+		if ${merged_bin}; then
+			test_merged "${type}" "${root}" "/usr/" "sbin" "bin"
+		else
+			test_dir "${type}" "${root}" "/" "usr/sbin"
+		fi
 	fi
 done
 
diff --git a/system/Config.in b/system/Config.in
index 32462241a5..0652b94a3b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -343,6 +343,16 @@ config BR2_ROOTFS_MERGED_USR
 	  symlinks to their counterparts in /usr. In this case, /usr can
 	  not be a separate filesystem.
 
+config BR2_ROOTFS_MERGED_BIN
+	bool "Merged /usr/bin"
+	depends on BR2_ROOTFS_MERGED_USR
+	help
+	  If you say 'n' here, then /usr/bin and /usr/sbin will be
+	  separate directories; this is the historical UNIX way.
+
+	  If you say 'y' here, then /usr/sbin will be a relative
+	  symlink to /usr/bin.
+
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_ENABLE_ROOT_LOGIN
@@ -529,6 +539,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
+	default "/usr/bin" if BR2_ROOTFS_MERGED_BIN
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
 	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
diff --git a/system/skeleton/usr/sbin/.empty b/system/skeleton/usr/sbin/.empty
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/system/system.mk b/system/system.mk
index 8fe2c138b0..52e810868a 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -32,18 +32,30 @@
 #   set inittab to remount root read-write or read-only
 #
 
-# This function handles the merged or non-merged /usr cases
+# This function handles the merged or non-merged /usr, and merged or
+# non-merged /usr/bin cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+define SYSTEM_SBIN_SYMLINKS_OR_DIRS
+	ln -snf bin $(1)/usr/sbin
+endef
+else
+define SYSTEM_SBIN_SYMLINKS_OR_DIRS
+	$(INSTALL) -d -m 0755 $(1)/usr/sbin
+endef
+endif
 define SYSTEM_USR_SYMLINKS_OR_DIRS
 	ln -snf usr/bin $(1)/bin
 	ln -snf usr/sbin $(1)/sbin
 	ln -snf usr/lib $(1)/lib
+	$(SYSTEM_SBIN_SYMLINKS_OR_DIRS)
 endef
 else
 define SYSTEM_USR_SYMLINKS_OR_DIRS
 	$(INSTALL) -d -m 0755 $(1)/bin
 	$(INSTALL) -d -m 0755 $(1)/sbin
 	$(INSTALL) -d -m 0755 $(1)/lib
+	$(INSTALL) -d -m 0755 $(1)/usr/sbin
 endef
 endif
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
