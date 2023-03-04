Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E7C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 14:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ACEC4011E;
	Sat,  4 Mar 2023 14:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ACEC4011E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkcdUqnPHhRj; Sat,  4 Mar 2023 14:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5AF2408AA;
	Sat,  4 Mar 2023 14:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5AF2408AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62EE31BF357
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 14:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BCA381CDC
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 14:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BCA381CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaS0qJJhsPHF for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 14:22:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D89C981DE8
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 14:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D89C981DE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8CDE860FD; Sat,  4 Mar 2023 14:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 14:39:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4d7b942fce6024af6e61c82e1cca19e65145c558
X-Git-Newrev: 3536574469a757f87c05223c382280c8a0029445
X-Patchwork-Hint: ignore
Message-Id: <20230304142222.C8CDE860FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/dmalloc: convert
 existing patch to git format
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

commit: https://git.buildroot.net/buildroot/commit/?id=3536574469a757f87c05223c382280c8a0029445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

We're going to add more patches, so let's cleanup our historical
baggage...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a7bd0fdb88a15b15d4b41bdc82a37cf35ab2b268)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dmalloc/0001-configure-fix-build-on-mips.patch | 90 ++++++++++++++++++++++
 package/dmalloc/0001-mips.patch                    | 45 -----------
 2 files changed, 90 insertions(+), 45 deletions(-)

diff --git a/package/dmalloc/0001-configure-fix-build-on-mips.patch b/package/dmalloc/0001-configure-fix-build-on-mips.patch
new file mode 100644
index 0000000000..9b1525d0d1
--- /dev/null
+++ b/package/dmalloc/0001-configure-fix-build-on-mips.patch
@@ -0,0 +1,90 @@
+From af6adb3f5f05be4faa88a5aa83296c388c8085e7 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 8 Feb 2023 12:30:10 +0100
+Subject: [PATCH] configure: fix build on mips
+
+This patch is a historical baggage that Buildroot has carried for ages
+(since 2006), and the reason for it are notentirely clear.
+
+Since dmalloc is pretty tricky, and as this patch has not been
+identified as causing issues, we keep it; we just add the configure.ac
+patchlet to match the one in configure.
+
+As for the title, the original patch was named dmalloc-mips.patch, so
+presumably it fixes some mips issue; let's title the commit that way.
+
+[Fabrice: Updated for 5.6.5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998@free.fr: make it a git-formatted patch]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure    |  4 ++--
+ configure.ac |  2 +-
+ return.h     | 16 +++-------------
+ 3 files changed, 6 insertions(+), 16 deletions(-)
+
+diff --git a/configure b/configure
+index d52a1e8..c18dfb2 100755
+--- a/configure
++++ b/configure
+@@ -5413,8 +5413,8 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking return.h macros work" >&5
+ $as_echo_n "checking return.h macros work... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-   $as_echo "#define RETURN_MACROS_WORK 0" >>confdefs.h
+- { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++   $as_echo "#define RETURN_MACROS_WORK 1" >>confdefs.h
++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: assume yes (cross-compiling)" >&5
+ $as_echo "no" >&6; }
+ 
+ else
+diff --git a/configure.ac b/configure.ac
+index a5295f1..9740fdc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -705,7 +705,7 @@ int main()
+ ])],
+ [ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([yes]) ],
+ [ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ],
+-[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ]
++[ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([assume yes (cross-compiling)]) ]
+ )
+ 
+ ##############################################################################
+diff --git a/return.h b/return.h
+index 9d3f5f1..d916c7a 100644
+--- a/return.h
++++ b/return.h
+@@ -117,26 +117,16 @@
+ /*************************************/
+ 
+ /*
+- * For DEC Mips machines running Ultrix
++ * For Mips machines running Linux
+  */
+ #if __mips
+ 
+-/*
+- * I have no idea how to get inline assembly with the default cc.
+- * Anyone know how?
+- */
+-
+-#if 0
+-
+ /*
+  * NOTE: we assume here that file is global.
+  *
+- * $31 is the frame pointer.  $2 looks to be the return address but maybe
+- * not consistently.
++ * $31 is the return address.
+  */
+-#define GET_RET_ADDR(file)	asm("sw $2, file")
+-
+-#endif
++#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
+ 
+ #endif /* __mips */
+ 
+-- 
+2.25.1
+
diff --git a/package/dmalloc/0001-mips.patch b/package/dmalloc/0001-mips.patch
deleted file mode 100644
index 3150d030ec..0000000000
--- a/package/dmalloc/0001-mips.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-[Fabrice: Updated for 5.6.5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---- a/configure
-+++ b/configure
-@@ -7107,7 +7107,7 @@
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking return.h macros work" >&5
- $as_echo_n "checking return.h macros work... " >&6; }
- if test "$cross_compiling" = yes; then :
--   $as_echo "#define RETURN_MACROS_WORK 0" >>confdefs.h
-+   $as_echo "#define RETURN_MACROS_WORK 1" >>confdefs.h
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
- $as_echo "no" >&6; }
- 
---- a/return.h
-+++ b/return.h
-@@ -106,26 +106,16 @@
- /*************************************/
- 
- /*
-- * For DEC Mips machines running Ultrix
-+ * For Mips machines running Linux
-  */
- #if __mips
- 
- /*
-- * I have no idea how to get inline assembly with the default cc.
-- * Anyone know how?
-- */
--
--#if 0
--
--/*
-  * NOTE: we assume here that file is global.
-  *
-- * $31 is the frame pointer.  $2 looks to be the return address but maybe
-- * not consistently.
-+ * $31 is the return address.
-  */
--#define GET_RET_ADDR(file)	asm("sw $2, file")
--
--#endif
-+#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
- 
- #endif /* __mips */
- 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
