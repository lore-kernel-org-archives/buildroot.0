Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D95C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 09:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D49060806;
	Sun,  7 Jul 2024 09:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytyq78uMkinU; Sun,  7 Jul 2024 09:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BB46071C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BB46071C;
	Sun,  7 Jul 2024 09:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAEAD1BF86C
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C42FD406A3
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2I0XsUAMIpa for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 09:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F002406A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F002406A0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F002406A0
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 09:44:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so364492266b.2
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720345472; x=1720950272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrQJDVTuPxid+8voWrGcuSnq6KL+5Zri3uUcQBoAvQw=;
 b=Lk6RYISwR4/mEXJtHem3YfZ4sNpmQzW0qK7uaUEXQNutWqoEd9zsBAqYG8wdSAgnYE
 KX33I8eyPSgzjHUrEkehCmYFriuzsGWImmz0tzB1vjq6eTuFK6NUmVmaB0SK6Z3MzZmt
 vO5/fKi0I0UqCM3FxbND4m7TaYUSaGkY18FzroXn2PeejMiSmkmLBrX7szi3t4PSSFmP
 RFTnZRTEIQ1WXyZqlz9kwuDVZWYJVQWQkfbL8Ke/zdXNKXjWy9uls60Zg12pTJMAUb+5
 7nxkjvsaH0xnQOhGTBgxlRnYNkCEYuVvJlRtS03IKjLlHqtlEDDtzlNay16PSo/SmPB9
 77AA==
X-Gm-Message-State: AOJu0YzISTwh0Z7FkkU3U6SOmwoMWYe+gUQsxdmCvhxzR27uvPdPS5KS
 zxR/E6cKig2GZD3Y3ZKY81PQ1Af8rujbztKiWOCcS8HOtFbU8eRkER3yO4nC79ta+Qgd7Y7jMYj
 cnws=
X-Google-Smtp-Source: AGHT+IF741mkYJCf+sczTkWA446fAWp+Rx62bPcyuDuNHN9hKsJMsxtjfCvIpNtiSkL/CKUfwHYO+A==
X-Received: by 2002:a17:907:684:b0:a77:c3b5:9e5d with SMTP id
 a640c23a62f3a-a77c3b59f8cmr554826466b.47.1720345472469; 
 Sun, 07 Jul 2024 02:44:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77d2d1ff2bsm190230066b.155.2024.07.07.02.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 02:44:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 11:44:28 +0200
Message-ID: <20240707094428.3947165-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720345472; x=1720950272;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrQJDVTuPxid+8voWrGcuSnq6KL+5Zri3uUcQBoAvQw=;
 b=jQaqgHnzckTTvD+au+xtOdzZtha5PCjbKvc6E23H53xcmxpajOgSh2YK6TSAIPBhDk
 xfC8C2VWPvObeJPcZsBu3Wq+sukcccZD/bSKGxdCwjI8ZhubeXHu57jEmX1HsilMPNgV
 PDgGmTUW1KsFn4e/jZWIhI+di78Qmp/yW9qRI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jQaqgHnz
Subject: [Buildroot] [PATCH 1/1] package/mongrel2: update the patches to be
 applied with fuzz 0
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
Cc: Lionel Orry <lionel.orry@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, mongrel2 fails to build with output:

    Applying 0001-Do-not-run-tests.patch using patch:
    patching file Makefile
    Hunk #1 FAILED at 16.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
    patching file tools/m2sh/Makefile
    Hunk #1 FAILED at 9.
    1 out of 1 hunk FAILED -- saving rejects to file tools/m2sh/Makefile.rej

    Applying 0003-fix-build-with-gcc-4.8.patch using patch:
    patching file Makefile
    patching file tools/m2sh/Makefile
    Hunk #1 FAILED at 10.
    1 out of 2 hunks FAILED -- saving rejects to file tools/m2sh/Makefile.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                              |  1 -
 package/mongrel2/0001-Do-not-run-tests.patch     | 16 +++++++++-------
 .../mongrel2/0003-fix-build-with-gcc-4.8.patch   | 10 ++++++----
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..b0cbe4032487 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1027,7 +1027,6 @@ package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
 package/mongodb/0002-src-mongo-db-exec-plan_stats.h-fix-build-with-gcc-11.patch lib_patch.Upstream
 package/mongrel2/0001-Do-not-run-tests.patch lib_patch.Upstream
 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch lib_patch.Upstream
-package/mongrel2/0003-fix-build-with-gcc-4.8.patch lib_patch.Upstream
 package/monit/0001-no-force-static.patch lib_patch.Upstream
 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_patch.Upstream
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
diff --git a/package/mongrel2/0001-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
index 4a75a470b458..3b72aef3c584 100644
--- a/package/mongrel2/0001-Do-not-run-tests.patch
+++ b/package/mongrel2/0001-Do-not-run-tests.patch
@@ -7,6 +7,8 @@ This patch is specific to cross-compiled environments and avoids running
 the tests on the host. It is not meant to be applied upstream.
 
 Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile            | 2 +-
  tools/m2sh/Makefile | 2 +-
@@ -16,22 +18,22 @@ diff --git a/Makefile b/Makefile
 index 7dc4089..ca72630 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -16,7 +16,7 @@ TEST_SRC=$(wildcard tests/*_tests.c)
+@@ -18,7 +18,7 @@
  TESTS=$(patsubst %.c,%,${TEST_SRC})
- MAKEOPTS=OPTFLAGS="${NOEXTCFLAGS} ${OPTFLAGS}" OPTLIBS="${OPTLIBS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
+ MAKEOPTS=OPTFLAGS="${CFLAGS} ${NOEXTCFLAGS} ${OPTFLAGS}" LDFLAGS="${LDFLAGS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
  
 -all: bin/mongrel2 tests m2sh procer
 +all: bin/mongrel2 m2sh procer filters config_modules
  
- dev: CFLAGS=-g -Wall -Isrc -Wall -Wextra $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
- dev: all
+ ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
+ ${OBJECTS}: | builddirs
 diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
 index b50d8a0..334e4da 100644
 --- a/tools/m2sh/Makefile
 +++ b/tools/m2sh/Makefile
-@@ -9,7 +9,7 @@ TESTS=$(patsubst %.c,%,${TEST_SRC})
- LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
- LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+@@ -12,7 +12,7 @@
+ 
+ $(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
  
 -all: ../lemon/lemon tests build/m2sh
 +all: ../lemon/lemon build/m2sh
diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
index eebfce048780..996cd3246b78 100644
--- a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
+++ b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
@@ -15,7 +15,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mongrel2/mongrel2/pull/354]
+Upstream: https://github.com/mongrel2/mongrel2/pull/354
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile            | 1 -
  tools/m2sh/Makefile | 4 ++--
@@ -37,16 +39,16 @@ diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
 index 83e7ae4..86364af 100644
 --- a/tools/m2sh/Makefile
 +++ b/tools/m2sh/Makefile
-@@ -10,7 +10,7 @@ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+@@ -10,7 +10,7 @@
  LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
  RAGEL_OBJECTS=src/lexer.o src/cli.o
  
 -$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
 +$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
  
- all: ../lemon/lemon tests build/m2sh
+ all: ../lemon/lemon build/m2sh
  
-@@ -20,7 +20,7 @@ dev: all
+@@ -20,7 +20,7 @@
  install: build/m2sh
  	install build/m2sh ${DESTDIR}${PREFIX}/bin
  
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
