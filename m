Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E94C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F9FD40BED;
	Tue, 20 Aug 2024 20:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8SrB8ZajJ_x; Tue, 20 Aug 2024 20:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9223A40BE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9223A40BE2;
	Tue, 20 Aug 2024 20:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE5D1BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3ADF403A6
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4z15B0PDklU for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F28D4029B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F28D4029B
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BF4586194; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 22:05:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4d68f0d040c47a98e008e28ba146c6d12000262c
X-Git-Newrev: 38b8112733e51ec23ab33a5b2ab14ca0b780b816
X-Patchwork-Hint: ignore
Message-Id: <20240820200712.5BF4586194@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/dhrystone: fix
 build with GCC 14.x
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
Content-Type: multipart/mixed; boundary="===============4958534351139468587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4958534351139468587==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=38b8112733e51ec23ab33a5b2ab14ca0b780b816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

GCC14 will give errors for missing function declarations and
missing return types :

dhry_1.c:75:1: error: return type defaults to ‘int’ [-Wimplicit-int]
   75 | main(int argc, char *argv[])
      | ^~~~
dhry_1.c: In function ‘main’:
dhry_1.c:159:5: error: implicit declaration of function ‘Proc_5’ [-Wimplicit-function-declaration]
  159 |     Proc_5();
      |     ^~~~~~

Fixes:

  http://autobuild.buildroot.net/results/8e65ba30efd5a6bca197f24ced2db1f8226b2c51/

Signed-off-by: Steffen Persvold <spersvold@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3847a145c23234b3bddae3a9ceb9d2d4e6a90fc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0006-Add-missing-function-declarations.patch   | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/package/dhrystone/0006-Add-missing-function-declarations.patch b/package/dhrystone/0006-Add-missing-function-declarations.patch
new file mode 100644
index 0000000000..0518340e3f
--- /dev/null
+++ b/package/dhrystone/0006-Add-missing-function-declarations.patch
@@ -0,0 +1,152 @@
+From fd7ce4b6a9e268e60071c94852f7f00f6e60ef11 Mon Sep 17 00:00:00 2001
+From: Steffen Persvold <spersvold@gmail.com>
+Date: Mon, 15 Jul 2024 11:16:36 +0200
+Subject: [PATCH] Add missing function declarations
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+GCC14 will give errors for missing function declarations and
+missing return types :
+
+dhry_1.c:75:1: error: return type defaults to ‘int’ [-Wimplicit-int]
+   75 | main(int argc, char *argv[])
+      | ^~~~
+dhry_1.c: In function ‘main’:
+dhry_1.c:159:5: error: implicit declaration of function ‘Proc_5’ [-Wimplicit-function-declaration]
+  159 |     Proc_5();
+      |     ^~~~~~
+
+Upstream: dead
+Signed-off-by: Steffen Persvold <spersvold@gmail.com>
+---
+ dhry_1.c | 26 +++++++++++++++++---------
+ dhry_2.c |  8 ++++----
+ 2 files changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/dhry_1.c b/dhry_1.c
+index 3ed1716..cad5840 100644
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -32,6 +32,7 @@ int             Arr_2_Glob [50] [50];
+ extern char     *malloc ();
+ #endif
+ Enumeration     Func_1 ();
++Boolean         Func_2 ();
+   /* forward declaration necessary since Enumeration may not simply be int */
+ 
+ #ifndef REG
+@@ -71,8 +72,17 @@ float           Microseconds,
+ 
+ /* end of variables for time measurement */
+ 
+-
+-main(int argc, char *argv[])
++/* forward declarations */
++void Proc_1 ();
++void Proc_2 ();
++void Proc_3 ();
++void Proc_4 ();
++void Proc_5 ();
++void Proc_6 ();
++void Proc_7 ();
++void Proc_8 ();
++
++int main(int argc, char *argv[])
+ /*****/
+ 
+   /* main program, corresponds to procedures        */
+@@ -295,7 +305,7 @@ main(int argc, char *argv[])
+ }
+ 
+ 
+-Proc_1 (Ptr_Val_Par)
++void Proc_1 (Ptr_Val_Par)
+ /******************/
+ 
+ REG Rec_Pointer Ptr_Val_Par;
+@@ -329,7 +339,7 @@ REG Rec_Pointer Ptr_Val_Par;
+ } /* Proc_1 */
+ 
+ 
+-Proc_2 (Int_Par_Ref)
++void Proc_2 (Int_Par_Ref)
+ /******************/
+     /* executed once */
+     /* *Int_Par_Ref == 1, becomes 4 */
+@@ -352,7 +362,7 @@ One_Fifty   *Int_Par_Ref;
+ } /* Proc_2 */
+ 
+ 
+-Proc_3 (Ptr_Ref_Par)
++void Proc_3 (Ptr_Ref_Par)
+ /******************/
+     /* executed once */
+     /* Ptr_Ref_Par becomes Ptr_Glob */
+@@ -367,7 +377,7 @@ Rec_Pointer *Ptr_Ref_Par;
+ } /* Proc_3 */
+ 
+ 
+-Proc_4 () /* without parameters */
++void Proc_4 () /* without parameters */
+ /*******/
+     /* executed once */
+ {
+@@ -379,7 +389,7 @@ Proc_4 () /* without parameters */
+ } /* Proc_4 */
+ 
+ 
+-Proc_5 () /* without parameters */
++void Proc_5 () /* without parameters */
+ /*******/
+     /* executed once */
+ {
+@@ -399,5 +409,3 @@ register int    l;
+         while (l--) *d++ = *s++;
+ }
+ #endif
+-
+-
+diff --git a/dhry_2.c b/dhry_2.c
+index 63a3d3e..25051e7 100644
+--- a/dhry_2.c
++++ b/dhry_2.c
+@@ -26,8 +26,9 @@
+ extern  int     Int_Glob;
+ extern  char    Ch_1_Glob;
+ 
++Boolean Func_3 ();
+ 
+-Proc_6 (Enum_Val_Par, Enum_Ref_Par)
++void Proc_6 (Enum_Val_Par, Enum_Ref_Par)
+ /*********************************/
+     /* executed once */
+     /* Enum_Val_Par == Ident_3, Enum_Ref_Par becomes Ident_2 */
+@@ -61,7 +62,7 @@ Enumeration *Enum_Ref_Par;
+ } /* Proc_6 */
+ 
+ 
+-Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
++void Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
+ /**********************************************/
+     /* executed three times                                      */ 
+     /* first call:      Int_1_Par_Val == 2, Int_2_Par_Val == 3,  */
+@@ -81,7 +82,7 @@ One_Fifty      *Int_Par_Ref;
+ } /* Proc_7 */
+ 
+ 
+-Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
++void Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
+ /*********************************************************************/
+     /* executed once      */
+     /* Int_Par_Val_1 == 3 */
+@@ -189,4 +190,3 @@ Enumeration Enum_Par_Val;
+   else /* not executed */
+     return (false);
+ } /* Func_3 */
+-
+-- 
+2.45.2
+

--===============4958534351139468587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4958534351139468587==--
