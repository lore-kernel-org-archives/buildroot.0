Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11AEC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E6B610FD;
	Wed, 14 May 2025 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZLRmc-ow0FD; Wed, 14 May 2025 16:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D72C610AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D72C610AC;
	Wed, 14 May 2025 16:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F37E212A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0F058372B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnf7JCUVTnI1 for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1F0683827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F0683827
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1F0683827
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so408805e9.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241911; x=1747846711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TQlTC9xuCp76L1IEKvNvOdCWR0daW77IMc2G0lBa3rA=;
 b=Eu2xZOhGo2rOFi4pG7cbKExqZzZoM68+CY1kOmsag1lPjHAP4fKfGchWBEUm6m6UPB
 NuKPHDZIU0Wj6uEWquJpoNiTnWTbOHOvnqWin6HcreYcVWLfSCK7NvWZKUw1wsIUvzYc
 0Yz1LjYY3QF1jld9AVVR6zHqmgZuffpDokhYSMDnowS0ygYkAL40btqU9uyo7uSsPYDg
 HbSvWdmmeCnoSdLjAdffAluV+s14KAyhM6vPd/ILSPaaoDQqC8KI/hwXc+JdXigZmIDy
 SIDwh4y/XqS2tIQekq5e9EBs9LyMcLKvtDf5kINAz+6js68NK7/9lGtBBLbVgktrzk7P
 I5GQ==
X-Gm-Message-State: AOJu0Yz5Tat6z/yff0KGtEqAa67tMWIMBiPQ8s++bCFvd9r5VaG0aTrl
 KlBTw1yDy5dA3PGWCA0N5/iMpm20aoSjZy5K+uwzk0pYEK/4KeOpctCEIA==
X-Gm-Gg: ASbGncv2FVRCwSSibuTXOS10xjKMUkMq724a7bNxLJ9p8u+ONBijBoHwpi00FeLvQxR
 LoPXcDLcYB4PbCXU9KX9uTAlgkBLH9UTCa9B6pnW0oARDzT1JM9quKv1uJ1hr7sE22+QlrNlZ/4
 +BW19NwgM5jZa/Deguq2ZajNpZ1k+gOnLLca6q2F4FC1kaC6+MgxHhPeEXhufIvYlAv7T77Fvau
 2o2HyukSJVYwnT+1y8xfdxxFGSepyw3Cn5z7xZ6tNl6sqVnnGTn7nWdyuHbtHs/H+15dIugzqcH
 HuixReYuKPVf5Z4rmrLbIMBgTsgv3Aku7Zqn972Xi0kq3pYXnNgp+ViAoWF53g==
X-Google-Smtp-Source: AGHT+IEj9a1gsDk4rgs0pIGRJ9T5MSCZQyrnpHK7omWV9VOuTj/E0VUlYO7Sy5oIiR+3TU2JxhgScg==
X-Received: by 2002:a05:600c:c1c8:10b0:43c:fa52:7d2d with SMTP id
 5b1f17b1804b1-442f331f94cmr19617735e9.20.1747241911033; 
 Wed, 14 May 2025 09:58:31 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:19 +0200
Message-ID: <cc940dccb8f864ed0718fcc655fd972a49f3c5d4.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241911; x=1747846711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQlTC9xuCp76L1IEKvNvOdCWR0daW77IMc2G0lBa3rA=;
 b=hxFnRYm1Sqx6lryYNXjyXEBWXvWt1MfQBsewAv/Dajh+UYPwmp2GquzuHmkQxHxTKx
 VS7egWLLFykbCLuI9ghyLlodPEpj66cA2hM0TxleD6rMCipYjJUVLGCryINdTLK4vxtF
 oCo47RPMrzBpbkgJHoa4+GQ9GhGgfeUHZSdRhOZkdTLxEwbISEwiSrClMn2Q+WEx0wv3
 PAkenYZjud30h1xBpyBLDUsYEzc2C++1oJbuTvKv6hdoda+TZ57h+UEk7XFAP9PZLQSd
 U2WDy5GTy6+9ZcY65jZLpyNQGOQRZx/j/KnTfpAaGbGaplQd2mxN4K95pHnu27div4de
 k22w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hxFnRYm1
Subject: [Buildroot] [PATCH 07/13] support/scripts;
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                                   | 10 +++++-----
 package/skeleton-custom/skeleton-custom.mk |  7 ++++---
 support/scripts/check-merged               | 19 +++++++++++++++----
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index a5aa1c6553..1248dfb9e0 100644
--- a/Makefile
+++ b/Makefile
@@ -780,11 +780,13 @@ endif
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
-		$(Q)not_merged_dirs="$$(support/scripts/check-merged $(d))"; \
+		$(Q)not_merged_dirs="$$(\
+			support/scripts/check-merged \
+			$(d) \
+			$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
+		)"; \
 		test -n "$$not_merged_dirs" && { \
 			echo "ERROR: The overlay in $(d) is not" \
 				"using a merged /usr for the following directories:" \
@@ -792,8 +794,6 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 			exit 1; \
 		} || true$(sep))
 
-endif # merged /usr
-
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		@$(call MESSAGE,"Copying overlay $(d)")$(sep) \
 		$(Q)$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 7d64959711..e583d2d731 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -25,10 +25,11 @@ endif
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
-	$(shell support/scripts/check-merged $(SKELETON_CUSTOM_PATH))
-endif # merged /usr
+	$(shell support/scripts/check-merged \
+		$(SKELETON_CUSTOM_PATH) \
+		$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
+	)
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
 ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index 9459d975fe..7fea4e1dea 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -11,12 +11,14 @@
 #
 # Input:
 #   $1:     the root directory (skeleton, overlay) to check
+#   $*:     the list of merged checks to perform: merged-usr
 # Output:
 #   stdout: the list of non-compliant paths (empty if compliant).
 #
 
-# The directory to check for merged-usr
+# The directory to check for $what
 root="${1}"
+shift
 
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
@@ -46,6 +48,15 @@ test_merged() {
 	printf '%s\n' "${dir1}"
 }
 
-test_merged "${root}" "/lib" "/usr/lib"
-test_merged "${root}" "/bin" "/usr/bin"
-test_merged "${root}" "/sbin" "/usr/sbin"
+for what; do
+	case "${what}" in
+		(merged-usr)
+			test_merged "${root}" "/lib" "/usr/lib"
+			test_merged "${root}" "/bin" "/usr/bin"
+			test_merged "${root}" "/sbin" "/usr/sbin"
+		;;
+		(*)
+			printf 'Error: unknown type of test %s\n' "${what}"
+		;;
+	esac
+done
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
