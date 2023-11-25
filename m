Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42905C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C188160A5A;
	Sat, 25 Nov 2023 21:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C188160A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYMqekUDBX2V; Sat, 25 Nov 2023 21:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AF1608B7;
	Sat, 25 Nov 2023 21:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AF1608B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5641BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80118400DD
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80118400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVjp22Sprh6z for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54B97400B8
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B97400B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C8D9873BA; Sat, 25 Nov 2023 21:40:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:40:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d59f3d10e84379bea8ac0b77f6946fa6c8176663
X-Git-Newrev: 6a94b0b763555f865046bd1dd0be0253cb7e5957
X-Patchwork-Hint: ignore
Message-Id: <20231125214035.3C8D9873BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oatpp: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a94b0b763555f865046bd1dd0be0253cb7e5957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since the addition of the
package in commit d5bba26801b352f591451cf73e0b7509de0e6850:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
      |                                                                                             ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...core-base-Environment.hpp-include-cstdarg.patch | 37 ++++++++++++++++++++++
 package/oatpp/oatpp.mk                             |  6 ++++
 2 files changed, 43 insertions(+)

diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
new file mode 100644
index 0000000000..e9b7832837
--- /dev/null
+++ b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
@@ -0,0 +1,37 @@
+From b3e8930ccbaeeb77a4cd8b0fffbe52a208aa9a29 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Nov 2023 22:45:56 +0100
+Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
+
+Include cstdarg to fix the following build failure with uclibc-ng:
+
+In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
+                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
+/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
+  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
+      |                                                                                             ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/oatpp/oatpp/commit/1d11558e2cbbabc0db02a233bf00d651ce5ea758
+---
+ src/oatpp/core/base/Environment.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
+index fd77a5c6..05d5c949 100644
+--- a/src/oatpp/core/base/Environment.hpp
++++ b/src/oatpp/core/base/Environment.hpp
+@@ -29,6 +29,7 @@
+ #include "./Compiler.hpp"
+ #include "./Config.hpp"
+
++#include <cstdarg>
+ #include <cstdio>
+ #include <atomic>
+ #include <mutex>
+--
+2.42.0
+
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index 621a549023..c8b0c9694a 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -13,4 +13,10 @@ OATPP_INSTALL_STAGING = YES
 # Only builds a static lib and headers
 OATPP_INSTALL_TARGET = NO
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=OFF
+else
+OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
