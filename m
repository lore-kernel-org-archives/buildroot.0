Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0731C8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 10:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5DA60EE9;
	Sat,  5 Jul 2025 10:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIGc5gOvj1D2; Sat,  5 Jul 2025 10:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7579960A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7579960A50;
	Sat,  5 Jul 2025 10:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 339F115F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1997A40AC8
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2eDHEIiSCop for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 10:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7797140061
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7797140061
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:27:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E0885F1A; Sat,  5 Jul 2025 10:27:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 12:14:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c41a06bbd92c23881f2d324db3cb4aaab09906dc
X-Git-Newrev: 8f09106e81ab5ead9d3cb61d000334068b33e04d
X-Patchwork-Hint: ignore
Message-Id: <20250705102709.66E0885F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/test-pkg: stop on sigint
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f09106e81ab5ead9d3cb61d000334068b33e04d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When SIGINT is issued for a package test run, it will abort the active
toolchain run then proceed to the next. If a user is running the entire
default toolchain set (`-a`), they can be required to invoke SIGINT
multiple times to stop a run.

This commit uses a SIGINT hook to flag a shutdown state and stop further
attempts to run anymore toolchain tests.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
