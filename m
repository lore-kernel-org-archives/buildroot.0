Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD07CCFA1A
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5399484248;
	Wed,  5 Nov 2025 22:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaU-nFY_CQms; Wed,  5 Nov 2025 22:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575AD841CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575AD841CB;
	Wed,  5 Nov 2025 22:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D86E462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA82411E7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0yzhNPGE_XC for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBCFA412B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBCFA412B7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA10B83D96; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 428ac6fcc4c286dd013ada411bf1ab5c0ad11614
X-Git-Newrev: e38cd466c7ca9e29777eef6bee0c4d126c90d5ff
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.EA10B83D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: reject skeletons or
 overlays that are unexpectedly merged
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

commit: https://git.buildroot.net/buildroot/commit/?id=e38cd466c7ca9e29777eef6bee0c4d126c90d5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we partially accept that a skeleton or a rootfs overlay be
merged:
  - for unmerged, we accept all kind of situations: unmerged, partially
    merged, badly merged, merged-usr or merged-bin, arbitrary relative
    or absolute symlinks, and whatnots;
  - for merged-usr, we strictly require a properly set up merged-usr,
    and we refuse a merged-bin;
  - for merged-bin, we stricty require a properly set up merged-bin.

The unmerged case is inconsistent with the other cases, especially it
allows for arbitrary symlinks that may point to arbitrary locations that
may even not belong to $(TARGET_DIR) at all...

We fix that by ensuring that the skeleton and overlays strictly adhere
to the merge-level of the configuration; i.e. for an unmerged config, we
require that the skeleton and overlays be strictly unmerged, that is,
/bin, /lib, and /sbin, and their counterparts in /usr, are actual
directories.

Thus, for all three types of merge level, the skeleton and overlays must
match the configured merge level.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/check-merged | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index fbda49f1c0..bff6ae2b7b 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -3,16 +3,21 @@
 # Check if a given custom skeleton or overlay complies to the merged
 # requirements:
 #
-# - for merged-usr:
-#   /bin            missing, or a relative symlink to usr/bin
-#   /lib            missing, or a relative symlink to usr/lib
-#   /sbin           missing, or a relative symlink to usr/sbin
+# - for unmerged:
+#   /bin            missing*, or an existing directory; not a symlink
+#   /lib            missing*, or an existing directory; not a symlink
+#   /sbin           missing*, or an existing directory; not a symlink
 #   /usr/bin/       missing*, or an existing directory; not a symlink
 #   /usr/lib/       missing*, or an existing directory; not a symlink
 #   /usr/sbin/      missing*, or an existing directory; not a symlink
 #
 # *: must be present for skeletons, can be missing for overlays
 #
+# - for merged-usr: all of the above, except:
+#   /bin            missing, or a relative symlink to usr/bin
+#   /lib            missing, or a relative symlink to usr/lib
+#   /sbin           missing, or a relative symlink to usr/sbin
+#
 # - for merged-bin: all of the above, except:
 #   /usr/sbin       missing, or a relative symlink to bin (thus points
 #                   to /usr/bin)
@@ -119,9 +124,9 @@ test_dir() {
 is_success=true
 for root; do
 	first=true
+	test_dir "${type}" "${root}" "/" "usr/bin"
+	test_dir "${type}" "${root}" "/" "usr/lib"
 	if ${merged_usr}; then
-		test_dir "${type}" "${root}" "/" "usr/bin"
-		test_dir "${type}" "${root}" "/" "usr/lib"
 		test_merged "${type}" "${root}" "/" "bin" "usr/bin"
 		test_merged "${type}" "${root}" "/" "lib" "usr/lib"
 		test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
@@ -130,6 +135,11 @@ for root; do
 		else
 			test_dir "${type}" "${root}" "/" "usr/sbin"
 		fi
+	else
+		test_dir "${type}" "${root}" "/" "bin"
+		test_dir "${type}" "${root}" "/" "lib"
+		test_dir "${type}" "${root}" "/" "sbin"
+		test_dir "${type}" "${root}" "/" "usr/sbin"
 	fi
 done
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
