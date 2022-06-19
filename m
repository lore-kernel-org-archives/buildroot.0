Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1807C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EE7410A1;
	Sun, 19 Jun 2022 15:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EE7410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMm62PcBpIOz; Sun, 19 Jun 2022 15:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 274E740933;
	Sun, 19 Jun 2022 15:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 274E740933
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AA21BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCEEA81433
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCEEA81433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhZ0W2Sv0W6n for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18751813BA
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18751813BA
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D3ABF873C2; Sun, 19 Jun 2022 15:45:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a76294cd6cf4c06a37b326585cb118d561322315
X-Git-Newrev: eed183e67e02a35e98fbf6baead9c9ee559b493e
X-Patchwork-Hint: ignore
Message-Id: <20220619154529.D3ABF873C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: adding ifupdown
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eed183e67e02a35e98fbf6baead9c9ee559b493e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Actually, configuring a wifi interface as per "interfaces" man:

auto wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant.conf

doesn't work on buildroot because the line wpa-conf is ignored due to
the lack of a proper ifupdown script to handle the wpa_supplicant
initialization.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/ifupdown.sh       | 49 ++++++++++++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk |  9 ++++++
 2 files changed, 58 insertions(+)

diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
new file mode 100755
index 0000000000..569344b683
--- /dev/null
+++ b/package/wpa_supplicant/ifupdown.sh
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+# This file is executed by ifupdown in pre-up, post-up, pre-down and
+# post-down phases of network interface configuration.
+
+WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
+
+# run this script only for interfaces which have wpa-conf option
+[ -z "$IF_WPA_CONF" ] && exit 0
+
+# Allow wpa_supplicant interface to be specified via wpa-iface
+# useful for starting wpa_supplicant on one interface of a bridge
+if [ -n "$IF_WPA_IFACE" ]; then
+	WPA_IFACE="$IF_WPA_IFACE"
+else
+	WPA_IFACE="$IFACE"
+fi
+
+WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
+
+do_start () {
+	if [ ! -s "$IF_WPA_CONF" ]; then
+		echo "cannot read contents of $IF_WPA_CONF"
+		exit 1
+	fi
+	WPA_SUP_CONF="-c $IF_WPA_CONF"
+}
+
+case "$MODE" in
+	start)
+		do_start
+		case "$PHASE" in
+			post-up)
+				start-stop-daemon -S -q -x ${WPA_SUP_BIN} \
+				-- -B -i ${WPA_IFACE} ${WPA_SUP_CONF} -P ${WPA_SUP_PIDFILE}
+				;;
+		esac
+		;;
+
+	stop)
+		case "$PHASE" in
+			pre-down)
+				start-stop-daemon -K -p ${WPA_SUP_PIDFILE}
+				;;
+		esac
+		;;
+esac
+
+exit 0
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 14f6a6e271..afcd6502e3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -256,6 +256,14 @@ define WPA_SUPPLICANT_INSTALL_STAGING_CMDS
 	$(WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO)
 endef
 
+ifeq ($(BR2_PACKAGE_IFUPDOWN_SCRIPTS),y)
+define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
+	$(INSTALL) -m 0755 -D package/wpa_supplicant/ifupdown.sh \
+		$(TARGET_DIR)/etc/network/if-up.d/wpasupplicant
+	ln -sf ../if-up.d/wpasupplicant $(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
+endef
+endif
+
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
@@ -265,6 +273,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
 	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
