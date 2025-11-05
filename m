Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3500CCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8EF412DF;
	Wed,  5 Nov 2025 22:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1V06jhguyaT; Wed,  5 Nov 2025 22:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710D74131E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 710D74131E;
	Wed,  5 Nov 2025 22:30:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 539C6462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D61BD80E93
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF6tIULGz8Uu for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D1A80E7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D1A80E7F
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2D1783DAC; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc3cdc6d1ec61730ecb2968778c21a59deab9d6e
X-Git-Newrev: 428ac6fcc4c286dd013ada411bf1ab5c0ad11614
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.E2D1783DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: add support for merged /usr/sbin
 (aka merged-bin)
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

commit: https://git.buildroot.net/buildroot/commit/?id=428ac6fcc4c286dd013ada411bf1ab5c0ad11614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Makefile                                   |  1 +
 package/skeleton-custom/skeleton-custom.mk |  1 +
 support/scripts/check-merged               | 22 +++++++++++++++++++---
 system/Config.in                           | 11 +++++++++++
 system/skeleton/usr/sbin/.empty            |  0
 system/system.mk                           | 14 +++++++++++++-
 6 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 6b7b61c01a..87dbe0e2d0 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
