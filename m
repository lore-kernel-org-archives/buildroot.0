Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB16C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A931408DC;
	Sat, 25 Feb 2023 09:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A931408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ahT-eUbJHnN; Sat, 25 Feb 2023 09:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56A1740BCD;
	Sat, 25 Feb 2023 09:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56A1740BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E29FF1BF860
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4E9E60B60
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E9E60B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Vt-In8R6XG2 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D423A60BAD
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D423A60BAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2CA986A8E; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:48:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6b4217312815379a7c52bf5d53752dbe0838645
X-Git-Newrev: 4a99d6611f0de6b1844cdbdc81d0ff25949c2b16
X-Patchwork-Hint: ignore
Message-Id: <20230225095001.C2CA986A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: fix build without
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a99d6611f0de6b1844cdbdc81d0ff25949c2b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...wscript-fix-build-without-stack-protector.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
