Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE44C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8094092D;
	Fri,  4 Mar 2022 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NQbDYAIhK_S; Fri,  4 Mar 2022 20:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32F9401B2;
	Fri,  4 Mar 2022 20:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 552EB1BF82F
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 20:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 521BA60AE8
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 20:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGGuoM59TWOi for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 20:58:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713B960807
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 20:58:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7E6B182B6F; Fri,  4 Mar 2022 20:50:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 4 Mar 2022 21:43:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cd8faa8d3b525fc01c21bc03ddd617062516699
X-Git-Newrev: 0f3b4f9402b7f5da8f0e0840523d43ef40c3f73f
X-Patchwork-Hint: ignore
Message-Id: <20220304205027.7E6B182B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: fix build without
 shell-desktop
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f3b4f9402b7f5da8f0e0840523d43ef40c3f73f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without shell-desktop raised since bump
to version 10.0.0 in commit f67a6e9b7a7be9adbc405b3126000056120a01af and
https://gitlab.freedesktop.org/wayland/weston/-/commit/9e90760ab054db2234f73374600489fa5584ad7c:

In file included from ../tests/weston-test-client-helper.c:43:
../tests/weston-test-client-helper.h:40:10: fatal error: weston-screenshooter-client-protocol.h: No such file or directory
   40 | #include "weston-screenshooter-client-protocol.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8ece588f52fc1b4e422f8bce9b106d9d3822f1a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...pendency-on-screenshooter-client-protocol.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
new file mode 100644
index 0000000000..927215380e
--- /dev/null
+++ b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
@@ -0,0 +1,38 @@
+From 2ac6b6b084a877adde64db7faff2ed22eb3ea97a Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniels@collabora.com>
+Date: Tue, 8 Feb 2022 22:39:42 +0000
+Subject: [PATCH] tests: Add dependency on screenshooter client protocol
+
+Given that the test-helper code relies on the screenshooter protocol,
+make sure it's available for us to build, and the dependency ensures we
+build in order.
+
+Fixes: #588
+
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/wayland/weston/-/commit/2ac6b6b084a877adde64db7faff2ed22eb3ea97a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tests/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 2d464ddcc..222091cd1 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -29,8 +29,9 @@ lib_test_client = static_library(
+ 		'weston-test-client-helper.c',
+ 		'weston-test-fixture-compositor.c',
+ 		weston_test_client_protocol_h,
+-		weston_screenshooter_protocol_c,
+ 		weston_test_protocol_c,
++		weston_screenshooter_client_protocol_h,
++		weston_screenshooter_protocol_c,
+ 		viewporter_client_protocol_h,
+ 		viewporter_protocol_c,
+ 		'color_util.h',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
