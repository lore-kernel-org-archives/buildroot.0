Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A180CC47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFBF41E06;
	Sat,  6 Jan 2024 13:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFBF41E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3ZssOz4PCY9; Sat,  6 Jan 2024 13:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F5A41DAA;
	Sat,  6 Jan 2024 13:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F5A41DAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87A3C1BF322
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E2F7608A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2F7608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCWK_tASCHa4 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:48:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 294F560706
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 294F560706
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so3845795e9.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 05:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704548896; x=1705153696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2fEFxKYHmjdJ1Xxrz71hJhutZvfGtrg3C3ye6r6luk=;
 b=mTXvogAvV+vQ8SNSD+SOx8Lq4Fnoor//No/MStMorhhUbK20hdL0BuWbu5RCCAo5jw
 UKhRG+rwCLXtpZiqgYfsFOwTq9mUnaHGsYhYzwef/Bp37asoJHz6xuBH6LPCAvi1KHjl
 AFCYrFrzX4AbtNTkPWts4eneE77v/6dEhEHHuLHNVldAx7+rnAO+OprLPXZQwFllztVB
 XQd7XRS25HwGUoksaAf9I3jvW9hQaD+ekE5QGxOFZN0KnEzLsF9lORiG7bABnQDkAmov
 c+QOdfw9TPXqnVrRKCHc9SPRyd7GWiSfoRlaQavfZ21OYwiNISRetGv68Tlj7O3j3kIq
 dU8w==
X-Gm-Message-State: AOJu0YxFZ5gavSwAgUVOWsX/eluUNU+qs9VjiTb4i9DC9fcOFcYd/7ou
 JXG6THSJ+wcpQa4g9yMq/djNAachSPUNxP3G
X-Google-Smtp-Source: AGHT+IE0j9wb3fZgTdfweDt4pzSB6z5uSvDj4H+fqKbxOFcIxFNBNUmst2xKBhREuC/JaQgC/LDKSg==
X-Received: by 2002:a05:600c:5388:b0:40d:7246:da51 with SMTP id
 hg8-20020a05600c538800b0040d7246da51mr627006wmb.93.1704548896236; 
 Sat, 06 Jan 2024 05:48:16 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:bb38:d24b:f402:8043])
 by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b0040e426bd3dbsm268663wms.11.2024.01.06.05.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 05:48:15 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:47:58 +0100
Message-Id: <20240106134800.506782-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105101105.6a181dcd@windsurf>
References: <20240105101105.6a181dcd@windsurf>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/3] package/cairo: bump to 1.17.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, aperez@igalia.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://www.cairographics.org/news/cairo-1.17.2/
 - https://www.cairographics.org/news/cairo-1.17.4/

!! This is a bump to a snapshot release: 1.17.4.

But it is the first version that supports meson,
and the only version that supports both meson and autotools.

This is just an intermediate bump in order to
switch over to meson in a later commit.

Patches:
 - drop 0001-fix-nofork-build.patch, upstream: [1]
 - drop 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch, upstream: [2]
 - add 0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch, upstream: [3]

[1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/cb2357f481396820ec954dc4b69eafc01a8d162a
[2]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
[3]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
---
 ...r_tolerance_normalized-fix-infinite.patch} |  0
 package/cairo/0001-fix-nofork-build.patch     | 29 ----------------
 ...-Fix-mask-usage-in-image-compositor.patch} |  0
 ...vailable-in-cairo_ft_apply_variation.patch | 33 -------------------
 ...private.h-fix-missing-FT_Color-error.patch | 32 ++++++++++++++++++
 package/cairo/cairo.hash                      |  6 ++--
 package/cairo/cairo.mk                        | 10 +++---
 7 files changed, 39 insertions(+), 71 deletions(-)
 rename package/cairo/{0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch => 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch} (100%)
 delete mode 100644 package/cairo/0001-fix-nofork-build.patch
 rename package/cairo/{0004-Fix-mask-usage-in-image-compositor.patch => 0002-Fix-mask-usage-in-image-compositor.patch} (100%)
 delete mode 100644 package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 create mode 100644 package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch

diff --git a/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch b/package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
similarity index 100%
rename from package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
rename to package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
diff --git a/package/cairo/0001-fix-nofork-build.patch b/package/cairo/0001-fix-nofork-build.patch
deleted file mode 100644
index 702e9910a5..0000000000
--- a/package/cairo/0001-fix-nofork-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-test: fix build when SHOULD_FORK is false
-
-The code in test/cairo-test-runner.c properly takes into account
-platforms that do have fork() support, and uses the SHOULD_FORK define
-to know whether fork is available or not.
-
-However, this SHOULD_FORK macro is used to guard the inclusion of
-<unistd.h>, which is needed to get the prototype of other functions
-(namely readlink and getppid), that are used in portions of this file
-not guarded by SHOULD_FORK.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/test/cairo-test-runner.c
-===================================================================
---- a/test/cairo-test-runner.c
-+++ b/test/cairo-test-runner.c
-@@ -36,10 +36,10 @@
- #include <pixman.h> /* for version information */
- 
- #define SHOULD_FORK HAVE_FORK && HAVE_WAITPID
--#if SHOULD_FORK
- #if HAVE_UNISTD_H
- #include <unistd.h>
- #endif
-+#if SHOULD_FORK
- #if HAVE_SIGNAL_H
- #include <signal.h>
- #endif
diff --git a/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch b/package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
similarity index 100%
rename from package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
rename to package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
diff --git a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
deleted file mode 100644
index 10e000d16f..0000000000
--- a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
-[Retrieved from:
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
- 
--- 
-2.24.1
-
diff --git a/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch
new file mode 100644
index 0000000000..3b18d8077b
--- /dev/null
+++ b/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch
@@ -0,0 +1,32 @@
+From da698db0c20507f0e07492cbe40dbaf1c9053f71 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 09:58:05 +0100
+Subject: [PATCH] cairo-ft-private.h: fix missing FT_Color error
+
+In file included from ../src/cairo-colr-glyph-render.c:37:
+../src/cairo-ft-private.h:87:30: error: unknown type name 'FT_Color'
+   87 |                              FT_Color               *palette,
+      |                              ^~~~~~~~
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/cairo-ft-private.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cairo-ft-private.h b/src/cairo-ft-private.h
+index 836f7e523..6b0e30223 100644
+--- a/src/cairo-ft-private.h
++++ b/src/cairo-ft-private.h
+@@ -43,6 +43,8 @@
+ 
+ #if CAIRO_HAS_FT_FONT
+ 
++#include FT_COLOR_H
++
+ CAIRO_BEGIN_DECLS
+ 
+ typedef struct _cairo_ft_unscaled_font cairo_ft_unscaled_font_t;
+-- 
+2.34.1
+
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 3b93e24a22..fca9ff678c 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,7 @@
-# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
-sha1  00e81842ae5e81bb0343108884eb5205be0eac14  cairo-1.16.0.tar.xz
+# From https://www.cairographics.org/snapshots/cairo-1.17.4.tar.xz.sha1
+sha1  68712ae1039b114347be3b7200bc1c901d47a636  cairo-1.17.4.tar.xz
 # Calculated based on the hash above
-sha256  5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331  cairo-1.16.0.tar.xz
+sha256  74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705  cairo-1.17.4.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7bc8f92deb..4515b76075 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,19 +4,17 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.16.0
+CAIRO_VERSION = 1.17.4
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_CPE_ID_VENDOR = cairographics
-CAIRO_SITE = http://cairographics.org/releases
+CAIRO_SITE = http://cairographics.org/snapshots
 CAIRO_INSTALL_STAGING = YES
 
-# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
-CAIRO_IGNORE_CVES += CVE-2018-19876
-# 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
+# 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 CAIRO_IGNORE_CVES += CVE-2019-6462
-# 0004-Fix-mask-usage-in-image-compositor.patch
+# 0002-Fix-mask-usage-in-image-compositor.patch
 CAIRO_IGNORE_CVES += CVE-2020-35492
 
 CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
