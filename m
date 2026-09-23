Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC52C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96DC8133D;
	Thu, 24 Sep 2026 18:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne6nuWzczC6G; Thu, 24 Sep 2026 18:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ACE881277
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276308;
	b=sa1K7t0Vt9PNHTax8hj510DajUhVG6BraK/aDUDQpi8DC2xqlTKMwADDPymdV9m1+Ghn
	 9CIccFDTr1snmGCrUjiyjGkuNZ6gIL0kkJGJtmsDPv2ltCgAcM8KhN6EmFw4aeeMk4kaL
	 5QEjN9Io4Rs/Wefi8ZmViWeZ0AP3AQamwUFvB6eDe8hbVE7iAgdCfqieL7QrcFda3E8/Q
	 cy73GuqYHS3RcrZ4L6b+dQmmUtfu3Vv+BfeIkDsamSrWTICETCz6s7UttxhMptgdtmZZ6
	 X/iVw3/rxC0zAGs2/DlAN0YWdZji2beeigq+bjyFA6AkWLrc0bzQ302BFc2npPKNjKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4XfGYNvILoVj+XjOzatGUQwCQGfQEPlL9F5PEzeFiMc=;
	b=ZmzdHUW2DaevlKPun8t9jZY+LxiJ0XkFT3WQ3Q9MK9jFDmiaCGgC9LkNp65kiIs8HseH
	 r+9/KmTPkJNs/p4iJMh3YshDFo+j+s1t7c7hZ6J+TCmpw1e8RW+jLAku/v6yNAOFkLEA7
	 npsnRqpJ91ERealeS8lQb0rCnqGeknwIlIdocb6IuMJbBcUUDMmTa0ojvFTG/4JiVIOzB
	 Sgwj/VWGP3PWIZhViS2NLqedffejFI3xoRt94tqJSmg+fEjY5g5dKfCDmCn3DSdhXoTOl
	 IMmfairwGkYtbdhcngtxqXWkZhFfwDTriJfkTCuuBYkZYh8R2MtoflSYxACtLUV/Ihw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276308;
	bh=4XfGYNvILoVj+XjOzatGUQwCQGfQEPlL9F5PEzeFiMc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cARepiRcoaHVIHeyW3UB4+H7koUg54KIPAFRwO9OTVEE35snm9mSb4DWbQ5AuvNMu
	 Cm5yTYw79XVTeGJnTNkeNecMsSTk0j/rDbsIuGFLtKH4TdWGXtT3lYykVZ0uN3P6SL
	 lPQjrrV1cDXbaesBb+C9YnLi8s9Y8ihSEYJcedVYZw5u2497Ck3nFQpPfpDSBDsDYr
	 yI/jQ8DgjRbs9fKqqiMF6uJzPdWLeFtG0lz73JqMYflkBx301GoWazBilxESH7gk1G
	 TQs7HAohiTuSJATIJTAnfV/oe04kI5x+Y9g+S5hjxrlmisK2I6VXbxWyQOl9r0UJa2
	 CNjJdRNU5ZskA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ACE881277;
	Thu, 24 Sep 2026 18:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34F3D332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 253B481218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gixmLMFZeExk for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4F80181225
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=DdTNze9QDXq0GIpP4bom4Eca6UNIZsWeEX/Zhn+pkS1IMoNS7BfOQYUz2lqNpGWmRt2/
 9r6v/KAO4W8TNR1a8vNcMfq3RWF8JZrkCSSWFIcRRmHsMidn4O6Pl9ZW2MUV4XRVIfqfp
 Nv7IvYe5c/Rno2N+LbnhCvFYaYSAAfE69QXR7oGCUuPtC0TxsE02l62bb3/dwhF9uBGc+
 FNt1+v0tdJcxvfnqQmtD7vCVjKX0AQB5VilUf4Je7SDmrt4fPsVSIy35wMRufDbQvpJ3l
 +UTi7lb+XuFsOgcOZgC/6DTja6u00lnZnQk2UGKbEKTFqYs2qsLRKQODUx4m7UADqcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h24PTjbeFqjIGEUQktSz4LCk5OxsLhMIrUBkw0uOJPU=;
 b=PZeIo7orOdbQXled75v9+NupDok9Y0cTT/RLbQe0yvhrhPXm+dAjbNjVmB3HPZZf6M69
 9hK5yhaY2jbVrB4nCs+glMDJlFQ15JdnpnsbImpKJB5SwwV+o1CBwYkoXk/vjB781KoBF
 M2s9cAx1qcRMsfOCqHaocLj8IKGBCFDaWBcKVZoLxEvDoz440Q+im2KUjKxNQy0s5Uf0z
 JfT4VS2+iUrfX3M2x6/Z90OKb4TJNGzW5l54iH5Jzx3mbctvnyWsGRXk6GrsVlnsEOUd9
 Pf6rjwF5B4Xf+37+4EKDEE065cK47OSAEYQgDGS9JTcIW7TZoMGmKWI7M45/B2S9EKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F80181225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E62D398387; Thu, 24 Sep 2026 18:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:45:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e12ef9c6524d0e9bd0f26458603820be5dd21439
X-Git-Newrev: 2a1acd674a1da8ce964924a6199ccaff560ffe10
X-Patchwork-Hint: ignore
Message-Id: <20260924185539.E62D398387@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/lldpd: rework
 start script
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8765130116414609181=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8765130116414609181==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a1acd674a1da8ce964924a6199ccaff560ffe10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 2fd1f6b629862f48e832d7e0379a7b48dc9eae42)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore    |  1 -
 package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++++++++--------------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c3ec943075..7c66dd52df 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -552,7 +552,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_p
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

--===============8765130116414609181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8765130116414609181==--
