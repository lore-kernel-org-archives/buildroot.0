Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA20C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:30:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27B860E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D27B860E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D737F400E3;
	Sat, 24 Jul 2021 21:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzCrZBcew1jp; Sat, 24 Jul 2021 21:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DE84043D;
	Sat, 24 Jul 2021 21:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E340E1BF95E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC1CA400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pj8Bj-35Rkcr for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:29:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 072F0400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C79488D1C; Sat, 24 Jul 2021 20:55:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:29:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a62f90e3635795dcc93b3316b987e0076dea48c
X-Git-Newrev: 82712c5862badbc905346afb6ad08c4d4ff47dfb
X-Patchwork-Hint: ignore
Message-Id: <20210724205513.0C79488D1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: add init S50polkit script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=82712c5862badbc905346afb6ad08c4d4ff47dfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Polkit source does not come with non-systemd init script. Add one that is
modeled after package/busybox/S01syslogd.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/S50polkit | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/polkit/polkit.mk |  5 +++++
 2 files changed, 56 insertions(+)

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
new file mode 100755
index 0000000000..f07e2d613b
--- /dev/null
+++ b/package/polkit/S50polkit
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="polkitd"
+DAEMON_PATH="/usr/lib/polkit-1/${DAEMON}"
+PIDFILE="/var/run/${DAEMON}.pid"
+POLKITD_ARGS="--no-debug"
+
+# polkitd does not create a pidfile, so pass "-n" in the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "${DAEMON}"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${POLKITD_ARGS}
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
+	printf 'Stopping %s: ' "${DAEMON}"
+	start-stop-daemon -Kqp "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index f48c103a52..d5b3955ddb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -57,4 +57,9 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 
 endef
 
+define POLKIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
+		$(TARGET_DIR)/etc/init.d/S50polkit
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
