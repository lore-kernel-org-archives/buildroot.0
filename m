Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E3C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6128B81EE3;
	Sat, 29 Jul 2023 21:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6128B81EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLANM7_f4D1n; Sat, 29 Jul 2023 21:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B57A81F00;
	Sat, 29 Jul 2023 21:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B57A81F00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABA881BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E1C6409DF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1C6409DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrieyN2PI5cM for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57257409CB
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57257409CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D7C783B6D; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:45:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d24a36888db4521e40d2a0643fdd8ccf5eb50cd0
X-Git-Newrev: 5799585e16f74496e19fe688502e8c1fed9d3b10
X-Patchwork-Hint: ignore
Message-Id: <20230729215906.3D7C783B6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect: fix
 build with gcc-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=5799585e16f74496e19fe688502e8c1fed9d3b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
new file mode 100644
index 0000000000..65db2b4702
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
@@ -0,0 +1,49 @@
+From fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 26 Apr 2023 17:15:00 +0000
+Subject: [PATCH] include missing <cstdint> to support gcc-13
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/inputstream.ffmpegdirect/commit/fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4
+---
+ src/utils/DiskUtils.h | 1 +
+ src/utils/HttpProxy.h | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/utils/DiskUtils.h b/src/utils/DiskUtils.h
+index 79e34268..f900ec58 100644
+--- a/src/utils/DiskUtils.h
++++ b/src/utils/DiskUtils.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace ffmpegdirect
+diff --git a/src/utils/HttpProxy.h b/src/utils/HttpProxy.h
+index eb0c99cb..d203ce36 100644
+--- a/src/utils/HttpProxy.h
++++ b/src/utils/HttpProxy.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace ffmpegdirect
+@@ -36,4 +37,4 @@ namespace ffmpegdirect
+     std::string m_user;
+     std::string m_password;
+   };
+-} //namespace ffmpegdirect
+\ No newline at end of file
++} //namespace ffmpegdirect
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
