Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 17:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C5040114;
	Thu,  3 Feb 2022 17:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I39vAkm-CaZY; Thu,  3 Feb 2022 17:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACCEA403FD;
	Thu,  3 Feb 2022 17:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2F181BF3EE
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 17:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1C8E817AB
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 17:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1KLEs0enA9a for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 17:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4C46817A5
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 17:19:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7666185wmj.2
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 09:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GW87/Gwsu5AcO9bLge89RBG1qk6g7HN0qvkkz5tTq0M=;
 b=FmTUzw55xJU0FFbVQmZAKbKz3fJbhc7CBdxW8hMH3vJZ3r8gMCZbQhGQyLIWLHFWtC
 6/yysHlR/2b8kJsdaMujFnwHwmR7ExVNx07gza08juH4RSXBny2Nv4eiFIreEp18EPCq
 nbCVmWCnhujCdTjV3di2isIjHZmYLufAkTr+liIIl5OT4za0V2Uc+2Qo5bSdkpuQqz2O
 ryQ39yLa4ouGtYJWr3mU0I8WTADNdsE4JzzhExSdGiGQuKBTUKwBP5dx98q6l2IkvNbQ
 TPHuuqzKPZlrM5ecPJqh6ZPd2NO2xbD40eHXyeqP6rtVOxqQe4Xh8K3X7LMfKMU/Im/+
 Athw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GW87/Gwsu5AcO9bLge89RBG1qk6g7HN0qvkkz5tTq0M=;
 b=2E7guPSIKMIUHUnL8CKzvvLY2tB4fmKG1Ub5puCyeIZn48/GIZq/Licm1yeaMprBdg
 TNBUjRuHK22d03bEFT4ckC0UC18TPwztqU0wfHCa7pMuIPPWt7nk2RzbEq3nEo+YVCP9
 8l8ip9ec+12erOeHf3HzwcAf9lGiaR1e1pO2oG9e3ynSH9FeyO/c49FM1kEQV7x6IBl7
 4OJgdOlFkFOHqPNxPEpQwJNEPOPImpsOqu3aQWmEneb0K+ctnBPsFpNJko4NpxtSKLtO
 wbYbWMvSBu5tiNDZkKOxMPdAu+yHbsKYVj/9jh593tjFzlTCYZn1KcT2KGzGUw29ovgY
 pYsw==
X-Gm-Message-State: AOAM530JwZbf1d37Hv1qdR7iyhtcfUOWawvgMgpzWwVWT5KPGu9LWla5
 Y/McXucjiSYSrZRMXCD9rK7p4QO9trI=
X-Google-Smtp-Source: ABdhPJwWMSBpgZNCz4ikC/yh24UkGphp9Fihpwt0PGHb/FK5+TRwzyR7Hz/hQk4UAavvaNGtwszrzw==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr11435699wmm.52.1643908765733; 
 Thu, 03 Feb 2022 09:19:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o8sm7284733wmc.46.2022.02.03.09.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:19:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 18:17:15 +0100
Message-Id: <20220203171715.658568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: bump to version 2.26
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

- Add upstream link to first patch
- Drop second patch (already in version)

https://github.com/storaged-project/libblockdev/blob/2.26-1/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-replacement-function-for-strerror_l.patch |  2 ++
 ...ec-Fix-deprecated-glib-function-call.patch | 32 -------------------
 package/libblockdev/libblockdev.hash          |  2 +-
 package/libblockdev/libblockdev.mk            |  2 +-
 4 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 018e4c4489..d5c9b2dfdb 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -8,6 +8,8 @@ so let's provide a simple replacement function that falls back on
 strerror().
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Upstream status:
+https://github.com/storaged-project/libblockdev/pull/701]
 ---
  configure.ac         | 2 ++
  src/plugins/crypto.c | 7 +++++++
diff --git a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
deleted file mode 100644
index 2c370a133f..0000000000
--- a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From aad927a81fd9067865dc391c5bbff12ac51a0002 Mon Sep 17 00:00:00 2001
-From: Manuel Wassermann <manuel.wassermann97@gmail.com>
-Date: Thu, 1 Jul 2021 04:45:49 +0200
-Subject: [PATCH] exec: Fix deprecated glib function call Glib will rename
- "g_spawn_check_exit_status()" to "g_spawn_check_wait_status()" in version
- 2.69.
-
-[Retrieved from:
-https://github.com/storaged-project/libblockdev/commit/aad927a81fd9067865dc391c5bbff12ac51a0002]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/utils/exec.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/utils/exec.c b/src/utils/exec.c
-index 317fb5525..8faeb289c 100644
---- a/src/utils/exec.c
-+++ b/src/utils/exec.c
-@@ -236,7 +236,12 @@ gboolean bd_utils_exec_and_report_status_error (const gchar **argv, const BDExtr
-     /* g_spawn_sync set the status in the same way waitpid() does, we need
-        to get the process exit code manually (this is similar to calling
-        WEXITSTATUS but also sets the error for terminated processes */
--    if (!g_spawn_check_exit_status (exit_status, error)) {
-+
-+    #if !GLIB_CHECK_VERSION(2, 69, 0)
-+    #define g_spawn_check_wait_status(x,y) (g_spawn_check_exit_status (x,y))
-+    #endif
-+
-+    if (!g_spawn_check_wait_status (exit_status, error)) {
-         if (g_error_matches (*error, G_SPAWN_ERROR, G_SPAWN_ERROR_FAILED)) {
-             /* process was terminated abnormally (e.g. using a signal) */
-             g_free (stdout_data);
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 101b99f1a8..53a3b0737f 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  555aa42a2db39649ad83253bdc902ab5bd63d39c123e0c8055c4de7fe7571668  libblockdev-2.25.tar.gz
+sha256  c4c0e10b35ac632bda8ce6d200b5601184984dec387fe59185921eb42432e069  libblockdev-2.26.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 39ae9230d9..36b74966fb 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 2.25
+LIBBLOCKDEV_VERSION = 2.26
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
