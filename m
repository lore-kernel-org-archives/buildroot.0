Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E28C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1338C416C7;
	Sat,  4 Mar 2023 19:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1338C416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBc_nwmO3EXv; Sat,  4 Mar 2023 19:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD07141695;
	Sat,  4 Mar 2023 19:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD07141695
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DEF91BF855
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36DA640386
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36DA640386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70iprlsWk2Cu for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F218940607
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F218940607
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF91186163; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:38:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 34a3f617815ff2fbfd98379b2880f4848c9a99fd
X-Git-Newrev: 9f0acac3f7608a17489c9a40ad646dbaea8788b5
X-Patchwork-Hint: ignore
Message-Id: <20230304195132.DF91186163@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/less: fix
 CVE-2022-46663
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f0acac3f7608a17489c9a40ad646dbaea8788b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

In GNU Less before 609, crafted data can result in "less -R" not
filtering ANSI escape sequences sent to the terminal.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 924ca9414fa962ce767c39b277489a0bdcbfad79)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rlink-on-invalid-embedded-escape-sequence.patch | 27 ++++++++++++++++++++++
 package/less/less.mk                               |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch b/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
new file mode 100644
index 0000000000..233f949e24
--- /dev/null
+++ b/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
@@ -0,0 +1,27 @@
+From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Fri, 7 Oct 2022 19:25:46 -0700
+Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
+
+[Retrieved from:
+https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ line.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/line.c b/line.c
+index 236c49ae..cba7bdd1 100644
+--- a/line.c
++++ b/line.c
+@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
+ 		/* Hyperlink ends with \7 or ESC-backslash. */
+ 		if (ch == '\7')
+ 			return ANSI_END;
+-		if (pansi->prev_esc && ch == '\\')
+-			return ANSI_END;
++		if (pansi->prev_esc)
++            return (ch == '\\') ? ANSI_END : ANSI_ERR;
+ 		pansi->prev_esc = (ch == ESC);
+ 		return ANSI_MID;
+ 	}
diff --git a/package/less/less.mk b/package/less/less.mk
index 7d7a6d5fe5..f01f94d6c8 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -11,6 +11,9 @@ LESS_LICENSE_FILES = COPYING
 LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
+# 0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
+LESS_IGNORE_CVES += CVE-2022-46663
+
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
