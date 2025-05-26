Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9927C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AB983BA9;
	Sat, 31 May 2025 16:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9lyiW-8A3Vu; Sat, 31 May 2025 16:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B1183BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B1183BA5;
	Sat, 31 May 2025 16:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D708236
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0606C83C8B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4_va8vn6pDp for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2705E83BFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2705E83BFC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 257CE87578; Sat, 31 May 2025 16:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:49:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 276fc22e66f9f9aed490338b967c3aedffd70084
X-Git-Newrev: 01296fc5a885ad7c55f3641b7b7a4c1fbf4eb646
X-Patchwork-Hint: ignore
Message-Id: <20250531165510.257CE87578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/audit/S02auditd:
 fix shellcheck and check-package warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=01296fc5a885ad7c55f3641b7b7a4c1fbf4eb646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixup S20audit to pass shellcheck -oall and check-package. The file now
closely resembles package/busybox/S01syslogd.

Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
all work with busybox ash shell.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: remove it from .checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit cbabeb507744e220f5edaabb3a1549c1399adad6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore     |  1 -
 package/audit/S02auditd | 66 ++++++++++++++++++++++++++++++++-----------------
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2758b62f8b..fc682e5105 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -280,7 +280,6 @@ package/asterisk/0004-install-samples-need-the-data-files.patch lib_patch.Upstre
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_patch.Upstream
 package/at/S99at lib_sysv.Indent lib_sysv.Variables
 package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
-package/audit/S02auditd Shellcheck lib_sysv.Variables
 package/aufs-util/0001-remove-user-settings.patch lib_patch.Upstream
 package/aufs-util/0002-no-check-ver.patch lib_patch.Upstream
 package/aufs-util/0003-no-strip-lib.patch lib_patch.Upstream
diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index dd3dc22d6d..f32f01714e 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -8,52 +8,74 @@
 #              will be sent to syslog.
 #
 
-NAME=auditd
-DAEMON=/usr/sbin/${NAME}
-CONFIG=/etc/audit/auditd.conf
-PIDFILE=/var/run/${NAME}.pid
+DAEMON="auditd"
+PIDFILE="/var/run/${DAEMON}.pid"
 
 start(){
-	printf "Starting ${NAME}: "
+	printf "Starting %s: " "${DAEMON}"
 
 	# Create dir to store log files in if one doesn't exist. Create
 	# the directory with SELinux permissions if possible
-	command -v selabel_lookup >/dev/null 2>&1
-	if [ $? = 0 ]; then
-		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3`
+	if command -v selabel_lookup >/dev/null 2>&1; then
+		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
+		mkdir -p /var/log/audit -Z "${audit_log_selable}"
 	else
 		mkdir -p /var/log/audit
 	fi
 
-	# Run audit daemon executable
-	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
-
-	if [ $? = 0 ]; then
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	status=$?
+	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
 		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
 		echo "OK"
 	else
 		echo "FAIL"
 	fi
+	return "${status}"
 }
 
 stop(){
-	printf "Stopping ${NAME}: "
-
-	start-stop-daemon -K -q -p ${PIDFILE}
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "${DAEMON}"
+	start-stop-daemon --stop --pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "${status}"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "${PIDFILE}" \
+		--exec "/sbin/${DAEMON}"; do
+		sleep 0.1
+	done
+	rm -f "${PIDFILE}"
+	return "${status}"
 }
 
 reload(){
-	printf "Reloading ${NAME} configuration: "
-	start-stop-daemon --stop -s 1 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Reloading %s configuration: " "${DAEMON}"
+	start-stop-daemon --stop --signal HUP --pidfile "${PIDFILE}" 1>/dev/null
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "${status}"
 }
 
 rotate(){
-	printf "Rotating ${NAME} logs: "
-	start-stop-daemon --stop -s 10 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Rotating %s logs: " "${DAEMON}"
+	start-stop-daemon --stop --signal SIGUSR1 --pidfile "${PIDFILE}" 1>/dev/null
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "${status}"
 }
 
 case "$1" in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
