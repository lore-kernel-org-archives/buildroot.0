Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE2EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B33860B24;
	Thu, 17 Feb 2022 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8USD3bOKdQOb; Thu, 17 Feb 2022 16:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A44AF6F738;
	Thu, 17 Feb 2022 16:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 209B01C1162
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D31783FA1
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUmZlsPLCUzI for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5375583F99
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BAEFC83797; Thu, 17 Feb 2022 16:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 17:34:52 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 8e734ee44396fda79dc5c61e7d30e73b100730f9
X-Git-Newrev: f4b18f72c93a4987bde541850fbef7ce1f2a06fc
X-Patchwork-Hint: ignore
Message-Id: <20220217162844.BAEFC83797@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] docs/manual: add section
 on start script recommendations
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4b18f72c93a4987bde541850fbef7ce1f2a06fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4fe33a1b47ba9c1e90c2c794cefb13962ea89b99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 96 +++++++++++++++++++++++++++++++
 docs/manual/configure.txt                 |  1 +
 2 files changed, 97 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 54d96451fe..23bd293a6c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -554,3 +554,99 @@ over time. Such patches should not be downloaded, and instead be added
 locally to the package folder.
 
 If the +.hash+ file is missing, then no check is done at all.
+
+[[adding-packages-start-script]]
+=== The +SNNfoo+ start script
+
+Packages that provide a system daemon usually need to be started somehow
+at boot.  Buildroot comes with support for several init systems, some
+are considered tier one (see xref:init-system[]), while others are also
+available but do not have the same level of integration.  Ideally, all
+packages providing a system daemon should provide a start script for
+BusyBox/SysV init and a systemd unit file.
+
+For consistency, the start script must follow the style and composition
+as shown in the reference: +package/busybox/S01syslogd+. An annotated
+example of this style is shown below. There is no specific coding style
+for systemd unit files, but if a package comes with its own unit file,
+that is preferred over a buildroot specific one, if it is compatible
+with buildroot.
+
+The name of the start script is composed of the +SNN+ and the daemon
+name.  The +NN+ is the start order number which needs to be carefully
+chosen.  For example, a program that requires networking to be up should
+not start before +S40network+.  The scripts are started in alphabetical
+order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
+start thereafter.
+
+------------------------------
+01: #!/bin/sh
+02:
+03: DAEMON="syslogd"
+04: PIDFILE="/var/run/$DAEMON.pid"
+05:
+06: SYSLOGD_ARGS=""
+07:
+08: # shellcheck source=/dev/null
+09: [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+10:
+11: # BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
+12: # and use "-m" to instruct start-stop-daemon to create one.
+13: start() {
+14: 	printf 'Starting %s: ' "$DAEMON"
+15: 	# shellcheck disable=SC2086 # we need the word splitting
+16: 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+17: 		-- -n $SYSLOGD_ARGS
+18: 	status=$?
+19: 	if [ "$status" -eq 0 ]; then
+20: 		echo "OK"
+21: 	else
+22: 		echo "FAIL"
+23: 	fi
+24: 	return "$status"
+25: }
+26:
+27: stop() {
+28: 	printf 'Stopping %s: ' "$DAEMON"
+29: 	start-stop-daemon -K -q -p "$PIDFILE"
+30: 	status=$?
+31: 	if [ "$status" -eq 0 ]; then
+32: 		rm -f "$PIDFILE"
+33: 		echo "OK"
+34: 	else
+35: 		echo "FAIL"
+36: 	fi
+37: 	return "$status"
+38: }
+39:
+40: restart() {
+41: 	stop
+42: 	sleep 1
+43: 	start
+44: }
+45:
+46: case "$1" in
+47: 	start|stop|restart)
+48: 		"$1";;
+49: 	reload)
+50: 		# Restart, since there is no true "reload" feature.
+51: 		restart;;
+52: 	*)
+53: 		echo "Usage: $0 {start|stop|restart|reload}"
+54: 		exit 1
+55: esac
+------------------------------
+
+*Note:* programs that support reloading their configuration in some
+fashion (+SIGHUP+) should provide a +reload()+ function similar to
++stop()+.  The +start-stop-daemon+ supports +-K -s HUP+ for this.
+It is recommended to always append +-x "/sbin/$DAEMON"+ to all the
++start-stop-daemon+ commands to ensure signals are set to a PID that
+matches +$DAEMON+.
+
+Both start scripts and unit files can source command line arguments from
++/etc/default/foo+, in general, if such a file does not exist it should
+not block the start of the daemon, unless there is some site specirfic
+command line argument the daemon requires to start.  For start scripts a
++FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in and
+the user can override this from +/etc/default/foo+.
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index c9eef567f4..60860d2c71 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -377,6 +377,7 @@ good solution.
 Note that if +systemd+ is chosen as init system, /dev management will
 be performed by the +udev+ program provided by +systemd+.
 
+[[init-system]]
 === init system
 
 The _init_ program is the first userspace program started by the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
