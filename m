Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE309E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 15:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DCD608CC;
	Tue, 31 Dec 2024 15:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbJ67vkHXOhL; Tue, 31 Dec 2024 15:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF16608FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF16608FC;
	Tue, 31 Dec 2024 15:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC25D972
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C789608CC
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0EzkJJIvI4v for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 15:05:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 497D3608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497D3608C4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 497D3608C4
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:05:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AB4FD40002;
 Tue, 31 Dec 2024 15:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alex Michel <alex.michel@wiedemann-group.com>
Date: Tue, 31 Dec 2024 16:05:08 +0100
Message-ID: <20241231150509.1763416-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735657512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wZR18L3ZWeFrm/LGhgH8bP9Q7bEJXj59cqux5Ll3fXM=;
 b=YKgdB0pZ6JqKC7Lr3S6RAtlHwSYXXW2KJ872JnSVrzGZ/S8M2H7loUviurKHkBqa3Cl3ed
 1W7vfrCilH6OprvVZK8qBxB2tn1+ELy63avfhdlcyalxUM3TFY6JA2UCkbeql0b+5guzmh
 dSNV8m4ooTbb6eMS35sTNmx1dY/rArqDTw1gEFyelOczNFuPjB2EWsKdLqRpW6xv2ZB/u1
 7Tpt4yp3g/YCJwukRqNnwDcyf/iEfV2hRSpWHkfVIAW5SjjLjHouupTrMX1V9v42C7W6MI
 yoM78cEYmHZLjw0BlLxhJU0ZEuwyZjT4+WtFnHnwFvZ30pSknkJdItTglyGaZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YKgdB0pZ
Subject: [Buildroot] [PATCH] package/libzenoh-pico: fix debug+fortify glibc
 builds
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configurations that have:
- BR2_ENABLE_RUNTIME_DEBUG=y
- One of BR2_FORTIFY_SOURCE_xyz=y

Currently fail to build, as libzenoh-pico's build system forces -O0
when BR2_ENABLE_RUNTIME_DEBUG=y, but -O0 builds aren't compatible with
_FORTIFY_SOURCE, causing:

../../../per-package/libzenoh-pico/host/mips64-buildroot-linux-gnu/sysroot/usr/include/features.h:422:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  422 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~
cc1: all warnings being treated as errors

We fix this by adding a patch that drops the forced -O3 (release
builds) and -O0 (debug builds) from the project CMakeLists.txt.

This issue exists since libzenoh-pico was introduced in Buildroot in
commit
a96361901dcc7b962a0c43f163e97a2de65687f3 ("package/libzenoh-pico: new
package"), but was hidden by other issues until a first occurence in
November 2024 right after the bump to 1.0.1:

  http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/

Fixes:

  http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
The provided patch will not apply well on the version of libzenoh-pico
that's in 2024.02.x. If that patch gets backported to 2024.02.x,
contact me, and I'll provide a patch that applies on the version of
libzenoh-pico that was in 2024.02.x.
---
 ...on-t-override-the-optimization-level.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch

diff --git a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
new file mode 100644
index 0000000000..9f911a750b
--- /dev/null
+++ b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
@@ -0,0 +1,64 @@
+From 32d087860abaf5b2374043db7034174aec06b885 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 31 Dec 2024 15:52:57 +0100
+Subject: [PATCH] CMakeLists.txt: don't override the optimization level
+
+zenoh-pico's CMakeLists.txt has some logic to provide its own compiler
+optimization level: -O3 for release builds, -O0 for debug builds.
+
+Unfortunately, using add_compile_options() means that those settings
+take precedence over what the user can pass as custom compiler
+flags. And this causes issues for example when doing a debug build
+with _FORTIFY_SOURCE enabled, as _FORTIFY_SOURCE support in glibc is
+incompatible with unoptimized builds causing this build failure:
+
+/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:414:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  414 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+which is a warning, but as zenoh-pico builds with -Werror, it turns
+into a build failure.
+
+As it is unclear how CMakeLists.txt can pass a default -O level, while
+allowing it to be overridden by the user, we simply remove those
+optimization level options.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/eclipse-zenoh/zenoh-pico/pull/847
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7a9fb6d1..97fba56a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -85,13 +85,13 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
+ # Compile options
+ if(CMAKE_BUILD_TYPE MATCHES "RELEASE" OR "Release")
+   if(UNIX)
+-    add_compile_options(-pipe -O3)
++    add_compile_options(-pipe)
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
+-    add_compile_options(-pipe -O3)
++    add_compile_options(-pipe)
+   endif()
+ else()
+   if(UNIX)
+-    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g -O0)
++    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g)
+     # C99 pedantic doesn't like struct anonymous in unix header
+     if (NOT CMAKE_C_STANDARD STREQUAL "99")
+       add_compile_options(-Wpedantic)
+@@ -100,7 +100,7 @@ else()
+   elseif(MSVC)
+     add_compile_options(/W4 /WX /Od /wd4127)
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
+-    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g -O0)
++    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g)
+   endif()
+ endif()
+ 
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
