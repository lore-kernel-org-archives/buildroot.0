Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265CBC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32D8041BFF;
	Fri, 12 Jul 2024 22:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNK5q5rzyEIJ; Fri, 12 Jul 2024 22:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D3441A4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D3441A4A;
	Fri, 12 Jul 2024 22:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD77D1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B2DF83EE9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0f79JplISH3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9327982131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9327982131
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 403A484729; Fri, 12 Jul 2024 22:00:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:59:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d200d8ebe255384cd492ee0f983ec7868df9caec
X-Git-Newrev: c2c2f3a42cb5ca72415d257ee50625730b47e9df
X-Patchwork-Hint: ignore
Message-Id: <20240712220004.403A484729@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: properly shut down
 before kexec
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2c2f3a42cb5ca72415d257ee50625730b47e9df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's good practice to unmount filesystems and gracefully terminate
running services before running "kexec -e". So when a boot option has
been chosen from the petitboot menu, poke init to shut the system down
and kexec the new kernel.

One benefit to us in particular is that when pb-console is killed, it
notifies the user that we're booting:

  trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM

This terminal reset is also useful, exiting the ncurses visual mode so
subsequent boot output is raw rather than being confined to the window
set up for the petitboot menu.

Currently we assume busybox init (using the bb-kexec-reboot script
included with petitboot), but do not add an accompanying entry
in the inittab to run kexec, so things aren't working.

Add a new script kexec-restart that does the right thing for all init
systems that Buildroot supports (busybox, sysv, openrc, systemd). OpenRC
and systemd have an upstream way to do a kexec-shutdown. For busybox and
sysv, we add a line to inittab that does kexec -f -e (after the shutdown
scripts have run). Finally, for other cases (where there is no
recognized init system) directly use kexec -f -e.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
[Arnout:
 - install kexec-restart in /usr/libexec/petitboot, where it was before;
 - determine init system statically based on config instead of dynamically.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/kexec-restart.in |  8 ++++++++
 package/petitboot/petitboot.mk     | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/petitboot/kexec-restart.in b/package/petitboot/kexec-restart.in
new file mode 100644
index 0000000000..d749391448
--- /dev/null
+++ b/package/petitboot/kexec-restart.in
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+@KEXEC_COMMAND@
+
+while :
+do
+	sleep 1
+done
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 2eb6461144..f5231733dc 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -30,7 +30,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
+	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/kexec-restart
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
@@ -55,11 +55,37 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+# inittab "restart" runlevel entry runs kexec
+PETITBOOT_KEXEC_COMMAND = /bin/kill -QUIT 1
+define PETITBOOT_BUSYBOX_INITTAB
+	grep -q kexec $(TARGET_DIR)/etc/inittab || \
+		printf "\nnull::restart:/usr/sbin/kexec -f -e\n" >> $(TARGET_DIR)/etc/inittab
+endef
+PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_BUSYBOX_INITTAB
+else ifeq ($(BR2_INIT_SYSV),y)
+# inittab runlevel 6 entry runs kexec
+PETITBOOT_KEXEC_COMMAND = /sbin/shutdown -r now
+define PETITBOOT_SYSV_INITTAB
+	grep -q kexec $(TARGET_DIR)/etc/inittab || \
+		$(SED) 's~^reb0:.*~reb0:6:wait:/usr/sbin/kexec -f -e~' $(TARGET_DIR)/etc/inittab
+endef
+PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_SYSV_INITTAB
+else ifeq ($(BR2_INIT_OPENRC),y)
+PETITBOOT_KEXEC_COMMAND = /sbin/openrc-shutdown --kexec now
+else ifeq ($(BR2_INIT_SYSTEMD),y)
+PETITBOOT_KEXEC_COMMAND = /usr/bin/systemctl kexec
+else # BR2_INIT_NONE
+PETITBOOT_KEXEC_COMMAND = /usr/sbin/kexec -f -e
+endif
+
 PETITBOOT_GETTY_PORT = $(patsubst %,'%',$(call qstrip,$(BR2_PACKAGE_PETITBOOT_GETTY_PORT)))
 
 define PETITBOOT_POST_INSTALL
-	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
-		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart.in \
+		$(TARGET_DIR)/usr/libexec/petitboot/kexec-restart
+	$(SED) 's~@KEXEC_COMMAND@~$(PETITBOOT_KEXEC_COMMAND)~' \
+		$(TARGET_DIR)/usr/libexec/petitboot/kexec-restart
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
@@ -77,6 +103,7 @@ define PETITBOOT_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
+
 endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
