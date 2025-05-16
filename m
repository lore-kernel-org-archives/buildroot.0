Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCBC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2082070DE6;
	Mon, 19 May 2025 11:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id as6Tuf6tnx7w; Mon, 19 May 2025 11:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A454D70DDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A454D70DDC;
	Mon, 19 May 2025 11:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 571CAE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32711414D3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jtp2UCaeGeWU for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 326B24176A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 326B24176A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D3A68348A; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 11:19:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aaa50b0e617eb0b288efd00c384a305e90289690
X-Git-Newrev: 211e822d433806893c1395b55c1d891343a07aa0
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.2D3A68348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openssh: apply
 security patch for CVE-2025-32728 (sshd)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=211e822d433806893c1395b55c1d891343a07aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32728

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to CVE in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-logic-error-in-disableforwarding-option.patch | 49 ++++++++++++++++++++++
 package/openssh/openssh.mk                         |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
new file mode 100644
index 0000000000..2c64ec1910
--- /dev/null
+++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
@@ -0,0 +1,49 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option.
+
+This option was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
+
+Fixes the following CVE:
+  - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
+                    directive does not adhere to the documentation stating
+                    that it disables X11 and agent forwarding.
+
+[Titouan: 
+ - Remove diff on OpenBSD comment at the top of the file that does not apply
+   cleanly on openssh 9.9
+]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ session.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/session.c b/session.c
+index 52a4a3446e6..6444c77f31c 100644
+--- a/session.c
++++ b/session.c
+@@ -2171,7 +2171,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2566,7 +2567,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+ 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+ 		return 0;
+ 	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+ 		debug("X11 forwarding disabled in server configuration file.");
+ 		return 0;
+ 	}
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 115290ce13..b5e4645b50 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
+# 0001-fix-logic-error-in-disableforwarding-option.patch
+OPENSSH_IGNORE_CVES += CVE-2025-32728
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
