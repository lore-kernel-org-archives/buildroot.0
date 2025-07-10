Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3616C83F22
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E2883F5C;
	Fri, 11 Jul 2025 10:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2ZLnZW2091Q; Fri, 11 Jul 2025 10:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D71883F5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D71883F5A;
	Fri, 11 Jul 2025 10:21:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 158D6968
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DA8B40E08
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3xblwgvPLAT for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BA440E10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87BA440E10
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85F9F86353; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:23 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4f2d5b0e5041fe2b95744c61772e1f2615857b0f
X-Git-Newrev: 9e0870e09e04582bb5190ade1aa60305df89626f
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.85F9F86353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] utils/test-pkg: stop on
 sigint
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e0870e09e04582bb5190ade1aa60305df89626f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

When SIGINT is issued for a package test run, it will abort the active
toolchain run then proceed to the next. If a user is running the entire
default toolchain set (`-a`), they can be required to invoke SIGINT
multiple times to stop a run.

This commit uses a SIGINT hook to flag a shutdown state and stop further
attempts to run anymore toolchain tests.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8f09106e81ab5ead9d3cb61d000334068b33e04d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/test-pkg | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 19d8713d6a..cd77964252 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,6 +3,11 @@ set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
+abort=0
+
+do_abort() {
+    abort=1
+}
 
 do_clean() {
     if [ -n "${TEMP_CONF}" ]; then
@@ -67,7 +72,8 @@ main() {
         esac
     done
 
-    trap do_clean INT TERM HUP EXIT
+    trap do_abort INT
+    trap do_clean TERM HUP EXIT
 
     if [ -z "${cfg}" ]; then
         pkg_br_name="${pkg//-/_}"
@@ -139,6 +145,10 @@ main() {
         (3) : $((nb_legal++)); printf "FAILED\n";;
         (4) : $((nb_show++)); printf "FAILED\n";;
         esac
+
+        if [ "${abort}" -eq 1 ]; then
+            return 1
+        fi
     done
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
