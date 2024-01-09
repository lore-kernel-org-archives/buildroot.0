Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3702C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E5994085E;
	Tue,  9 Jan 2024 13:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E5994085E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILkfq-AsXk9N; Tue,  9 Jan 2024 13:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B39E41A32;
	Tue,  9 Jan 2024 13:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B39E41A32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AAB71BF95D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8A56817A4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A56817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP0ftsExPyBB for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 085E38144C
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 085E38144C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E832B825BF; Tue,  9 Jan 2024 13:09:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:38:50 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3b5860f271b20c8be5f4fe453d524737f31be6c1
X-Git-Newrev: 20e8a02477f32b4e05d30fbd94fb99008c10ea11
X-Patchwork-Hint: ignore
Message-Id: <20240109130917.E832B825BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/google-breakpad:
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
Content-Type: multipart/mixed; boundary="===============5161973296136708213=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5161973296136708213==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=20e8a02477f32b4e05d30fbd94fb99008c10ea11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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

--===============5161973296136708213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5161973296136708213==--
