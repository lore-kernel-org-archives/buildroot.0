Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81B2C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80C4E40E94;
	Tue,  9 Jul 2024 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cHt9LR72l6n; Tue,  9 Jul 2024 20:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 305BA40EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 305BA40EDF;
	Tue,  9 Jul 2024 20:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B058B1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D30240445
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf3HR3ivTqmz for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA0C40026
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA0C40026
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 833EA843F2; Tue,  9 Jul 2024 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 22:14:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd315306726c0150bbc105f5488711c18557460b
X-Git-Newrev: 8423849576e848fec73d93ba00266d9a4d34d3f7
X-Patchwork-Hint: ignore
Message-Id: <20240709202415.833EA843F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atftp: add sysvinit script
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

commit: https://git.buildroot.net/buildroot/commit/?id=8423849576e848fec73d93ba00266d9a4d34d3f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a script to launch the atftp daemon at boot.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atftp/S80atftpd | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/atftp/atftp.mk  |  5 +++++
 2 files changed, 55 insertions(+)

diff --git a/package/atftp/S80atftpd b/package/atftp/S80atftpd
new file mode 100644
index 0000000000..523251b77b
--- /dev/null
+++ b/package/atftp/S80atftpd
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DAEMON="atftpd"
+PIDFILE="/var/run/$DAEMON.pid"
+ATFTPD_ARGS="--user root.root /tftpboot"
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
+		--daemon --pidfile="$PIDFILE" $ATFTPD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+restart|reload)
+	stop
+	start
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index d41178cac4..c71a70cd5d 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -36,4 +36,9 @@ else
 ATFTP_CONF_OPTS += --disable-libpcre
 endif
 
+define ATFTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/atftp/S80atftpd \
+		$(TARGET_DIR)/etc/init.d/S80atftpd
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
