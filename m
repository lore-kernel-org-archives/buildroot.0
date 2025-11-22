Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2AECFC531
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F9842907;
	Sat, 22 Nov 2025 12:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVaGQokhJC82; Sat, 22 Nov 2025 12:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A91D428EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A91D428EE;
	Sat, 22 Nov 2025 12:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB235158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C90C5428EE
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcrx99KYOKqY for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E862E428DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E862E428DB
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:30:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D647585CFB; Sat, 22 Nov 2025 12:30:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 13:29:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe01d702a19a1b83bffc18141886f2e04fe2439d
X-Git-Newrev: 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
X-Patchwork-Hint: ignore
Message-Id: <20251122123049.D647585CFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/check-merged: use getopts
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=793ebd5d28095c8df45a0d183d273d8a84b3f0a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
options. As it's just for use in an internal script, we can live with
the less descriptive options, though.

Switch to using getopts, it removes the need for a new host dependency.

Fixes: 1187c34d88e16191753bfd0c3b4cd2f914813f31
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Makefile                                   |  6 ++---
 package/skeleton-custom/skeleton-custom.mk |  6 ++---
 support/scripts/check-merged               | 35 +++++++++---------------------
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
