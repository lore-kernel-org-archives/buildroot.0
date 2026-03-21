Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79AB109448F
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 18:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68AE784658;
	Sat, 21 Mar 2026 18:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMdc5i0S1ZD3; Sat, 21 Mar 2026 18:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA1184A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774119225;
	bh=Dh+5lRkajFdd+7ppRgvT9LLMQbDadk0alkZd9p60s4A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f24reldWADXzUWLW+vLYTIji+ECGVqQWsZDw8WRw4Yg4qMVTFGRAlv1Ti+BtYgWW4
	 s2dAa8+E5FHO6SQThgb2zNEdlA27evqcI+7wvdt/Kl+AkcDhg7GIu7tYg7DD7F10Ai
	 +2S3bVP9kBiwODj3IRflj1fp3mmfEyiMLb/uzH+G9Y6B4pGuyksbwSNSZatH1WfH/l
	 sqqoyxFkOWgG4FfRHEBhSBgtoGZlPNJnuBQi55CVifbnkxdX9WCFak/pdU2/n0i9WJ
	 QRViHYF0T/IgeoVWwD6qyIsOE6XUyKkzr8bdJUWJnZEGpWT5xGZ0SZXOSLaH8z4wTK
	 KLRiItOmio2ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA1184A91;
	Sat, 21 Mar 2026 18:53:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D0C6265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5331A84A91
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooCjrWdesW-k for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 18:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39A7C84658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A7C84658
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39A7C84658
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:53:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 449F3A4C0426;
 Sat, 21 Mar 2026 19:53:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46518)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w41S8-000000007us-1h39;
 Sat, 21 Mar 2026 18:53:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Mar 2026 19:53:40 +0100
Message-ID: <20260321185340.1749353-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774119221;
 bh=svHifox7K478xrD6ILYk0LALFbKmD5Sn7DPOdt4H+vs=;
 h=From:To:Cc:Subject:Date:From;
 b=mt4Za1f65msmsoY+/UmC8CtCs1nggYhglGV12YEAcOwgrcsJplyOtyVFQ9ZEKfu5a
 midARuuC0bnVCI5O00e/qf7xgShNpb5R+DYfq+/rUocu88Z1dAh1mckt9kBosY/gnh
 7OPE4i6ukMDocpjJw9SVfV/hAhBxaxurHSIEmXN2GpRSyfNrsWuad7IBL2bqGJxSBt
 5U7rthRweKDe2fSl5bI1l9aTL6R3NNzhZinF6VdOyB9/+SyoxmnpzIVSfSFiUmCtJM
 6hY5rhNt3a2+kTjQEJsS6zey2jZU+UTaT57uloCY9cYZ2O/CYpNIvWaRtw2weq2nrz
 ZN47Dcm1Ora3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mt4Za1f6
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.10.2
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

https://github.com/mesonbuild/meson/compare/1.10.1...1.10.2

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
index b9243dfaec..794e6b5cc9 100644
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
index 7ac7c8364d..eb2e0e0a3a 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
-sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.10.2
+sha256  7890287d911dd4ee1ebd0efb61ed0321bfcd87c725df923a837cf90c6508f96b  meson-1.10.2.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6b2a25f1dd..1c6068e004 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.10.1
+MESON_VERSION = 1.10.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
