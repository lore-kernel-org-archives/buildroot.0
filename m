Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9292DC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 16:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8888401A0;
	Sun, 30 Jul 2023 16:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8888401A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JkVv-P5XVV7; Sun, 30 Jul 2023 16:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B45340213;
	Sun, 30 Jul 2023 16:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B45340213
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7185F1BF392
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5169540642
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5169540642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNCfVdY5mLmk for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 16:10:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ACBD400D9
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 16:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACBD400D9
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A648AA4C036A;
 Sun, 30 Jul 2023 18:10:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45258)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ8za-0005WW-1G;
 Sun, 30 Jul 2023 18:10:02 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 18:10:02 +0200
Message-Id: <20230730161002.1511077-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690733402;
 bh=XvQFo/Q88/SSe1mXJ/9mzEH5o1EnyrZZ2UfaiD3ZWn0=;
 h=From:To:Cc:Subject:Date:From;
 b=oS0Ua/7o9EtLObgtFMk1VNxWan3h5RaUUUXKq2+oH3g73iaLJZoGD4c4yMSKo2p7U
 cRihBf6LmETqk4JOO0CJ7ZF6IgSUwHO6/hXvqF5PRpsbV/dOkcQWtF+fbWX77WpIKt
 8FsJPYGFbMJ/o6OllXR23SLT9HLyLBOuihrpkifK6PcDmSe/HjYKSlUqI1M1KKwVw2
 DLtonecOSaH/EhKDRLOpXjXOgm7+SMx4Z9dn3oonkWDj0ali3CqY8JpZ/neavIN02g
 iajlogi/MyCodYhDroinTM75ezKymct8TymaJDFKnRpcfGR7xwvnWvGPHI2pD2AOjx
 pDmTXBQQ+QsxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=oS0Ua/7o
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: fix build with gcc 13.x
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
Cc: Fabio Urquiza <fabiorush@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/8ac/8aceefdb71814c48163d7b171783172b6e1fdf27/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...includes-to-fix-gcc-13-compile-error.patch | 48 +++++++++++++++++++
 ...efactor-add-most-of-src-util-to-iwyu.patch | 34 +++++++++++++
 .../0004-src-util-string-h-fix-gcc13.patch    | 23 +++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
 create mode 100644 package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
 create mode 100644 package/bitcoin/0004-src-util-string-h-fix-gcc13.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
