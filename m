Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA12CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE02541484;
	Sun, 15 Oct 2023 09:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE02541484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5oDVgj8_rQs; Sun, 15 Oct 2023 09:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 971854118A;
	Sun, 15 Oct 2023 09:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971854118A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 933C21BF2F1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B8460F48
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B8460F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ui5uB3yuj0Cr for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF61610C0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF61610C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6B3C851CA; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 10:59:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b518b0f161c81582f31c79c50552b5106f693df2
X-Git-Newrev: 05db019ea6f12c407a1ff7e8a365ba2743668d81
X-Patchwork-Hint: ignore
Message-Id: <20231015090300.E6B3C851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: fix build with gcc >= 13
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05db019ea6f12c407a1ff7e8a365ba2743668d81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from src/Library/Base64.cpp:23:
src/Library/Base64.hpp:34:34: error: 'uint8_t' does not name a type
   34 |   std::string base64Encode(const uint8_t* buffer, size_t buflen);
      |                                  ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1a08823020c37a73f4e4a40f47b02fca3f159748

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ke-GitHub-Actions-cover-build-with-GCC-13.patch | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
