Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE9CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D4A61355;
	Wed, 22 Oct 2025 16:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWtzFPO9jx4x; Wed, 22 Oct 2025 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9641961336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9641961336;
	Wed, 22 Oct 2025 16:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B44CDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCC283F8C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC6CN4d7Tq-z for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6322583F71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6322583F71
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5303087722; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 11f8c9225bbb667b638c1d347ace1b1109f0dd5b
X-Git-Newrev: 176c0dd14175b711302052c29940ff001eb3b5d6
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.5303087722@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/audit/S02auditd:
 fix SELinux label issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=176c0dd14175b711302052c29940ff001eb3b5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

"mkdir -Z" tries to create the directory with the default type context
and does not accept any parameter, leading to mkdir creating a
directory by the name of "system_u:object_r:auditd_log_t" (or failing
to, with a read-only rootfs). Use "--context=" instead to specify the
context.

Letting start-stop-daemon create the auditd PID file leads to an
incorrect label, with type "initrc_runtime_t" instead of
"auditd_runtime_t", which would prevent auditd from writing or
deleting it. Auditd manages its own PID file and daemonizes by
default, so simply drop the --background and --make-pidfile options
from start-stop-daemon.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3fdce2464744ad1b8a85ee37b6ef830806d81157)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/audit/S02auditd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index f32f01714e..97c43bc66f 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -18,13 +18,13 @@ start(){
 	# the directory with SELinux permissions if possible
 	if command -v selabel_lookup >/dev/null 2>&1; then
 		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
-		mkdir -p /var/log/audit -Z "${audit_log_selable}"
+		mkdir -p --context="${audit_log_selable}" /var/log/audit
 	else
 		mkdir -p /var/log/audit
 	fi
 
-	start-stop-daemon --start --background --make-pidfile \
-		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	start-stop-daemon --start --pidfile "${PIDFILE}" \
+		--exec "/usr/sbin/${DAEMON}"
 	status=$?
 	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
