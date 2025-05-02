Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD38C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 16:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C09F81FB0;
	Fri,  2 May 2025 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yB5-MRZovRO; Fri,  2 May 2025 16:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2660081B9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2660081B9A;
	Fri,  2 May 2025 16:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF45DEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 16:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5AB140EC5
 for <buildroot@buildroot.org>; Fri,  2 May 2025 16:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0aG1-rL1WTQ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 16:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F23B340E61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F23B340E61
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F23B340E61
 for <buildroot@buildroot.org>; Fri,  2 May 2025 16:22:11 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3d46ef71b6cso21805645ab.3
 for <buildroot@buildroot.org>; Fri, 02 May 2025 09:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746202931; x=1746807731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61GlRF/pDN+I8p1WtFEOue5mWUZL14a5/REKtIwgOQU=;
 b=P/xCWL58jbBuD6GvNB0tNJptPU6F+dkYZYMUbIrVakCIY2DKCpVJt8Ymp/+J2wECfc
 XF/maJ+a8AYrobQf11hVpJBZpRco46eAnCsUgg6cnorKV84JA6kxwLjGSYwolxK22TlK
 3PbnDpbUaErgtFaNtt4saIU0H0fMECg1SGayVzZQWM2x3dnZggB+QZKEV10xhXo/UjTi
 5xmGJvk12NE09QMJ7bMOrCBIUr16XMTtjn81jCS59Egv3uYkexhiiHKaLv7CP4ikZDYK
 juJd64tTS8JOZ6DmjRVELbYuBxuzblr5bHcgQt7hm3Y23HGvx7kdMVAPNXLyZVA6s3wo
 Mw3A==
X-Gm-Message-State: AOJu0Yx0p5IdIJ43NIcGnhmaKDoRia7iC3drQvcsN2xp5mc48FSn3kE2
 MqWyZw2l6sauZJm5zcAs6Ay6oIr1ogCgFV0vPboto62BrQpNY1p7Og0pmvU5
X-Gm-Gg: ASbGncuoEt29eHF/H1A2ab0sQuiqPYpJX4b+o25nBCeAK4NirHvsMv3z4VemfcKJnVf
 XE5vp6tTE/fHPeGkf5vL7zeiEqFmIz9uD67DeuUs/WnLIhdN3JvD9XnJctuMPowS4ITcs1kvUxk
 0OkMnndkIWSQumno8K5isONYBeGBvOBiUpobBz6E4kvWfLAq8bthvNkhj4kkf4qT6080IOrtUos
 evhseGnSwQaFvIAUVu+RDXET5aYLtpj++yJri5EgBo25E0eheMkph1qSGAknjGEVnEEqxm3SU3k
 eCWGBDadGGvOHDvcz79qmJNEDSU8U5GxTz+tBqGsIo3psKju4aGELgWtxlc/TVlKIoUALL+nn6i
 scmFaqcCZUnjeQC3uzEA=
X-Google-Smtp-Source: AGHT+IH2QgXKj60DaNNh4Wk4p4rA3rhsUZKLdV9dgckzViJIhSbdy92u7DJcR6ru46iiIgBNf6v4OA==
X-Received: by 2002:a05:6e02:3b81:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d97c1a3502mr41429105ab.10.1746202930634; 
 Fri, 02 May 2025 09:22:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975e6fbbdsm6786045ab.16.2025.05.02.09.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  2 May 2025 10:22:08 -0600
Message-Id: <20250502162208.864286-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746202931; x=1746807731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=61GlRF/pDN+I8p1WtFEOue5mWUZL14a5/REKtIwgOQU=;
 b=CYoWzGYeX3zr+zy7g8bIg+CA79deCA0Yt2qs7HVGcPgDxXUq49pwFR/YuX+5w2p/dx
 1oOTlH+qO914uZUbwDtNX5cqqLFXCFtedFOVmeJXFh2qLGPiUbCfWaS7pOU2tpGwM2wE
 icf8nsTSv/162Ht3GI2eMfJWPs89qFd48g+o3+dWMIiOtmMOVcrSoalGhyhS9f11rbdp
 ilW5ohpmz4+Bs08/Hv+/NkVqFdL3htso6kqzB/JANO1EBjxz+s2gbyMXi9jlEb2GLcrp
 NwJG3oSLtCqqCkVrFJokM8TkYfbPaRl9t20cO2RYhuDLoKh+Ab02o069SLIXoi2Ez0dg
 hTow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CYoWzGYe
Subject: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ption-to-not-install-NuGet-packaging.patch | 51 -------------------
 package/hiredis/hiredis.hash                  |  2 +-
 package/hiredis/hiredis.mk                    |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch

diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
deleted file mode 100644
index dbe8bc0ae6..0000000000
--- a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ff7a064490e0aacf718a5263b25b2ddaad0d245e Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 20 Jan 2024 13:53:39 +0100
-Subject: [PATCH] CMakeList: add option to not install NuGet packaging
-
-The NuGet hiredis.target packaging description file is of no use on
-systems that are not using NuGet, like Linux systems, and the spurious
-presence of that file is not "clean".
-
-Add a cmake option to allow users to disable installation of that file.
-As some people may have relied on that file to be installed, continue to
-install it by default.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/redis/hiredis/commit/ff7a064490e0aacf718a5263b25b2ddaad0d245e
----
- CMakeLists.txt | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b7d6ee8..0fcf29b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
- OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
- OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
- OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
-+# Historically, the NuGet file was always install; default
-+# to ON for those who rely on that historical behaviour.
-+OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
-
- MACRO(getVersionBit name)
-   SET(VERSION_REGEX "^#define ${name} (.+)$")
-@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
-         CONFIGURATIONS Debug RelWithDebInfo)
- endif()
-
--# For NuGet packages
--INSTALL(FILES hiredis.targets
--    DESTINATION build/native)
-+if (ENABLE_NUGET)
-+    # For NuGet packages
-+    INSTALL(FILES hiredis.targets
-+        DESTINATION build/native)
-+endif()
-
- INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
-     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
---
-2.43.0
-
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 16ee442d93..b9b4fe556e 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  82ad632d31ee05da13b537c124f819eb88e18851d9cb0c30ae0552084811588c  hiredis-1.2.0.tar.gz
+sha256  25cee4500f359cf5cad3b51ed62059aadfc0939b05150c1f19c7e2829123631c  hiredis-1.3.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 86f35bd4cd..f7acb2f131 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 1.2
+HIREDIS_VERSION_MAJOR = 1.3
 HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
