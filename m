Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0592ECDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8592460EF1;
	Fri, 13 Oct 2023 21:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8592460EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj5vLaSId-ly; Fri, 13 Oct 2023 21:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B1660EF6;
	Fri, 13 Oct 2023 21:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B1660EF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C03371BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9972C60EF6
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9972C60EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCTiCBKIzUix for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:54:03 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D693960EF1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D693960EF1
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-405524e6769so16383265e9.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697234040; x=1697838840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rMM1jdi3A0sOj5q4NLCOTs+t4NSSvf6tXJUn5TLDlnk=;
 b=ex97Rd8Sjw+plQ3qTIzpMz4IC2vTfPP0sWM4GNLOnwW3JXXErc2qehMpKm//f3ATt3
 qs2ffO5YX/8vzSaiQatNU35DgOrGd5k3Rvi6Mmbe5Uga88q7wIwq4z4Bjwbs7RxpaUVy
 WXvDd1aBfvDriRqe+Ly4hBy9or/HiVeCFrVI4iUD8VQJ5+gjGJvq9JtSyDpM77Pmv53/
 FCNHknU8tJNTHodn7A6HoDlwyWHyee58xk0EwX7c6NG2CNrElWNZoyvbLaPuAPjpcCos
 8fdafbgWBp2ZHZ9Ene7V+CRF+QNoTdgV6BhrsiAUCq+VoOtEXAVNi4BDUXosjGld+7Lf
 MCGg==
X-Gm-Message-State: AOJu0YzSCEXzNUzeGbc3/qgTnL+oVU6huxvyAzicQxHQhhv0SmJx8qcm
 XK58KGBjx+SKUiDTC7eHGPsiEfJM/54=
X-Google-Smtp-Source: AGHT+IFv19+HsjK936yDCwH2Src1Kan1A1VzJjVag5ujMSuEZMtVmvqmhry/kJsgucUdfgWCf9Xl6A==
X-Received: by 2002:a05:600c:4f91:b0:406:80b4:efd5 with SMTP id
 n17-20020a05600c4f9100b0040680b4efd5mr992655wmq.14.1697234040046; 
 Fri, 13 Oct 2023 14:54:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c431200b0040642a1df1csm199886wme.25.2023.10.13.14.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 14:53:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 23:53:55 +0200
Message-ID: <20231013215355.323987-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697234040; x=1697838840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rMM1jdi3A0sOj5q4NLCOTs+t4NSSvf6tXJUn5TLDlnk=;
 b=UWT51qqhQt8vw6Zt3zETlN/l0PJ4+0Q4/SpWxjMfi/OrpnLw3EoA761WBELVl+zuUK
 CHKDDWOxSYh9wAGRezvzHrxDuxpaj/CothzOfaIl7x3o/Fx1Pw5F1DI6vO9xY47TMbib
 FVLHuWsDK+M5mzfGrQ+upwWpEq/berj3EA306n+j22+jod5RQE+2smCuGAES5Y9yzcIp
 z7G06Pma+POfzWwU3WQgQ/RN/QYSepGdIbV1rLme4jha3Yy8AqW8QZ54cVP/xBPeG+L5
 SemKlGR0c6SCP62JAj73jjnqUJ4v24WfT/IYfaivlYRSIRDoPZZWejZrdhZ7Aab0pwt0
 TFdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UWT51qqh
Subject: [Buildroot] [PATCH 1/1] package/usbguard: fix build with gcc >= 13
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In file included from src/Library/Base64.cpp:23:
src/Library/Base64.hpp:34:34: error: 'uint8_t' does not name a type
   34 |   std::string base64Encode(const uint8_t* buffer, size_t buflen);
      |                                  ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1a08823020c37a73f4e4a40f47b02fca3f159748

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tHub-Actions-cover-build-with-GCC-13.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch

diff --git a/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch b/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch
new file mode 100644
index 0000000000..415b8e1dd1
--- /dev/null
+++ b/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch
@@ -0,0 +1,114 @@
+From 22b1e0897af977cc96af926c730ff948bd120bb5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 31 Mar 2023 09:39:49 +0200
+Subject: [PATCH] Fix build for GCC 13 + make GitHub Actions cover build with
+ GCC 13 (#586)
+
+* include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it for
+uint8_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+* docker.yml: Cover openSUSE Tumbleweed with GCC 13+
+
+Based on scripts/docker/build_on_centos_8_2.Dockerfile .
+
+---------
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Co-authored-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/USBGuard/usbguard/commit/22b1e0897af977cc96af926c730ff948bd120bb5
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .github/workflows/docker.yml                  |  1 +
+ .../build_on_opensuse_tumbleweed.Dockerfile   | 50 +++++++++++++++++++
+ src/Library/Base64.cpp                        |  1 -
+ src/Library/Base64.hpp                        |  1 +
+ 4 files changed, 52 insertions(+), 1 deletion(-)
+ create mode 100644 scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
+
+diff --git a/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile b/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
+new file mode 100644
+index 00000000..d0993d8c
+--- /dev/null
++++ b/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
+@@ -0,0 +1,50 @@
++##
++## Copyright (c) 2023 Sebastian Pipping <sebastian@pipping.org>
++##
++## This program is free software; you can redistribute it and/or modify
++## it under the terms of the GNU General Public License as published by
++## the Free Software Foundation; either version 2 of the License, or
++## (at your option) any later version.
++##
++## This program is distributed in the hope that it will be useful,
++## but WITHOUT ANY WARRANTY; without even the implied warranty of
++## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++## GNU General Public License for more details.
++##
++## You should have received a copy of the GNU General Public License
++## along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++FROM opensuse/tumbleweed:latest
++RUN zypper --non-interactive install dnf rpm-repos-openSUSE-Tumbleweed \
++        && \
++    dnf install -y \
++            asciidoc \
++            autoconf \
++            automake \
++            dbus-1-glib-devel \
++            diffutils \
++            file \
++            gcc-c++ \
++            git \
++            libgcrypt-devel \
++            libqb-devel \
++            libsodium-devel \
++            libtool \
++            libxslt \
++            make \
++            polkit-devel \
++            protobuf-devel
++ADD usbguard.tar usbguard/
++ADD catch.tar usbguard/src/ThirdParty/Catch/
++ADD pegtl.tar usbguard/src/ThirdParty/PEGTL/
++WORKDIR usbguard
++RUN git init &>/dev/null && ./autogen.sh
++RUN ./configure --with-bundled-catch --with-bundled-pegtl || ! cat config.log
++RUN make dist
++RUN tar xf usbguard-*.tar.gz
++RUN mv -v usbguard-*.*.*/ usbguard-release/
++RUN mkdir usbguard-release/build/
++WORKDIR usbguard-release/build/
++RUN ../configure --with-bundled-catch --with-bundled-pegtl || ! cat config.log
++RUN bash -c 'set -o pipefail; make V=1 "-j$(nproc)" |& tee build.log'
++RUN ! grep -F 'include file not found' build.log
+diff --git a/src/Library/Base64.cpp b/src/Library/Base64.cpp
+index ddb28dce..0246a134 100644
+--- a/src/Library/Base64.cpp
++++ b/src/Library/Base64.cpp
+@@ -22,7 +22,6 @@
+ 
+ #include "Base64.hpp"
+ #include <stdexcept>
+-#include <cstdint>
+ 
+ namespace usbguard
+ {
+diff --git a/src/Library/Base64.hpp b/src/Library/Base64.hpp
+index 0947f214..e0c745cb 100644
+--- a/src/Library/Base64.hpp
++++ b/src/Library/Base64.hpp
+@@ -23,6 +23,7 @@
+ #endif
+ 
+ #include <string>
++#include <cstdint>
+ #include <cstddef>
+ 
+ namespace usbguard
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
