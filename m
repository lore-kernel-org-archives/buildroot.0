Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EECC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F10D61077
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F10D61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C548402D2;
	Sun, 14 Nov 2021 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJZTi2KGU4fG; Sun, 14 Nov 2021 13:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD17402F8;
	Sun, 14 Nov 2021 13:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 365F41BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321DD4022B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZqBeHpOJ0KP for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2832B40202
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C1E578CA89; Sun, 14 Nov 2021 13:47:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:51:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f84350e7255c94329fc87f3783bee03469fc0159
X-Git-Newrev: 0f0b1f59c310447ff259499baab6093a7e17b512
X-Patchwork-Hint: ignore
Message-Id: <20211114134740.C1E578CA89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ntp: run ntpd as ntp
 user
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f0b1f59c310447ff259499baab6093a7e17b512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- in case libcap is enabled use the now enabled '-u' option to run nptd as
  user/group ntp

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntp/{S49ntp => S49ntp.in}             |  2 +-
 package/ntp/ntp.mk                            | 15 +++++++++++++--
 package/ntp/{ntpd.service => ntpd.service.in} |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp.in
similarity index 96%
rename from package/ntp/S49ntp
rename to package/ntp/S49ntp.in
index 66c5f70a5f..11c03b888f 100644
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp.in
@@ -6,7 +6,7 @@
 DAEMON="ntpd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-NTPD_ARGS="-g"
+NTPD_ARGS="@NTPD_EXTRA_ARGS@ -g"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index ff23cdc2b6..96b099d5b1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -44,6 +44,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NTP_CONF_OPTS += --enable-linuxcaps
 NTP_DEPENDENCIES += libcap
+define NTP_USERS
+	ntp -1 ntp -1 * - - - ntpd user
+endef
+NTP_DAEMON_EXTRA_ARGS = -u ntp:ntp
 else
 NTP_CONF_OPTS += --disable-linuxcaps
 endif
@@ -109,11 +113,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
 define NTP_INSTALL_INIT_SYSV_NTPD
-	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	sed -e 's%@NTPD_EXTRA_ARGS@%$(NTP_DAEMON_EXTRA_ARGS)%g' \
+		package/ntp/S49ntp.in \
+		> $(TARGET_DIR)/etc/init.d/S49ntp
+	chmod 0755 $(TARGET_DIR)/etc/init.d/S49ntp
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system
+	sed -e 's%@NTPD_EXTRA_ARGS@%$(NTP_DAEMON_EXTRA_ARGS)%g' \
+		package/ntp/ntpd.service.in \
+		> $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 endef
 endif
 
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service.in
similarity index 85%
rename from package/ntp/ntpd.service
rename to package/ntp/ntpd.service.in
index 9a0f4c6dbf..b7db4a2878 100644
--- a/package/ntp/ntpd.service
+++ b/package/ntp/ntpd.service.in
@@ -9,7 +9,7 @@ PIDFile=/run/ntpd.pid
 # correct time to work, but we likely won't acquire that without NTP. Let's
 # break this chicken-and-egg cycle here.
 Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
-ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
+ExecStart=/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntpd.pid
 
 [Install]
 WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
