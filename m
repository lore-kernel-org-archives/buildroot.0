Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22814C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D341C41B4B;
	Tue,  9 Jan 2024 13:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D341C41B4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfOGF_iVk9-N; Tue,  9 Jan 2024 13:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B48C41BBE;
	Tue,  9 Jan 2024 13:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B48C41BBE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E261BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F84160FB0
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F84160FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCfB_pwssPyU for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433E46073F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433E46073F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE1A84BB9; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:40:25 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 731d17da87c66b789d0ef0fcc69d8d984bd1b000
X-Git-Newrev: 7dbc0dde06452a87129b3f27b46399e73d40e41f
X-Patchwork-Hint: ignore
Message-Id: <20240109130643.2DE1A84BB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/google-breakpad:
 fix building with gcc 13.x
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
Content-Type: multipart/mixed; boundary="===============8636223347643123782=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8636223347643123782==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7dbc0dde06452a87129b3f27b46399e73d40e41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following error when building with gcc 13.x:

‘uintptr_t’ is defined in header ‘<cstdint>’; did you forget to ‘#include <cstdint>’?

Fixes:

  http://autobuild.buildroot.net/results/73f17ec308b6fd20dabdb7e391a3f67793a14d5b/

  (which happens with the target google-breakpad, but the issue can
  also happen when building host-google-breakpad if the host system
  uses gcc 13.x)

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Thomas: use upstream fix, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 08fa882d3c443ee9b7a956e84a87e60af8a7a7dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rsion-gcc-13-cannot-use-uintptr_t-via-inc.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch b/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
new file mode 100644
index 0000000000..2c3619b74b
--- /dev/null
+++ b/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
@@ -0,0 +1,30 @@
+From 7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa Mon Sep 17 00:00:00 2001
+From: mingtaoxt xt <mingtaoxt@gmail.com>
+Date: Wed, 19 Oct 2022 19:36:13 +0800
+Subject: [PATCH] mainline version gcc-13 cannot use "uintptr_t" via "#include
+ <string>"
+
+Change-Id: I0049bb92658b4226e32783ad4d8271787deef5f3
+Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166
+Reviewed-by: Mike Frysinger <vapier@chromium.org>
+Upstream: https://chromium.googlesource.com/breakpad/breakpad/+/7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/client/linux/handler/minidump_descriptor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/client/linux/handler/minidump_descriptor.h b/src/client/linux/handler/minidump_descriptor.h
+index 4349b88f..d822c9d9 100644
+--- a/src/client/linux/handler/minidump_descriptor.h
++++ b/src/client/linux/handler/minidump_descriptor.h
+@@ -32,6 +32,7 @@
+ #include <assert.h>
+ #include <sys/types.h>
+ 
++#include <cstdint>
+ #include <string>
+ 
+ #include "client/linux/handler/microdump_extra_info.h"
+-- 
+2.43.0
+

--===============8636223347643123782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8636223347643123782==--
