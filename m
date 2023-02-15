Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B19C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038E540209;
	Wed, 15 Feb 2023 21:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038E540209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcD14OHhcBnY; Wed, 15 Feb 2023 21:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3751D40354;
	Wed, 15 Feb 2023 21:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3751D40354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70F1D1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5860D60BE6
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5860D60BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyCp_5eaWCHC for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD4960B09
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD4960B09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16B1985EEC; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:45:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f16b97eab1859395ddd74f557d33ef8a1f2447d6
X-Git-Newrev: a7bd0fdb88a15b15d4b41bdc82a37cf35ab2b268
X-Patchwork-Hint: ignore
Message-Id: <20230215214803.16B1985EEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: convert existing patch to
 git format
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7bd0fdb88a15b15d4b41bdc82a37cf35ab2b268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're going to add more patches, so let's cleanup our historical
baggage...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
