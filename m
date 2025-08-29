Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA370CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8455D80761;
	Mon,  8 Sep 2025 14:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXwauRmXmJd1; Mon,  8 Sep 2025 14:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5507B80740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5507B80740;
	Mon,  8 Sep 2025 14:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE46186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DA0360613
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OYEwjHE25OF for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05C8605BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C05C8605BB
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B09C78359C; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:49:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90533b689941cfd92da9e1a2a1ed6c1b7246b25e
X-Git-Newrev: 035f496978eafd822115a176f4aeb7e281c91717
X-Patchwork-Hint: ignore
Message-Id: <20250908141629.B09C78359C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/initscripts: add service to load
 kernel modules at boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=035f496978eafd822115a176f4aeb7e281c91717
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In cases where no hotplug is available (by choice or by the lack of a
proper hotplug method for a device), this service can be used to load
kernel module drivers by reading the /etc/modules-load.d/*.conf files.
The modules files matches the one used by systemd, which in turn has
a builtin mechanism to load a module at boot, therefore making systemv
init on par with systemd features.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Arnout:
 - add exception for missing DAEMON variable;
 - fix shellcheck warnings
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/initscripts/init.d/S11modules | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
new file mode 100644
index 0000000000..ab9b93dae3
--- /dev/null
+++ b/package/initscripts/init.d/S11modules
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+MODULES_DIR="/etc/modules-load.d/"
+
+[ -z "$(ls -A ${MODULES_DIR} 2> /dev/null)" ] && exit 0
+
+load_unload() {
+	for module_file in "${MODULES_DIR}"/*.conf; do
+		while read -r module args; do
+
+			case "$module" in
+				""|"#"*) continue ;;
+			esac
+
+			if [ "$1" = "load" ]; then
+				# shellcheck disable=SC2086  # We need word splitting for args
+				modprobe -q "${module}" ${args} >/dev/null && \
+					printf '%s ' "$module" || RET='FAIL'
+			else
+				rmmod "${module}" >/dev/null
+			fi
+
+		done < "${module_file}"
+	done
+
+	RET='OK'
+}
+
+start() {
+	printf 'Starting modules: '
+
+	load_unload load
+
+	echo $RET
+}
+
+stop() {
+	printf 'Stopping modules: '
+
+	load_unload unload
+
+	echo $RET
+}
+
+restart() {
+	stop
+	sleep 1
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
+esac
+
+# check-package Ignore missing DAEMON Variables
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
