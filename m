Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA603C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F1B440659;
	Fri, 12 Jul 2024 22:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQVdzPz6FIJR; Fri, 12 Jul 2024 22:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE824187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE824187C;
	Fri, 12 Jul 2024 22:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0971BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8599760656
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufl28hRixtlb for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95E47605BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95E47605BE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79F738631F; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:59:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2c2f3a42cb5ca72415d257ee50625730b47e9df
X-Git-Newrev: d5ba2db4011cd577732e26b5c081e57a26d8910f
X-Patchwork-Hint: ignore
Message-Id: <20240712220004.79F738631F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: run script when exiting
 to shell
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d5ba2db4011cd577732e26b5c081e57a26d8910f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the user selects the shell escape option from the petitboot menu,
reset the terminal so output is raw rather than being confined to the
ncurses window set up for the petitboot menu, and print some helpful
text before running the shell.

To do this, override the default HOST_PROG_SH (/bin/sh) with a small
script. Doing so also enables someone to customize this behavior by
overlaying a different script.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/pb-shell     | 10 ++++++++++
 package/petitboot/petitboot.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/petitboot/pb-shell b/package/petitboot/pb-shell
new file mode 100644
index 0000000000..99887c3f3b
--- /dev/null
+++ b/package/petitboot/pb-shell
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+reset
+
+cat <<EOM
+Exiting petitboot. Type 'exit' to return.
+You may run 'pb-sos' to gather diagnostic data.
+EOM
+
+exec /bin/sh
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index f5231733dc..6f7789b185 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -30,6 +30,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
+	HOST_PROG_SH=/usr/libexec/petitboot/pb-shell \
 	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
@@ -94,6 +95,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
+		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	for port in $(PETITBOOT_GETTY_PORT); do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
