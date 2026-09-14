Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01558C88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E1F4053D;
	Mon, 14 Sep 2026 19:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JokbYTCI252F; Mon, 14 Sep 2026 19:47:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AFC704052A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789415266;
	b=IM0eHSsIDl/MustWLQnO9O/QNwg1PPfMKB4kBW1YQW6Yn/mTxdHVuFpOMD4hQW4OzrB+
	 uS11eT6JLt3Fod72Ut/k+yYeiCcZErC3vntbd4OchvmCjX4mrU7Ya+97qZCZiVo5E+7SB
	 9jH8Xq3wzBMRoqM18DelWW/FbOu0YLXIXNroVHDm2QYJFieQbSTPsMyIdJDNe2iE5RKTv
	 wvbG+c15861mHgcsQVFjCKG3fjcoeuyWoVT2nSp4awM/SVXduNnbboYeLj9Iarh0H4m2g
	 ZbjZ1i/trinD2PfVXp46MLrLVvmaSuRkiCrBM2K7dL0UgycxHNvrETu0v4DDoXcFK+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789415266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8hUBVfA/W+sSLWhzScUAWGImCv7mRcu0PJ+V2nTkpd4=;
	b=su8wwouU+z4kMnSi0ReJR5aies4npUdjRNQBt+WBRYbZ29d+PWgnOJg6LlBGbR9jj7Fi
	 GGuzP89fBpZFIjb4bkZfI6WOtmB19SD39KrmxSahNDRGS5ycnlynPSA441xbrwA1DZZ9O
	 AdPt9nVtJYOstfsbPbVHiasEK8JWW+Y4YfJ++cqCCzkZVgnhv7y+Jo9JHBe+swSJWDevu
	 wa8aVbATMNXoeYSJPIK2TyafUVWvCsm7rlumiSExJa17eo/7JcYk0zLJy9KVkGapAIUE7
	 OLvS57XB4Oq2d/aCuSUGYVmac5jHIyIb7wr9qpMIaNzHf0qAJQ3UDaq+BMcJRJNzyEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789415266;
	bh=8hUBVfA/W+sSLWhzScUAWGImCv7mRcu0PJ+V2nTkpd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cs5hicS363MbcvsJoJaizIfdwK6beBsJu997J5fKC1UtZY+hJ4Oj7V4fWUKMFU+I7
	 qDEi56pyZx8+idFEnuHhElPASz622jux6LNPgLEcF+yKDnHCWX4WV3hwzmCN3xzmY/
	 VeCHC9dX/7XO0AoutjYqBiphfjxcwXUpBqeIA2TrVyXCE7Mh+9JvTQSdNoaccKv3bj
	 rdte0dI4Zo3rgWxRXAXJNxHs+mgU3Z/+O9FYGktqT7q4FRyDUePHVhElkqvt8ljprh
	 40OBbMSnwbHx8Dbmecgik5iuBzLLvizMGjOgNwACCN08PoLr9MWWWK4mf/KzUGkwZm
	 VdafKFcrcszeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC704052A;
	Mon, 14 Sep 2026 19:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28AB9465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA7B403C4
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jgdawkZ8wry for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:47:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 52D8C403EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789415263;
 b=qiHlkFBmMUOs4ao8yQbmwk6FMhDLe9Pw1LVBNvvnOPOnTr7lJSZXKASYDGM7HewP9+ci
 98mnaW6DU9g/oepjMAmLOMvA0H9Vl0gq4TEQ3lcbBqX84AMM7cZMXdilWpYJFluRD/6UX
 qiUSWJ0zAuM2aP+lWWo1C+1jWigl6xxHef4vf6z95OuCq0KrSI2Ut3gRJGHKEI+IpsvOK
 pzcOp14FhNHMdn0nxQplG3CmW9RoqR9eAubO5VEJwMT0t7i59scS1VIcQIk9HdK5tv4W4
 8H2k1o4M+b5vjXtkhXy+gNJQo/HOyZs67X7WmJZzSj27F0Y7y1lW+BK8BSlRwcNS/fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789415263;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=r8dXVcRTRWaWAVxdk9gFWC7SOCsD1MQjjDDmJ+2/2B0=;
 b=DdkW5VOfTnV3HJT62jF17apymXYojYIutflIRGs0bYLfRqZRIRvqjaSnlE0yI1u/lqb2
 vHKKGhvGHqQhehVyn/z91RPSgFVbXfkTgR3dn7JSfmtTC7iJuvrNA40bZOZN+TehPzloZ
 DHxmv9QGa87tMg0jX2h1EXtHgP9It0arI0DqaopfyXBDMMmHYyxPn3Vq5DHuXdoxzfFLY
 ZSz7mBi/ot5zCNChq/XA20JaGEt0VK3uK5ogDLldifsTSbJMj95FA+6OO87e7ZBZejJLQ
 HSOzSyP17hrz5J4PxAorOzPd1ukKjl+MTnaSEUDolGGQsqPC48OuAB447gYJY4Lvk3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52D8C403EE
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C63EA95CB5; Mon, 14 Sep 2026 19:46:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:36:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03e4bebcd21a8d25c68f1b225498de5db10d8edc
X-Git-Newrev: 2fd1f6b629862f48e832d7e0379a7b48dc9eae42
X-Patchwork-Hint: ignore
Message-Id: <20260914194637.C63EA95CB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: rework start script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2fd1f6b629862f48e832d7e0379a7b48dc9eae42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

check-package reports six warnings on S60lldpd: indentation with
spaces, no DAEMON variable, and shellcheck complaints.

The script also masks failures, the exit status of
"[ $? = 0 ] && echo OK || echo FAIL" is the one of echo, so start and
stop always return success.  Stopping does not wait for the daemon to
exit either, so a restart can race the instance on its way out.

Rewrite it after package/busybox/S01syslogd, as the manual asks.  lldpd
daemonizes and writes the PID file itself, but does not remove it on
exit, so pass the PID file to both start-stop-daemon and the daemon and
drop the stale file once the process is gone.  Also pick up arguments
from /etc/default/lldpd and add the customary reload alias.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore    |  1 -
 package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++++++++--------------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2fc8349f1e..32be4c93aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -550,7 +550,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_p
 package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstream
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
-package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
index 3dfa6c1aa1..79605c2f02 100644
--- a/package/lldpd/S60lldpd
+++ b/package/lldpd/S60lldpd
@@ -1,25 +1,61 @@
 #!/bin/sh
-#
-# Controls lldpd.
-#
 
-case $1 in
-    start)
-	printf "Starting lldpd: "
-	start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-    stop)
-	printf "Stopping lldpd: "
-	start-stop-daemon -K -q -p /var/run/lldpd.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-    restart)
-	$0 stop
-	$0 start
-	;;
-    *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-	;;
+DAEMON="lldpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+LLDPD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# lldpd daemonizes and creates the PID file itself, so tell it where to
+# put it, but it does not remove it on exit.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- -p "$PIDFILE" $LLDPD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
