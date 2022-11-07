Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F5DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E017D4038C;
	Mon,  7 Nov 2022 09:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E017D4038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9n8Ql-mXBHr; Mon,  7 Nov 2022 09:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9E240354;
	Mon,  7 Nov 2022 09:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9E240354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA2D1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35A14813EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 09:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A14813EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKxzLGDS25eb for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 09:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DDD813EA
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74DDD813EA
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 09:17:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (21)
Received: from grinn224.grinn-global.com (95.143.241.142.ultranet.net.pl
 [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 70F661BC3FA;
 Mon,  7 Nov 2022 10:17:09 +0100 (CET)
From: Marek Metelski <marek.metelski@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 10:16:58 +0100
Message-Id: <20221107091658.25974-1-marek.metelski@grinn-global.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gitlab-runner: fix inconsistency of
 systemd and sysv daemons
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
Cc: Marek Metelski <marek.metelski@grinn-global.com>,
 Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Copy default $DEAMON_ARGS from systemd service to sysv init script.

Make GITLAB_RUNNER_USER home directory the same as default
--work-directory (-d) flag.

Run sysv daemon process using root user (remove -c option)
This is needed to correctly access config files as specified.
System access can still be limited with gitlab-runner `--user` flag.

Use same $DAEMON_ARGS variable name so it can be overwritten in
/etc/default/gitlab-runner environment file in both cases.

Signed-off-by: Marek Metelski <marek.metelski@grinn-global.com>
---
 package/gitlab-runner/S95gitlab-runner | 6 +++---
 package/gitlab-runner/gitlab-runner.mk | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/gitlab-runner/S95gitlab-runner b/package/gitlab-runner/S95gitlab-runner
index 2a50e7151a..739adf1783 100644
--- a/package/gitlab-runner/S95gitlab-runner
+++ b/package/gitlab-runner/S95gitlab-runner
@@ -3,7 +3,7 @@
 DAEMON="gitlab-runner"
 PIDFILE="/var/run/$DAEMON.pid"
 
-GITLAB_RUNNER_ARGS="run"
+DAEMON_ARGS="run --syslog --user gitlab-runner -d /var/lib/gitlab-runner -c /etc/gitlab-runner/config.toml"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
@@ -11,8 +11,8 @@ GITLAB_RUNNER_ARGS="run"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -m -b -p "$PIDFILE" -c "$DAEMON:$DAEMON" -x "/usr/bin/$DAEMON" \
-		-- $GITLAB_RUNNER_ARGS
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $DAEMON_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
index fde776e631..9542275135 100644
--- a/package/gitlab-runner/gitlab-runner.mk
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -12,9 +12,8 @@ GITLAB_RUNNER_LICENSE_FILES = LICENSE
 GITLAB_RUNNER_LDFLAGS = \
 	-X gitlab.com/gitlab-org/gitlab-runner/common.VERSION=$(GITLAB_RUNNER_VERSION)
 
-# Don't run gitlab runner as root.
 define GITLAB_RUNNER_USERS
-	gitlab-runner -1 gitlab-runner -1 * /var/run/dbus /bin/false - Gitlab Runner
+	gitlab-runner -1 gitlab-runner -1 * /var/lib/gitlab-runner /bin/false - Gitlab Runner
 endef
 
 define GITLAB_RUNNER_INSTALL_INIT_SYSV
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
