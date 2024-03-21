Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ED2C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74B18293F;
	Thu, 21 Mar 2024 21:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVSROnqjBfBI; Thu, 21 Mar 2024 21:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7626282A2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7626282A2D;
	Thu, 21 Mar 2024 21:05:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 235561BF980
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52969608C2
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7TCgeWHKZVE for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6733D60712
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6733D60712
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5544B837AA; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:16:28 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 299412bed4c34bd576a0cf65b70fa45379c9ec21
X-Git-Newrev: ee5d27d199b51043ef3e76d892c92a7b682753d4
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.5544B837AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/bitcoin: fix
 build with gcc 13.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee5d27d199b51043ef3e76d892c92a7b682753d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/8ac/8aceefdb71814c48163d7b171783172b6e1fdf27/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc08ac951de277d4c601c715b1cb8c121f3eb2e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sing-includes-to-fix-gcc-13-compile-error.patch | 48 ++++++++++++++++++++++
 ...003-refactor-add-most-of-src-util-to-iwyu.patch | 34 +++++++++++++++
 .../bitcoin/0004-src-util-string-h-fix-gcc13.patch | 23 +++++++++++
 3 files changed, 105 insertions(+)

diff --git a/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch b/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
new file mode 100644
index 0000000000..22c0ca2adf
--- /dev/null
+++ b/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
@@ -0,0 +1,48 @@
+From 339a95b7537b47e5d6b732c0633a00afd96e3ca0 Mon Sep 17 00:00:00 2001
+From: MarcoFalke <*~=`'#}+{/-|&$^_@721217.xyz>
+Date: Thu, 19 Jan 2023 19:35:43 +0100
+Subject: [PATCH] Add missing includes to fix gcc-13 compile error
+
+Upstream: https://github.com/bitcoin/bitcoin/commit/fadeb6b103cb441e0e91ef506ef29febabb10715
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/support/lockedpool.cpp | 3 +++
+ src/support/lockedpool.h   | 4 ++--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/support/lockedpool.cpp b/src/support/lockedpool.cpp
+index 26de780f2..11131d551 100644
+--- a/src/support/lockedpool.cpp
++++ b/src/support/lockedpool.cpp
+@@ -22,6 +22,9 @@
+ #endif
+ 
+ #include <algorithm>
++#include <limits>
++#include <stdexcept>
++#include <utility>
+ #ifdef ARENA_DEBUG
+ #include <iomanip>
+ #include <iostream>
+diff --git a/src/support/lockedpool.h b/src/support/lockedpool.h
+index b9e2e99d1..25b4c0f36 100644
+--- a/src/support/lockedpool.h
++++ b/src/support/lockedpool.h
+@@ -5,11 +5,11 @@
+ #ifndef BITCOIN_SUPPORT_LOCKEDPOOL_H
+ #define BITCOIN_SUPPORT_LOCKEDPOOL_H
+ 
+-#include <stdint.h>
++#include <cstddef>
+ #include <list>
+ #include <map>
+-#include <mutex>
+ #include <memory>
++#include <mutex>
+ #include <unordered_map>
+ 
+ /**
+-- 
+2.39.2
+
diff --git a/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch b/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
new file mode 100644
index 0000000000..095fa648dd
--- /dev/null
+++ b/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
@@ -0,0 +1,34 @@
+From c187efa907fd64ea2c7b7d699c5c97f9d5b79960 Mon Sep 17 00:00:00 2001
+From: fanquake <fanquake@gmail.com>
+Date: Thu, 9 Jun 2022 16:26:55 +0100
+Subject: [PATCH] refactor: add most of src/util to iwyu
+
+These files change infrequently, and not much header shuffling is required.
+
+We don't add everything in src/util/ yet, because IWYU makes some
+dubious suggestions, which I'm going to follow up with upstream.
+
+Upstream: https://github.com/bitcoin/bitcoin/commit/07f2c25d04c39a0074e1d9ee1b24b3e359c8153f
+
+[Bernd: backported relevant part from upstream commit to version 0.21.2
+        to fix build error with gcc 13.x]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util/bip32.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/bip32.h b/src/util/bip32.h
+index 347e83db9..6ef051c48 100644
+--- a/src/util/bip32.h
++++ b/src/util/bip32.h
+@@ -6,6 +6,7 @@
+ #define BITCOIN_UTIL_BIP32_H
+ 
+ #include <attributes.h>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+-- 
+2.39.2
+
diff --git a/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch b/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch
new file mode 100644
index 0000000000..00a9ef2b97
--- /dev/null
+++ b/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch
@@ -0,0 +1,23 @@
+From fa2deae2a86417d7e0d4cd33fb933b1000d20313 Mon Sep 17 00:00:00 2001
+From: MacroFake <falke.marco@gmail.com>
+Date: Thu, 5 May 2022 08:28:29 +0200
+Subject: [PATCH] Wrap boost::replace_all
+
+Upstream: https://github.com/bitcoin/bitcoin/commit/fa2deae2a86417d7e0d4cd33fb933b1000d20313
+
+[Bernd: backported relevant part from upstream commit to version 0.21.2
+        to fix build error with gcc 13.x]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+diff --git a/src/util/string.h b/src/util/string.h
+index 2e91347b27a10..df20e34ae9aaa 100644
+--- a/src/util/string.h
++++ b/src/util/string.h
+@@ -9,6 +9,7 @@
+ 
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+ #include <cstring>
+ #include <locale>
+ #include <sstream>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
