Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA556CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC676068B;
	Fri, 13 Oct 2023 14:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC676068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdFJ1NanAFyu; Fri, 13 Oct 2023 14:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B7F6F63C;
	Fri, 13 Oct 2023 14:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B7F6F63C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0B11BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 150FA40543
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150FA40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JxIZDmmx5km for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D510340137
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D510340137
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3994843FE; Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:33:11 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 67c5936f4249b8edcda8de9e70146d332730524a
X-Git-Newrev: 4ede63c069d81aaabbe1960d4ff63689d2c2b67a
X-Patchwork-Hint: ignore
Message-Id: <20231013144706.C3994843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/linux-tools: fix
 SysV init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ede63c069d81aaabbe1960d4ff63689d2c2b67a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 14c4bd7bf8150283e158c50df87c77d63bb1b73c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore           | 1 -
 package/linux-tools/S10hyperv | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1ff0f4e0c0..526df2d781 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -825,7 +825,6 @@ package/linux-fusion/0001-fix-for-linux-4-and-above.patch Upstream
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
