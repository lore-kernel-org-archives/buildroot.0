Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9736FCCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 20:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD2A821DD;
	Wed,  8 Oct 2025 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pymOt0Fletzw; Wed,  8 Oct 2025 20:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA45821D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA45821D9;
	Wed,  8 Oct 2025 20:27:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01614D84
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D777740CCC
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTe0MhN4ECP7 for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37468404AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37468404AC
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 256D386B59; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Oct 2025 22:16:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0449bef9a0a62ea0cea661e7d7d9f20c0a4e3df8
X-Git-Newrev: 3fdce2464744ad1b8a85ee37b6ef830806d81157
X-Patchwork-Hint: ignore
Message-Id: <20251008202753.256D386B59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit/S02auditd: fix SELinux label
 issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fdce2464744ad1b8a85ee37b6ef830806d81157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
