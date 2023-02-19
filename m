Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF9C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BB84179F;
	Sun, 19 Feb 2023 17:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4BB84179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPe7tWsseVyr; Sun, 19 Feb 2023 17:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4694176C;
	Sun, 19 Feb 2023 17:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB4694176C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2C601BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD1BC60B21
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD1BC60B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qehhISC8Kjy6 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:52:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D01A605B3
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D01A605B3
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:52:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b11so1445628wrw.5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 09:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6joreWH3tjJUZBGWZAYdl6i98GBHmUCT8rgTho3Zb5s=;
 b=LMqHodnSnuL3Vnn46iQoI9ypiBAvL1DP4XK8eQxFuaTjMMAY4VOjYJUBwuWjjZj1lS
 GIkP4p8VdazEJ6PCRvdlluH9t8aig3nHpTb1/Dl9KtNsDMHwYll9JfPxe139Vjog4wbx
 1c9ve1wxhuVAckpSPxAArDaKlGWu7M5PN4dnSQDg+8++aBHYkrdzK5BOLztoRx7Vsauz
 F5M5/ZmAO2r/8c9lRa47Zds/fIMGK/OOZk5MfehDtWA3Da07rX2wodDiFljao2SnX/UZ
 TPuCJ0sXwAbF8Mj4yc9DGMOLBoNPbli0ZWwGNf9QdIeGxSa+XLLuWWnF0vANG0VQqTMc
 1a0g==
X-Gm-Message-State: AO0yUKUwtVr7m0+blO3Zbo0sdkAU8NUTr0p52ZxF8xP5aQD+hDxwrGed
 LrdGGG6UR8YsQPHWi/U5IEqDzctYEHw=
X-Google-Smtp-Source: AK7set8q3EWYso/8QGzXJrdKucdnls1WbDOZ1Fb6tBeMftnzu0sMlhelVGqvfpY+6J13UTsQBCEM2A==
X-Received: by 2002:a5d:6ac1:0:b0:2c6:5a4e:ea23 with SMTP id
 u1-20020a5d6ac1000000b002c65a4eea23mr1037446wrw.61.1676829129493; 
 Sun, 19 Feb 2023 09:52:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b002c6e8af1037sm2110117wrw.104.2023.02.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 09:52:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:52:04 +0100
Message-Id: <20230219175204.645686-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6joreWH3tjJUZBGWZAYdl6i98GBHmUCT8rgTho3Zb5s=;
 b=GeqbkFk+mU6uiicWNYJM/awOmfuYaOJmYANLHj9sqshMcyRH7TRKvp/3+iuxLR/EEm
 BinKVLyUxUK6z9LC6hXvGmTgSY8RLCKt6WuQyPvw20uNxzKKuep5wi4GOB5TvC4BZ1fl
 vFRO5I6Vt/gEoZMZP/ZtQBmKDC7LzaAKj949RvwwEDwuYGDl0FMz0NsY7/TAkeY0pdh8
 DIiwvKxJEp2U0S2VMn2Z5ZU9mx532yBXJZz7rrSEBURNIAZInl0pl78j5ceaFRop0sbe
 S5pxj+T4oy7wK4qA/YhdXFHtPTdEzQ56we0wIyHEcff5dcg6iZCB/CLC0pkYBvfdDEa8
 bYxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GeqbkFk+
Subject: [Buildroot] [PATCH 1/1] package/less: fix CVE-2022-46663
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In GNU Less before 609, crafted data can result in "less -R" not
filtering ANSI escape sequences sent to the terminal.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-on-invalid-embedded-escape-sequence.patch | 27 +++++++++++++++++++
 package/less/less.mk                          |  3 +++
 2 files changed, 30 insertions(+)
 create mode 100644 package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
