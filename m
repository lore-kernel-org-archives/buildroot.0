Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C5C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBF982193;
	Sat, 23 Dec 2023 21:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBF982193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isQQ1w4zpWfp; Sat, 23 Dec 2023 21:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D897D815AB;
	Sat, 23 Dec 2023 21:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D897D815AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD6321BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B37DB60A6D
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37DB60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZUhtDhpJ1Ou for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:25:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D099360A6A
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D099360A6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5F4A82567; Sat, 23 Dec 2023 21:25:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 22:24:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08fa882d3c443ee9b7a956e84a87e60af8a7a7dd
X-Git-Newrev: c20334d35cebed3f28d92734fd6d070bfb936e68
X-Patchwork-Hint: ignore
Message-Id: <20231223212530.B5F4A82567@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: disable uclibc
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c20334d35cebed3f28d92734fd6d070bfb936e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The google-breakpad package uses stab.h which is not included in
uClibc, causing the following build error:

src/common/stabs_reader.cc:37:10: fatal error: stab.h: No such file or directory
   37 | #include <stab.h>
      |          ^~~~~~~~
compilation terminated.

Fixes:

  http://autobuild.buildroot.net/results/bba513b7c63a24a83805d2b989a9b95e5fe08e82/

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                         | 2 +-
 package/google-breakpad/Config.in | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 27f5deb16a..554b4062eb 100644
--- a/Config.in
+++ b/Config.in
@@ -589,7 +589,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 4320ad64aa..49d0bc06de 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
@@ -34,12 +34,12 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 if BR2_PACKAGE_GOOGLE_BREAKPAD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
