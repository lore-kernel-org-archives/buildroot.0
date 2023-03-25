Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCC3C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1BF81FFB;
	Sat, 25 Mar 2023 21:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1BF81FFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXbw1jxM6RE9; Sat, 25 Mar 2023 21:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CACA81FEA;
	Sat, 25 Mar 2023 21:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CACA81FEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05A0D1BF39A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74C2416E3
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74C2416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqCuvBM97G1H for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89869416F2
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89869416F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7747982ABB; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:47:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b21fc7532ce1aedadb2e6efc710add665eebd82d
X-Git-Newrev: cf7b3a1a36c7f60cc32117f4521c6571f68416a3
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.7747982ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuio: migrate to new autopoint
 flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf7b3a1a36c7f60cc32117f4521c6571f68416a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is no longer necessary after moving to new package flag.
Add patch to fix builds due to missing required files.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-configure-remove-po-Makefile.in.patch     | 26 ------------------
 ...ure.ac-set-automake-strictness-to-foreign.patch | 31 ++++++++++++++++++++++
 package/libuio/libuio.mk                           |  2 +-
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/package/libuio/0001-configure-remove-po-Makefile.in.patch b/package/libuio/0001-configure-remove-po-Makefile.in.patch
deleted file mode 100644
index 067465cc31..0000000000
--- a/package/libuio/0001-configure-remove-po-Makefile.in.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c5fa0b778e1c2a7d03ff6e661bdfa2faef878f68 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 1 Jul 2016 17:56:30 +0200
-Subject: [PATCH] configure: remove po/Makefile.in
-
-The file po/Makefile.in is automatically added to AC_OUTPUT while using gettexize
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f7fb40f..a25e463 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,5 +55,4 @@ dnl last but not least
- AC_OUTPUT([Makefile
- 	libuio.dox
- 	libuio-uninstalled.pc
--	libuio.pc
--	po/Makefile.in])
-+	libuio.pc])
--- 
-2.5.5
-
diff --git a/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
new file mode 100644
index 0000000000..1ce91f01f3
--- /dev/null
+++ b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
@@ -0,0 +1,31 @@
+From 546e07b2405455c03b7eb0d392c331e189913bc4 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 31 Jan 2023 19:06:29 -0600
+Subject: [PATCH] configure.ac: set automake strictness to foreign
+
+libuio does not conform to the GNU's strict layout requirements. [1]
+
+Set the strictness to foreign to account for this.
+
+[1] https://www.gnu.org/software/automake/manual/html_node/Strictness.html
+
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 101abd3..ef46171 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ dnl Every other copy of the package version number gets its value from here
+ AC_INIT(libuio, 0.2.8, https://github.com/linutronix/libuio/issues)
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER(config.h)
+ 
+-- 
+2.25.1
+
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index a0285277ab..d5019af594 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -14,7 +14,7 @@ LIBUIO_LIBS = $(TARGET_NLS_LIBS)
 LIBUIO_INSTALL_STAGING = YES
 
 # Fetched from github, no pre-generated configure script provided
-LIBUIO_GETTEXTIZE = YES
+LIBUIO_AUTOPOINT = YES
 LIBUIO_AUTORECONF = YES
 
 # Avoid build issue when makeinfo is missing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
