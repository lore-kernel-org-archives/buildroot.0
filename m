Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C3CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E3A412F5;
	Wed,  5 Nov 2025 22:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6NavwtgBu9r; Wed,  5 Nov 2025 22:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729F4412ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729F4412ED;
	Wed,  5 Nov 2025 22:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C08EB00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B408480E92
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpFn05Cgc6wY for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E879380E85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E879380E85
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA704828BB; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eb873bda0c019269cefe04d8c06abea2b371b37
X-Git-Newrev: fc3cdc6d1ec61730ecb2968778c21a59deab9d6e
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.DA704828BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts;
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc3cdc6d1ec61730ecb2968778c21a59deab9d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Makefile                                   |  3 +--
 package/skeleton-custom/skeleton-custom.mk | 11 ++---------
 support/scripts/check-merged               | 22 +++++++++++++++-------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 935893be17..6b7b61c01a 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
