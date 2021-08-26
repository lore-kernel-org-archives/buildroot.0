Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471C4C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:10:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084DC6103C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 084DC6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1DF6149D;
	Thu, 26 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zosKWmNvwLr; Thu, 26 Aug 2021 21:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B0761498;
	Thu, 26 Aug 2021 21:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0A301BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A016081013
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3w7EsWCTGym for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:10:06 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from da1vs04.rockwellcollins.com (da1vs04.rockwellcollins.com
 [205.175.227.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531F280C00
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:10:06 +0000 (UTC)
IronPort-SDR: m9Xiq00r/I66c4jXgLI74EFBKeFFnH9CbAGyUnySe33pejYvgV/OBt9/8GiucSy7FQEjJSVmqC
 V8TtaOQcK6uNu9+lvqsaqly5PjusRiFd8B5LUkXn9FO578GqnI0SFqV/ag4LnunEUkxCiz/pkE
 aCAOwq3h7XQKVkfgq3CRXCmV0xDaV5MxEWdCSGUmgeHnmtngvlDXlx3hxuK+1RBNDxOUJHloDb
 qZB7T9NfwOQnwLY7kBoYcp5KYh290/+4ixKqaqfEQCmQclp93ExFcmAtxpmoRyMYlBjzOTfer7
 voE=
Received: from ofwda1n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs04.rockwellcollins.com with ESMTP; 26 Aug 2021 16:02:58 -0500
X-Received: from eggs.rockwellcollins.com (eggs.rockwellcollins.lab
 [10.148.117.42])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 4D94F605CF;
 Thu, 26 Aug 2021 16:02:57 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 16:02:40 -0500
Message-Id: <20210826210241.56201-1-sam.voss@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/1] package/busybox: add systemd service for
 telnetd
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
From: Sam Voss via buildroot <buildroot@busybox.net>
Reply-To: Sam Voss <sam.voss@collins.com>
Cc: Sam Voss <sam.voss@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Sam Voss <sam.voss@collins.com>
---
 package/busybox/busybox.mk      |  7 +++++++
 package/busybox/telnetd.service | 11 +++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/busybox/telnetd.service

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index cfc06b0d78..fb427faf1c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -378,6 +378,13 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
+define BUSYBOX_INSTALL_INIT_SYSTEMD
+	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
+		$(INSTALL) -D -m 0644 package/busybox/telnetd.service \
+			$(TARGET_DIR)/usr/lib/systemd/system/telnetd.service ; \
+	fi
+endef
+
 # Install the sysvinit scripts, for the moment, but not those that already
 # have a corresponding one in openrc.
 define BUSYBOX_INSTALL_INIT_OPENRC
diff --git a/package/busybox/telnetd.service b/package/busybox/telnetd.service
new file mode 100644
index 0000000000..3c1fa457b1
--- /dev/null
+++ b/package/busybox/telnetd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Telnetd Service
+After=network.target
+
+[Service]
+# busybox telnet doesn't support pidfile, so run in foreground
+Type=simple
+ExecStart=/usr/sbin/telnetd -F
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
