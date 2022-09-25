Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CC1C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 18:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A89405D7;
	Sun, 25 Sep 2022 18:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A89405D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaJGirHT3ECG; Sun, 25 Sep 2022 18:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0619840558;
	Sun, 25 Sep 2022 18:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0619840558
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5E8F1BF32E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F8B60BD2
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F8B60BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZIoupBkR_rZ for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 18:16:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FD0760615
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 18:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD0760615
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8839A86000; Sun, 25 Sep 2022 18:16:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 19:36:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 447b5baf30609736206b9280c49f9f512903dcff
X-Git-Newrev: a88ba1548a50d5599e0156d66063dd71545f910b
X-Patchwork-Hint: ignore
Message-Id: <20220925181627.8839A86000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: fixup qemu dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=a88ba1548a50d5599e0156d66063dd71545f910b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1facb09b94bf806b301868539185c0ff9ddffee2 ("package/nodejs:
build host-nodejs only if we're installing modules with NPM") forgot
to account for the dependency on Qemu. Now that nodejs no longer
depends on host-nodejs, but needs host-qemu, we need to make sure that
nodejs selects the relevant BR2_PACKAGE_HOST_QEMU options.

So this patch:

 - Drops the dependency of BR2_PACKAGE_NODEJS_ARCH_SUPPORTS on
   BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET, which was incorrect: we
   don't care about running Qemu on the target. We care about
   host-qemu supporting the emulation of the target architecture,
   which is what BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS is for.

 - Adds the dependency to the relevant BR2_PACKAGE_HOST_QEMU options
   to BR2_PACKAGE_NODEJS, so that host-qemu is built with the
   appropriate features needed to build the target nodejs.

 - Removes the qemu related dependencies from host-nodejs, which does
   not need Qemu at all.

Without this change the build of nodejs without npm enabled is broken
as the host-qemu that gets built does not have all the features that
are needed. There are no autobuild failures at this point, however.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/Config.in      | 4 +++-
 package/nodejs/Config.in.host | 4 ----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 8d0bd8fd60..5375dfeacd 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
 comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
 	depends on BR2_USE_MMU
@@ -31,6 +31,8 @@ config BR2_PACKAGE_NODEJS
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..f7f2b80a9b 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,12 +1,9 @@
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_HOST_QEMU
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
@@ -14,5 +11,4 @@ config BR2_PACKAGE_HOST_NODEJS
 	  http://nodejs.org/
 
 comment "host nodejs needs a host gcc >= 8"
-	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
