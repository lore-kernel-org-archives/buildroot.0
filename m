Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D8BCFC522
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 613CB41D74;
	Sat, 22 Nov 2025 17:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJpqLllan1cT; Sat, 22 Nov 2025 17:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2475241CFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2475241CFA;
	Sat, 22 Nov 2025 17:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7729034E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C78848D6
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kX2aTI865amb for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A5A848D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5A5A848D2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9074D85EBE; Sat, 22 Nov 2025 17:03:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 18:01:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32490ae99f9cfd2ded0b150071b28908419c7244
X-Git-Newrev: 0eab434cb00d615cc4e5999db6ff1f59104de48b
X-Patchwork-Hint: ignore
Message-Id: <20251122170314.9074D85EBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: fix build with newer gcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0eab434cb00d615cc4e5999db6ff1f59104de48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build error not yet seen by the autobuilders due to other
packages failing before. Seen with defconfig:
https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-emitterutils-Explicitly-include-cstdint.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
new file mode 100644
index 0000000000..e3dc308a2f
--- /dev/null
+++ b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
@@ -0,0 +1,42 @@
+From 7b469b4220f96fb3d036cf68cd7bd30bd39e61d2 Mon Sep 17 00:00:00 2001
+From: Christopher Fore <csfore@posteo.net>
+Date: Wed, 14 Aug 2024 21:02:32 -0400
+Subject: [PATCH] emitterutils: Explicitly include <cstdint>
+
+GCC 15 will no longer include it by default, resulting in build
+failures in projects that do not explicitly include it.
+
+Error:
+src/emitterutils.cpp:221:11: error: 'uint16_t' was not declared in this scope
+  221 | std::pair<uint16_t, uint16_t> EncodeUTF16SurrogatePair(int codePoint) {
+      |           ^~~~~~~~
+src/emitterutils.cpp:13:1: note: 'uint16_t' is defined in header '<cstdint>';
+this is probably fixable by adding '#include <cstdint>'
+   12 | #include "yaml-cpp/null.h"
+  +++ |+#include <cstdint>
+   13 | #include "yaml-cpp/ostream_wrapper.h"
+
+Tests pass.
+
+Closes: #1307
+See-also: https://gcc.gnu.org/pipermail/gcc-cvs/2024-August/407124.html
+See-also: https://bugs.gentoo.org/937412
+Signed-off-by: Christopher Fore <csfore@posteo.net>
+
+Upstream: https://github.com/jbeder/yaml-cpp/commit/7b469b4220f96fb3d036cf68cd7bd30bd39e61d2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/emitterutils.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/emitterutils.cpp b/src/emitterutils.cpp
+index fc41011a5..f801b1d0c 100644
+--- a/src/emitterutils.cpp
++++ b/src/emitterutils.cpp
+@@ -1,4 +1,5 @@
+ #include <algorithm>
++#include <cstdint>
+ #include <iomanip>
+ #include <sstream>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
