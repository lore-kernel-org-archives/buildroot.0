Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C6CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4841F613A9;
	Mon,  1 Sep 2025 09:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5UFoXofrqvp; Mon,  1 Sep 2025 09:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C643613AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C643613AB;
	Mon,  1 Sep 2025 09:01:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B63E2186
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFDA960E04;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgeQa9impHyJ; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94332611F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94332611F8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94332611F8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b88bff3ebso6594215e9.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717295; x=1757322095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2pzarnZI4xT1gl1FhpoComYHSJrnVnqClv1TuEEKwSs=;
 b=ebwW48u5YhI1aahykIiOQTO9F7KkCY0ruaaywPLEYLRBEDvY8drjdsPrkZk9FXrgdN
 Dl/5ajo2SrN9XwKDnhK/5SF/NlMnaoIJjASxhYKHZAPUmNogGZliRRAiM4pfodBIfuD5
 ke7uk851tFvQkXF5W6Ldh2hz2BSivSTwB+Wlw0UmxNMZlU0Tmhb+52KMMoz0tRcCveHE
 tNLE6h3trcTmTbN3KAZ6QVlXi/ZjW+vPUrS1kmXz2Q2S07J6F8urmXVFeqSgsReSJz6K
 lEV7M0449Wi4jjVmNCQpz+OjLCn04bOmhEYbunGcdZ5DqKkTA7ccqYc+LdEBteJ+U+8B
 GJdg==
X-Gm-Message-State: AOJu0YyXIB06Q/OFV6O0XY/m8r6n3nhF02PwfcS+BYcpJIhk+cpLp0X5
 mngFAfT5VGkxORdSrPDA5vAEOci6sFBOn46Pz/XV9UIGkT3wscwuhDZBOWFtcQ==
X-Gm-Gg: ASbGncu8hvzJim3ekAYPp1f6RIEz7OvwHfhhHCU2V50vV8FXh+pfY9DaEyrHwGyISfJ
 ZX6T0MKozaxTSvnLpi2A7745xTeI/4DoZIJHr7BxETFdIrm9rxvoF9CoxwzSGYukH+1i2uAl+y5
 XMgJrJqEoRs5AJxjnxyHs9Rjud3YY4Bjt5p3SLwegi6bIevKNTLE80vTRFc27BvBdkSvhLjsvKn
 OXsi8dEmY4KwxgZJlhKC81vTUVyabZEqbjLK4PfxA3NEQ3DLUSXFiSTVuiwm15WQFUD5WbYsy9Y
 LRhwJ+H+1wOedC5mdbf7lBZFzptLDnz3GacT6wDVC+X7DO3tiu6KTOwH+rExRImbiZWOlTep86K
 ZWiS7/8oyaI7Lx44V+DxjuJRiyE6z0fF/EZMXZPa8yQfO9uULatWANA==
X-Google-Smtp-Source: AGHT+IG1I66RgACgd8bFObwq2HNNmkKKJ1PuMpmVKN2r39iXsXEFcEo+0SmJ+/lk0tJPvghToIwE+A==
X-Received: by 2002:a05:600c:484a:b0:45b:85d0:9a0c with SMTP id
 5b1f17b1804b1-45b85d09ccdmr43870265e9.15.1756717294143; 
 Mon, 01 Sep 2025 02:01:34 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, TIAN Yuanhao <tianyuanhao3@163.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Mon,  1 Sep 2025 11:01:20 +0200
Message-ID: <8c193a85cb4d084bd4213106be3e9f1f4f851702.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717295; x=1757322095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2pzarnZI4xT1gl1FhpoComYHSJrnVnqClv1TuEEKwSs=;
 b=U4yqNVc6BDV2v9xSphGXEegaTDKKXCUJHsUCcoqnYQnzhpUY415il6S+ZkEj9Va/12
 m9rYwO57Ffmfn9wAVNSPS8ZS4VmMbl7Be5YPruXCKVKNXDXyfB6pGEMAPuyjltqfwurn
 nxUYgJNLgOyukcOuCsRaaMj+efc9h3tU7pjy/+rcwciA9xe7uiDrHBd9wOi6oHt7jCPV
 KJVhef/rSb7y2mGZZkg+ERUZh14RFfjZFqtKeIXZhPl5dGjnvJBWzA71Ja4zL7i51MI4
 jLik7NVTRvj0r3Ggs5Tz4jPvycTxhQgohdUSlZGLQzX+1eUFvUj+NgUHtYytVjXaxviY
 4IMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4yqNVc6
Subject: [Buildroot] [PATCH 11/18 v3] system: add support for merged
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
Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
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
index 2ff944f6f1..5fd49c3e9b 100644
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
