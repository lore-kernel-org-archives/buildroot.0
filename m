Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC3CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A991E4230A;
	Wed,  3 Sep 2025 16:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwllNSTvthut; Wed,  3 Sep 2025 16:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE57D42302
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE57D42302;
	Wed,  3 Sep 2025 16:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D53952BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D6C84463
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jkx3s12GHG4J for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171F88427E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 171F88427E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B83687EA9; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:20:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f309a6e0f969c2baf9e5c1598c80aba0049742d
X-Git-Newrev: a4b0913280b95b62cd74fdc5ff0b25e3afa2c529
X-Patchwork-Hint: ignore
Message-Id: <20250903162314.4B83687EA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apitrace: fix build with GCC 15.x
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7141386746989335294=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7141386746989335294==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a4b0913280b95b62cd74fdc5ff0b25e3afa2c529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  /home/thomas/buildroot/buildroot/outputs/all/build/apitrace-10.0/retrace/metric_writer.cpp:50:70: error: ‘uint64_t’ does not name a type
   50 |         case CNT_NUM_UINT64: std::cout << "\t" << *(reinterpret_cast<uint64_t*>(data)); break;
      |                                                                      ^~~~~~~~

Fixes:

  http://autobuild.buildroot.net/results/6e4/6e4e841b4f0be29956fdfad43a406d2dab3003f3/build-end.log

Patch is backported from upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apitrace/0003-Explicit-header-stdint.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/apitrace/0003-Explicit-header-stdint.patch b/package/apitrace/0003-Explicit-header-stdint.patch
new file mode 100644
index 0000000000..efd7522314
--- /dev/null
+++ b/package/apitrace/0003-Explicit-header-stdint.patch
@@ -0,0 +1,42 @@
+From 3cc8956995d6d702a2c3ef0d7f91500c6accbfad Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Fri, 21 Mar 2025 05:02:23 +0000
+Subject: [PATCH] Explicit header: stdint
+
+Fix building with GCC-15. It no longer includes it by default.
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Upstream: 952bad1469ea747012bdc48c48993bd5f13eec04
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ frametrim/ft_dependecyobject.hpp | 1 +
+ retrace/metric_writer.cpp        | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
+index cf1885f1..53b910d0 100644
+--- a/frametrim/ft_dependecyobject.hpp
++++ b/frametrim/ft_dependecyobject.hpp
+@@ -28,6 +28,7 @@
+ #pragma once
+ 
+ #include "ft_tracecall.hpp"
++#include <stdint.h>
+ 
+ namespace frametrim {
+ 
+diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
+index e923ed1d..4e4ce748 100644
+--- a/retrace/metric_writer.cpp
++++ b/retrace/metric_writer.cpp
+@@ -24,6 +24,7 @@
+  **************************************************************************/
+ 
+ #include <iostream>
++#include <stdint.h>
+ 
+ #include "metric_writer.hpp"
+ 
+-- 
+2.50.1
+

--===============7141386746989335294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7141386746989335294==--
