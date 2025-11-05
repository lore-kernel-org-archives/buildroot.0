Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4EBCCFA1A
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FAF741321;
	Wed,  5 Nov 2025 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3kDbikN9GzP; Wed,  5 Nov 2025 22:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F15B41326
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F15B41326;
	Wed,  5 Nov 2025 22:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 025CC462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BE8E80F8B
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4qCQnt9VzVV for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D010680E5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D010680E5E
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C194783D96; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74b29f34ba1a807e2a213f8deaec20a8bb253a87
X-Git-Newrev: 1187c34d88e16191753bfd0c3b4cd2f914813f31
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.C194783D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: move merged-usr errors
 message into check-merged-usr.sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=1187c34d88e16191753bfd0c3b4cd2f914813f31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By moving the loop over the overlays into the script, we can generate
better error messages about how and why a skeleton or a specific overlay
is improperly setup for merged-usr.

We can also now rely on its exit code to decide whether the skeleton or
the overlays are properly setup, rather than stash the stdout/stderr to
a Makefile variable and test the emptiness thereof.

Introduce a --type option to pass the type of root to verify, for better
error reporting. This will incidentally be usefull in a future commit,
when we need to take different actions based on whether the root is a
skeleton or an overlay.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Makefile                                   | 15 ++-----
 package/skeleton-custom/skeleton-custom.mk | 21 +++++-----
 support/scripts/check-merged-usr.sh        | 65 +++++++++++++++++++++++-------
 3 files changed, 64 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index b8678ea15b..77ca3b4702 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
