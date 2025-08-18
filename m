Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75032CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 13:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B48341C69;
	Mon, 18 Aug 2025 13:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XutJ1QskRrJ1; Mon, 18 Aug 2025 13:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EEFE41C3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EEFE41C3B;
	Mon, 18 Aug 2025 13:46:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C3E75
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2451D41C3B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-1qfMY8ILfQ for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 13:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9186641C37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9186641C37
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9186641C37
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:46:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b004954so29620585e9.0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755524800; x=1756129600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9/il6mZgVt7PHmVFogL0SHPSq7Tp+4gA6/AiSKkcws=;
 b=ZXcwfzooTe9CmMKOLufAwZHgbI4079cjo6Rl6Zk0s+SgROj+D5KLsAGPMjKG7QOE5n
 JTXP677uBsUM3TPDGhBkUwpTHVynxB8Wp4s4rr+sR9pexFBD3DWkzKEWbTKhQT7SWdJu
 A9KdR7ceFla26RMQoAgSlBiwxepDfTCtRFos1khbrx2tbGdU7iJqhg8D3zZbuTmOmSU3
 pdZzSlZT68C+HW9TKl07wFtgl0pvy8mXmn9oyEHBZSLuJxkTBRD/FD/zBwjJUvwbYFOZ
 YNgURgyUjeF90n3lQUm6zhJoTuu7EHP+cSINmL8m/olzujJJWtnOEZcAzXb1ghLK95f/
 5VNg==
X-Gm-Message-State: AOJu0YyIMl18/4D5VvHJBrmR/jf1PlWOYdzUHxE9JJLNKPIiFnWmFCTE
 PyXjNSYr/+EFkibw9rlQthft2q8ZLReXWq4U9rbXT7bAKYBBlL/yr7i4Iil/hvLa
X-Gm-Gg: ASbGncsxwNCAtZtGd/5Su6ilAQ3BoPlVao4+dem3+kH8x9ZGckG8x1AQUpeF1YMfuaF
 wtVGGMqf8wFD21jkxnmCJXOcETHc8hm0XwiJ6ZUf0nWCByTD00M+TshK/sRovG5RbcrfpJJBs/B
 d7Z6rBi178p1Yxo8wnUV4LihpiCt/TCV0+XgaPFs1c3WG5NbbUAmd1Xg7TZXE8SdzYTVnkuEOgg
 x5m/wjSFp2+YSYMHerbW5EWh+p+1WzUuFp033n8FRURnHY4fVQ1jMtYwBDYcqf51nGpn5+fnYDL
 IHToPorTCfHd5z+FAL9QylfOVaPtjb2mFef5dXrpXV1gL2ZXP9bwLPOduwRdkSwXF+MVJV/eJSU
 qbttr5afhuKRZpT5LmQJfEFoFY3kzd/jYmixwfS/G1eB7yQ==
X-Google-Smtp-Source: AGHT+IEWOPG9dNECx8kppLY5wF49TSscLp271yHC3q0DWAWXDdG6J8ZNcVv7dD44SR4xNfVY+ugwpw==
X-Received: by 2002:a05:600c:1f96:b0:456:1dd9:943 with SMTP id
 5b1f17b1804b1-45a26fdafe4mr76143905e9.3.1755524800003; 
 Mon, 18 Aug 2025 06:46:40 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb93862fe7sm13035328f8f.64.2025.08.18.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 06:46:39 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 18 Aug 2025 15:46:36 +0200
Message-Id: <20250818134636.927592-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755524800; x=1756129600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9/il6mZgVt7PHmVFogL0SHPSq7Tp+4gA6/AiSKkcws=;
 b=aI1eZ/Lgthsryn2Ge39Sj5XLMR9nGLplPAPS43Xg0RG7eU3/fe8Z22NOOKuyv7vnYF
 7IyrjGetqHFJI96W5rOA83ormuh4sGV03Js2BZVV2SsiTldyqXSmcX8uYob4LNwPMvwl
 jXd1knSzuu9z2YiYB55UDkFQXZ1OcGlBD4WVvxz7jfqw0hnr6/jQVzgjFkErbyDA/Bo/
 rN6sY2oSdq+7K/2RmXKaxAUOJ7Y79cGQGO59ZtQEdGH50nlD950KAW3KRtqoNaEhhGei
 8ojmwfyaR7ePgIXchC9TUokmTm2OSsAn5FrgWYymdkGJZWa3al/ejMIu2FKAHd6EZ2Ew
 Bsow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aI1eZ/Lg
Subject: [Buildroot] [PATCH] package/mono: remove mono and related packages
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

Microsoft maintains a modern fork of Mono runtime in the dotnet/runtime repo and
has been progressively moving workloads to that fork. That work is now complete,
and we recommend that active Mono users and maintainers of Mono-based app
frameworks migrate to .NET which includes work from this fork.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

To the maintainers: while applying this patch, please apply also this patch from
Giulio

https://patchwork.ozlabs.org/project/buildroot/patch/20240701193420.2119084-1-giulio.benetti@benettiengineering.com/


 DEVELOPERS                                    |  3 -
 package/Config.in                             |  5 --
 ...-MONO_PROFILE_ENTER_LEAVE-undeclared.patch | 28 --------
 .../0002-Mono-compilation-error-branch.patch  | 25 -------
 package/mono-gtksharp3/Config.in              |  8 ---
 package/mono-gtksharp3/mono-gtksharp3.hash    |  5 --
 package/mono-gtksharp3/mono-gtksharp3.mk      | 17 -----
 ...-system-libatomic_ops-shared-library.patch | 52 --------------
 ...0002-Ongoing-work-on-the-cmake-build.patch | 34 ----------
 package/mono/Config.in                        | 29 --------
 package/mono/mono.hash                        |  5 --
 package/mono/mono.mk                          | 67 -------------------
 package/monolite/monolite.hash                |  2 -
 package/monolite/monolite.mk                  | 17 -----
 14 files changed, 297 deletions(-)
 delete mode 100644 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch
 delete mode 100644 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
 delete mode 100644 package/mono-gtksharp3/Config.in
 delete mode 100644 package/mono-gtksharp3/mono-gtksharp3.hash
 delete mode 100644 package/mono-gtksharp3/mono-gtksharp3.mk
 delete mode 100644 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
 delete mode 100644 package/mono/0002-Ongoing-work-on-the-cmake-build.patch
 delete mode 100644 package/mono/Config.in
 delete mode 100644 package/mono/mono.hash
 delete mode 100644 package/mono/mono.mk
 delete mode 100644 package/monolite/monolite.hash
 delete mode 100644 package/monolite/monolite.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a28f3e8d57..828e7f7b22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -223,9 +223,6 @@ F:	package/libb64/
 F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
-F:	package/mono/
-F:	package/mono-gtksharp3/
-F:	package/monolite/
 F:	package/openjpeg/
 F:	package/python-can/
 F:	package/python-minimalmodbus/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..f4bc846b8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -816,11 +816,6 @@ endmenu
 endif
 	source "package/micropython/Config.in"
 	source "package/moarvm/Config.in"
-	source "package/mono/Config.in"
-if BR2_PACKAGE_MONO
-menu "Mono libraries/modules"
-	source "package/mono-gtksharp3/Config.in"
-endmenu
 endif
 	source "package/nodejs/Config.in"
 	source "package/octave/Config.in"
diff --git a/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch b/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch
deleted file mode 100644
index 6596849a89..0000000000
--- a/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c1b9bd4214b78dc426bc6e6a07c23a8ab4ab50ea Mon Sep 17 00:00:00 2001
-From: Jordi Mas <jmas@softcatala.org>
-Date: Tue, 12 Mar 2019 12:24:19 +0100
-Subject: [PATCH] Fixes MONO_PROFILE_ENTER_LEAVE undeclared when compiling with
- newer versions of Mono (#266)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/mono/gtk-sharp/commit/c1b9bd4214b78dc426bc6e6a07c23a8ab4ab50ea]
----
- gtk/gui-thread-check/profiler/gui-thread-check.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gtk/gui-thread-check/profiler/gui-thread-check.c b/gtk/gui-thread-check/profiler/gui-thread-check.c
-index 11838e3b0..9f45fe6b2 100644
---- a/gtk/gui-thread-check/profiler/gui-thread-check.c
-+++ b/gtk/gui-thread-check/profiler/gui-thread-check.c
-@@ -86,6 +86,10 @@ simple_method_enter (MonoProfiler *prof, MonoMethod *method)
- 	}
- }
- 
-+#ifndef MONO_PROFILE_ENTER_LEAVE
-+#define MONO_PROFILE_ENTER_LEAVE (1 << 12)
-+#endif
-+
- void
- mono_profiler_startup (const char *desc)
- {
diff --git a/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch b/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
deleted file mode 100644
index 0d52401b4a..0000000000
--- a/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b Mon Sep 17 00:00:00 2001
-From: plprevost <plprevost@sii.fr>
-Date: Wed, 12 May 2021 16:46:16 +0200
-Subject: [PATCH] refs issue:#298 Fix mono compilation errors
-
-[Retrieved from:
-https://github.com/mono/gtk-sharp/pull/299/commits/fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- sample/test/TestRange.cs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sample/test/TestRange.cs b/sample/test/TestRange.cs
-index 82fb81105..8727c9a77 100644
---- a/sample/test/TestRange.cs
-+++ b/sample/test/TestRange.cs
-@@ -8,7 +8,7 @@
- 
- using System;
- 
--using Gtk;
-+using Gtk; using Range = Gtk.Range;
- 
- namespace WidgetViewer {
- 
diff --git a/package/mono-gtksharp3/Config.in b/package/mono-gtksharp3/Config.in
deleted file mode 100644
index 570b62c3c9..0000000000
--- a/package/mono-gtksharp3/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_MONO_GTKSHARP3
-	bool "gtk# 3"
-	depends on BR2_PACKAGE_LIBGTK3
-	help
-	  Gtk# is a .NET language binding for the GTK+ toolkit.
-	  This package provides version 3 of the bindings.
-
-	  http://www.mono-project.com/docs/gui/gtksharp/
diff --git a/package/mono-gtksharp3/mono-gtksharp3.hash b/package/mono-gtksharp3/mono-gtksharp3.hash
deleted file mode 100644
index 706d985159..0000000000
--- a/package/mono-gtksharp3/mono-gtksharp3.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# sha256 from https://download.gnome.org/sources/gtk-sharp/2.99/gtk-sharp-2.99.3.sha256sum
-sha256  6440f571416267ae0cb5698071d087b31e3084693fa2c829b1db37ca7ea2c3a2  gtk-sharp-2.99.3.tar.xz
-
-# Locally computed
-sha256  4b96eca92e6964e89c2faf6a810c9a0214daf6be651fa848fdfbb8cef80c04b1  COPYING
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
deleted file mode 100644
index 27fcda9482..0000000000
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# gtksharp3
-#
-################################################################################
-
-MONO_GTKSHARP3_VERSION_MAJOR = 2.99
-MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
-MONO_GTKSHARP3_SITE = https://download.gnome.org/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
-MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
-MONO_GTKSHARP3_LICENSE = LGPL-2.0, MIT (cairo)
-MONO_GTKSHARP3_LICENSE_FILES = COPYING
-MONO_GTKSHARP3_INSTALL_STAGING = YES
-MONO_GTKSHARP3_DEPENDENCIES = mono libgtk3
-MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/bin/mcs
-
-$(eval $(autotools-package))
diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
deleted file mode 100644
index 66d4d8e100..0000000000
--- a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 5 Nov 2018 22:50:40 +0100
-Subject: Fix linkage with a system libatomic_ops shared library
-
-Issue #247 (bdwgc).
-
-When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must
-contain the needed dynamic libraries (such as -latomic_ops) otherwise
-build of applications could fail on the link stage on some hosts:
-* libgc.so: undefined reference to 'AO_fetch_compare_and_swap_emulation'
-* libgc.so: undefined reference to 'AO_store_full_emulation'
-
-So, this commit sets ATOMIC_OPS_LIBS to "-latomic_ops" when a system
-atomic_ops library is used and uses ATOMIC_OPS_LIBS in bdw-gc.pc.in.
-
-* bdw-gc.pc.in (Libs): Add @ATOMIC_OPS_LIBS@.
-* configure.ac [$with_libatomic_ops!=no && $with_libatomic_ops!=none
-&& $THREADS!=none] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC_SUBST.
-
-Fix is cherry-picked from bdwgc upstream
-
-Link to original commit https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified  
-
-Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
-
-diff --git a/external/bdwgc/bdw-gc.pc.in b/external/bdwgc/bdw-gc.pc.in
-index ef4c2341..a32e7598 100644
---- a/external/bdwgc/bdw-gc.pc.in
-+++ b/external/bdwgc/bdw-gc.pc.in
-@@ -6,5 +6,5 @@ includedir=@includedir@
- Name: Boehm-Demers-Weiser Conservative Garbage Collector
- Description: A garbage collector for C and C++
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lgc
-+Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc
- Cflags: -I${includedir}
-diff --git a/external/bdwgc/configure.ac b/external/bdwgc/configure.ac
-index 21abe8fa..9ffe81de 100644
---- a/external/bdwgc/configure.ac
-+++ b/external/bdwgc/configure.ac
-@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
- AC_MSG_CHECKING([which libatomic_ops to use])
- AS_IF([test x"$with_libatomic_ops" != xno],
-   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
--          [ AC_MSG_RESULT([external]) ],
-+          [ AC_MSG_RESULT([external])
-+            ATOMIC_OPS_LIBS="-latomic_ops"
-+            AC_SUBST([ATOMIC_OPS_LIBS]) ],
-           [ AC_MSG_RESULT([none])
-             AS_IF([test x"$THREADS" != xnone],
-                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
diff --git a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
deleted file mode 100644
index afe618f193..0000000000
--- a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 17650f7e0f571287bb14bb9b4fbde7b91d842bb4 Mon Sep 17 00:00:00 2001
-From: monojenkins <jo.shields+jenkins@xamarin.com>
-Date: Thu, 24 Sep 2020 12:17:34 -0400
-Subject: [PATCH] Ongoing work on the cmake build. (#20428)
-
-* Fix some warnings.
-* Avoid creating netcore/config.make.
-* Fix CPU_COUNT test.
-* Add missing source file.
-
-Co-authored-by: vargaz <vargaz@users.noreply.github.com>
-
-[Retrieved (and updated to keep only update of icall.c) from:
-https://github.com/mono/mono/commit/17650f7e0f571287bb14bb9b4fbde7b91d842bb4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- mono/metadata/CMakeLists.txt | 1 +
- mono/metadata/icall.c        | 2 +-
- mono/mini/CMakeLists.txt     | 5 +++++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/mono/metadata/icall.c b/mono/metadata/icall.c
-index fa991bc72e57..f2c003ac1ff1 100644
---- a/mono/metadata/icall.c
-+++ b/mono/metadata/icall.c
-@@ -9605,7 +9605,7 @@ mono_create_icall_signatures (void)
- 	int n;
- 	while ((n = sig->param_count)) {
- 		--sig->param_count; // remove ret
--		gsize_a *types = (gsize*)(sig + 1);
-+		gsize_a *types = (gsize_a*)(sig + 1);
- 		for (int i = 0; i < n; ++i) {
- 			gsize index = *types++;
- 			g_assert (index < G_N_ELEMENTS (lookup));
diff --git a/package/mono/Config.in b/package/mono/Config.in
deleted file mode 100644
index 0152df8268..0000000000
--- a/package/mono/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
-	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
-
-config BR2_PACKAGE_MONO_ARCH_SUPPORTS
-	bool
-	default y if (BR2_aarch64 || BR2_arm || BR2_armeb || \
-		      BR2_i386 || BR2_powerpc || BR2_x86_64)
-	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-
-config BR2_PACKAGE_MONO
-	bool "mono"
-	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBATOMIC_OPS
-	help
-	  An open source, cross-platform, implementation of C#
-	  and the CLR that is binary compatible with Microsoft.NET.
-
-	  http://download.mono-project.com/sources/mono/
-
-comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
-	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
deleted file mode 100644
index 1010f6d0ab..0000000000
--- a/package/mono/mono.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# sha256 locally computed
-sha256  57366a6ab4f3b5ecf111d48548031615b3a100db87c679fc006e8c8a4efd9424  mono-6.12.0.182.tar.xz
-sha256  923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
-sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
-sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
deleted file mode 100644
index aead85bac0..0000000000
--- a/package/mono/mono.mk
+++ /dev/null
@@ -1,67 +0,0 @@
-################################################################################
-#
-# mono
-#
-################################################################################
-
-MONO_VERSION = 6.12.0.182
-MONO_SITE = http://download.mono-project.com/sources/mono
-MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
-MONO_SELINUX_MODULES = mono
-MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-MONO_LICENSE_FILES = LICENSE mcs/COPYING \
-	external/Newtonsoft.Json/Tools/7-zip/copying.txt
-MONO_CPE_ID_VENDOR = mono-project
-MONO_INSTALL_STAGING = YES
-
-## Mono native
-
-# patching configure.ac
-MONO_AUTORECONF = YES
-
-MONO_COMMON_CONF_OPTS = --with-mcs-docs=no \
-	--with-ikvm-native=no \
-	--enable-minimal=profiler,debug \
-	--enable-static \
-	--disable-btls \
-	--disable-system-aot
-
-# Disable managed code (mcs folder) from building
-MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-mcs-build
-
-# The libraries have been built by the host-mono build. Since they are
-# architecture-independent, we simply copy them to the target.
-define MONO_INSTALL_LIBS
-	rsync -av --exclude=*.so --exclude=*.mdb \
-		$(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
-endef
-
-MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-MONO_DEPENDENCIES += libiconv
-endif
-
-MONO_DEPENDENCIES += \
-	host-mono \
-	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
-	libatomic_ops
-
-## Mono managed
-
-HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
-
-# ensure monolite is used
-HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
-
-HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3
-
-define HOST_MONO_SETUP_MONOLITE
-	rm -rf $(@D)/mcs/class/lib/monolite
-	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/lib/monolite monolite)
-endef
-
-HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
deleted file mode 100644
index e72ccfbf9d..0000000000
--- a/package/monolite/monolite.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# sha256 locally computed
-sha256  0ac314f75ca2bc4455785f12ceb50da89b6dac90162f9f46afbbb988a8752d4b  monolite-linux-1A5E0066-58DC-428A-B21C-0AD6CDAE2789-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
deleted file mode 100644
index b0042aabf7..0000000000
--- a/package/monolite/monolite.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# monolite
-#
-################################################################################
-
-MONOLITE_VERSION = 1A5E0066-58DC-428A-B21C-0AD6CDAE2789
-MONOLITE_SITE = http://download.mono-project.com/monolite
-MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
-MONOLITE_LICENSE = LGPL-2.0 or commercial
-
-define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/lib/monolite-linux/$(MONOLITE_VERSION)
-	cp -r $(@D)/* $(HOST_DIR)/lib/monolite-linux/$(MONOLITE_VERSION)
-endef
-
-$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
