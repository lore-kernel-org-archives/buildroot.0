Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84766C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EB380CB5;
	Tue, 23 Jul 2024 08:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCdzG0nGTDPN; Tue, 23 Jul 2024 08:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58F880D21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58F880D21;
	Tue, 23 Jul 2024 08:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 215661BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EBD24030A
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxYGUQuxPYbL for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 758CB40201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758CB40201
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 758CB40201
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:16:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso36748555e9.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721722603; x=1722327403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDIJ7f5tpoYZMf6MjgJvjNvZVXvpxJVEzU+qgADBcoY=;
 b=PTbZFuQ5ryaN296oI+uIzqSyEEBuO1Ls9SI08DbC5sjDV0ZBMFTB8F2+wuIeSje5Ri
 4bCwlqiDe7VbYV5Rh736wOMqNKD6tzmB0nKs24yUfSnyuvtJkygyOmgnxit8WmJqLU9z
 m3uONWt3lnjtuh7DkQYZeU8VqLoyJ9XMB7x3VaKl0gbfELkDPwxcIpuLvig9qvnk5Rgv
 wnYRmsVlTFUDwSB9eG33/ydbi6Gor2xkO187LhgLLLT4Uuq1Cp6wHJuJKqZkqkD0vUPA
 nFlXMubxPYDNRKmIK/DEtBLaDAssnUnOTQhNP3gdGnzIqzQ/CYWyjOeGUwPwnPRwo8r2
 iwYw==
X-Gm-Message-State: AOJu0Yw+WoWvyRrWWrtCabt45v23JAO9L0fy/Gq+kWrrLQMj84LgUBom
 HFMzqJCAZsaOs8BVeuSd0WSisPx2/TKujjK+M8ut3AyqjurGZTA9WIFnhA==
X-Google-Smtp-Source: AGHT+IGY8mqR4ic5FQwlvP2jUvuHBmesvvI7d47b+rQIz3IEE2zDoyQtsqlO+GQfV4uMXG4/PxuizQ==
X-Received: by 2002:adf:f502:0:b0:366:e9f3:c242 with SMTP id
 ffacd0b85a97d-369dec0d025mr1418186f8f.12.1721722602768; 
 Tue, 23 Jul 2024 01:16:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786848f9sm10668122f8f.1.2024.07.23.01.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 01:16:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:16:37 +0200
Message-ID: <20240723081637.548225-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721722603; x=1722327403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hDIJ7f5tpoYZMf6MjgJvjNvZVXvpxJVEzU+qgADBcoY=;
 b=J0kabuRddcJCzwZ4iKScFOsiVwWTnMSprYYmgNNvbh8inqjSKqfBPVQY03ty2YhvGx
 +EjDgTXR9i1t7DDzz/HEmz/h1MmXFVV+5Xo45dLGEAPpKdMbLNW5fmdHPPjd6e40tEdD
 hfWgVB6ceC/Ty/roHdgwlbvtpxKIKtMDlumzmzFQXfnuIo1JG2RGFJZctD/TySj6DTrm
 4TFl4ID+ZqdKvwr16h8AuHT97atDWwuBqo0aBtwwYzaU2VyhemcLDcv3Yrgu364Y/5q/
 08FUas5K8hWExZS8z+D/U787Ct7xsfQdSqTG7n3z+/3PjOMw92W0r9MNuc8IBJpGze9p
 3N7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J0kabuRd
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: bump to version 3.1.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Rebase second patch
- This bump will fix the following build failure with gcc >= 14 thanks to
  https://github.com/fluent/fluent-bit/commit/1f8a672dbd8121ff5fbbd955dfbdda7cf4357fd7:

  In file included from /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/flb_tls.c:24:
  /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c: In function 'tls_context_server_alpn_select_callback':
  /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c:220:40: error: passing argument 1 of 'SSL_select_next_proto' from incompatible pointer type [-Wincompatible-pointer-types]
    220 |         result = SSL_select_next_proto(out,
        |                                        ^~~
        |                                        |
        |                                        const unsigned char **

https://fluentbit.io/announcements/v3.1.3/
https://fluentbit.io/announcements/v3.1.2/
https://fluentbit.io/announcements/v3.1.1/
https://fluentbit.io/announcements/v3.1.0/
https://fluentbit.io/announcements/v3.0.7/
https://fluentbit.io/announcements/v3.0.6/
https://fluentbit.io/announcements/v3.0.5/

Fixes:
 - http://autobuild.buildroot.org/results/8f9fcc0ec9c915a40fe402d7c643fa83f7f6a261

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fka-CMakeLists.txt-allow-compilation-with.patch | 14 ++++++++------
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
index bcfe3ea859..fd3d9ce722 100644
--- a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -9,15 +9,17 @@ e.g. fluent-bit is a c-only library, so allow compilation without cxx
 Upstream: https://github.com/confluentinc/librdkafka/pull/4366
 Upstream: https://github.com/fluent/fluent-bit/pull/7765
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+[Fabrice: update for 3.1.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  lib/librdkafka-2.3.0/CMakeLists.txt          | 18 ++++++++++--
  lib/librdkafka-2.3.0/examples/CMakeLists.txt | 31 +++++++++++++-------
  2 files changed, 35 insertions(+), 14 deletions(-)
 
-diff --git a/lib/librdkafka-2.3.0/CMakeLists.txt b/lib/librdkafka-2.3.0/CMakeLists.txt
+diff --git a/lib/librdkafka-2.4.0/CMakeLists.txt b/lib/librdkafka-2.4.0/CMakeLists.txt
 index 7f3dd0fc6..c1ee93062 100644
---- a/lib/librdkafka-2.3.0/CMakeLists.txt
-+++ b/lib/librdkafka-2.3.0/CMakeLists.txt
+--- a/lib/librdkafka-2.4.0/CMakeLists.txt
++++ b/lib/librdkafka-2.4.0/CMakeLists.txt
 @@ -3,7 +3,12 @@ cmake_minimum_required(VERSION 3.2)
  include("packaging/cmake/parseversion.cmake")
  parseversion("src/rdkafka.h")
@@ -57,10 +59,10 @@ index 7f3dd0fc6..c1ee93062 100644
  
  if(RDKAFKA_BUILD_EXAMPLES)
    add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.3.0/examples/CMakeLists.txt b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
+diff --git a/lib/librdkafka-2.4.0/examples/CMakeLists.txt b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
 index 8c0079abe..c9336b729 100644
---- a/lib/librdkafka-2.3.0/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
+--- a/lib/librdkafka-2.4.0/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
  add_executable(producer producer.c ${win32_sources})
  target_link_libraries(producer PUBLIC rdkafka)
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 6fcf4fac3e..a3dbf5f544 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b439f89e879e538849e9106fe450bcf58da5034dfc316af4d2a837423786ed11  fluent-bit-3.0.4.tar.gz
+sha256  4c745066223811047e3911c19db118eadec579ca62ef833a1b1fb573acd8cb85  fluent-bit-3.1.3.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 13bd4ddecb..5463682e45 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.4
+FLUENT_BIT_VERSION = 3.1.3
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
