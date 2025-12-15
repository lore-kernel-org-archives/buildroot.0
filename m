Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED6D5B16C
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 14:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEBD80F17;
	Mon, 15 Dec 2025 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5noK4hJbU18; Mon, 15 Dec 2025 14:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FC380E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765807603;
	bh=vCdSEjnI7SbQouK+h1r72hAHqMMANj+ejqUOzvzUVAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kSuETQjGYjPEr9XFLNyJCC6ImYoeuYj5YSRa31eiysSN+1DSI26BezYFlrg5FW5pb
	 PQ6pUYIR8bsahUuEp0EuWtAMiU+LGJxTefY46Y7qFKTYrHStLQQdc0owN4wVO/wTJ2
	 NxPQjHD4CuBtMtDteKWLPIZzV+jxQg/wmReArrOF//NbWSbUYPxd3l5FD19JpH/nlz
	 fzrXFZ2JXa0DLVAFF61/ygQUmhQM96xP/siiAFTlK8MF/odOQP+GUOCrwUwuzW39eA
	 QgJjg2tRoWAxwovTT81XWucU5V/yr1EER/iSo8acH2XIeDX/eq9SWCQOJCKx1F4AHB
	 Q3RKaUaIKg0iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7FC380E50;
	Mon, 15 Dec 2025 14:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D958B117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFAB34047D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4BiTTFOPcFa for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 14:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9403A407D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9403A407D9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9403A407D9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:06:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b77030ffad9so72851766b.0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 06:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765807598; x=1766412398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISexRnmxFMZO7WtrjaSbtTYSLDLBhvFHUho0yLypBsc=;
 b=Nee9YGD///45VGlKYApeTlziFSx2PoIUfhSpRYm26SR2H91M1I7HGT6pVCdaAlxB/M
 YFzYrVP0+rsQwij9ERyU2yK9TrzIk0MOoEFfg9xk4J7AkgmY+PIQZj8F0NKxT6WxtxMa
 gzlDaGZrs9Vf4ukLoVUV6teaMoPOHRoKIO/VrZCi5fcGj1FT4VGQ7jcoJdVxlLUnehFA
 +iWUw4zqPo/Ms7N43pSjkMeg9pL4viTtyVsD5FJac9LyA2g4ff4WoHQItwg8eZ/SJXrz
 So0bhy6ACqHKZnSSPLGYccvy6i0T/r2dBfL/bvSrzZYTJOf9pNUs3juwEHOh9l2fJi5a
 TnZA==
X-Gm-Message-State: AOJu0YzgTDGM9QyQZnJ7lGTtseJ9+99Ovssn+afwidlju9gXI7Jyu/nb
 OgQsDWMiGnrPXYrU6DlJ8qaSd8eMt57TlI+EM5ppCYd++PPthqAYt8bPjQzCBw==
X-Gm-Gg: AY/fxX6OHKiN1QC7j/ND4eRijJ4uRz1FOp34jbtVlAHBDTg2CW2SuSaGL25u0kiKxkP
 AivEvocip0Dp0iRtQ9CiYefNZsHRBH0ylMyCOYPNfK3FTq3mjZK7/H3b8kwki5wy2rz8RBBKWxS
 ET4qGvXbFS9hE1RpzduViAO/dETrJuVTQ2ljGKBhUf3TkskYmFJjW6WMfemCKqp4RJJZbZ3a8kK
 9gtp4dMl5LeI6NR0hi89bpXxwR/3+y//uZtEfnz6dwHcE88NanMDCpQbnQFGUY/pMhoyW7e3J2c
 Qjz+zVnYrGh95usBB0QwM0nMFO+7EXfhiVhpRhDDMI4Odw6Vu7TjaSjn0zT7YWVIzpHYSD7ESgm
 30JnjD4bxuI7FFDl2xN2aRaFKjqhY0Py1heq5APsbr6WTUzGoNbeIxjhJ/0tEwv03Qco3N1iY4L
 0ZLDRLHjVgwPnr92NbhuWBHOu4J9Rmt75poCjhzSLBi9c8PxkufSxvvgC039IrAI+55zo=
X-Google-Smtp-Source: AGHT+IEz5Y5Z9BmOgtIukY43rLO9Zsy3VodYx22Vyfte6qXS3KuPjafx7TUy+jgQOa3O/mDKE9r5Pw==
X-Received: by 2002:a17:907:94cb:b0:b79:fc29:ebd2 with SMTP id
 a640c23a62f3a-b7d2362accemr1195384466b.3.1765807597430; 
 Mon, 15 Dec 2025 06:06:37 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b02sm1406053966b.63.2025.12.15.06.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:06:36 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 15:06:34 +0100
Message-Id: <20251215140634.2955955-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765807598; x=1766412398; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ISexRnmxFMZO7WtrjaSbtTYSLDLBhvFHUho0yLypBsc=;
 b=Oh12dmSPevUtSGeGdfesG9vUpBmz2rlXkndWjIOdjRh25gxzbn3F8WaFiw/CNXJjbR
 /3FM0qsXNTgC2UjKuiTMOpKMn3t1O6ffEV12vcZF49TF84GhFCTKmd9EE6Rw1E43z1+5
 7T0rzvcIzGz7TjtQWdI/3g6ucKp4x792h9CXlgz7Ov7JQ6CAp+FnapJ9jTEFEggqWZEl
 uT/Svd+9wpFhP7HGZAe0bFL08mxawrr0YdEjti5uIBVn06TEO7cAbtJRQ0Z2630h0gdt
 omf/aNQgNCZS3LvnYEGe7xSmFGEB/fblFyxFY64Vz/JMSKdVwePkch5qJrzkt0tCa+W+
 80BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oh12dmSP
Subject: [Buildroot] [PATCH] package/cmocka: disable documentation building
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

cmocka tries to find the Doxygen binary by default and if successful,
it tries to download style sheets and breaks with the following message:

CMake Error at
doxygen-awesome-css-subbuild/doxygen-awesome-css-populate-prefix/src/doxygen-awesome-css-populate-stamp/download-doxygen-awesome-css-populate.cmake:163
(message):
  Each download failed!

    error: downloading
'https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.4.1.tar.gz'
failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

closing connection #-1

Add a patch introducing the BUILD_DOC option to prevent this behavior.
Patch URL: https://gitlab.com/cmocka/cmocka/-/merge_requests/105

Fixes:
https://autobuild.buildroot.org/results/e6a04cee8bc3028bd8a1a535c2852e60f362c4ba/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-CMake-add-BUILD_DOC-option.patch     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/cmocka/0001-CMake-add-BUILD_DOC-option.patch

diff --git a/package/cmocka/0001-CMake-add-BUILD_DOC-option.patch b/package/cmocka/0001-CMake-add-BUILD_DOC-option.patch
new file mode 100644
index 0000000000..2913315fab
--- /dev/null
+++ b/package/cmocka/0001-CMake-add-BUILD_DOC-option.patch
@@ -0,0 +1,43 @@
+From 597cd3a08605b2f04f89c806d123ee14f57d3cb4 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 15 Dec 2025 14:08:36 +0100
+Subject: [PATCH] CMake: add BUILD_DOC option
+
+Build documentation only if explicitly enabled. Set the default to ON to
+preserve current behavior.
+
+Upstream: https://gitlab.com/cmocka/cmocka/-/merge_requests/105
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ CMakeLists.txt      | 4 +++-
+ DefineOptions.cmake | 1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e33a1a8..ebdcf4e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -53,7 +53,9 @@ endif (MINGW)
+ # check subdirectories
+ add_subdirectory(include)
+ add_subdirectory(src)
+-add_subdirectory(doc)
++if (BUILD_DOC)
++    add_subdirectory(doc)
++endif (BUILD_DOC)
+ 
+ if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
+     include(AddCMockaTest)
+diff --git a/DefineOptions.cmake b/DefineOptions.cmake
+index e6b876f..13f1b0b 100644
+--- a/DefineOptions.cmake
++++ b/DefineOptions.cmake
+@@ -2,3 +2,4 @@ option(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ option(WITH_EXAMPLES "Build examples" ON)
+ option(UNIT_TESTING "Build with unit testing" OFF)
+ option(PICKY_DEVELOPER "Build with picky developer flags" OFF)
++option(BUILD_DOC "Build documentation" ON)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
