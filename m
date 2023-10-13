Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91769CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4069960F90;
	Fri, 13 Oct 2023 14:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4069960F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WehjymMc53P; Fri, 13 Oct 2023 14:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA346F56D;
	Fri, 13 Oct 2023 14:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA346F56D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2FC1BF99A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC8E4049A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC8E4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vp1ueGkwzPNj for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A937840137
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A937840137
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F3F847A0; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:32:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4cb43fc95700b648933587001a4e29f968b065fb
X-Git-Newrev: 2055dc5ae57298aa6aa4e81b985affa5577c7e01
X-Patchwork-Hint: ignore
Message-Id: <20231013144605.92F3F847A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/linux-tools: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=2055dc5ae57298aa6aa4e81b985affa5577c7e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 4faa3a8b8f..dbff352d3b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -93,7 +93,6 @@ package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch Sob
 package/libiio/S99iiod Shellcheck Variables
 package/libmad/0001-mips-h-constraint-removal.patch Sob
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
-package/linux-tools/S10hyperv Variables
 package/linuxptp/S65ptp4l Indent Shellcheck
 package/linuxptp/S66phc2sys Indent Shellcheck
 package/lirc-tools/S25lircd Indent Variables
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
