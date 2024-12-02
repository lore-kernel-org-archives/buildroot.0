Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF81D78339
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 17:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FF981008;
	Mon,  2 Dec 2024 17:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96fqAYz49iL1; Mon,  2 Dec 2024 17:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A1081EE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A1081EE4;
	Mon,  2 Dec 2024 17:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D4360
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33B7F40958
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRyJX_7JSFYP for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 17:24:28 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.63.162; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73E6940936
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E6940936
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.162])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73E6940936
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:24:26 +0000 (UTC)
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4Y29d34GHsz3tx3
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:24:23 +0100 (CET)
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4Y29d33XPCz3twj
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:24:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4Y29d25wpLz8t4H
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:24:22 +0100 (CET)
Received: from localhost.localdomain (ip5b4132a0.dynamic.kabel-deutschland.de
 [91.65.50.160])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 80C3383FD4;
 Mon,  2 Dec 2024 18:24:17 +0100 (CET)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Cc: Torben Voltmer <mail@t-voltmer.net>
Date: Mon,  2 Dec 2024 18:23:44 +0100
Message-ID: <20241202172344.3843005-1-mail@t-voltmer.net>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 80C3383FD4
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: aVye0JNlg/4r5V7zKLqNOFy3aM418tZBfHc760L2ahCcxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-8201.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH 1/1] package/openssh: split install of sshd and
 sftp-server
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using an ssh daemon other then the one provided by OpenSSH,
having the ability to install sftp-server separately can be useful.
For instance the Dropbear ssh daemon relies on an external sftp-server
implementation for sftp functionality.

So far, sshd, sshd-session and sftp-server could only be selected
together as BR2_PACKAGE_OPENSSH_SERVER.
By splitting the installation of the server components, installing
just the sftp-server executable is possible.

In order to not break existing configurations two steps were taken:
- BR2_PACKAGE_OPENSSH_SERVER was explicitly not renamed
- BR2_PACKAGE_OPENSSH_SERVER selects the new
  BR2_PACKAGE_OPENSSH_SFTP_SERVER config

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/openssh/Config.in  | 10 +++++++++-
 package/openssh/openssh.mk | 12 +++++++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..70befd017a 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -23,8 +23,16 @@ config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSH_SFTP_SERVER
 	help
-	  Server programs: sshd, sftp-server
+	  Server programs: sshd, sshd-session
+
+config BR2_PACKAGE_OPENSSH_SFTP_SERVER
+	bool "sftp-server"
+	default y
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Server programs: sftp-server
 
 config BR2_PACKAGE_OPENSSH_KEY_UTILS
 	bool "key utilities"
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 95c059e03d..dd5946b795 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -115,12 +115,11 @@ OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_CLIENT_PROGRAMS
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
-define OPENSSH_INSTALL_SERVER_PROGRAMS
+define OPENSSH_INSTALL_SSHD_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
 	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
-	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 endef
-OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSHD_SERVER_PROGRAMS
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
@@ -134,6 +133,13 @@ define OPENSSH_INSTALL_INIT_SYSV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSH_SFTP_SERVER),y)
+define OPENSSH_INSTALL_SFTP_SERVER
+	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
+endef
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SFTP_SERVER
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSH_KEY_UTILS),y)
 define OPENSSH_INSTALL_KEY_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/ssh-keygen $(TARGET_DIR)/usr/bin/ssh-keygen
-- 
2.47.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
