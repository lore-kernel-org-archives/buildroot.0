Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA9C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D723F40AAF;
	Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4t79X1ySKXJ; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 10BE440ADE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276205;
	b=FxI9BXPjB8KDLeQyGV9vNhr6nPwus+VIEFi3JCQ11Ap0b7oHOqCMGxZlPXpFtilSF75m
	 tye6eWOPECd/6syks46ygnQrW2fqsBp/402WJcwwt4UJ2xFGqDDqyu5HlOurwaSwkSTj6
	 AgY9odoquNJcFflTBWIdBO4k22gYLm2CGoOX8J850704u+5qVzQ93YN7kHcsj1O37qLu1
	 kFr0wOoc4ktdDIw1+7JJFADU21v9VR1SrhvtB30W8CLLPEft+ClMEo37WPMbyoTGcZQ5m
	 oS9cs+ZFHaGLF59dVH852+hj4drXlDbfRiFYrVjl8LRd32CzUiJNlpj0WWgrcvKq07A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6ZPVyhS+Sx4LNJReaznVfJooM1Da8vIXCOBD5iY/RyI=;
	b=E6t04Q2DTQEY6okhylQMj9eaIZhpVawi++TQrETTIO2iwlZpo6EWo9YvfybByQucctnO
	 7qN8tIM6+fUWcxykzW376VAqHctjvjXMOKUKRIiQfre8dYSyGKeRM3vVJ7KSG0+L0BcgF
	 +KvP4PKwogcTvSmrGaqrVubwJt/Cc33RSKPniUWdoow5Q6hnl27uQxYujVovwZXMmwATE
	 uj9XMEeds7Pszq0g2fsW/93L7DxmerkhpPDY5E+Csng0UeRVBUY8/8D4CT/eBjLsxbmju
	 joCQFVHGksJ1aNjLv8E13L8ZRCBCY10SSWzCcMKs4JheV8c5beTlqv4RR5WvovJN3GA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276205;
	bh=6ZPVyhS+Sx4LNJReaznVfJooM1Da8vIXCOBD5iY/RyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JV/Q3oPAGoLlC7KFPAlQ77NR8tDAa5V+3/cdp09wDGqA7HuzdjMdo9rq6ooiFqI3M
	 gxyAi6hxVD1W5qP9LvMBIJGop1Lco8shAAAoKYRFwXoL3ztaBbVMxvGxZimHGV6HDs
	 /1Iwh7OineWKziSIyyXhDd9eUJBw6YpWDWle5nsst25A5IjWMxP2H0oxQeytnihCbM
	 5s+Lxt4AsYYCHUltsjTi8p5HoLxgniYVYIIZhE1TvyDoAvtgOhf/wu+Z3tF+kXuFxv
	 rvDV4uGHOr4e/rT1N7dGjt5yqUaJ5bO384tULdzDGXvicXjHpTnYJJY97sOgcSQxLI
	 Yow5b8yx+XUmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BE440ADE;
	Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC92A392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D32B560847
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_aUhBOwqw3A for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF4D560BBC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=iO6KdMCRJAU3NHzEN30uZiYzA+Wcb1P1ZNc7FzhOJmkcjsRNvr2vrvkPtTsuG1Mk3JIg
 v8s8oPjEVM3F/CL7shk6IAlCM29Hd4eqKric1iDQIqTf2VkNw0WRkDeB35Z2udGNhkZto
 Koyeu/jYLV6PS6eGyNi6O88haQIaHUZmmEzTSLt8uEbfPKVJ3a5wM5cSxxLxNkDRxMoXT
 P2ON7vaYRbJMSpP40Z39YxfmrdAHSyAURWVVQwFYQKgbL3y8RBw4UBBWeQ6Th25nSBVnt
 ftZNfPK5bUcik47TvQOLQ/m90mhD93e9SoLy62Fz9I1GDK9DEQnV1U45n7ez5V1hFtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=74O4R1Y5wJXjxwUtkiFG/p6HYpu8m9xruWkpCfVRtzg=;
 b=AiRj52unKLkyWwsw68h2p+xVMYXdTLli9AAU/OlzUKpR+qNwI3+bjjNsHDrDCwX0galK
 UUPqPrz0U9WONVryrSgBhlGcpxNZ0+Hs2JGQHtCibmra6OWN4sWPqRRQ6Arm2ycKkCqyV
 sY0Y+aCPOrpzsI0BQ0s6mGmN6+MPExnzMtUgxXrfhS0Gqe7JlQTEPwHXFZwUAt01X3bAY
 x6VyHqkxbxGTc1BxTn/FV+XoA8xoinftqK4xYMoEJBogh5+TfrnC/u74cFv8uXFfEiHAX
 Jq0bDFgsCgqujkefiaqFbO1jiWowCRX5ri3hkGfD8WyC7pB9KxHJmuHZeAPB4QAYdAQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4D560BBC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8686E98385; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:45:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 75063b2556e76cb6287a873c11aa699927fe63cd
X-Git-Newrev: bea9b76f1cbab6d7f0601b1f4dc552c503aee597
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.8686E98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lldpd: rework
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
Content-Type: multipart/mixed; boundary="===============0066646818299747242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0066646818299747242==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bea9b76f1cbab6d7f0601b1f4dc552c503aee597
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[raphael: fix conflict in .checkpackageignore]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore    |  1 -
 package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++++++++--------------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 42973a5311..5bc397bcf1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -668,7 +668,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_p
 package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstream
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
-package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch lib_patch.Upstream
 package/llvm-project/libclc/0001-support-out-of-tree-build.patch lib_patch.Upstream
 package/lm-sensors/0001-static-build.patch lib_patch.Upstream
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

--===============0066646818299747242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0066646818299747242==--
