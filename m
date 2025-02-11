Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC02C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8B780D3B;
	Tue, 11 Feb 2025 17:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGUZGo2cgdgP; Tue, 11 Feb 2025 17:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6681780DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6681780DBB;
	Tue, 11 Feb 2025 17:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0AE194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6DD560F28
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GlS5nA32b6w for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FBDB60F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBDB60F21
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28C7B8752C; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Feb 2025 17:52:23 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 37e2cdc87ef3b3fc854f003c9ff9f882d2ee4d1d
X-Git-Newrev: be7d47d223dbb11c1cd7dc2faa3722d0b94c86b0
X-Patchwork-Hint: ignore
Message-Id: <20250211170133.28C7B8752C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/mdnsd/S50mdnsd:
 do not clobber exit code
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be7d47d223dbb11c1cd7dc2faa3722d0b94c86b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

As pointed out by shellcheck, the exit code of the start/stop/restart/reload
command is clobbered by the 'echo "FAIL'" statement:

In package/mdnsd/S50mdnsd line 52:
exit $?
     ^-- SC2320 (warning): This $? refers to echo/printf, not a previous command. Assign to variable to avoid it being overwritten.

So introduce a $status variable to keep track of it, similar to how it is
done in S40iwd.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit be20c12e157c0e67875d8031de17df41a9c55679)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdnsd/S50mdnsd | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 1c2b71802c..6d77671396 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -36,7 +36,9 @@ reload() {
 
 case "$1" in
 	start|stop|restart|reload)
-		if "$1"; then
+		"$1"
+		status=$?
+		if [ "$status" -eq 0 ]; then
 			echo "OK"
 		else
 			echo "FAIL"
@@ -48,4 +50,4 @@ case "$1" in
 		;;
 esac
 
-exit $?
+exit "$status"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
