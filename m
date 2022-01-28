Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902BCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2080D40105;
	Fri, 28 Jan 2022 21:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxd9NMYYVCZb; Fri, 28 Jan 2022 21:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB0A40148;
	Fri, 28 Jan 2022 21:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 095D51BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04DD940321
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S60GTEKwEV0v for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:58:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F11BB402C3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:58:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 14EC182B53; Fri, 28 Jan 2022 21:51:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:55:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d146485de18f807015a17926918c7c4a02de48a5
X-Git-Newrev: 90cf9188c96f391ac56788100af326df923b4c37
X-Patchwork-Hint: ignore
Message-Id: <20220128215117.14EC182B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/polkit: backport
 upstream patch to fix CVE-2021-4034
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

commit: https://git.buildroot.net/buildroot/commit/?id=90cf9188c96f391ac56788100af326df923b4c37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-local-privilege-escalation-CVE-2021-4034.patch | 80 ++++++++++++++++++++++
 package/polkit/polkit.mk                           |  3 +
 2 files changed, 83 insertions(+)

diff --git a/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch b/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch
new file mode 100644
index 0000000000..515fdb81c1
--- /dev/null
+++ b/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch
@@ -0,0 +1,80 @@
+From a2bf5c9c83b6ae46cbd5c779d3055bff81ded683 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Tue, 25 Jan 2022 17:21:46 +0000
+Subject: [PATCH] pkexec: local privilege escalation (CVE-2021-4034)
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/programs/pkcheck.c |  5 +++++
+ src/programs/pkexec.c  | 23 ++++++++++++++++++++---
+ 2 files changed, 25 insertions(+), 3 deletions(-)
+
+diff --git a/src/programs/pkcheck.c b/src/programs/pkcheck.c
+index f1bb4e1..768525c 100644
+--- a/src/programs/pkcheck.c
++++ b/src/programs/pkcheck.c
+@@ -363,6 +363,11 @@ main (int argc, char *argv[])
+   local_agent_handle = NULL;
+   ret = 126;
+ 
++  if (argc < 1)
++    {
++      exit(126);
++    }
++
+   /* Disable remote file access from GIO. */
+   setenv ("GIO_USE_VFS", "local", 1);
+ 
+diff --git a/src/programs/pkexec.c b/src/programs/pkexec.c
+index 7698c5c..84e5ef6 100644
+--- a/src/programs/pkexec.c
++++ b/src/programs/pkexec.c
+@@ -488,6 +488,15 @@ main (int argc, char *argv[])
+   pid_t pid_of_caller;
+   gpointer local_agent_handle;
+ 
++
++  /*
++   * If 'pkexec' is called THIS wrong, someone's probably evil-doing. Don't be nice, just bail out.
++   */
++  if (argc<1)
++    {
++      exit(127);
++    }
++
+   ret = 127;
+   authority = NULL;
+   subject = NULL;
+@@ -614,10 +623,10 @@ main (int argc, char *argv[])
+ 
+       path = g_strdup (pwstruct.pw_shell);
+       if (!path)
+-	{
++        {
+           g_printerr ("No shell configured or error retrieving pw_shell\n");
+           goto out;
+-	}
++        }
+       /* If you change this, be sure to change the if (!command_line)
+ 	 case below too */
+       command_line = g_strdup (path);
+@@ -636,7 +645,15 @@ main (int argc, char *argv[])
+           goto out;
+         }
+       g_free (path);
+-      argv[n] = path = s;
++      path = s;
++
++      /* argc<2 and pkexec runs just shell, argv is guaranteed to be null-terminated.
++       * /-less shell shouldn't happen, but let's be defensive and don't write to null-termination
++       */
++      if (argv[n] != NULL)
++      {
++        argv[n] = path;
++      }
+     }
+   if (access (path, F_OK) != 0)
+     {
+-- 
+2.25.1
+
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e00b634b7f..3fd041a813 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -12,6 +12,9 @@ POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
+# 0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch
+POLKIT_IGNORE_CVE = CVE-2021-4034
+
 POLKIT_DEPENDENCIES = \
 	libglib2 host-intltool expat spidermonkey $(TARGET_NLS_DEPENDENCIES)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
