Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD99C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F2A80FBC;
	Thu, 10 Jul 2025 20:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLhbOpC17HtS; Thu, 10 Jul 2025 20:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A928581227
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A928581227;
	Thu, 10 Jul 2025 20:23:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23236114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0581380F4C;
 Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE54IsqNxu8U; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44BF080DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BF080DA6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44BF080DA6
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so11591365e9.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178986; x=1752783786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mxjuXn4sEO35JUg8LO+3s7LJcWCbHk4nvd0VIjGj8kI=;
 b=BpRVWj7p7n/zrSancb5tWdKz7TMbB7ySO5BRy04GN44SnGJ9VLb1bbxIT4LmdoUL77
 P3uhW3GeJHT6w/17PPfyebSJn+oN1Dzcy7Nr4EWcLnVkTQwg8tNWZawJccQgnqclhnRw
 HQu19i47Ow/X1qVTZMmxdlHjEs4VOhxG9DBUKyDR3RtbXS0CbUq2FXoFuhxDx4U23oIZ
 lAl8yuDbIkjzbBy1yc0juQysRiyTEiXL3VOXzYTkiDUPkkQ1E9MWd0sb+9Y59ihjwxds
 3UNk9Bkm+5woX8RUXeLqzaWsbFrU2eFhfYJRax8uQMeA17fNnl1i9O1ADQPKDw5NiQhT
 WRuw==
X-Gm-Message-State: AOJu0Yz07QPdZKEfWmUII4flCgVSA7lgXH4Q2eX2KESUj80aceHCz4M6
 7aovx1ACFPlrUjE2zfbygEn/XMLSpejZPDJHkyN5rFZv/6w7IAhUlK7k+J+0+g==
X-Gm-Gg: ASbGncv+5k8m1JhVqBC4cs5XYVjrGnx9Atja1Z8o34/Sk1VTt/3W8L6R6KvMfh1o4kS
 KuVnmRXYxePZykXIq5khsCO0prM2o4DCRp//ivRD6NQ5oBMqdoU+6GGIba3rQhmvIvafZPxpw4Y
 np7vjUz3W9sFgVOjeP5Oq6cjc8QE5RLBHRNLfAuQx1kR5K5ES20D7nx6vCbK3fpSRdO2p5eoI6q
 aVwsuHUH+YJreANyQMOCQBwW4sgyHS9oxYhUbmb8rVF1d3KnZ9uSm+ryyYLiDRKxVZ2AYsiRaXh
 wX7ZvmttY1+T61/NDuGvmjvayEW+KWhCHVife7ZJqXZrptxtaBMTe5CcOZxYIoEGmCzQ7255
X-Google-Smtp-Source: AGHT+IEkwAXi0sNVKzYNl6z2ZxAZpNs+OLzmk469cL7pMsnq0lBSlfl/kxBe2flC/Y6baE1aNE+l2A==
X-Received: by 2002:a05:600c:638e:b0:43d:97ea:2f4 with SMTP id
 5b1f17b1804b1-454ec146b33mr2520355e9.12.1752178985915; 
 Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:52 +0200
Message-ID: <ba37b25098d1670541734a5320900cd011d27dc1.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178986; x=1752783786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxjuXn4sEO35JUg8LO+3s7LJcWCbHk4nvd0VIjGj8kI=;
 b=jtyjUUa3TQI/OkIIcEZ2b0w1vBGDAZwFLHtFnsmk++0KbXb6vmgv2twRlnqGI04som
 VP1p2sNFxg/dZF8Fkl8Bqxdq3I7NSLZAmlETTXkAZzDwSgguwod8IypI/3HVJG/9Fcdn
 aLUuwY1QfgF+nLys//1DJcPiufgTbx5OiH0YCNx6fUE2OPqux0CD7ZZjT64fCwOvNUfv
 a201Hd973mCEt6g88eetrWr2YOBOnyMLYTes+qezMnAWUmTedNqK1249SYvFfk37UQ2Z
 ufuJly9Z6+Cr/9smgHdHRRKQwrOctUxDAAzekcnU6NwDSwqUmgcu5dNtmxmvpoVhxGVi
 tA4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jtyjUUa3
Subject: [Buildroot] [PATCH 10/17 v2] support/scripts;
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
index 56266a8feb..2f5c43e1b3 100644
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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
