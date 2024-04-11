Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CCCC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505A361310;
	Thu, 11 Apr 2024 21:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACZNZAZHuDHn; Thu, 11 Apr 2024 21:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F09E612FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F09E612FC;
	Thu, 11 Apr 2024 21:02:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 928A31BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE3F82274
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMb1KYMZ7Wym for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AEEB82269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AEEB82269
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AEEB82269
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:02:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6223EA4C3146
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57008)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1Yr-000000001Ng-2Ryu
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:02:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:02:22 +0200
Message-Id: <20240411210222.2127990-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869342;
 bh=XUx/yavK8lNZnlr3XtoF0Mdb3VKlyd69KDy/FoIfKUg=;
 h=From:To:Subject:Date:From;
 b=QcULtv7bOO6rFP0lSfGw9Xed6I2XQ8ANyRjfAJDjef6rPhVIlcogq/cxAmRjSTLMe
 OQcdrm66MwJ8KTM2vcxzxZksASc1tqVPdy6DkC80MUzSD4IcQQhb109OeBJXp4qe8U
 AnR8UDQvi/8sghRyPAmHsAJ3efqQqFPWNF4OZpuMFZ8gVaUDog103yLq9QkG7x4Kcp
 pV6Z17HKVnrVZ+QbNK+WiQWWOilnvlWXsBWvFYJXQECFwZG+1xQYsKW2Phf20x1Myx
 Qz/ZhMtoMQlMOdcX8QtMMeyD1hX0kIznRbxHdESPjW1++PExPAmd7Kdn1sWKkAP4OW
 UhlUIfA2ss1Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=QcULtv7b
Subject: [Buildroot] [PATCH] package/libpciaccess: bump version to 0.18.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in upstream release.

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003483.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...lding-static-library-not-just-shared.patch | 48 -------------------
 package/libpciaccess/libpciaccess.hash        |  4 +-
 package/libpciaccess/libpciaccess.mk          |  2 +-
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch

diff --git a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
deleted file mode 100644
index df1b4b415a..0000000000
--- a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ad7e9cb4b291a46812eea321f0634cfc46fb94e2 Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Thu, 14 Mar 2024 13:55:55 -0700
-Subject: [PATCH] meson: allow building static library, not just shared
-
-Lets builders specify -Ddefault_library={shared,static,both}
-to control which types of libpciaccess library are built
-
-Closes: #20
-Reported-by: Maxime Gauduin (@alucryd)
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-
-Upstream: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/ad7e9cb4b291a46812eea321f0634cfc46fb94e2
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .gitlab-ci.yml  | 2 +-
- src/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
-index bcb75cf..185edc2 100644
---- a/.gitlab-ci.yml
-+++ b/.gitlab-ci.yml
-@@ -91,7 +91,7 @@ meson:
-       - MESON_OPTIONS: ['-Dzlib=disabled', '-Dzlib=enabled']
-   script:
-     - mkdir -p ../_inst
--    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 $MESON_OPTIONS
-+    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 -Ddefault_library=both $MESON_OPTIONS
-     - meson configure builddir
-     - ninja -C builddir test
-     - ninja -C builddir install
-diff --git a/src/meson.build b/src/meson.build
-index 24eee04..e319688 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -38,7 +38,7 @@ endif
- 
- inc_src = include_directories('.')
- 
--libpciaccess = shared_library(
-+libpciaccess = library(
-   'pciaccess',
-   [
-     'common_bridge.c',
--- 
-GitLab
-
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 4662314509..e50aacc846 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2024-February/003453.html
-sha512  54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd  libpciaccess-0.18.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003483.html
+sha512  ef27999446e735df2331e94219ee3dafe9198a2472bb452f63ef9c9c446d5431f9e231e224cfabdeba1402974a5a0064546f9abced4d1770f994f5fc0c2b3310  libpciaccess-0.18.1.tar.xz
 # Hash for license file:
 sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 04f3e2083b..cd35b27015 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.18
+LIBPCIACCESS_VERSION = 0.18.1
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
