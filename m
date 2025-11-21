Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD8ECFC27C
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 13:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349AA843D2;
	Fri, 21 Nov 2025 13:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVzUrkUd8jKA; Fri, 21 Nov 2025 13:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D48843AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D48843AC;
	Fri, 21 Nov 2025 13:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F537158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 13:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7151D843A7;
 Fri, 21 Nov 2025 13:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQao4bzBUwme; Fri, 21 Nov 2025 13:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AFC3843A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFC3843A2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AFC3843A2
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 13:53:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so19566745e9.3
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 05:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763733216; x=1764338016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjOkLYgml1u99YOgov1Gr3Cnw0MsJBS7ezI6sC+r4Bc=;
 b=sqDsPov0aUt8+3pGcBUtkQYf9eckMbm9QTgJvBySHnXBbL4UhlE4JgHqynkJeweL/C
 zvGPCt+eoqyl/XAfJDhWX0dIKKZF4cXxhCi9EtsZxrG37MiTteBGT0ppEz3VaynEAMMG
 BcoJdPKJYQ6FloiS+ych3Jham3JB4e5ebRPJ23L5kDPUZjOLhE8ndsZgH4sWUA9HBFa6
 aleNERHIeOhlqEJPgqh0w4qsEzMchv2ztN5xFG0fbuOeMS7L4xh9xG76Tqh0mZ2ESiGs
 1dCqNHWs2xNuv85Ez07zvWGcsCgS19sMhNLoQ9AwW5BrZ6iFLAVQDoE6v3eR9Y/EjB2I
 O8fA==
X-Gm-Message-State: AOJu0YxqH088DGPdnQ/pD5J6/nqYZWb1YmFhXKtx5EBdA7aJbpuRmS4B
 q4uMbgc4AAeSBJ+y4L6P/xrOYT213zEu6mOmZW6Q4DSUzXKyf5NUOYNt3xBaKg==
X-Gm-Gg: ASbGncvZQ0vhVAI1SM0PNXgfFiohX2inTtnaO9CHXIUkyrdZJIasxSFRYRgTIO8W6/r
 jV0/OUOeVOrD4Q+HOuu1XjhCSWdM7SWDsPyrwwoCb74F24MZHTfEVLUFdv6B4UMeqeUrZrB4l1x
 dY3yzZ+sZsBbw/jzRIw04B9YBIRPjFs0QUv+jzT+N7/LTIZaMD/drfh6NbeGluXi+WdBcmTo6bi
 TcdYu9jba5HjSDL1rdRoZQmJKEqUH7wkop8eNrP02kAG8g1ExT47uVU5mygoRCgU4vQKqItw/JM
 XHV4L0oMlhQyO99DGzkM87LLLS73im6vaHJbhNClj9sX5mZ43K+2V/ijkVRudwYOoQd6edODQh0
 XL5blnMRDfbEjjjBpsLuTm7NpyPAKezjGKLpE64rF2m6LK2sEIrbLCpT1RxaWi8eZNqjkegxdQT
 JfEONCSVEI9RvsFxC+/Ga95A==
X-Google-Smtp-Source: AGHT+IEzttYu+vzcUdeqwBeggMgEeDfv6vNvxDoxOF+GmOzOCBPgnQWHJ3ByxIMBmxMDpIix0ImvCQ==
X-Received: by 2002:a05:600c:19d2:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-477c0184965mr25359555e9.11.1763733215589; 
 Fri, 21 Nov 2025 05:53:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3aef57sm41904055e9.11.2025.11.21.05.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:53:35 -0800 (PST)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Nov 2025 14:53:34 +0100
Message-ID: <20251121135334.470282-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763733216; x=1764338016; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=FjOkLYgml1u99YOgov1Gr3Cnw0MsJBS7ezI6sC+r4Bc=;
 b=QjW0c+f1dxNGrhADNNrwDhiin0N8VFxGU/F765Q4z+Y+okILGN7T2r9Apoko7Hib6p
 RDms8QGGwFUQeC7affs1OSh3DUVnHEaKr9jVffkx5du76Pw75LYF9O4Ep8LHx3nIAm58
 2ZAIWVkd4X3JEBA2+f7THUf9JUH+jTLu0EzTOXM3MPUVNTW4iw+f0N5ap7ydHoMLkXjJ
 enwOajVZZ1Mv65+zqOAbI8tNcRnwcLqFBb0+KTaFxVs9IN+ZJuHQ66d/vjoSf0BU5H05
 wnzbT42E+vQt4pS9jyiQ0sbeB+ZuEltJ6wQcy4/Eb1E3y8v+9IpOrfG+LBXwcOu9vxAN
 +NOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QjW0c+f1
Subject: [Buildroot] [PATCH] support/scripts/check-merged: use short options
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

Commit 1187c34d88e1 (support/scripts: move merged-usr errors message
into check-merged-usr.sh) introduced the use of getopt to parse its
options; doing so allowed to use long option (with two leading dashes),
which is more descriptive than the usual one-character options.

However, getopt is part of util-linux; it is not a shell built-in.
util-linux is not a prerequisite of Buildroot, so we may end up running
on a system where it is missing.

We could add host-util-linux as a dependency when the system does not
provide getopt, but that's not very nice; even though host-skeleton does
not need to check for merged-bin for now, it does not need getopt, and
thus we could add host-util-linux (which depends on host-skeleton) as a
dependency of skeleton-custom. But that will not be tenable over the
long run, especially if/when we do a merged-bin in host dir.

Requiring that util-linux be installed system-wide is not nice either;
it's an additional requirement on the host.

We can do like we do in the oter scripts, though: use the shell built-in
getopts. Its usage is slightly different, and does not support long
options. As it's just for use in an intenral script, we can live with
the less descriptive options, though.

Switch to using getopts, it removes the need for a new host dependency.

Fixes: 1187c34d88e16191753bfd0c3b4cd2f914813f31
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                                   |  6 ++--
 package/skeleton-custom/skeleton-custom.mk |  6 ++--
 support/scripts/check-merged               | 35 +++++++---------------
 3 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index ff25027c13..d1d1c88943 100644
--- a/Makefile
+++ b/Makefile
@@ -783,9 +783,9 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
 	support/scripts/check-merged \
-		--type overlay \
-		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
-		$(if $(BR2_ROOTFS_MERGED_BIN),--merged-bin) \
+		-t overlay \
+		$(if $(BR2_ROOTFS_MERGED_USR),-u) \
+		$(if $(BR2_ROOTFS_MERGED_BIN),-b) \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 7c79500046..b5a1a5e80d 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -25,9 +25,9 @@ endif
 
 define SKELETON_CUSTOM_CONFIGURE_CMDS
 	support/scripts/check-merged \
-		--type skeleton \
-		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
-		$(if $(BR2_ROOTFS_MERGED_BIN),--merged-bin) \
+		-t skeleton \
+		$(if $(BR2_ROOTFS_MERGED_USR),-u) \
+		$(if $(BR2_ROOTFS_MERGED_BIN),-b) \
 		$(SKELETON_CUSTOM_PATH)
 endef
 
diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index bff6ae2b7b..8da4a69374 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -23,9 +23,9 @@
 #                   to /usr/bin)
 #
 # Input:
-#   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
-#   --merged-usr    check for merged /usr
-#   --merged-bin    check for merged /usr/bin
+#   -t TYPE         the type of root to check: 'skeleton' or 'overlay'
+#   -u              check for merged /usr
+#   -b              check for merged /usr/bin
 #   $*:             the root directories (skeleton, overlays) to check
 # Output:
 #   stdout:         the list of non-compliant paths (empty if compliant).
@@ -34,31 +34,16 @@
 #   !0:             if any directory to check is improperly merged
 #
 
-opts="type:,merged-usr,merged-bin"
-ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
-eval set -- "${ARGS}"
-
 type=
 merged_usr=false
 merged_bin=false
-while :; do
-	case "${1}" in
-	(--type)
-		type="${2}"
-		shift 2
-		;;
-	(--merged-usr)
-		merged_usr=true
-		shift
-		;;
-	(--merged-bin)
-		merged_bin=true
-		shift
-		;;
-	(--)
-		shift
-		break
-		;;
+while getopts "t:ub" OPT; do
+	case "${OPT}" in
+	(t)	type="${2}";;
+	(u)	merged_usr=true;;
+	(b)	merged_bin=true;;
+	(:)	printf "option %s expects a mandatory argument\n" "${OPTARG}"; exit 1;;
+	(\?)	printf "unknown option %s\n" "${OPTARG}"; exit 1;;
 	esac
 done
 
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
