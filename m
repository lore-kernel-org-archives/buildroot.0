Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8108C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D5C7409EF;
	Wed, 26 Jan 2022 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUgXdGFIhdg7; Wed, 26 Jan 2022 21:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F6C409EA;
	Wed, 26 Jan 2022 21:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4699A1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 325C584D90
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UESvmR01fKm4 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:02:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D7EF84D8F
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:02:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v13so1104954wrv.10
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QidztXcvFrW5HN9F2aNbNHZ0JLERXaDfdgHiTyltNts=;
 b=aCNyCUYzDV9SEQ+xQNbdvnCN10EiSfrUMM3L7TKd1d5hRhWSHvCoKzRcy3n3OYW5kw
 jgP26F21ZVINC2wdQ0UyvutvHOI0bd/zbAwSdNd8VNQB0dIt13ShbGiNJqoCl2LX8pO9
 SrO/kCPHuZPDFIY3KqibtFzivbpI9NvYiGiBFTTfp162OoP6JBnsxg41VvwFm7CcE4MF
 6LtS0SMvkKA2Jgh2Inp41P/QtwxhwMNnr+yII2tfKvobYpY7imAHAigujGLUshZ9WKGd
 y454mkRefbKdDX5xmdoWF9YuYgveWarkWfioe3A5Lo3rg47Nj0xQJ81AUEGVUAUNJAnp
 iipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QidztXcvFrW5HN9F2aNbNHZ0JLERXaDfdgHiTyltNts=;
 b=TXfZUDS3iQ3Xi4q2E3zG/mR41BwyongjUUh+FU0n/Sn8LXFMR/hl63tDsN3GsDW/3t
 isAO6oXlBxy/xtpxkBksI5EJgrwFdZ0+dZL4MmAEU6dkMdH8+REedXL+GvKnwHxOB1al
 O07YhVN3TWYl+ajM+Ir8FPHIuEwDNPYm0/CLAdOXnCYx6fSAA4wY2NinKEIcohp/S1jn
 IpV66Mjlsd3v8DwJrZD7F/s+QYXJUX9AbnibkfdnQQpXrTlSIMxDVQRbU8OPryVlpvwC
 d6G/hh4YHKDz0dn9jmxJEO1CRrRjVY2BB3Pu2TsPBgan54TLbV3XmJixW26wvYPjXz4r
 AENA==
X-Gm-Message-State: AOAM532PoMlpsEK6npancg+IUuP3PPs9aIIqTWhwYDHx6kylbztSVc3o
 cr/meo6R0Zy0ZBHCYRjHShLY0RimROA=
X-Google-Smtp-Source: ABdhPJzD9ETM5mTM3FYA/TGar4Z0HeYGTHw5t1BqRF1pwutTDQ29QFOJFblqNtZrQ/47VPL8rC5awQ==
X-Received: by 2002:a05:6000:1e1b:: with SMTP id
 bj27mr253128wrb.657.1643230951754; 
 Wed, 26 Jan 2022 13:02:31 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 by smtp.gmail.com with ESMTPSA id u7sm4117914wml.7.2022.01.26.13.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:02:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:02:26 +0100
Message-Id: <20220126210226.1689899-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2021.02.x] package/polkit: backport upstream
 patch to fix CVE-2021-4034
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...l-privilege-escalation-CVE-2021-4034.patch | 79 +++++++++++++++++++
 package/polkit/polkit.mk                      |  3 +
 2 files changed, 82 insertions(+)
 create mode 100644 package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch

diff --git a/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch b/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch
new file mode 100644
index 0000000000..8c01eed775
--- /dev/null
+++ b/package/polkit/0004-pkexec-local-privilege-escalation-CVE-2021-4034.patch
@@ -0,0 +1,79 @@
+From a2bf5c9c83b6ae46cbd5c779d3055bff81ded683 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Tue, 25 Jan 2022 17:21:46 +0000
+Subject: [PATCH] pkexec: local privilege escalation (CVE-2021-4034)
+
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
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
