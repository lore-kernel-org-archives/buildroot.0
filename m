Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6285CC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBCF41B26;
	Tue,  9 Jan 2024 13:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBCF41B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrLwvXiHyqaB; Tue,  9 Jan 2024 13:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401E841B99;
	Tue,  9 Jan 2024 13:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401E841B99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 566F01BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016678144C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016678144C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZca3EYFuWID for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FDF781464
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDF781464
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 002D484F64; Tue,  9 Jan 2024 13:09:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:39:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 20e8a02477f32b4e05d30fbd94fb99008c10ea11
X-Git-Newrev: f72c3292dcfeb04813803af4859a8be489dbdee5
X-Patchwork-Hint: ignore
Message-Id: <20240109130918.002D484F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/google-breakpad:
 disable uclibc support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f72c3292dcfeb04813803af4859a8be489dbdee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit c20334d35cebed3f28d92734fd6d070bfb936e68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
