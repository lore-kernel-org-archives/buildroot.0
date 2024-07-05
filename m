Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FFC30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 06:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00E340858;
	Fri,  5 Jul 2024 06:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96OWX2iEmxWW; Fri,  5 Jul 2024 06:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCA8409C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCA8409C5;
	Fri,  5 Jul 2024 06:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92FAC1BF215
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EEF4409C5
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjaZ0ovReB6w for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 06:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3926F40858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3926F40858
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3926F40858
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 06:51:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so926096e87.0
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 23:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720162292; x=1720767092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiCcV9MTaZQ6aZ7bt8G5tolaCGnSr9tpxygoYt50oYY=;
 b=LWjeamGwLQVo2aF32L4A2zDcaDzz09yXiWEBqv8Vuzd0O5yUawz9DelUwm+CYziYlS
 BdfXP5l7LPJrZUXizR8BgrKlSWqTtTYeqi2To2N+Mz2xD1HweNBEDbEgJJw40YuGTF97
 akSXve7rTFi5YUvv64VAW2NtZR49WPIiSdQHASF0Ofd1DjMmXEGGcgD7D0XG5OX98Ykj
 uowelFuq4zUloD8wmeIqclwqst/HHz5e5ssBidgRZUardyZod5yC2BPkUraTJ8w81zms
 MVgaWCVCWkjMPmL28U4sGSOuNsZF5Nov2hFHVmYa+0ZjxVNTyW3Kubu+iw6Si6FelLmz
 ZE0A==
X-Gm-Message-State: AOJu0Yzujrdi++aBXz1T1YORNU+c3rnPQ4nqoiDKA0ePPDOOBYEAIevj
 2XT7hRJP8i28Dpi4Ne5g8sYjWJ7Q2E1pXX5z9Ar9jV7fg1te4t6Mtv1E73mVqKpPn8g6LbcEUqR
 xO4c=
X-Google-Smtp-Source: AGHT+IGRSkuRDeA4mb6m7VYeBsbhJmD9Qu6b8ckchBhRj0g5hJ9ycN1zSs+O3P0qz7zigVbFz/VFcQ==
X-Received: by 2002:ac2:5108:0:b0:52c:a8c4:4d99 with SMTP id
 2adb3069b0e04-52ea06fce9fmr2070229e87.68.1720162291479; 
 Thu, 04 Jul 2024 23:51:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:f8c9:214d:f5ce:3e55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77b784de44sm112860066b.56.2024.07.04.23.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 23:51:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 08:51:21 +0200
Message-ID: <20240705065121.3235358-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720162292; x=1720767092;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiCcV9MTaZQ6aZ7bt8G5tolaCGnSr9tpxygoYt50oYY=;
 b=OvZEKLFAkxKAsW9MLsuSnAMc98EQW8EWiYiHXXD1BBrIBgZnyyiKx8HkwIJDJFKoHY
 UL3kZbJ0gel+MM28FGVpMgQFjZn9SjZsRWP4GuCtTFi4yJW++PYW+Ubs6t8ReCaJ7EBT
 nXnCTTRsyxkhd0s8QKv6gNsRNAmnYpl4DVJWM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OvZEKLFA
Subject: [Buildroot] [PATCH 1/1] package/pulseview: update the patches to be
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, pulseview fails to build with output:

    Applying 0001-Replace-obsolete-deprecated-Qt-methods.patch using patch:
    patching file pv/util.cpp
    Hunk #2 succeeded at 175 (offset 4 lines).
    Hunk #3 succeeded at 285 (offset 4 lines).
    patching file pv/util.hpp
    Hunk #2 succeeded at 139 (offset 1 line).
    patching file pv/views/trace/decodetrace.cpp
    Hunk #1 FAILED at 103.
    1 out of 1 hunk FAILED -- saving rejects to file pv/views/trace/decodetrace.cpp.rej

    Applying 0003-Support-glibmm-2.68.patch using patch:
    patching file CMakeLists.txt
    Hunk #3 FAILED at 231.
    Hunk #4 FAILED at 492.
    2 out of 4 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...place-obsolete-deprecated-Qt-methods.patch | 32 ++++++++++---------
 .../pulseview/0003-Support-glibmm-2.68.patch  | 22 +++++++------
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..bf8f3225f445 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1233,7 +1233,6 @@ package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.pat
 package/pulseaudio/S50pulseaudio lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch lib_patch.Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch lib_patch.Upstream
-package/pulseview/0003-Support-glibmm-2.68.patch lib_patch.Upstream
 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch lib_patch.Upstream
 package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch lib_patch.Upstream
 package/python-daphne/0001-remove-pytest-runner-requirement.patch lib_patch.Upstream
diff --git a/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch b/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
index 047fe2cccdc2..24fde677bf95 100644
--- a/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
+++ b/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
@@ -1,4 +1,4 @@
-From caacc9bc622238ca48674ea6f40d07466e4b97a5 Mon Sep 17 00:00:00 2001
+From 01de3217e14b52e44356185729f804460147c85c Mon Sep 17 00:00:00 2001
 From: Valentin Ochs <a@0au.de>
 Date: Sat, 20 Jun 2020 16:01:27 +0200
 Subject: [PATCH] Replace obsolete/deprecated Qt methods
@@ -9,6 +9,8 @@ resolved in pv/util.cpp.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Fabrice: restore original patch in pv/util.cpp for 0.4.2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  pv/util.cpp                     | 21 +++++++++++++++++++--
  pv/util.hpp                     | 10 ++++++++++
@@ -18,7 +20,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  5 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/pv/util.cpp b/pv/util.cpp
-index 49b9467c..2a63038d 100644
+index 9a9a5065a2e1..b0c29f304287 100644
 --- a/pv/util.cpp
 +++ b/pv/util.cpp
 @@ -137,7 +137,7 @@ QString format_time_si(const Timestamp& v, SIPrefix prefix,
@@ -30,7 +32,7 @@ index 49b9467c..2a63038d 100644
  	ts << qSetRealNumberPrecision(precision) << (v * multiplier);
  	ts << ' ' << prefix << unit;
  
-@@ -171,7 +171,7 @@ QString format_value_si(double v, SIPrefix prefix, unsigned precision,
+@@ -175,7 +175,7 @@ QString format_value_si(double v, SIPrefix prefix, unsigned precision,
  	QString s;
  	QTextStream ts(&s);
  	if (sign && (v != 0))
@@ -39,7 +41,7 @@ index 49b9467c..2a63038d 100644
  	ts.setRealNumberNotation(QTextStream::FixedNotation);
  	ts.setRealNumberPrecision(precision);
  	ts << (v * multiplier) << ' ' << prefix << unit;
-@@ -281,5 +281,22 @@ vector<string> split_string(string text, string separator)
+@@ -285,5 +285,22 @@ vector<string> split_string(string text, string separator)
  	return result;
  }
  
@@ -63,7 +65,7 @@ index 49b9467c..2a63038d 100644
  } // namespace util
  } // namespace pv
 diff --git a/pv/util.hpp b/pv/util.hpp
-index dd7be222..ad904f85 100644
+index e1640c4a374d..a6cdfdcad4d9 100644
 --- a/pv/util.hpp
 +++ b/pv/util.hpp
 @@ -30,6 +30,7 @@
@@ -74,7 +76,7 @@ index dd7be222..ad904f85 100644
  
  using std::string;
  using std::vector;
-@@ -137,6 +138,15 @@ QString format_time_minutes(const Timestamp& t, signed precision = 0,
+@@ -138,6 +139,15 @@ QString format_time_minutes(const Timestamp& t, signed precision = 0,
  
  vector<string> split_string(string text, string separator);
  
@@ -91,10 +93,10 @@ index dd7be222..ad904f85 100644
  } // namespace pv
  
 diff --git a/pv/views/trace/decodetrace.cpp b/pv/views/trace/decodetrace.cpp
-index 9c7196bf..1ee7ae9f 100644
+index 1cc89feb67ae..0347b3327b27 100644
 --- a/pv/views/trace/decodetrace.cpp
 +++ b/pv/views/trace/decodetrace.cpp
-@@ -103,7 +103,8 @@ DecodeTrace::DecodeTrace(pv::Session &session,
+@@ -164,7 +164,8 @@ DecodeTrace::DecodeTrace(pv::Session &session,
  
  	// Determine shortest string we want to see displayed in full
  	QFontMetrics m(QApplication::font());
@@ -102,13 +104,13 @@ index 9c7196bf..1ee7ae9f 100644
 +	// e.g. two hex characters
 +	min_useful_label_width_ = util::text_width(m, "XX");
  
- 	// For the base color, we want to start at a very different color for
- 	// every decoder stack, so multiply the index with a number that is
+ 	default_row_height_ = (ViewItemPaintParams::text_height() * 6) / 4;
+ 	annotation_height_ = (ViewItemPaintParams::text_height() * 5) / 4;
 diff --git a/pv/views/trace/ruler.cpp b/pv/views/trace/ruler.cpp
-index acea8a36..68134966 100644
+index 555794fc42c6..83ffed281b5f 100644
 --- a/pv/views/trace/ruler.cpp
 +++ b/pv/views/trace/ruler.cpp
-@@ -218,7 +218,7 @@ void Ruler::paintEvent(QPaintEvent*)
+@@ -283,7 +283,7 @@ void Ruler::paintEvent(QPaintEvent*)
  		const int rightedge = width();
  		const int x_tick = tick.first;
  		if ((x_tick > leftedge) && (x_tick < rightedge)) {
@@ -118,10 +120,10 @@ index acea8a36..68134966 100644
  			const int x_legend = min(max(x_tick, x_left_bound), x_right_bound);
  			p.drawText(x_legend, ValueMargin, 0, text_height,
 diff --git a/pv/widgets/timestampspinbox.cpp b/pv/widgets/timestampspinbox.cpp
-index 21b3d0d7..383aed1f 100644
+index fea8175e8e00..01424a5b7837 100644
 --- a/pv/widgets/timestampspinbox.cpp
 +++ b/pv/widgets/timestampspinbox.cpp
-@@ -75,7 +75,7 @@ QSize TimestampSpinBox::minimumSizeHint() const
+@@ -76,7 +76,7 @@ QSize TimestampSpinBox::minimumSizeHint() const
  {
  	const QFontMetrics fm(fontMetrics());
  	const int l = round(value_).str().size() + precision_ + 10;
@@ -131,5 +133,5 @@ index 21b3d0d7..383aed1f 100644
  	return QSize(w, h);
  }
 -- 
-2.26.2
+2.43.0
 
diff --git a/package/pulseview/0003-Support-glibmm-2.68.patch b/package/pulseview/0003-Support-glibmm-2.68.patch
index 00e4e696d928..558699a684ae 100644
--- a/package/pulseview/0003-Support-glibmm-2.68.patch
+++ b/package/pulseview/0003-Support-glibmm-2.68.patch
@@ -1,4 +1,4 @@
-From a97d5a060a534a3c658578e7f14ab43556db93ca Mon Sep 17 00:00:00 2001
+From cbdd970fa4a805cefcad2e692df204bfceb46e16 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 30 Dec 2021 16:19:46 +0100
 Subject: [PATCH] Support glibmm 2.68
@@ -10,14 +10,16 @@ https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
 C++17 support is mandatory with glibmm 2.68
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+Upstream: not sent yet
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CMakeLists.txt | 23 +++++++++++++++++++----
  INSTALL        |  2 +-
  2 files changed, 20 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7791b1b1..58a9cf92 100644
+index c29fa283bcb6..e739d5fccaa7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -75,7 +75,14 @@ add_subdirectory(manual)
@@ -44,9 +46,9 @@ index 7791b1b1..58a9cf92 100644
  pkg_check_modules(LIBSRCXX ${LIBSR_CXX_BINDING})
  if(NOT LIBSRCXX_FOUND OR NOT LIBSRCXX_VERSION)
  	message(FATAL_ERROR "libsigrok C++ bindings missing, check libsigrok's 'configure' output (missing dependencies?)")
-@@ -225,7 +231,11 @@ memaccess_check_unaligned_le(HAVE_UNALIGNED_LITTLE_ENDIAN_ACCESS)
+@@ -194,7 +200,11 @@ memaccess_check_unaligned_le(HAVE_UNALIGNED_LITTLE_ENDIAN_ACCESS)
  set(PV_TITLE PulseView)
- set(PV_VERSION_STRING "0.5.0")
+ set(PV_VERSION_STRING "0.4.2")
  
 -set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
 +if(LIBSRGLIBMM24_FOUND)
@@ -57,7 +59,7 @@ index 7791b1b1..58a9cf92 100644
  
  include(GetGitRevisionDescription)
  
-@@ -486,7 +496,12 @@ qt5_add_resources(pulseview_RESOURCES_RCC ${CMAKE_BINARY_DIR}/translations.qrc)
+@@ -445,7 +455,12 @@ qt5_add_resources(pulseview_RESOURCES_RCC ${CMAKE_BINARY_DIR}/translations.qrc)
  add_definitions(-DQT_NO_KEYWORDS)
  add_definitions(-D__STDC_LIMIT_MACROS)
  add_definitions(-Wall -Wextra)
@@ -69,10 +71,10 @@ index 7791b1b1..58a9cf92 100644
 +	add_definitions(-std=c++17)
 +endif()
  add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
- if(WIN32)
- 	add_definitions(-Wa,-mbig-obj -O3)
+ 
+ if(ENABLE_FLOW)
 diff --git a/INSTALL b/INSTALL
-index da89be8d..8003fcfb 100644
+index d666f0a7f824..ecf984f3c4b4 100644
 --- a/INSTALL
 +++ b/INSTALL
 @@ -14,7 +14,7 @@ Requirements
@@ -85,5 +87,5 @@ index da89be8d..8003fcfb 100644
      - Qt5Core, Qt5Gui, Qt5Widgets, Qt5Svg, Qt5LinguistTools
      - Qt translation package (optional; needed at runtime, not build time)
 -- 
-2.34.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
