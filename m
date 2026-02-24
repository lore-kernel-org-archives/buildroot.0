Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E5F4BB6F
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D628235A;
	Tue, 24 Feb 2026 18:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ttbgv7PfCZIq; Tue, 24 Feb 2026 18:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BBE082324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771957224;
	bh=XnUSJMNBrDfB4vPWkEKWer8mSUz+FNPwhELFyqXwdxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fXO8e44HzfH5AmWyC9e6qfbUc08Aj7LJI6TWkBesQhGg7V0wO8V8VcQspNc+vsIXv
	 DB1cUaYNfXHcGPkPdF+87Hnk6BqlogwPIfJzkHLh3Coa+yfa9r9F6LYTA64g6z0zFE
	 l9zzYfoZaqCqQxgyIg7s/F9O9p31+z+RNU6jaZOPb3MlMGFZ2KgLqJPKz0+i65Sji/
	 LEN/QQEWhQXO3EEk8B7SB1A8ZaDfRFg7e++dXqhR1whD/9IeAUt3E5kVjsgSijx/kY
	 5Y3b/o+8OXyW7g4JH6GEP1UjNdZf/fyXrBmT4yh/VKbjuVjbMd/EaZNDQrE7fWC0wu
	 /dPTuI5EHYcug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBE082324;
	Tue, 24 Feb 2026 18:20:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EA1237
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C066041D55
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s01NgjpDXQbX for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 18:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2399A41C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2399A41C09
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2399A41C09
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D2BFA4C2717;
 Tue, 24 Feb 2026 19:20:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46784)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vux16-0000000080N-2m64;
 Tue, 24 Feb 2026 18:20:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Tue, 24 Feb 2026 19:20:14 +0100
Message-ID: <20260224182016.2631828-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771957217;
 bh=5gxfCPq1XGbRyaq3Exvk7ju5vz/Al7ex17lPO+s/nVk=;
 h=From:To:Cc:Subject:Date:From;
 b=BDpCUKG+wViMw0JikZiA5FXtZyRb/N5Qb9dq1Ja0SXaJhSmZ1h+xZqEQoA3NNk3G0
 47s3y5ZFn1nAH7567wQ5d21pNjQEwnVo/RhItPuPaKIhaJeGRaEXzjVSoY5u83HSBQ
 1U04y5lVhG33uvVlEvYXpIT7lmmcVImDWEhUcufxWVTkoas3vjAokHK2apuXwzkgcC
 IKJw3vbmuqDAMIu5vLefufC+kF0VrGX4VgRWtqe9bVyxIyZkP21QWcomHNhwlECYFI
 fUp5hE/xbkMeYC4XKk0zWTqGxFZ17rJbJBOp5Hgs9QugR/9qphKh172LtN3jGPtZfk
 USysEuCkDH91Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BDpCUKG+
Subject: [Buildroot] [PATCH 1/3] package/vlc: replace wayland-scanner patch
 with upstream commit
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...t-possible-to-override-wayland-scann.patch | 39 +++++++++++++++
 ...o-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 -------------------
 package/vlc/vlc.mk                            |  1 +
 4 files changed, 40 insertions(+), 51 deletions(-)
 create mode 100644 package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
 delete mode 100644 package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 695e0d50c6..3ad99d0eb1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -975,7 +975,6 @@ package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_pa
 package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
 package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
 package/vlc/0007-Add-support-for-freerdp2.patch lib_patch.Upstream
-package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch lib_patch.Upstream
 package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
 package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
diff --git a/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
new file mode 100644
index 0000000000..b89687ec74
--- /dev/null
+++ b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yann Lochet <yann@l0chet.fr>
+Date: Fri, 25 Nov 2022 16:20:45 +0100
+Subject: [PATCH] configure: make it possible to override wayland-scanner
+
+When cross-compiling, PKG_CONFIG might pick up the wayland-scanner
+from the sysroot.
+
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/75e52f617bf3273f4883b56c4175d68211e02d14
+
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a91fc73172..5e8821dea9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3277,6 +3277,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
+     ])
+ 
+     AC_MSG_CHECKING([for the Wayland scanner])
++    AS_VAR_SET_IF(WAYLAND_SCANNER, [],[
+     PKG_CHECK_EXISTS([wayland-scanner], [
+       WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
+       AC_MSG_RESULT([${WAYLAND_SCANNER}])
+@@ -3284,6 +3285,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
+       AC_MSG_RESULT([not found])
+       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
+     ])
++    ])
+ 
+     have_wayland="yes"
+ 
+-- 
+2.47.3
+
diff --git a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
deleted file mode 100644
index 2b74fe0d39..0000000000
--- a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 27635f902831fac898586f1f3dc98369f12582c9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Aug 2018 12:51:04 +0200
-Subject: [PATCH] configure.ac: also use AC_PATH_PROG to check for
- wayland-scanner
-
-When cross-compiling the .pc file might point to the wrong
-wayland-scanner binary (target rather than host) resulting in a
-non-executable and wrong scanner.
-Try searching the PATH first, and if that fails fall back into
-pkg-config.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4808b8becf..a18641ed23 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3140,14 +3140,17 @@ AS_IF([test "${enable_wayland}" != "no"], [
-       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors 'wayland-protocols >= 1.4')])
-     ])
- 
--    AC_MSG_CHECKING([for the Wayland scanner])
--    PKG_CHECK_EXISTS([wayland-scanner], [
--      WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
--      AC_MSG_RESULT([${WAYLAND_SCANNER}])
--    ], [
--      AC_MSG_RESULT([not found])
--      AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
--    ])
-+    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
-+    if test "x$WAYLAND_SCANNER" = x; then
-+        AC_MSG_CHECKING([for the Wayland scanner])
-+        PKG_CHECK_EXISTS([wayland-scanner], [
-+          WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
-+          AC_MSG_RESULT([${WAYLAND_SCANNER}])
-+        ], [
-+          AC_MSG_RESULT([not found])
-+          AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
-+        ])
-+    fi
- 
-     have_wayland="yes"
- 
--- 
-2.18.0
-
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 07aeefd193..0ce6662353 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -527,6 +527,7 @@ VLC_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS),yy)
+VLC_CONF_ENV += WAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
 VLC_CONF_OPTS += --enable-wayland
 VLC_DEPENDENCIES += wayland wayland-protocols
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
