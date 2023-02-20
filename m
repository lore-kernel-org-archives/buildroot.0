Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B2AC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 488F98143F;
	Mon, 20 Feb 2023 17:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 488F98143F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2nBCyH-fyu3; Mon, 20 Feb 2023 17:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E9D812B9;
	Mon, 20 Feb 2023 17:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E9D812B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 978901BF2B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 726AE40BE2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726AE40BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwyDtImGCDcX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:14:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41684012F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41684012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89596863E7; Mon, 20 Feb 2023 17:14:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:05:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd351c4e933e48f380cc8924d1659b220d13b70c
X-Git-Newrev: 924ca9414fa962ce767c39b277489a0bdcbfad79
X-Patchwork-Hint: ignore
Message-Id: <20230220171438.89596863E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: fix CVE-2022-46663
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

commit: https://git.buildroot.net/buildroot/commit/?id=924ca9414fa962ce767c39b277489a0bdcbfad79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In GNU Less before 609, crafted data can result in "less -R" not
filtering ANSI escape sequences sent to the terminal.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
