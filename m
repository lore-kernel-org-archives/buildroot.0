Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41208FF8850
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B8114277B;
	Sun, 26 Apr 2026 07:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_ABe1SEwarO; Sun, 26 Apr 2026 07:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED994276F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777187838;
	bh=DlXchOtCgdaKCxR91NlFbhQZgn2hTzWoy42zEsufq7k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fPj8WmnoSywBC3zpNsyMNRJeaxwdG+AdXUuDa6PKulii24h/BJc8X8yJ1ExabDMFc
	 bVakZCGnxQ/XRPQmQkakS6jfPOM6pwio2gj3wy11SJ4WE2bJe7FZ7fDr2tDa0vdspj
	 W3vr3OCeAcE0nW35PtaQVWgrDgeZgaau+HfVFeKxxNfq04whKriY/otEWykCyHiqWa
	 oqwFlW+ZzgxWTFgNJRUDktN3/6xZj01Lk9R1tZ1NR4uIQoH2VczlQAQLjOvLXSXCh+
	 AQiCsW45EPoP1X6wPVVWb+0BpibUcGSGKyn+4qbFstRN3McCT8siNYViFzarJu8bcf
	 g2mYRjLIKz3kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED994276F;
	Sun, 26 Apr 2026 07:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91ABC2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82F21616A5
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7syp3F19A3t for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 083C060632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083C060632
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 083C060632
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:17:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02799A4C0CF4;
 Sun, 26 Apr 2026 09:17:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33728)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtjq-000000003kU-1z8K;
 Sun, 26 Apr 2026 07:17:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Apr 2026 09:17:10 +0200
Message-ID: <20260426071710.363519-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777187832;
 bh=vXEuJ7b8UOFjDmuBse2fCt4qYHNI2sYxahrosaTEiTw=;
 h=From:To:Cc:Subject:Date:From;
 b=T50NqVt+5x0F+uI9toqxfYOfJJf77SjwFTKK4wCsN/GCaJyHqnkDHpGGwe84DToUy
 zbtBHsLcgMpCFSjAzhoeDC28Rw5urpRsPeSNZCuTRJBRZsgTpXwTVYe8P+7H1mxhcA
 xhgtycpbdw8QFovbuxHRXkc2Hhnllk/TpZGfeMmSZmi5jzIyFK6gjkYiI10N9svhfx
 Qjz/i57v5h4+KJiWitRnTDj1W0bCrsFvvzxFSLgplCb3jalWzJ5XzrqLhOAkxFoE9l
 5AFhN07qXD2+4/EHLudV1c8yCYqazBhcnNUStnwm5PWfTwczET+HiNTutY7RMWum4O
 MkFSlB+xDXExA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=T50NqVt+
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.11.1
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

https://mesonbuild.com/Release-notes-for-1-11-0.html

Removed patch which is included in this bump.

Disabled the usage of ccache in mesa3d with BR2_PACKAGE_MESA3D_RUSTICL=y
due to upstream commit:
https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
(bisected https://github.com/mesonbuild/meson/compare/1.10.1...1.10.2 to
 find the offending commit, the same defconfig works with meson 1.10.1)

Without this change mesa3d configure is broken:

output/build/mesa3d-26.0.3/src/gallium/frontends/rusticl/meson.build:420:27:
 ERROR: No build machine compiler for 'src/gallium/frontends/rusticl/proc/lib.rs'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/mesa3d.mk                      |  6 +++
 ...not-fail-if-only-the-build-machine-u.patch | 45 -------------------
 package/meson/meson.hash                      |  4 +-
 package/meson/meson.mk                        |  2 +-
 4 files changed, 9 insertions(+), 48 deletions(-)
 delete mode 100644 package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fb5499de81..047cfaba2a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -71,6 +71,12 @@ MESA3D_CONF_OPTS += \
 	-Drust_std=2021 \
 	-Dmesa-clc-bundle-headers=enabled
 
+# meson does not allow ccache
+# https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
+MESA3D_CONF_ENV += \
+	CC_FOR_BUILD="$(HOSTCC_NOCCACHE)" \
+	CXX_FOR_BUILD="$(HOSTCXX_NOCCACHE)"
+
 MESA3D_MESON_EXTRA_BINARIES += \
 	rust=['$(HOST_DIR)/bin/rustc','--target=$(RUSTC_TARGET_NAME)'] \
 	rust_ld='$(TARGET_CROSS)gcc'
diff --git a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
deleted file mode 100644
index 22f9ace42e..0000000000
--- a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c1db93be859b360b64fe20d49a286278b56df64e Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Tue, 3 Feb 2026 12:56:36 +0100
-Subject: [PATCH] ninjabackend: do not fail if only the build machine uses C++
-
-This is caused by the introduction of the cpp_importstd option; while
-target_uses_import_std() tries to protect from the option not existing,
-this does not work if cpp_importstd exists but build.cpp_importstd does
-not, and get_option_for_target() wants to look at the latter.
-
-Just return false on a KeyError for simplicity.
-
-Fixes: #15497
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream: https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- mesonbuild/backend/ninjabackend.py | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
-index 42f24d47d..e0aaa39c4 100644
---- a/mesonbuild/backend/ninjabackend.py
-+++ b/mesonbuild/backend/ninjabackend.py
-@@ -3297,11 +3297,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47485'''))
-     def target_uses_import_std(self, target: build.BuildTarget) -> bool:
-         if 'cpp' not in target.compilers:
-             return False
--        if 'cpp_importstd' not in self.environment.coredata.optstore:
--            return False
--        if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'false':
-+        try:
-+            if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'true':
-+                return True
-+        except KeyError:
-             return False
--        return True
- 
-     def handle_cpp_import_std(self, target: build.BuildTarget, compiler):
-         istd_args = []
--- 
-2.47.3
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 7ac7c8364d..b2fff8974d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
-sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.11.1
+sha256  6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866  meson-1.11.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6b2a25f1dd..0a61cc9c0b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.10.1
+MESON_VERSION = 1.11.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
