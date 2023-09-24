Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1BACE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB6E60DF0;
	Sun, 24 Sep 2023 19:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB6E60DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSOh-7UHgZHZ; Sun, 24 Sep 2023 19:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B252F60ADE;
	Sun, 24 Sep 2023 19:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B252F60ADE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF7D1BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E4A81B0A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E4A81B0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WD6G4HoMAuk for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B6481A12
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9B6481A12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F3C875B1; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:37:18 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 98fa3bd9573def995617ca98fd21918356afa853
X-Git-Newrev: 3f228eca09a188cf1529a33accc6139aee8930b0
X-Patchwork-Hint: ignore
Message-Id: <20230924190552.97F3C875B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libjxl: fix riscv
 build
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
Content-Type: multipart/mixed; boundary="===============8630047033562714848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8630047033562714848==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f228eca09a188cf1529a33accc6139aee8930b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

libjxl was failing to build for riscv targets, since commit ff7c37e57
"package/libjxl: security bump to version 0.8.1". Build was failing with
output:

    /build/libjxl-0.8.1/lib/jxl/enc_xyb.cc: In function 'jxl::Image3F jxl::N_SCALAR::TransformToLinearRGB(const jxl::Image3F&, const jxl::ColorEncoding&, float, const JxlCmsInterface&, jxl::ThreadPool*)':
    /build/libjxl-0.8.1/lib/jxl/enc_xyb.cc:223:21: error: variable 'std::atomic<bool> ok' has initializer but incomplete type
      223 |   std::atomic<bool> ok{true};
          |                     ^~

This build failure was due to a missing <atomic> header inclusion. For
some reason, the build failure was observed only with RISC-V toolchains.

This commit fixes the issue by adding an upstream commit, not yet in a
package release. See [1].

Fixes:
http://autobuild.buildroot.org/results/121/12107bc7aea7afae1d2fb935d31b44eee6ea1501

[1] https://github.com/libjxl/libjxl/commit/22d12d74e7bc56b09cfb1973aa89ec8d714fa3fc

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de45aea47bfaffaa3ccef02b247f94ab78ab1add)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-atomic-content-to-fix-gcc-compilation-fo.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch b/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch
new file mode 100644
index 0000000000..b856b00728
--- /dev/null
+++ b/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch
@@ -0,0 +1,47 @@
+From 42e944a471672dae8522fbcf161941895ba16632 Mon Sep 17 00:00:00 2001
+From: Eastdong <31920925+IEAST@users.noreply.github.com>
+Date: Thu, 23 Feb 2023 06:08:36 +0800
+Subject: [PATCH] Add missing <atomic> content to fix gcc compilation for RISCV
+ architecture. (#2211)
+
+* Add missing <atomic> content to fix gcc compilation for RISCV architecture.
+
+* add name to AUTHORS
+
+* lint fix
+
+Co-authored-by: Moritz Firsching <firsching@google.com>
+Upstream: https://github.com/libjxl/libjxl/commit/22d12d74e7bc56b09cfb1973aa89ec8d714fa3fc
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ AUTHORS            | 1 +
+ lib/jxl/enc_xyb.cc | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/AUTHORS b/AUTHORS
+index 44dcc409..3340422d 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -30,6 +30,7 @@ Daniel Novomeský <dnovomesky@gmail.com>
+ David Burnett <vargolsoft@gmail.com>
+ Dirk Lemstra <dirk@lemstra.org>
+ Don Olmstead <don.j.olmstead@gmail.com>
++Dong Xu <xdong181@gmail.com>
+ Even Rouault <even.rouault@spatialys.com>
+ Fred Brennan <copypaste@kittens.ph>
+ Heiko Becker <heirecka@exherbo.org>
+diff --git a/lib/jxl/enc_xyb.cc b/lib/jxl/enc_xyb.cc
+index c7310765..2fd5d025 100644
+--- a/lib/jxl/enc_xyb.cc
++++ b/lib/jxl/enc_xyb.cc
+@@ -6,6 +6,7 @@
+ #include "lib/jxl/enc_xyb.h"
+ 
+ #include <algorithm>
++#include <atomic>
+ #include <cstdlib>
+ 
+ #undef HWY_TARGET_INCLUDE
+-- 
+2.41.0
+

--===============8630047033562714848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8630047033562714848==--
