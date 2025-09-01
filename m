Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E111CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DF9414BF;
	Mon,  1 Sep 2025 09:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Po2yl2amnRfP; Mon,  1 Sep 2025 09:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 823C9414C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823C9414C7;
	Mon,  1 Sep 2025 09:01:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CF2D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C1F413F9;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6Ae0NktCovg; Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1359940D07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1359940D07
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1359940D07
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b627ea685so34736955e9.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717292; x=1757322092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RUudtlr6KnonZOIb+ntS/qpcUx+5p51QAmkXIOhGqJI=;
 b=RhmByiOK+pwMv1XeD4Oz1CzLEmqluq2XnQLns+ywMQldU1qJRveg7XkfyzapYXcDpK
 2IEVa+0grvMdc5UjiwNVOkFS/R8WSzG6DOpqIgm/KPw+UeTUGYIvv/CPbqnVs2dp4irR
 ZdU2ozLZB7yGmemQab+eKmx2WNd8aNgAaGnhBtYl8ryqEyMIop5eK+wUj0jrtT75zYXL
 DjZOY/4eR72GQNle2zXax65zrvBEYe9aibeI0a4l/vDZogSHzd7PGVdBNuR4pvXBwQnK
 Zhy9MQGxMlJiVgpPs41myo1PcrB0pjAhLfysGBSuMqNH/58/havd17lXKCA68p++PGna
 aoUA==
X-Gm-Message-State: AOJu0YxDpflGOJVqlcykIPs7HgTpnVkVtELgFjwWkZg/IH8Kgyf2PCkv
 /zy97p6QHFr6Jx8M5AnpZJ8v1nYiJNmFSN5ZGFsQ8bcdoH+42lznZpT2GGYOxg==
X-Gm-Gg: ASbGncsJezk2UcCPjGBjSw7qGqfAtAiZQ6s5jlUpU/Cq5Przwxht+f6ZJULZ64645i8
 tje87yh2mU1FpXwKlf0plXx3hpZg8Jl/lkUMe7c4E2Vs7FaEDpNA7Zgm30bf8hCW6QDHyLkiCOs
 CMNTn+pLruSI6VAmYJblGq+rw0NFO0GDzLHENy8wndAksu44e6KcbirXsNu4CFOwQAv0faWCKt4
 lO3UC644kEtmHVit0ulyj8G8AsnxRV98AwRsh42Q6GZJsSmMCuubERagFiuy234mhz4kO0HQZpk
 T52wi3FZbuoFJ+nDsTULq08gupczSBaG0BlwaXCInR+hxmoJSg/Y0+SPNnU9mlzHNL6pc93rhxu
 s0Kj2o43MnnUJorcInjYNqPvfOjNop7+SljIERHtaCIncnBEyPDLqqg==
X-Google-Smtp-Source: AGHT+IErPZsiQSY6JyBxZBl9kFG2HQ4hdNOw+ItjJRq69/24y/TgknttycU7nujzZBCGrQ4Rf5iHjQ==
X-Received: by 2002:a05:600c:1e89:b0:45b:88ed:9558 with SMTP id
 5b1f17b1804b1-45b88ed9bc3mr45103825e9.30.1756717291731; 
 Mon, 01 Sep 2025 02:01:31 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:16 +0200
Message-ID: <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717292; x=1757322092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUudtlr6KnonZOIb+ntS/qpcUx+5p51QAmkXIOhGqJI=;
 b=IDZynsYY/j9DJpfuJPiZvVdSFjPCxqeZU/1metbUut+Oe3yqRHgOiGgrji3idoC9JY
 trVz+RTpHIb7E5AFU3pqmRe7lXzXKm3MnuMt9MdhAQ3DGi/R9ofw38YWMwYYcjBr9qv4
 3y9ama3isuLx2bK3WAVin5RdHWGS8J3NVzmJCgRq5qAWICPTaiIGzFbbdKMyGLiIWbGY
 HeDwBJjiea4lRl+CzMHEvwNHLJyCDDqumI69Rm+Qv/ST3aZ72rWkskcCRkwuuucaO17g
 dd9oTqY5ZSxsVWDhUp4UpWkVB+42iUXiXr77EL5c0vX2wegjriCjl/X7IPXEJKtyBiBX
 qbtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IDZynsYY
Subject: [Buildroot] [PATCH 07/18 v3] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
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

By moving the loop over the overlays into the script, we can generate
better error messages about how and why a skeleton or a specific overlay
is improperly setup for merged-usr.

We can also now rely on its exit code to decicde whether the skeleton or
the overlays are properly setup, rather than stash the stdout/stderr to
a Makefile variable and test the emptiness thereof.

Introduce a --type option to pass the type of root to verify, for better
error reporting. This will incidentally be usefull in a future commit,
when we need to take different actions based on whether the root is a
skeleton or an overlay.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                   | 15 ++---
 package/skeleton-custom/skeleton-custom.mk | 21 +++----
 support/scripts/check-merged-usr.sh        | 65 +++++++++++++++++-----
 3 files changed, 64 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index d4ad4629c0..a74fcc7324 100644
--- a/Makefile
+++ b/Makefile
@@ -782,17 +782,10 @@ endif
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
-	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
-		$(Q)not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
-		test -n "$$not_merged_dirs" && { \
-			echo "ERROR: The overlay in $(d) is not" \
-				"using a merged /usr for the following directories:" \
-				$$not_merged_dirs; \
-			exit 1; \
-		} || true$(sep))
-
+	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
+	support/scripts/check-merged-usr.sh \
+		--type overlay \
+		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 endif # merged /usr
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index b05c834b94..c194108307 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -26,17 +26,16 @@ endif
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
-	$(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))
+define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
+	support/scripts/check-merged-usr.sh \
+		--type skeleton \
+		$(SKELETON_CUSTOM_PATH)
+endef
 endif # merged /usr
 
-ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
-ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
-$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
-	using a merged /usr for the following directories: \
-	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
-endif
-endif
+define SKELETON_CUSTOM_CONFIGURE_CMDS
+	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS)
+endef
 
 # The target-dir-warning file and the lib{32,64} symlinks are the only
 # things we customise in the custom skeleton.
@@ -49,9 +48,7 @@ define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
 endef
 
 # For the staging dir, we don't really care what we install, but we
-# need the /lib and /usr/lib appropriately setup. Since we ensure,
-# above, that they are correct in the skeleton, we can simply copy the
-# skeleton to staging.
+# need the /lib and /usr/lib appropriately setup.
 define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index 6d31c81c21..c3b5c6419a 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -11,16 +11,48 @@
 # /usr/sbin/
 #
 # Input:
-#   $1:     the root directory (skeleton, overlay) to check
+#   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
+#   $*:             the root directories (skeleton, overlays) to check
 # Output:
-#   stdout: the list of non-compliant paths (empty if compliant).
+#   stdout:         the list of non-compliant paths (empty if compliant).
 # Exit code:
-#   0:      in case of success (stdout will be empty)
-#   !0:     if any path is improperly merged
+#   0:              in case of success (stdout will be empty)
+#   !0:             if any path is improperly merged
 #
 
-# The directory to check for merged-usr
-root="${1}"
+opts="type:"
+ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
+eval set -- "${ARGS}"
+
+type=
+while :; do
+	case "${1}" in
+	(--type)
+		type="${2}"
+		shift 2
+		;;
+	(--)
+		shift
+		break
+		;;
+	esac
+done
+
+report_error() {
+	local type="${1}"
+	local root="${2}"
+	local fmt="${3}"
+	shift 3
+
+	if ${first}; then
+		printf "The %s in %s is not properly setup:\n" \
+			"${type}" "${root}"
+	fi
+	first=false
+	# shellcheck disable=SC2059  # fmt *is* a format string
+	printf "  - ${fmt}" "${@}"
+	is_success=false
+}
 
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
@@ -42,19 +74,24 @@ is_valid_merged() {
 }
 
 test_merged() {
-	local root="${1}"
-	local dir1="${2}"
-	local dir2="${3}"
+	local type="${1}"
+	local root="${2}"
+	local dir1="${3}"
+	local dir2="${4}"
 
 	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
-		printf '%s\n' "${dir1}"
-		is_success=false
+		report_error "${type}" "${root}" \
+			'%s should be missing, or be a relative symlink to %s\n' \
+			"${dir1}" "${dir2}"
 	fi
 }
 
 is_success=true
-test_merged "${root}" "/lib" "/usr/lib"
-test_merged "${root}" "/bin" "/usr/bin"
-test_merged "${root}" "/sbin" "/usr/sbin"
+for root; do
+	first=true
+	test_merged "${type}" "${root}" "/lib" "/usr/lib"
+	test_merged "${type}" "${root}" "/bin" "/usr/bin"
+	test_merged "${type}" "${root}" "/sbin" "/usr/sbin"
+done
 
 ${is_success}
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
