Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FCAC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 13:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BE9404F6;
	Wed,  1 Jul 2026 13:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XBL53wjhNRz; Wed,  1 Jul 2026 13:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E47F4043C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782912642;
	bh=YWj2gG8ZIW5JdUyc/oKhNpmEDlyrqiD+s5fxi8+3m2Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IicqPtNa5v8FIsasXIQFBfijqjVGzjymEeil8jUfTP1NTj0QxGPAoaDDva7aBQIb3
	 8YbEgAYLUmOEF1fWLcrMrx7Jt1iWgtTQU0b1Va5TWlWJsdnAia//78ph7eAdMdjsol
	 r9w9WDDQJ2uE4sbNHCMpPqvZV7R2I3Tc4+JmFi3gegX2AhSdsrI86rAFhJh93uyMuf
	 E65GxcLFUgHyglL/FP1SMLj7ujGH9xNCZ50VI2gpaCrpII4GXzRQfQRJLBSA4KXeWS
	 NHbzrSdAPe6rDWC5kmwKQBOtPevXMFP/0eDbh1FmXNffCCLBAzGAXJfVQJ6ojua7dZ
	 mvQRHzRW8PnpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E47F4043C;
	Wed,  1 Jul 2026 13:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FEE4127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9158860746
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESVI8ATgJAFE for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 13:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC594605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC594605DF
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC594605DF
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:30:35 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5aeb2b17167so1686182e87.0
 for <buildroot@buildroot.org>; Wed, 01 Jul 2026 06:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782912633; x=1783517433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwEcJob7KlhTHpDcGbqycLQ5LcToAKi0qp38h/1jHEA=;
 b=c7LbJm/HINrFx8WTesuWngp2mvrLYhqGWIX+ydataDyQsOMjxN+W7oZpwq5cvM/rEk
 LXv1wThX2JSkDBmZ0UzRzdWTDQN4Pbkgeq6DPm9Fn7oo2nctvGYR9K6HGFcgpky5MRHt
 Bpl4klht5tdNh+dix+q5TiKZXHM0mPHc8DkQhix1k7OonDI+o39rMjyVSAZsjfSuwdDG
 9WuEMM7mgfWEeiEyCYjIBpRZk0PxpaZiGyZBhiYYmyxBgnRwnf3zchFyZw/IqxXkEIvp
 mcE9WLtL+ebDJyHcKnmCyAZnk+08W2spUlw5brH0nc2LDD2vp518rqFk93XeGc8z0fAt
 Bv8Q==
X-Gm-Message-State: AOJu0YwWDeHUpKeY83bMjIIFVlyeH60NNtRCCXF/jsETG25a6hbCRjpg
 WPoy1ylzeWFH70FL6dRc+cK7Voi7yo0jJf2/UXBYkbHahWzQDQIWH0Vkhd5C3HVomdIcNg==
X-Gm-Gg: AfdE7cm4cLNZ7ashCI68+RxzlQbL+PtAt5kf/eDjJHEC9dW5LbgiM6oJdqLX+m1i50D
 E5Hht8U3qrCmca7fl3/+46SJGP2WAGgJZIgxZ3ByUFWQ3lfFs1e4LOrQgdeu/+0OjjAcxRJ5x3X
 97JBLExeUVOpiQr7hpkdK+VbCxIv5lGZpTR3MdSczO2c9y1ZpTBlDEbgN0g18al5swSCniuUWIj
 0elLj6t6SKKDGd1jjYvXAiUWesNKvG38le/0S/rNhhE/4KSVmWOyK1BmNW9McOv0OTWnWt6j7dK
 ZYREAByYRHuPFOAqzF8omDRJFZoEZP6c1rCopQdEqffizgS7fAbJMdmju3CWrP54HbdQTzIInw7
 4Z+7g8A+fl6eH9xR8WlVvVFX+imm4VYf6V8c/AhUWLayn/M0B/fH7iajViinKSITnSjDfnPENRp
 qT+JGv/mw0gWhXSUHcOaFj/+bYfbTtt3nGSwvlcRrqObkuclU2lZX5fy2k3ckC1JW8d0l68GhnO
 6Y=
X-Received: by 2002:ac2:4bd5:0:b0:5ae:b2d5:202f with SMTP id
 2adb3069b0e04-5aec631088fmr442139e87.21.1782912632723; 
 Wed, 01 Jul 2026 06:30:32 -0700 (PDT)
Received: from precision7530-arch-roy.lan (12.79-161-109.customer.lyse.net.
 [79.161.109.12]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aebe4ab23asm1269849e87.78.2026.07.01.06.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 06:30:31 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Jul 2026 15:30:29 +0200
Message-ID: <20260701133030.866703-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782912633; x=1783517433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KwEcJob7KlhTHpDcGbqycLQ5LcToAKi0qp38h/1jHEA=;
 b=UhAc2wuHNBZXFFEqYpKDPCdghEay5a2DLDjQOrgl23aF7HDGKO/o59KMHKZv8u8txG
 ul1OtPofHlV+OzhFmLUx+dSd2r33ZDPmIOjeYgBwbib0StON3ScDC35CQGWBW6pjUWbU
 /V9N5Y7dERZy2Ge4FuJu4JOO/2gt0lCWu9xdl0QgV5NrY0exsgOW+eWi0KXUf+1SGI+9
 UIPKgG54Hlhjqtw43U1cd+Uj3TIPSHD7JlUSqweGI8SF3h2UJ6guPSzsbigvXZehAnxT
 juIQLygz6u3C14BCEYfDC6b7C8x5OhKY+HlyxLxeXIJn97Ea/ZHk6IV/48u2aUBzMOiB
 pquA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UhAc2wuH
Subject: [Buildroot] [PATCH] package/qt6: bump version to 6.11.1
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1], [2], [3], [4], [5], [6], [7] and [8].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.2/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.3/release-note.md

[3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.0/release-note.md
[4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.1/release-note.md
[5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.2/release-note.md
[6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.3/release-note.md

[7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.0/release-note.md
[8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.1/release-note.md

qt6multimedia:
Removed 0001-ffmpeg8.patch since the fix is included in this version. It
guarded AV_CODEC_CAP_SUBFRAMES, which FFmpeg deprecated and removed; the
guard was upstreamed in 6.9.2.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6.mk                            |  2 +-
 package/qt6/qt6base/qt6base.hash              |  4 +-
 package/qt6/qt6charts/qt6charts.hash          |  4 +-
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |  4 +-
 package/qt6/qt6graphs/qt6graphs.hash          |  4 +-
 package/qt6/qt6grpc/qt6grpc.hash              |  4 +-
 .../qt6languageserver/qt6languageserver.hash  |  4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
 package/qt6/qt6multimedia/0001-ffmpeg8.patch  | 39 -------------------
 package/qt6/qt6multimedia/qt6multimedia.hash  | 10 ++---
 package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
 .../qt6/qt6positioning/qt6positioning.hash    |  4 +-
 package/qt6/qt6quick3d/qt6quick3d.hash        |  8 ++--
 .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |  4 +-
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +-
 package/qt6/qt6svg/qt6svg.hash                |  4 +-
 package/qt6/qt6tools/qt6tools.hash            |  4 +-
 .../qt6virtualkeyboard.hash                   |  4 +-
 package/qt6/qt6wayland/qt6wayland.hash        |  4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |  4 +-
 24 files changed, 48 insertions(+), 87 deletions(-)
 delete mode 100644 package/qt6/qt6multimedia/0001-ffmpeg8.patch

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index f6183f513a..f56a9ff1fa 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.9
+QT6_VERSION_MAJOR = 6.11
 QT6_VERSION = $(QT6_VERSION_MAJOR).1
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index a4e2e81056..40e42682e0 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtbase-everywhere-src-6.9.1.tar.xz.sha256
-sha256  40caedbf83cc9a1959610830563565889878bc95f115868bbf545d1914acf28e  qtbase-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtbase-everywhere-src-6.11.1.tar.xz.sha256
+sha256  d9594a31228aa23ad6b531719a29b45f0f3989fe6c136d45767ea179f233c1ac  qtbase-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 0d39e0d6dd..0c816b1709 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtcharts-everywhere-src-6.9.1.tar.xz.sha256
-sha256  b8871beb7ac816e9241db9cbdc4803a53313f84a1e4b951f108bd00709aec3d3  qtcharts-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtcharts-everywhere-src-6.11.1.tar.xz.sha256
+sha256  3fe3ed318c2a86d1417c5c29cf7494275e8fd4b537cd37453f5599c57365515c  qtcharts-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index fac62a39fc..8be1c65e45 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qt5compat-everywhere-src-6.9.1.tar.xz.sha256
-sha256  96c726ac3f0d5c40570e75196e4ab5c95d3de7c85d15604fe97ac2a6573d917a  qt5compat-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qt5compat-everywhere-src-6.11.1.tar.xz.sha256
+sha256  cfcb9fdaa051aad54b0e61b24ac5693b4887a86e07609f665fea67328a6f161b  qt5compat-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 6d09e6dcfa..8245f357d2 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtdeclarative-everywhere-src-6.9.1.tar.xz.sha256
-sha256  ccb94665df0199d7ee387b965b29677c8b89cfb1782bb6f01239b1d1524cec97  qtdeclarative-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtdeclarative-everywhere-src-6.11.1.tar.xz.sha256
+sha256  52e670f670b0304f534b24f98c47ceb8a41bb710464414ebc9527ec71cc86aa4  qtdeclarative-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 03ccf2bc09..db80fb6dde 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgraphs-everywhere-src-6.9.1.tar.xz.sha256
-sha256  f52ddc5052cdbb5a3a321b211e42371014cccf3bc6c0f442d9bec3ddfe593444  qtgraphs-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtgraphs-everywhere-src-6.11.1.tar.xz.sha256
+sha256  84b1138ab68a8e2956439895a4b85eb68dda48ac169da673f67191873b1e0462  qtgraphs-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
index bbf30f2a2d..5ef08e8bb4 100644
--- a/package/qt6/qt6grpc/qt6grpc.hash
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgrpc-everywhere-src-6.9.1.tar.xz.sha256
-sha256  c34c869e203289b0fd695a1e5391840bc51b919a8b55e1ed1ff36b4cb923a750  qtgrpc-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtgrpc-everywhere-src-6.11.1.tar.xz.sha256
+sha256  437b04f0c550ccdb1739ca5f9119b73dfa0376564815e8bfc199890643e2a250  qtgrpc-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 548f7e27fd..2e7348b34f 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtlanguageserver-everywhere-src-6.9.1.tar.xz.sha256
-sha256  ca17353612760b9bb6e3115bfacc9ba5e06d0d18b522f4f62ae6d510d63488ec  qtlanguageserver-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtlanguageserver-everywhere-src-6.11.1.tar.xz.sha256
+sha256  50008537f2ca54abb3b8dc3f26759864e9cad2b2ad39e92e42fa718de2dd8aef  qtlanguageserver-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 511048566e..178c69a6d3 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1e68591b33dcf48ad1f61ca3ba56c63fedd620a5a6333903f9daddc5847cbaa4  qt6mqtt-6.9.1-git4.tar.gz
+sha256  3714255cb7bd3481b762a9ffd860f43e3180e8a069beb528338bf42799e29ea4  qt6mqtt-6.11.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/0001-ffmpeg8.patch b/package/qt6/qt6multimedia/0001-ffmpeg8.patch
deleted file mode 100644
index 9bbeb9e135..0000000000
--- a/package/qt6/qt6multimedia/0001-ffmpeg8.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9670d9e5eb7acb9efb0f2f1a798a09baace53d82 Mon Sep 17 00:00:00 2001
-From: Tim Blechmann <tim.blechmann@qt.io>
-Date: Mon, 2 Jun 2025 09:56:57 +0800
-Subject: FFmpeg: 7.2 compile fix
-
-AV_CODEC_CAP_SUBFRAMES was deprecated without replacement and removed.
-
-Pick-to: 6.8 6.5
-Change-Id: I45ac1d0d603f88701bdb727a7a472cfea8f32d5d
-Reviewed-by: Pavel Dubsky <pavel.dubsky@qt.io>
-Reviewed-by: Tim Blechmann <tim.blechmann@qt.io>
-(cherry picked from commit 65b11b9f97632101041134e04713697b17819884)
-Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
-(cherry picked from commit ef866d101e58832f0bf86150ed8328e2d3ec9c49)
-
-Upstream: https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?h=6.9.2&id=9670d9e5eb7acb9efb0f2f1a798a09baace53d82
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
-index c154fd835..360a33909 100644
---- a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
-+++ b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
-@@ -99,7 +99,9 @@ void dumpCodecInfo(const Codec &codec)
-         { AV_CODEC_CAP_DR1, "DRAW_HORIZ_DR1" },
-         { AV_CODEC_CAP_DELAY, "DELAY" },
-         { AV_CODEC_CAP_SMALL_LAST_FRAME, "SMALL_LAST_FRAME" },
-+#ifdef AV_CODEC_CAP_SUBFRAMES
-         { AV_CODEC_CAP_SUBFRAMES, "SUBFRAMES" },
-+#endif
-         { AV_CODEC_CAP_EXPERIMENTAL, "EXPERIMENTAL" },
-         { AV_CODEC_CAP_CHANNEL_CONF, "CHANNEL_CONF" },
-         { AV_CODEC_CAP_FRAME_THREADS, "FRAME_THREADS" },
--- 
-cgit v1.2.3
-
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 76a89075c3..49e30de6c9 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtmultimedia-everywhere-src-6.9.1.tar.xz.sha256
-sha256  955e36459518ee55f8e2bb79defc6e44aa94dc1edf5ac58a22d7734b2e07391d  qtmultimedia-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtmultimedia-everywhere-src-6.11.1.tar.xz.sha256
+sha256  390f8e52ddee3aca5c4de7eead900c84c4fa61ff6d1f0ebea9c7543365c09b0a  qtmultimedia-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -9,8 +9,8 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e  src/3rdparty/eigen/COPYING.BSD
-sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/eigen/COPYING.MPL2
-sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
+sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  src/3rdparty/eigen/COPYING.BSD
+sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  src/3rdparty/eigen/COPYING.MPL2
+sha256  ebf65756959aabc5e321d98c04ddf528b80b6982ffec355f3c743ea24018d263  src/3rdparty/eigen/COPYRIGHTS
 sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934  src/3rdparty/pffft/COPYRIGHTS
 sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/pffft/LICENSE
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 746ed73c60..45675cc5d1 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  af12c0be6e13e858d30d286276e7312880fc91b475fb445aa42cd281e00b0b4b  qt6opcua-6.9.1-git4.tar.gz
+sha256  19f41f945910bd4bef03f7a57d9e5365d1f8b52e7fe8e226922aeec477322aa0  qt6opcua-6.11.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
index 4e610c7e94..b9453d255b 100644
--- a/package/qt6/qt6positioning/qt6positioning.hash
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -1,5 +1,5 @@
-# From https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtpositioning-everywhere-src-6.9.1.tar.xz.sha256
-sha256  7062734b4989248ca3f0e3e4aebb9aa2e7ed2d6bf19e779e520c6ef69706ff26  qtpositioning-everywhere-src-6.9.1.tar.xz
+# From https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtpositioning-everywhere-src-6.11.1.tar.xz.sha256
+sha256  d5e6b91801ae286e7630016caea3bdc5e1978b4291d6741d0d64c125650f78f5  qtpositioning-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 039bdfc15d..008bda6a22 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtquick3d-everywhere-src-6.9.1.tar.xz.sha256
-sha256  f61600da8fbfd51b7d6b5c431cef453d7c24015c374ae25756c0faf0db2c9977  qtquick3d-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtquick3d-everywhere-src-6.11.1.tar.xz.sha256
+sha256  c76b85de3f8aa2a4bee64987acfef560675c1b378b92076c7c6264613e5b456f  qtquick3d-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -7,6 +7,6 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
 sha256  c3ed04bcbea49f521e4ab32c638fa86b13ebc7b8e1a8972807265079fcd1e6b9  src/3rdparty/assimp/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/embree/LICENSE.txt
-sha256  063805e3b8e24ceab4c5dea358b03245ee41c31be87cf65c61d836636cb494bb  src/3rdparty/meshoptimizer/LICENSE.md
-sha256  2af9d14c7cd67f13c3e7e91dcfe15ec5c8af42923635441e0f5a75bcadadeb33  src/3rdparty/tinyexr/LICENSE
+sha256  e4a26033e3551fb2722888949fbb41e77aee628e8e8f04dcffeee301aa7e5634  src/3rdparty/meshoptimizer/LICENSE.md
+sha256  b90388aaadc2b6f77a5c01278697a2a0539eab471a3befc6a081728becdc3390  src/3rdparty/tinyexr/LICENSE
 sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index 02e3cd8407..233f80cbfa 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtquicktimeline-everywhere-src-6.9.1.tar.xz.sha256
-sha256  78bfdbe7ca8178e4e0931372e07a3076dec503b6a55ff07e41b594d781897294  qtquicktimeline-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtquicktimeline-everywhere-src-6.11.1.tar.xz.sha256
+sha256  af53f643fd9e4045e1b9ba919998e5c048ca877452c08036c9c8c5ee07ea8c27  qtquicktimeline-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index 8df1c47554..a38078377c 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtscxml-everywhere-src-6.9.1.tar.xz.sha256
-sha256  0c33de2023b33a54fa6debd46f422440dca92da532faa7742af051fd88254780  qtscxml-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtscxml-everywhere-src-6.11.1.tar.xz.sha256
+sha256  8e495245e5d1fe75de612c8a07e4043635407a1979bb1dd588f1751d1390203f  qtscxml-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index af0362c289..ef4e96e1d6 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtserialbus-everywhere-src-6.9.1.tar.xz.sha256
-sha256  491ece4583565f5d809ea9dd8caa2779a97c23a7d4d8352ba8a7a660e1ab04d7  qtserialbus-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtserialbus-everywhere-src-6.11.1.tar.xz.sha256
+sha256  c46c9c0c8d6815301a669cdbd5866c10bcfb9e56889f5d7da14e11d6ad24f20a  qtserialbus-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d54a422826..63ed548400 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtserialport-everywhere-src-6.9.1.tar.xz.sha256
-sha256  808fed52380c74ae89268306ce4d04b00f8f6b81f8c442489c390006d93eff10  qtserialport-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtserialport-everywhere-src-6.11.1.tar.xz.sha256
+sha256  9af31a898ffd9a7e4faf6fed845d29e783c716885789055cbe319f3e072d3974  qtserialport-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 736907509d..9ff3f9c88f 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtshadertools-everywhere-src-6.9.1.tar.xz.sha256
-sha256  4e1ed24cce0887fb4b6c7be4f150239853a29c330c9717f6bacfb6376f3b4b74  qtshadertools-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtshadertools-everywhere-src-6.11.1.tar.xz.sha256
+sha256  2075052f9b23bcf9de045bbd180037084942f82cce870aab14a1454902c982fc  qtshadertools-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index 2df065341e..c5f9dabe2a 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtsvg-everywhere-src-6.9.1.tar.xz.sha256
-sha256  2dfc5de5fd891ff2afd9861e519bf1a26e6deb729b3133f68a28ba763c9abbd5  qtsvg-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtsvg-everywhere-src-6.11.1.tar.xz.sha256
+sha256  7f3cf02f4824bf03c2c5859ea6db173bf1482a1daf24e6cdf7bc78cfa26a8a94  qtsvg-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index 82209c3d9c..f6db07deaf 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qttools-everywhere-src-6.9.1.tar.xz.sha256
-sha256  90c4a562f4ccfd043fd99f34c600853e0b5ba9babc6ec616c0f306f2ce3f4b4c  qttools-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qttools-everywhere-src-6.11.1.tar.xz.sha256
+sha256  8e61835a679c93fa9c6065b142353c2071ba68e297898937c32a03777fcaf50d  qttools-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 14bf9a80c3..c47d69fa99 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtvirtualkeyboard-everywhere-src-6.9.1.tar.xz.sha256
-sha256  80059a38bdb836f0785292396970edc108f477a68d9a35bed8393750de3d281f  qtvirtualkeyboard-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtvirtualkeyboard-everywhere-src-6.11.1.tar.xz.sha256
+sha256  a1c6967b326243b2ca8d50bc7b7f7852c3975d9aa6ce4b186ebdf35bb1007e1c  qtvirtualkeyboard-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index f59c667d0c..62b7b2ee92 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwayland-everywhere-src-6.9.1.tar.xz.sha256
-sha256  7d21ea0e687180ebb19b9a1f86ae9cfa7a25b4f02d5db05ec834164409932e3e  qtwayland-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtwayland-everywhere-src-6.11.1.tar.xz.sha256
+sha256  95788aa502f75441d4edf65932b235f76523084e13dbbb7b9ee2d207b32bd9b3  qtwayland-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 93ad174c84..505fb2ca59 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwebsockets-everywhere-src-6.9.1.tar.xz.sha256
-sha256  98be8c863b7f02cc98eedc0b6eac07544c10a9d2fa11c685fd61f6b243f748f5  qtwebsockets-everywhere-src-6.9.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtwebsockets-everywhere-src-6.11.1.tar.xz.sha256
+sha256  243e3aa11924c8c5c1645e892f62d013caa3766c57512ca926d5b58146646fbf  qtwebsockets-everywhere-src-6.11.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
