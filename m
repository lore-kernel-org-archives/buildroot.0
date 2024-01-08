Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E55C47073
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 21:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D54E81274;
	Mon,  8 Jan 2024 21:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D54E81274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKygtiTo3b7R; Mon,  8 Jan 2024 21:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FD98125A;
	Mon,  8 Jan 2024 21:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FD98125A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 494F81BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1658460B43
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1658460B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB75iYYUCpP3 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 21:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5595F600B9
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 21:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5595F600B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FAD884C92; Mon,  8 Jan 2024 21:18:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 22:16:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af755c0db31f88a1af3a9742a083d004476b9db7
X-Git-Newrev: 30cc84d8994964883c9bd3ff002a1764e78c2521
X-Patchwork-Hint: ignore
Message-Id: <20240108211828.3FAD884C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtraceevent: needs dynamic
 library
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

commit: https://git.buildroot.net/buildroot/commit/?id=30cc84d8994964883c9bd3ff002a1764e78c2521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 1474f1b34b178defca1d16d18a2446fadda9a12b:

../src/event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7802d1ad00293147edda39683f6d3f614dd48263

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: only list first-level inherited deps]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtraceevent/Config.in | 4 ++++
 package/libtracefs/Config.in    | 4 ++++
 package/linux-tools/Config.in   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
index 399238eef1..28a5b32576 100644
--- a/package/libtraceevent/Config.in
+++ b/package/libtraceevent/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBTRACEEVENT
 	bool "libtraceevent"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  libtraceevent is a library that interfaces with the ftrace
 	  subsystem in the linux kernel.
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBTRACEEVENT
 	  rtla.
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
+
+comment "libtraceevent needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
index 81a2e962ea..bb0777b16c 100644
--- a/package/libtracefs/Config.in
+++ b/package/libtracefs/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBTRACEFS
 	bool "libtracefs"
+	depends on !BR2_STATIC_LIBS # libtraceevent
 	select BR2_PACKAGE_LIBTRACEEVENT
 	help
 	  libtracefs is used to easily interface with the ftrace
 	  interface through the tracefs virtual filesystem.
 
 	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
+
+comment "libtracefs needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index adfca4dbe3..ce744663f1 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -104,6 +104,7 @@ endif
 
 config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	bool "rtla"
+	depends on !BR2_STATIC_LIBS # libtracefs
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_LIBTRACEFS
 	help
@@ -123,6 +124,9 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
 	  not available in Buildroot, so only rtla in kernels 5.19
 	  onwards is actually supported in Buildroot.
 
+comment "rtla needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
