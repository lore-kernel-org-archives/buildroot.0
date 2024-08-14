Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43485E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E714841D0;
	Fri,  6 Sep 2024 20:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ--cPy4g0kE; Fri,  6 Sep 2024 20:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B88848447B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B88848447B;
	Fri,  6 Sep 2024 20:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4D71BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B1A760E13
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmgYHfeSiwmK for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F8C6076B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90F8C6076B
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E0A086EE3; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:17:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 439ddbc5bbd56ab15d4edc0573092af3a724d7fb
X-Git-Newrev: 5f76c30024dab07cad46f952c74e171733a32730
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.8E0A086EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: support configuration via
 /etc/default/udevd
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f76c30024dab07cad46f952c74e171733a32730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Take the arguments for the daemon and the "udevadm settle" command
from variables and support defining them in /etc/default/udevd.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/S10udev | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 4e799d6507..6f20fc51f5 100644
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -16,6 +16,14 @@
 #	/dev/zero, /dev/null -- that's needed to boot and run this script.
 #
 
+DAEMON="udevd"
+
+SETTLE_TIMEOUT=30
+UDEVD_ARGS="-d"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
@@ -25,10 +33,10 @@ case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd -d || { echo "FAIL"; exit 1; }
+        /sbin/udevd $UDEVD_ARGS || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=30 || echo "udevadm settle failed"
+        udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
         echo "done"
         ;;
     stop)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
