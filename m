Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E78CFA768
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 16:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FAB42905;
	Fri, 21 Nov 2025 16:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haqoxeImnefP; Fri, 21 Nov 2025 16:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E985842908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E985842908;
	Fri, 21 Nov 2025 16:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C05122
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 16:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEABA84B5A;
 Fri, 21 Nov 2025 16:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJCxC2k5MvBm; Fri, 21 Nov 2025 16:34:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1173684B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1173684B74
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1173684B74
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 16:34:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477632b0621so15639335e9.2
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 08:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763742895; x=1764347695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luAcLDyWCqVeHZWjw4ip5r6tHPBl9EQmgj9iEFEAKuY=;
 b=pYLKVYK483LbQUt6vOiBvSNesYGBQws11ibWvf1PXzKCl5vEFGJRlPovmsQgLU9QCW
 o1HXAa+GvTNwNiHSD0g8E00iyvpbyCUMt3EmIlMmHfzYp+cXepPxlVhiLug4pCQBWEDF
 qqwJMdW+w6vvRG9xqVGOyEBN4PrszBSIYZc0pcJwbpotFSvtaxOJIRO9tyL8yLlWQO+1
 7XRC8lvPVFG6xxoskOxVQ6NUauvusJsTHFtLeWV6jJZiCyeItTj93DxlMVb9b17TqaXC
 q9ArS1BQETIHslq1RHXtgcKeUHc2wjmfe5oiVX2HqWD/XcXsvA92Z2phqJDAia15jpAz
 NVZg==
X-Gm-Message-State: AOJu0YzPMhhFyUUmJUgE7nltI1OZwRa0vneWw3OvhGmYMg6GI4TeaWzK
 2GGb6bwf+uovXRZ6OjgnsPCkJWEyqyExuGQMfoP9aFaSgP9KeS6HzRPh4UbYQQ==
X-Gm-Gg: ASbGncuAxmseBKY/C0lHWO1zx2Gth71nQb+j9/9NQTKHGO28zTC8eXX1CXbn8tvsttc
 uw0FIM5VVhYVsELam89m9nxylfMX4cPYakxKHrTRwOXORuuTeG/zztZ1Pmyj1L6bQEbLqgqtKBk
 TWjBvQu0cMVQ7VJ5YhHh06NK6lyugGtQeJyOTah7RgfjAhHDU/9LZjHlxuJQH7i5WTMBnRQ9Czr
 5BOj2G0+B5Jdn8Ettyy30DXVQsUfOKcE+545ZrcELNpr+8XEghd4Zt7iHs+pTqLkBVv+9JgftVi
 jAzk4X/AFiXfjHl+/EDGTDQYtBXZ5+lnmAsHe7ZYB6IgjR3tv4TkuRklg9JJLAU7xmoZYAXssjM
 JEjwFp9l71Rwp7oXBPfD7FaIHAShADxmKjYh9DQw1ya7wwjBXYgM9IPHXpyExph0mf+yfUTDO5N
 Hd8TO4U44xOkSVEaqMTovgQQ==
X-Google-Smtp-Source: AGHT+IFtXeZl9Vz2aKZukdgfv1HCACnr0NsbVE6U9/r1pzY9zd1/dy5hz2fn0SZZEOfSWt1Z1b/UdA==
X-Received: by 2002:a05:600c:3592:b0:477:9b35:3e36 with SMTP id
 5b1f17b1804b1-477c10c873amr32348715e9.2.1763742894709; 
 Fri, 21 Nov 2025 08:34:54 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477c0d85360sm41750875e9.15.2025.11.21.08.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:34:54 -0800 (PST)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Nov 2025 17:34:53 +0100
Message-ID: <20251121163453.499648-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763742895; x=1764347695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=luAcLDyWCqVeHZWjw4ip5r6tHPBl9EQmgj9iEFEAKuY=;
 b=dO1/XQq1Iwc7lP1v/xZo3+Kux2qGIXyg35yYaODUMoOb60s5qOPasAKIR7TOPZXfsF
 tWa4IMYHHMNN+mP/RgA+GnrTz/wXtXzfirZ3xN5iibsL9S5Tp8EbyScAM169mUvLn2jw
 Y/nP/gbnZgSO/rhXTvMblwBuGh0NaZxtrdWEO10wEUJRRbk/8wQLSeTdYHN6SZih0zA3
 4lfumCGxb2h810p0wr2/SjgK1xsufGj61/3OLHQFtBhgCmWVQijN9z+vWeYyf+bWfAap
 VT/QwAw/a2ojRrVZLJBeF2JmQkcgEHCKTDBMEx8MqmHBrIu9u8+NWD+KiT/lXyBWAogU
 xwKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dO1/XQq1
Subject: [Buildroot] [PATCH v2] support/scripts/check-merged: use getopts
 instead of getopt
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
Changes v1 -> v2;
  - fix type's parameter: it's ${OPTARG}, not ${2}
  - reword commit title
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
index bff6ae2b7b..447abfd815 100755
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
+	(t)	type="${OPTARG}";;
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
