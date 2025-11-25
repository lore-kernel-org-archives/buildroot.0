Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00ED0EE3D
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 21:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C0F60720;
	Tue, 25 Nov 2025 21:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKE0r3Vh0k4X; Tue, 25 Nov 2025 21:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 522C660746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 522C660746;
	Tue, 25 Nov 2025 21:29:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0EA82A9
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 21:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2ABD607BE
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 21:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPHTmm9Q9Xu4 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 21:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BFB260720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BFB260720
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BFB260720
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 21:29:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51482A4C7684;
 Tue, 25 Nov 2025 22:28:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58302)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vO0ao-000000005vh-3uLo;
 Tue, 25 Nov 2025 21:28:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 25 Nov 2025 22:28:55 +0100
Message-ID: <20251125212855.589892-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764106139;
 bh=efDOeARcki8l/OU47ssRG421Qhb3/hhHqk1Wh+H8utc=;
 h=From:To:Cc:Subject:Date:From;
 b=UQhXBf3/PJsNb9sSp4JIBNSK5UpuAP+Uz1l0xYKaHhmdKuLhGTYEDhb2EFb/o9hMB
 jfRwJKxlTyxZZ+b2I5RdXe+E2awm+ZnAMSisfSZg4Boj0SD6vjW0Mda31OtBUKRHJQ
 oV8qNVEPQ4qDlR848f+f+yR3g+jU3PtXLL5APsKgKCWH/S0/dc4VjgQ9OMP4aWiN++
 47+gWdy0FF3SeKwrg3ETr6WeLIL97q4ttyyy68ZUUU4Ob5eUSKqzP1oIL6vh6xxB1W
 ebbldUMfCLFpfl+XRjCBaXqDdDHzJfu7LHukex9CCsSP+/24MxkiKETIsqTjaWpxXC
 +3sOOHQv0rSxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=UQhXBf3/
Subject: [Buildroot] [PATCH/next 1/1] package/pixman: bump version to 0.46.4
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

From: Charlie Jenkins <charlie@rivosinc.com>

Version 0.46.0 includes the patch to fix building on riscv without
vector support so drop the patch from the tree.

Release notes:
https://lists.cairographics.org/archives/cairo/2025-April/029612.html
https://lists.cairographics.org/archives/cairo/2025-June/029617.html
https://lists.cairographics.org/archives/cairo/2025-July/029629.html

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
[Bernd: bumped to version 0.46.4, added release notes]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...le-RVV-on-linux-if-hwcap-headers-are.patch | 44 -------------------
 package/pixman/pixman.hash                    |  4 +-
 package/pixman/pixman.mk                      |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch

diff --git a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
deleted file mode 100644
index ad1a0902e2..0000000000
--- a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d0045f1fc32635d9629ea9e361631b07d9ca4140 Mon Sep 17 00:00:00 2001
-From: Charlie Jenkins <charlie@rivosinc.com>
-Date: Mon, 21 Apr 2025 13:08:50 -0700
-Subject: [PATCH] RISC-V: Only enable RVV on linux if hwcap headers are
- available
-
-Linux 6.4 introduced COMPAT_HWCAP_ISA_V. When trying to compile pixman
-against linux headers older than this, pixman will fail to compile
-because it assumes COMPAT_HWCAP_ISA_V exists.
-
-During meson configuration, do not enable have_rvv if the platform is
-Linux and COMPAT_HWCAP_ISA_V doesn't exist.
-
-Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
-Fixes: 0e424031bda2 ("RISC-V floating point operations")
-Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/149
----
- meson.build | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fdea28f..cb10931 100644
---- a/meson.build
-+++ b/meson.build
-@@ -379,7 +379,15 @@ if not use_rvv.disabled()
-         }
-       ''',
-       args : rvv_flags,
--      name : 'RISC-V Vector Intrinsic Support')
-+      name : 'RISC-V Vector Intrinsic Support') and cc.compiles('''
-+      #if defined(__linux__)
-+      #include <asm/hwcap.h>
-+      #include <sys/auxv.h>
-+      COMPAT_HWCAP_ISA_V
-+      #endif
-+      ''',
-+      args : rvv_flags,
-+      name: 'RISC-V Vector Linux HWCAP Support')
-       have_rvv = true
-     endif
-   endif
--- 
-2.43.0
-
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index c49b9c9e76..3e1e5a16ff 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,5 +1,5 @@
-# From https://lists.cairographics.org/archives/cairo/2024-December/029586.html
-sha512  b24907f9a0bf6a9aa3278d31986c562c5f2d68f8c178021497c8648aca9f91e4c6f1ecfacf93eb01ba4f03ce4cfc5970fc40bb0fe6724bac9210fc57da09cba4  pixman-0.44.2.tar.xz
+# From https://lists.cairographics.org/archives/cairo/2025-July/029629.html
+sha512  83b133e7969ba34f883f4e08dcc5d388c4397f43ce836c191c05945fe77c16ff501d531600780c12678a0d08105828a6bdeff2156b63f9c1a84087bc7f40ae9f  pixman-0.46.4.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 78ab20da59..1cc9cc0f12 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.44.2
+PIXMAN_VERSION = 0.46.4
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
