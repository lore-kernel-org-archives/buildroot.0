Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C12CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B3A40DA6;
	Wed, 22 Oct 2025 16:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ4N06Zg1M6i; Wed, 22 Oct 2025 16:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A9B40DA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A9B40DA8;
	Wed, 22 Oct 2025 16:42:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C229DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29C483DCF
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYzih6Ez6CWH for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC7883DC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC7883DC5
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CC1D8615A; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:38:40 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 10af6326d83c6739efb78171a493e87fde411982
X-Git-Newrev: b80d90654ada6e573b406e284b55cb44ece3a2de
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.1CC1D8615A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/audit/S02auditd:
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

commit: https://git.buildroot.net/buildroot/commit/?id=b80d90654ada6e573b406e284b55cb44ece3a2de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
