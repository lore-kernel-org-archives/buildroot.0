Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ABAC27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 20:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E86C846F4;
	Sat,  1 Jun 2024 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-55__zA9zEJ; Sat,  1 Jun 2024 20:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514B2846FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514B2846FE;
	Sat,  1 Jun 2024 20:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B07AE1BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 973A6846FE
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N661qDUKqQ8q for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA984846F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA984846F4
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:19:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BC3C818B0; Sat,  1 Jun 2024 20:19:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 22:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 707318c08b5de008e3de51aa6e9b38391c3c8e37
X-Git-Newrev: 507caef3ddf5ab7d933e14303508db057c4b9501
X-Patchwork-Hint: ignore
Message-Id: <20240601201951.9BC3C818B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: Fix init script restart
 command
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

commit: https://git.buildroot.net/buildroot/commit/?id=507caef3ddf5ab7d933e14303508db057c4b9501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Restarting dnsmasq can cause constant issues: stop works, but start
fails because the new instance can't bind the socket. Another restart
immediately after works just fine:

    # /etc/init.d/S80dnsmasq restart
    Stopping dnsmasq: OK
    Starting dnsmasq:
    dnsmasq: failed to create listening socket for 192.168.128.1: Address in use
    FAIL
    # /etc/init.d/S80dnsmasq restart
    Stopping dnsmasq: FAIL
    Starting dnsmasq: OK

Solve this by waiting for process to actually stop before returning
from the stop command. Clean up the PID file after to avoid potential
issues with the PID being reused after stop. The wait could also be
placed inside the restart block, but putting it into the stop block
has the advantage that it also avoids similar issues for any other
callers.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
[yann.morin.1998@free.fr:
  - fix shellcheck
  - reflow commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore        | 1 -
 package/dnsmasq/S80dnsmasq | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 846cd8e1ec..914f3b5bb5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -552,7 +552,6 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
 package/dmraid/S20dmraid lib_sysv.Variables
-package/dnsmasq/S80dnsmasq Shellcheck
 package/docker-engine/S60dockerd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 175daf9d26..f1e1a68585 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -10,12 +10,21 @@ case "$1" in
 		printf "Starting dnsmasq: "
 		start-stop-daemon -S -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
 			--pid-file="$PIDFILE"
+		# shellcheck disable=SC2181
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		printf "Stopping dnsmasq: "
 		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+		# shellcheck disable=SC2181
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		# wait for dnsmasq process to be gone
+		while true; do
+			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+			{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
+			sleep 0.1
+		done
+		rm -f "$PIDFILE"
 		;;
 	restart|reload)
 		$0 stop
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
