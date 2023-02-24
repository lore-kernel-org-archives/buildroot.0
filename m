Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AE4C64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 10:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2AE60F72;
	Fri, 24 Feb 2023 10:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2AE60F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfEjRjm3-vIg; Fri, 24 Feb 2023 10:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C660260F30;
	Fri, 24 Feb 2023 10:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C660260F30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 667141BF3C8
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3751181F3D
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3751181F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8f_r_9-SpMQ for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 10:51:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2267381F2B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2267381F2B
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:51:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso1464060wmp.4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 02:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a73u9fSnOHebLgw9/4O7djfssYMOvP9jFIwT8GJnEls=;
 b=VMn+j7oMaZMpvq1k/0n+0HrGsqnZqHD5OWVfRQhTswu/fiaX5NMeIVzefovnUPKFrv
 f0bTe6Qpxs8HKFECIJa1wbZTvYS+boVck1RDqVpTvxSsngLZHdHWqmzpxr3EptZd+U3G
 SNH+K+u3QwjVQIEq4BXFmqSfYbmqdhUKx5H7dlPfl+8nBvNP2RpKHLeBobipGnpKZn3b
 JZE2Cdj4gxwzf5bRwNjyQHGpTM8ohoMcqEtLLVey5w+pLaTjMHxPFm31/O3UjuXpRdRs
 s/hAgstp9ee8EcU9eIn2HINQ8clWNpxNK36yU0nIgqD3padceq5XGcovArSMMsbFYWwP
 hMyw==
X-Gm-Message-State: AO0yUKUEgZEMG1o6E5jgKDOftUsc7k8MDwPNY28UJ3UPtyAFzMuCHzIl
 EubuFK20OIGqvuffcDTBp0nYfptN4Zg=
X-Google-Smtp-Source: AK7set9/K40tV1HBaG11i/PG8z+gi6MBuiKTWRPi4RV5eI7wpffnwsSQFudYKi4iiuPfFwdWbWCewA==
X-Received: by 2002:a05:600c:1716:b0:3dc:5302:ad9 with SMTP id
 c22-20020a05600c171600b003dc53020ad9mr6166703wmn.27.1677235911020; 
 Fri, 24 Feb 2023 02:51:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003dc521f336esm2366635wmi.14.2023.02.24.02.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 02:51:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 11:51:48 +0100
Message-Id: <20230224105148.1780818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a73u9fSnOHebLgw9/4O7djfssYMOvP9jFIwT8GJnEls=;
 b=Cnt7acria0s53OrLDgMLFXZ73Aj4PpRl6pP+cVN6jOunEbVk8hopi+WVBPAHdEJMIJ
 XmHq9i0N5POgmzCBHrof08rIrW4sbF+TlMj8wINNobSvG2EhHyMzMymu9NNji1WIFX4b
 GQXohdGCmrgsY1n+WDm0+2KRfRVthqh4er804KY5BKsQiXw7uKSU3jSIsXwyqXvczMqs
 ScwUAlG3hletp1G+QNFQ+T9xMI4OuSY76NDOxIcxW4FHVRjMhC0/bnn6jvXAhWrU4LeC
 iyeiesuCQQvYu2MbvyT/FlwMsU2WpRpci1CZ1+FANAIgPkZUldRf+KyVEiCi+VyY6j7+
 RLuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cnt7acri
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: fix build without
 stack-protector
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

Fix the following build failure without stack-protector raised since the
addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Checking for library ssp                 : not found
Checking for library ssp_nonshared       : not found
Checking if C compiler supports -fstack-protector-all : yes

[...]

The configuration failed
(complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)

Fixes:
 - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
 - http://autobuild.buildroot.org/results/62be818e2f2eac07b4a2de6f4a8898cc4cc05b1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pt-fix-build-without-stack-protector.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch

diff --git a/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch b/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
new file mode 100644
index 0000000000..f494bf479c
--- /dev/null
+++ b/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
@@ -0,0 +1,50 @@
+From 0a3ce09c14eb9c7e36aa30a4dafe40e56676d678 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Feb 2023 11:33:32 +0100
+Subject: [PATCH] wscript: fix build without stack-protector
+
+-fstack-protector-all can depends on ssp library availability (e.g. on musl) so
+move the test from cc_test_flags to ld_hardening_flags, this will avoid the
+following build failure:
+
+Checking for library ssp                 : not found
+Checking for library ssp_nonshared       : not found
+Checking if C compiler supports -fstack-protector-all : yes
+
+[...]
+
+The configuration failed
+(complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ntpsec/ntpsec/pull/6]
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index be396b33b..f301809fc 100644
+--- a/wscript
++++ b/wscript
+@@ -298,7 +298,6 @@ def configure(ctx):
+         ctx.env.LDFLAGS += ["-lssp_nonshared"]
+ 
+     cc_test_flags = [
+-        ('f_stack_protector_all', '-fstack-protector-all'),
+         ('PIC', '-fPIC'),
+         ('PIE', '-pie -fPIE'),
+         # this quiets most of macOS warnings on -fpie
+@@ -332,6 +331,7 @@ def configure(ctx):
+ 
+     # Check which linker flags are supported
+     ld_hardening_flags = [
++        ('f_stack_protector_all', '-fstack-protector-all'),
+         ("z_now", "-Wl,-z,now"),     # no deferred symbol resolution
+     ]
+ 
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
