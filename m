Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE24C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B3A4431BB;
	Wed,  1 Nov 2023 17:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B3A4431BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O5QVPkFixv7; Wed,  1 Nov 2023 17:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F9441768;
	Wed,  1 Nov 2023 17:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F9441768
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE32A1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A464ED61
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A464ED61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ta81WqSkwBus for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2684149DFC
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2684149DFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 103348639D; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:51:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 709c8cc37e37bbd89c9e6a6296c1adefe03bbe93
X-Git-Newrev: b652a546eb4a25b396a5d6b305df4b0003e3f214
X-Patchwork-Hint: ignore
Message-Id: <20231101170149.103348639D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/reproc: fix build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=b652a546eb4a25b396a5d6b305df4b0003e3f214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/src/reproc.cpp:1:
/home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:95:5: error: declaration of 'reproc::options::<unnamed struct> reproc::options::env' changes meaning of 'env' [-Wchanges-meaning]
   95 |   } env = {};
      |     ^~~
/home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:91:5: note: used here to mean 'class reproc::env'
   91 |     env::type behavior;
      |     ^~~

Fixes:
 - http://autobuild.buildroot.org/results/11feca3698154c255938ab3b25a34429135c31f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-reproc-Try-to-fix-gcc-13-build.patch      | 37 ++++++++++++++++++++++
 package/reproc/0002-Fix-gcc-13-build.patch         | 28 ++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch b/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
new file mode 100644
index 0000000000..22b21bcbc7
--- /dev/null
+++ b/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
@@ -0,0 +1,37 @@
+From 0b23d88894ccedde04537fa23ea55cb2f8365342 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Sat, 18 Mar 2023 19:38:19 +0100
+Subject: [PATCH] reproc++: Try to fix gcc 13 build
+
+Upstream: https://github.com/DaanDeMeyer/reproc/commit/0b23d88894ccedde04537fa23ea55cb2f8365342
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ reproc++/include/reproc++/reproc.hpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/reproc++/include/reproc++/reproc.hpp b/reproc++/include/reproc++/reproc.hpp
+index ab6f1394..e883ecec 100644
+--- a/reproc++/include/reproc++/reproc.hpp
++++ b/reproc++/include/reproc++/reproc.hpp
+@@ -88,7 +88,7 @@ struct redirect {
+ 
+ struct options {
+   struct {
+-    env::type behavior;
++    enum env::type behavior;
+     /*! Implicitly converts from any STL container of string pairs to the
+     environment format expected by `reproc_start`. */
+     class env extra;
+@@ -97,9 +97,9 @@ struct options {
+   const char *working_directory = nullptr;
+ 
+   struct {
+-    redirect in;
+-    redirect out;
+-    redirect err;
++    struct redirect in;
++    struct redirect out;
++    struct redirect err;
+     bool parent;
+     bool discard;
+     FILE *file;
diff --git a/package/reproc/0002-Fix-gcc-13-build.patch b/package/reproc/0002-Fix-gcc-13-build.patch
new file mode 100644
index 0000000000..3e06a2a396
--- /dev/null
+++ b/package/reproc/0002-Fix-gcc-13-build.patch
@@ -0,0 +1,28 @@
+From 9f399675b821e175f85ac3ee6e3fd2e6056573eb Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Fri, 21 Apr 2023 19:36:45 +0200
+Subject: [PATCH] Fix gcc 13 build
+
+Upstream: https://github.com/DaanDeMeyer/reproc/commit/9f399675b821e175f85ac3ee6e3fd2e6056573eb
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ reproc++/include/reproc++/reproc.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/reproc++/include/reproc++/reproc.hpp b/reproc++/include/reproc++/reproc.hpp
+index b52f495e..7b614a94 100644
+--- a/reproc++/include/reproc++/reproc.hpp
++++ b/reproc++/include/reproc++/reproc.hpp
+@@ -88,10 +88,10 @@ struct redirect {
+ 
+ struct options {
+   struct {
+-    enum env::type behavior;
++    reproc::env::type behavior;
+     /*! Implicitly converts from any STL container of string pairs to the
+     environment format expected by `reproc_start`. */
+-    class env extra;
++    reproc::env extra;
+   } env = {};
+ 
+   const char *working_directory = nullptr;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
