Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B99CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF78484359;
	Fri, 29 Aug 2025 10:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-UzdCwZ2s9v; Fri, 29 Aug 2025 10:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A930A84354
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A930A84354;
	Fri, 29 Aug 2025 10:52:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD81FD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFCDC41261
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FyAXoJzm31G for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2230440497
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2230440497
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1266687D3F; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:49:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90533b689941cfd92da9e1a2a1ed6c1b7246b25e
X-Git-Newrev: 035f496978eafd822115a176f4aeb7e281c91717
X-Patchwork-Hint: ignore
Message-Id: <20250829105211.1266687D3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/initscripts: add
 service to load kernel modules at boot
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
