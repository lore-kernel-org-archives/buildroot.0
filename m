Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24375109C057
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 19:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B86B60D9B;
	Wed, 25 Mar 2026 19:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAN8buUywbVE; Wed, 25 Mar 2026 19:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8993C60B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774466723;
	bh=RMXMgmR74YHtr+kHW3jIqaGBoZIdZ34H4mWY7UmxWNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KGzQvzeN3scF9/tr35zsi39RIkQojus1GwXjOMxnw0LXTMh279K0+9lkXO6mJU5Sd
	 dFWE0HDQCK7JXp6z2kEW6pg4vLlS0PqsnY8X6a/GriesPvUjBXJxEf4y79LdgbstqI
	 O/VyftoRTb1lFcvlsGtAV6r2/1CEcS1v3HAbpQJrm8yH2uRTJBWatJk0uDp29L+8py
	 p23LGodo2XVph+SFGr6vhhrtjgKggUEcCW0KNTSMhD8GBiAZK4VCkGeisXmG8B9awP
	 5PZyG3hraqNxxTGyq5jkCLYDWUdUAeNmpG1HiHupNuVauFvBkHFuCE1DWDEximBVJ3
	 +ZOjXs6PwO9ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8993C60B93;
	Wed, 25 Mar 2026 19:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FDE8353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF96816D6
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoEERlae-5bp for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 19:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF9B816D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF9B816D8
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9550E8455B; Tue, 24 Mar 2026 21:08:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 21:57:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8dd9e9a011f1a5755df62baceb865efc09862fe
X-Git-Newrev: d18f7e09162ac3dbe4538fd0e2a3e5ec192e88a4
X-Patchwork-Hint: ignore
Message-Id: <20260324210802.9550E8455B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: fix build with host gcc >= 15,
 glibc >= 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1891721423444722818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1891721423444722818==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d18f7e09162ac3dbe4538fd0e2a3e5ec192e88a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The edk2 package fails to build with gcc 15, with the following error:

  EfiRom.c:78:17: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]

Cherry-pick one patch from edk2-stable202602 to fix this.

This can be verified with the tests.boot.test_edk2 python tests.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
[Julien: add "host" gcc 15 and glibc 2.43 in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-BaseTools-EfiRom-fix-compiler-warning.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch b/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
new file mode 100644
index 0000000000..c1e688cfe0
--- /dev/null
+++ b/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
@@ -0,0 +1,46 @@
+From 9af06ef3cbb052b142f9660c2c01e7aeb401300c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 8 Dec 2025 10:28:50 +0100
+Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+New warning after updating gcc:
+
+EfiRom.c: In function ‘main’:
+EfiRom.c:78:17: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
+
+The assigned value is not used, so fix the warning by just removing it.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Upstream: https://github.com/tianocore/edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRom/EfiRom.c
+index fa7bf0e62e..6e903b3504 100644
+--- a/BaseTools/Source/C/EfiRom/EfiRom.c
++++ b/BaseTools/Source/C/EfiRom/EfiRom.c
+@@ -44,7 +44,6 @@ Returns:
+   FILE_LIST *FList;
+   UINT32    TotalSize;
+   UINT32    Size;
+-  CHAR8     *Ptr0;
+ 
+   SetUtilityName(UTILITY_NAME);
+ 
+@@ -75,7 +74,7 @@ Returns:
+   //
+   if (mOptions.DumpOption == 1) {
+     if (mOptions.FileList != NULL) {
+-      if ((Ptr0 = strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION)) != NULL) {
++      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION) != NULL) {
+         DumpImage (mOptions.FileList);
+         goto BailOut;
+       } else {
+-- 
+2.53.0
+

--===============1891721423444722818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1891721423444722818==--
