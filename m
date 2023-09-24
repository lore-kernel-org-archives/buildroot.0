Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E42CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 20:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D772B60A8C;
	Sun, 24 Sep 2023 20:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D772B60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAjYm2te1KOK; Sun, 24 Sep 2023 20:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB86E60EF8;
	Sun, 24 Sep 2023 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB86E60EF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2ED51BF313
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D337781586
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D337781586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hWFDfnMq6qG for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 20:55:13 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65DAE81441
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65DAE81441
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405524e6769so16373275e9.1
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 13:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695588911; x=1696193711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f2mMuMIxpwmSaVyW0el5JA2By4c2JPtPF0kX8D/lLMM=;
 b=LZjNueKyaIsgvHTqJdpJE8qwlq0yROBR8tG+4aabtvopYQUwgy7lN3lUHmvpNJiNwk
 8wmsk1rMMB+aNKHt4GNkd+LBhg1j2YeoHbPXaaxw1TsNMftj7OGer+EXaMm//id/Pt67
 LSDfMoFhmP2i4cf+ohHoQqpe8nNE9a88vFXHW7t3XuzCD+9XB33DJ6sN9CHSy6x6/wZm
 yGYR+bUpzNlJYgJUvJmMos/mnHmyWF16BZ0j72v03aIlzUumn7L8VVgcYh7+X2WnRsz2
 02EYusol523wR3fjMnwsax3bHqrLRl7N+rUuoF2CT9IiWY6hgWNdvWoveAbpG/pCU9nX
 wBZw==
X-Gm-Message-State: AOJu0YyuRv75rYcN541SzvqQWTGvs6Ofs8nwnhvT2kD8GlZ5ZlQmP60A
 u6tKNuXBPiHapUTafM5Js0XSGbpA4MQ=
X-Google-Smtp-Source: AGHT+IGdsBXzpEaIPwN2vpgdeSxvzfAguQkfOKusQ1AIWpcFlkOtWEPXooVHSg0xdkAIwuils0lPBA==
X-Received: by 2002:a7b:cc88:0:b0:405:409e:1fcb with SMTP id
 p8-20020a7bcc88000000b00405409e1fcbmr4029575wma.5.1695588910694; 
 Sun, 24 Sep 2023 13:55:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc858000000b004030c778396sm13278460wml.4.2023.09.24.13.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 13:55:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 22:55:05 +0200
Message-Id: <20230924205505.1553290-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695588911; x=1696193711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f2mMuMIxpwmSaVyW0el5JA2By4c2JPtPF0kX8D/lLMM=;
 b=SHbAL8nC2jw2UyfSwYlg1N9taLKMTMRf446xzOsmXx7uWTbMqGW+RC61Hj4l0dRc0e
 LtkLCZ41Npw4Nap+rMFw7SFynr2I7pJXA26Ga7bF4ht7gEz26IbWzNyBLxVf1Z4hUrmo
 aBewK+CadhyqI5re3sHYgp7ChadHuGxYjFPriliYlaru8CmIX3/+3lfbsClDOoCdKAo+
 JETampVE9xxC9XgPWlRGSNaZ6LZnpG+FkzfoYo+v7CvTyjWK5n5SdAlboGpX0a2dJI5N
 CC/eLAN37Qgj0f4n/Bq6ySTXLFbiGSrs6nRkHBf7yOGAopdwszJvhRZnO13bOObw7maX
 2w6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SHbAL8nC
Subject: [Buildroot] [PATCH 1/1] package/snappy: bump to version 1.1.10
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/google/snappy/blob/1.1.10/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
 package/snappy/snappy.hash                    |  2 +-
 package/snappy/snappy.mk                      |  2 +-
 4 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index bca673e8f7..760a0619d1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1311,7 +1311,6 @@ package/smcroute/S41smcroute Indent NotExecutable Variables
 package/smstools3/0001-fix-Makefile.patch Upstream
 package/smstools3/0002-fix-build-with-gcc-10.x.patch Upstream
 package/smstools3/S50smsd Shellcheck Variables
-package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch Upstream
 package/snmppp/0001-fix-build-without-v3.patch Upstream
 package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch Upstream
 package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch Upstream
diff --git a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
deleted file mode 100644
index bd2ef07794..0000000000
--- a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 0c716d435abe65250100c2caea0e5126ac4e14bd Mon Sep 17 00:00:00 2001
-From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
-Date: Wed, 5 May 2021 14:16:46 +0300
-Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-
-Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
-fix the following compilation errors and a warning with GCC:
-
-[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
-/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
--I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
--march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
--DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
-/tmp/snappy-1.1.9/snappy.cc
-/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
-function might not be inlinable [-Wattributes]
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
-unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
-uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
-char; ptrdiff_t = int]':
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-CMakeFiles/snappy.dir/build.make:137: recipe for target
-'CMakeFiles/snappy.dir/snappy.cc.o' failed
-
-Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
-inline specifier.
-
-[Retrieved from:
-https://github.com/google/snappy/pull/128/commits/0c716d435abe65250100c2caea0e5126ac4e14bd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- snappy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/snappy.cc b/snappy.cc
-index 79dc0e8d..51157be2 100644
---- a/snappy.cc
-+++ b/snappy.cc
-@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
- }
- 
- SNAPPY_ATTRIBUTE_ALWAYS_INLINE
--size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-   const uint8_t*& ip = *ip_p;
-   // This section is crucial for the throughput of the decompression loop.
-   // The latency of an iteration is fundamentally constrained by the
diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index b49b0e7e3b..729d696d7e 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7  snappy-1.1.9.tar.gz
+sha256  49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90  snappy-1.1.10.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index d31dcdd5fe..c96dff35fa 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.9
+SNAPPY_VERSION = 1.1.10
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
