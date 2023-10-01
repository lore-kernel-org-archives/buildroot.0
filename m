Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C083E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A235883F4A;
	Sun,  1 Oct 2023 09:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A235883F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEaW4AvQBxgD; Sun,  1 Oct 2023 09:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009A083F48;
	Sun,  1 Oct 2023 09:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009A083F48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6935D1BF342
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFF161180
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFF161180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iee2onyWOqHU for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 758256104E
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 758256104E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C1383D99; Sun,  1 Oct 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 11:47:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1351222486b93b72c00057fb3401d40967025164
X-Git-Newrev: 14c4bd7bf8150283e158c50df87c77d63bb1b73c
X-Patchwork-Hint: ignore
Message-Id: <20231001095229.59C1383D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: fix SysV init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=14c4bd7bf8150283e158c50df87c77d63bb1b73c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the S10hyperv SysV init script which expects binaries
to be locate in /sbin while they are installed in /usr/sbin. Please
note, that the systemd init scripts correctly reference them.
Furthermore, the SysV init script did not check for an actual HyperV
environment to be present, which is also corrected. In addition, this
commit also fixes check-package warnings regarding a missing DAEMON
definition.

Signed-off-by: Jens Maus <mail@jens-maus.de>
[Peter: drop from .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore           | 1 -
 package/linux-tools/S10hyperv | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 95695fa243..28de1745e4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -797,7 +797,6 @@ package/linux-fusion/0001-fix-for-linux-4-and-above.patch Upstream
 package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch Upstream
 package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch Upstream
 package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch Upstream
-package/linux-tools/S10hyperv Variables
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch Upstream
 package/linuxptp/S65ptp4l Indent Shellcheck
diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index 32887d1b6c..be9ed2c5df 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -2,14 +2,18 @@
 
 PROGS="@PROGS@"
 PIDDIR="/var/run"
+DAEMON="hyperv"
 
 # shellcheck source=/dev/null
-[ -r "/etc/default/hyperv" ] && . "/etc/default/hyperv"
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# only continue if we are in a HyperV platform
+[ -e "/sys/bus/vmbus" ] || exit 0
 
 start_one() {
 	printf 'Starting %s: ' "$1"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDDIR/$1.pid" -x "/sbin/$1" -- -n
+	start-stop-daemon -b -m -S -q -p "$PIDDIR/$1.pid" -x "/usr/sbin/$1" -- -n
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
