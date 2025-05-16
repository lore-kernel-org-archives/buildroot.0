Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA82AC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9B4607F8;
	Fri, 16 May 2025 17:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ddVfXO8cKyW; Fri, 16 May 2025 17:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3C76121C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3C76121C;
	Fri, 16 May 2025 17:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8580F185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735A8406BC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DICv2peZdJoX for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2031405C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2031405C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:45:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C049A86CDE; Fri, 16 May 2025 17:45:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:45:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3481a9643fc7223e400ed877f08ade34d44e6b78
X-Git-Newrev: 5009fd2436300383a50b3d23b80cdccd20c9d262
X-Patchwork-Hint: ignore
Message-Id: <20250516174552.C049A86CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: include defconfigs in
 sub-directories in list-defconfigs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5009fd2436300383a50b3d23b80cdccd20c9d262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, list-defconfigs only lists the defconfigs that live
 live in the top-level configs/ directory. For the in-tree defconfigs
this is indeed the case, but it is possible to manage the configs in a
br2-external tree with sub-directories.

A few examples:
  - for a given board, a first defconfig is the full system, and a
    second is the rescue system;
  - for a given board, two defconfigs implement an A/B feature set;
  - a set of configurations targetting various famillies of systems each
    running on different hardware, sorted per familly.

Extend list-defconfigs to look for and report defconfigs in
sub-directories of the top-level configs/.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 411e1de515..c0a41cabd5 100644
--- a/Makefile
+++ b/Makefile
@@ -1218,7 +1218,7 @@ help:
 # $(2): br2-external name, empty for bundled
 define list-defconfigs
 	@first=true; \
-	for defconfig in $(1)/configs/*_defconfig; do \
+	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
@@ -1228,7 +1228,7 @@ define list-defconfigs
 			fi; \
 			first=false; \
 		fi; \
-		defconfig="$${defconfig##*/}"; \
+		defconfig="$${defconfig#$(1)/configs/}"; \
 		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
 	done; \
 	$${first} || printf "\n"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
