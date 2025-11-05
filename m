Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE6FCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A92412BE;
	Wed,  5 Nov 2025 22:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjBadl8JAPFg; Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B69D412D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B69D412D4;
	Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B21A5462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98A08613D7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOcc_6uytX8A for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA36611AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBA36611AD
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B93FE83D2C; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bc1453856511e8f89733e2e14b289709035c257
X-Git-Newrev: 74b29f34ba1a807e2a213f8deaec20a8bb253a87
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.B93FE83D2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: also exit in error on
 improperly merged-usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=74b29f34ba1a807e2a213f8deaec20a8bb253a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/check-merged-usr.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index ac676185dd..6d31c81c21 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -14,6 +14,9 @@
 #   $1:     the root directory (skeleton, overlay) to check
 # Output:
 #   stdout: the list of non-compliant paths (empty if compliant).
+# Exit code:
+#   0:      in case of success (stdout will be empty)
+#   !0:     if any path is improperly merged
 #
 
 # The directory to check for merged-usr
@@ -45,9 +48,13 @@ test_merged() {
 
 	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
 		printf '%s\n' "${dir1}"
+		is_success=false
 	fi
 }
 
+is_success=true
 test_merged "${root}" "/lib" "/usr/lib"
 test_merged "${root}" "/bin" "/usr/bin"
 test_merged "${root}" "/sbin" "/usr/sbin"
+
+${is_success}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
