Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB21C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1670740711;
	Thu, 15 Aug 2024 12:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXUKNA-88bQF; Thu, 15 Aug 2024 12:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C792D40824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C792D40824;
	Thu, 15 Aug 2024 12:53:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5868B1BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 453F440824
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOR5Ijd0piRm for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7E140711
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7E140711
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2708184F84; Thu, 15 Aug 2024 12:53:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:53:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef5947774f04dbdf8edffb88b8688917cd6b71b2
X-Git-Newrev: 65c8e4c65168b6c17af1e797252693e4190c934f
X-Patchwork-Hint: ignore
Message-Id: <20240815125340.2708184F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: add
 wrapper script for logging to syslog
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

commit: https://git.buildroot.net/buildroot/commit/?id=65c8e4c65168b6c17af1e797252693e4190c934f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Dockerd logs only to stdout/stderr [1], which is lost with
--background. The upstream SysV init script [2] logs to a file by
passing --no-close to start-stop-daemon and redirecting the output,
but that option is not supported by Busybox' start-stop-daemon.

The wrapper script added with this commit captures the output of
dockerd (or whatever other command it is given) and forwards each line
to syslog.

[1] https://github.com/moby/moby/discussions/48260
[2] https://github.com/moby/moby/blob/50c3d19179e69f9e7ff01f688c4dbf32c5129ced/contrib/init/sysvinit-debian/docker

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/S60dockerd                | 8 ++++++--
 package/docker-engine/docker-engine.mk          | 2 ++
 package/docker-engine/dockerd-syslog-wrapper.sh | 4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index aab50d84d4..dda6dc7474 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -10,10 +10,14 @@ DOCKERD_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# Dockerd logs only to stdout/stderr, which is lost with
+	# --background. The wrapper script runs the given command
+	# (after "--", including dockerd) and forwards stdout/stderr
+	# to syslog.
 	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
 	start-stop-daemon --start --background --pidfile "$PIDFILE" \
-		--exec "/usr/bin/$DAEMON" \
-		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
+		--exec /usr/libexec/dockerd-syslog-wrapper.sh \
+		-- "/usr/bin/$DAEMON" --pidfile "$PIDFILE" $DOCKERD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c7c51c5ef5..268b851520 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -72,6 +72,8 @@ endef
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
 		$(TARGET_DIR)/etc/init.d/S60dockerd
+	$(INSTALL) -D -m 755 package/docker-engine/dockerd-syslog-wrapper.sh \
+		$(TARGET_DIR)/usr/libexec/dockerd-syslog-wrapper.sh
 endef
 
 define DOCKER_ENGINE_USERS
diff --git a/package/docker-engine/dockerd-syslog-wrapper.sh b/package/docker-engine/dockerd-syslog-wrapper.sh
new file mode 100644
index 0000000000..3d6a80a739
--- /dev/null
+++ b/package/docker-engine/dockerd-syslog-wrapper.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+"${@}" 2>&1 | while read -r LINE; do
+	logger -t "$(basename "${1}")" "$LINE";
+done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
