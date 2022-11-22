Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC34C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9383F409E6;
	Mon, 20 Feb 2023 21:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9383F409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVnU_eevODvc; Mon, 20 Feb 2023 21:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2823545BC3;
	Mon, 20 Feb 2023 21:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2823545BC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 112B81BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D9BC610E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9BC610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id un9AhF11AgOK for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B6A1610D2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6A1610D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91F748648F; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:49:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 47659b4f342382c764076c0c0dfbee446b090661
X-Git-Newrev: ef6c9da9d255f04847a89d22b99ab3605102d4cb
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.91F748648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gitlab-runner: fix
 inconsistency of systemd and sysv daemons
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef6c9da9d255f04847a89d22b99ab3605102d4cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Copy default $DAEMON_ARGS from systemd service to sysv init script.

Make GITLAB_RUNNER_USER home directory the same as default
--work-directory (-d) flag.

Run sysv daemon process using root user (remove -c option)
This is needed to correctly access config files as specified.
System access can still be limited with gitlab-runner `--user` flag.

Use same $DAEMON_ARGS variable name so it can be overwritten in
/etc/default/gitlab-runner environment file in both cases.

Signed-off-by: Marek Metelski <marek.metelski@grinn-global.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
