Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91058EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32EAE405ED;
	Mon, 19 Jun 2023 20:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32EAE405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgGrXUg1Bl5j; Mon, 19 Jun 2023 20:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DD5D402A8;
	Mon, 19 Jun 2023 20:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD5D402A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F38C81BF2CF
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD241404E0
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD241404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oh9l2y-_g1Nz for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E82401F3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E82401F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6F1E842D8; Mon, 19 Jun 2023 20:25:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 21:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66681bd4a6b9faadf9a6f772efb2705b06084cfc
X-Git-Newrev: 4c8ab13b960edcd290ea5ca7a7e739cb993fb863
X-Patchwork-Hint: ignore
Message-Id: <20230619202544.A6F1E842D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] petitboot: add pb-discover daemon
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2605351686194455068=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2605351686194455068==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c8ab13b960edcd290ea5ca7a7e739cb993fb863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
[Arnout: also source /etc/default file]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/S15pb-discover | 57 ++++++++++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk   |  4 +++
 2 files changed, 61 insertions(+)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
new file mode 100644
index 0000000000..7ecc12e991
--- /dev/null
+++ b/package/petitboot/S15pb-discover
@@ -0,0 +1,57 @@
+#!/bin/sh
+
+DAEMON="pb-discover"
+PIDFILE="/var/run/$DAEMON.pid"
+LOGFILE="/var/log/$DAEMON.log"
+
+PB_DISCOVER_ARGS="-l $LOGFILE"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+if [ "$(pb-config debug)" = "enabled" ] ; then
+	PB_DISCOVER_ARGS="$PB_DISCOVER_ARGS --verbose"
+fi
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $PB_DISCOVER_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
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
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index a798e7ca61..4d56b73938 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -53,6 +53,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
+	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
+		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	ln -sf /usr/sbin/pb-udhcpc \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL

--===============2605351686194455068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2605351686194455068==--
