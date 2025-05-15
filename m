Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC59C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1C061339;
	Fri, 16 May 2025 11:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzagifScLLxg; Fri, 16 May 2025 11:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F104E6132D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F104E6132D;
	Fri, 16 May 2025 11:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 140BB1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B71A40ADB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HDcpu6y_zJy for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C1A04227A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C1A04227A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 798CC86A17; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4cf750826ff31bcddcdece037500c4d1e5cc3490
X-Git-Newrev: 7e2b4f4d4170beb41f58dc4fdad3602c0d97bb9e
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.798CC86A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gmp: add patch to
 fix build with gcc-15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0601304351035319267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0601304351035319267==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7e2b4f4d4170beb41f58dc4fdad3602c0d97bb9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When using host gcc 15, host-gmp fails at configure time with
error message:

    configure: error: could not find a working compiler, see config.log for details

The error is due to the macro GMP_PROG_CC_WORKS in the file
acinclude.m4 containing C-code declaring functions without declaring
its parameters. This construct is now an error in C23, which is the
new default in gcc 15. See:
https://gcc.gnu.org/gcc-15/porting_to.html#c23

This commit fixes the issue by adding a package patch from
upstream changesets, not yet published in a release.

Even if gcc 15 is not yet included in Buildroot, this commit also
sets _AUTORECONF = YES for the target package in order to have this
package already fixed.

Fixes:
https://autobuild.buildroot.org/results/623634fa7bbeceeb6d90b15ce0abb1b9b4b24045/

Tested-by: Brigham Campbell <me@brighamcampbell.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 31569bcc1b0762636d704baad0b35fc37aedb386)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...nction-prototype-in-acinclude.m4-for-C23-.patch | 51 ++++++++++++++++++++++
 package/gmp/gmp.mk                                 |  4 ++
 2 files changed, 55 insertions(+)

diff --git a/package/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch b/package/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
new file mode 100644
index 0000000000..129a4a88e0
--- /dev/null
+++ b/package/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
@@ -0,0 +1,51 @@
+From 9cd0c36d0110191a5f42e268d7bd21a95a2aa883 Mon Sep 17 00:00:00 2001
+From: Marc Glisse <marc.glisse@inria.fr>
+Date: Wed, 29 Jan 2025 22:38:02 +0100
+Subject: [PATCH] Complete function prototype in acinclude.m4 for C23
+ compatibility
+
+Add parameter names to function prototype
+
+Upstream: https://gmplib.org/repo/gmp/rev/d66d66d82dbb
+Upstream: https://gmplib.org/repo/gmp/rev/8e7bb4ae7a18
+Signed-off-by: Marc Glisse <marc.glisse@inria.fr>
+[Julien: git patch adapted from two upstream mercurial changesets]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ ChangeLog    | 9 +++++++++
+ acinclude.m4 | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 2902cd2..d808a8b 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2025-03-15  Khem Raj <raj.khem@gmail.com>
++
++	* acinclude.m4: Add parameter names to function prototype.
++
++2025-01-29  Rudi Heitbaum <rudi@heitbaum.com>
++	    Marc Glisse <marc.glisse@inria.fr>
++
++	* acinclude.m4: Complete function prototype.
++
+ 2023-07-29  Torbjörn Granlund  <tg@gmplib.org>
+ 
+ 	* Version 6.3.0 released.
+diff --git a/acinclude.m4 b/acinclude.m4
+index 9cf9483..b79a431 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -609,7 +609,7 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 1],
+ 
+ #if defined (__GNUC__) && ! defined (__cplusplus)
+ typedef unsigned long long t1;typedef t1*t2;
+-void g(){}
++void g(int a,t1 const*b,t1 c,t2 d,t1 const*e,int f){}
+ void h(){}
+ static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+-- 
+2.49.0
+
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7e8da9025c..07aa4aefdf 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,10 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+# 0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
+GMP_AUTORECONF = YES
+HOST_GMP_AUTORECONF = YES
+
 GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet

--===============0601304351035319267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0601304351035319267==--
