Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB66C53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C278B80879;
	Mon, 27 Jul 2026 09:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REDBegx_xxdA; Mon, 27 Jul 2026 09:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4579780992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785145760;
	bh=1Wa9DRHVbtPfrw+PGHSyJkFBNU0ptdFrNULD7dQOYFM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSu+WkucmjQhAhfmcUD6GhKhuXZUMVKAdxUD6OwSTPZCzuC9msicNYeoVpeSr8A6O
	 dbliI8S20NhB6rR32/p/gMHfsKVeHbniQVJbf65Ec3QpASv3WNj9SsZAoFpZfFSyx+
	 oZR3gfyhOeFQu5icFVHIOP4iws7emhjv9NqfTi8ZaqU9ljCMAeCgfgVuA9yF8SdrWL
	 L13G3rPyjsvuzajGeP6lIhUWjqLXk5zWadK6vdibyzab3noM3vtnX6lH/UiL31VcBa
	 l07ubLLn1LqI0xuX0k0XwvZm/se85uLFjsQ+IdTh4vFy8jM16OnG/R5u5Sc1HoEA8t
	 5XvBH5AjIsBcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4579780992;
	Mon, 27 Jul 2026 09:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73C8A26C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED40380769
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXWD9pjNuKJ8 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 09:49:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C178B80D96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C178B80D96
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C178B80D96
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c15f025146dso31869766b.2
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 02:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145754; x=1785750554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OCAMz5Bv6YMHpERFlEpzmG/6UFgPDdLQ/JNMbGTUi10=;
 b=l4c9LenpcQvSqgZxoDB1mYPX67vyGWVaf2F2v3IgwUKFAWDO0EsvTEPEyiNmIaWomg
 Mnm5IFRfCvcMwE3t6yTd5hy6gthA4OmvFY6AyWmNtnusLuMZHwfwdZdYCkClWuOMWIxH
 R9WVpGiiRR2snhvx+pg/KIP6/A/9Y0c92nZWq3uhpMery/kl4e7g/m8vNQxTD/iGJR6K
 zEfoXkBrMmFZrcQXZReZYjVinzT8EuvL2XNC2Sr0I0s+qa4vPx8Szio59fMl0y5gxQmF
 7VX39TClt1aklhuQlvc5lPR7hNDuVAX0Y6BgHLICstOf+dnFRhUscbcPYhUNE80mbf9Y
 QU6Q==
X-Gm-Message-State: AOJu0YwZ2r9wIG5f46fz7sBZszzDvEXvgI1jL0VoAIgzkkJdsjsYKp5U
 6pu2mS2zxYxY3sTVFp9OK4413PUizf6EeOvLpPHxCpvBZecbgOT0YjrUF8s3Atslv1T6I0ubgVC
 PT+1F
X-Gm-Gg: AR+sD13AO0tGqX4htAJjb5vNuR1FOvwlYYXIpRIrZDI8tiEQKVuy5u7BHWOCRWUncsu
 gX/nKx8GVcHDqpPn3+RYT8xnoX0lbxspuxoHP0zmyd/lToFviBoXhHiCteHZ9oAYp4fIFS7RL9/
 oZn+o7P3AAOvzCmTL9OoMQNNPQJ+cXAXa99Y6TypL/1jSJjXmHZbaiju/NyC3sjC3EqZW0SnjoR
 Iz37tD7s56+Xlj+MGm6xPM8XxVsEWGqM4SRDtSvvEX3K3CrH901iiME21r38cBzgeAzVxULJe5t
 stWPfMNVq5um3TZu8UsBxu5qMg4FbomCBp3tvzAgUXXzF1AhSoGsNbJxUs0vv8z9l0PK0WXCnKo
 8NPrVa7M8WPSf7t9NCcgCTUhs13DV668/u0PG8iuXlyWgZVCgl7VHWxzou5rOR+PSRYY0XSxN1N
 1GrOiRQAkCyl96Zy2nzBdA4PqUm3JSv+ceNbmIkHrI1VAsSzCCocBjn9fQMwe4I+eI/vvm+A/1b
 0Fzpm/qBtoO7WOuqkWrka7SlTTTf44X8dh96wNxUyNkdRn2AlKaxf5+fsVfKJMfDz18qtEDC3zb
 5W56oA==
X-Received: by 2002:a17:907:e1d0:10b0:c1f:4754:d87b with SMTP id
 a640c23a62f3a-c1f4754d8e8mr41033766b.1.1785145753982; 
 Mon, 27 Jul 2026 02:49:13 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32c90b42sm617448566b.38.2026.07.27.02.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 02:49:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 27 Jul 2026 11:49:08 +0200
Message-ID: <20260727094909.1701843-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
References: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785145754; x=1785750554;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OCAMz5Bv6YMHpERFlEpzmG/6UFgPDdLQ/JNMbGTUi10=;
 b=Z24m437Z5GsHy1RoGuQpIacF/oynJTAAvu3rqY7R9zdbVRpv3uSgdE3Ctf1iD8xJqA
 bJ0IhxdSNkcKzeXWcRuyJQ3pRodvnwnJiHI0RZAwdMFFaKUuJzQlXOyOaOlIs1lHYMkG
 oSK5DTikE772RJDSVVxDulIaU2KmMBiQGt9WE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Z24m437Z
Subject: [Buildroot] [PATCH 4/4] package/yaml-cpp: bump version to 0.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patches.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...tterutils-Explicitly-include-cstdint.patch | 42 -------------------
 ...y-range-to-avoid-deprecation-warning.patch | 26 ------------
 package/yaml-cpp/yaml-cpp.hash                |  2 +-
 package/yaml-cpp/yaml-cpp.mk                  |  4 +-
 4 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
 delete mode 100644 package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch

diff --git a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
deleted file mode 100644
index e3dc308a2f..0000000000
--- a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7b469b4220f96fb3d036cf68cd7bd30bd39e61d2 Mon Sep 17 00:00:00 2001
-From: Christopher Fore <csfore@posteo.net>
-Date: Wed, 14 Aug 2024 21:02:32 -0400
-Subject: [PATCH] emitterutils: Explicitly include <cstdint>
-
-GCC 15 will no longer include it by default, resulting in build
-failures in projects that do not explicitly include it.
-
-Error:
-src/emitterutils.cpp:221:11: error: 'uint16_t' was not declared in this scope
-  221 | std::pair<uint16_t, uint16_t> EncodeUTF16SurrogatePair(int codePoint) {
-      |           ^~~~~~~~
-src/emitterutils.cpp:13:1: note: 'uint16_t' is defined in header '<cstdint>';
-this is probably fixable by adding '#include <cstdint>'
-   12 | #include "yaml-cpp/null.h"
-  +++ |+#include <cstdint>
-   13 | #include "yaml-cpp/ostream_wrapper.h"
-
-Tests pass.
-
-Closes: #1307
-See-also: https://gcc.gnu.org/pipermail/gcc-cvs/2024-August/407124.html
-See-also: https://bugs.gentoo.org/937412
-Signed-off-by: Christopher Fore <csfore@posteo.net>
-
-Upstream: https://github.com/jbeder/yaml-cpp/commit/7b469b4220f96fb3d036cf68cd7bd30bd39e61d2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/emitterutils.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/emitterutils.cpp b/src/emitterutils.cpp
-index fc41011a5..f801b1d0c 100644
---- a/src/emitterutils.cpp
-+++ b/src/emitterutils.cpp
-@@ -1,4 +1,5 @@
- #include <algorithm>
-+#include <cstdint>
- #include <iomanip>
- #include <sstream>
- 
diff --git a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
deleted file mode 100644
index 6ab3df96cf..0000000000
--- a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c2680200486572baf8221ba052ef50b58ecd816e Mon Sep 17 00:00:00 2001
-From: Craig Scott <craig.scott@crascit.com>
-Date: Thu, 17 Aug 2023 08:54:05 +1000
-Subject: [PATCH] Specify CMake policy range to avoid deprecation warning
- (#1211)
-
-Upstream: https://github.com/jbeder/yaml-cpp/commit/c2680200486572baf8221ba052ef50b58ecd816e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 46dc18059..1ae92e2b7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,6 @@
--# 3.5 is actually available almost everywhere, but this a good minimum
--cmake_minimum_required(VERSION 3.4)
-+# 3.5 is actually available almost everywhere, but this a good minimum.
-+# 3.14 as the upper policy limit avoids CMake deprecation warnings.
-+cmake_minimum_required(VERSION 3.4...3.14)
- 
- # enable MSVC_RUNTIME_LIBRARY target property
- # see https://cmake.org/cmake/help/latest/policy/CMP0091.html
diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 92bf65d2f7..321f932df4 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16  yaml-cpp-0.8.0.tar.gz
+sha256  25cb043240f828a8c51beb830569634bc7ac603978e0f69d6b63558dadefd49a  yaml-cpp-0.9.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index c259f1e531..b963dba094 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.8.0
-YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,$(YAML_CPP_VERSION))
+YAML_CPP_VERSION = 0.9.0
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
