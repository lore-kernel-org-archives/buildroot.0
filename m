Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C195C44521
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 12:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C186060A;
	Sun, 19 Jul 2026 12:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU-I-sydnfCz; Sun, 19 Jul 2026 12:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEEA60671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784465622;
	bh=NC6mAYgycVdli+AlLKVdkMuJfGJkHn9AwQ40xArFmY0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DiiupMMiXnq9SIGetzYP0EOCaDIsu/X6DN9X/eFt1kNjq5jaHubEaGvnsvWUlrcPH
	 OYeQDUBQrlJWouE6nGowdPCH5YXb0qmk1PCaSzLmpAcw93O1LTBgoQackfVhgRkTO8
	 m9YJf4GcnfWfr5UBbcMiVg7sGQGOyzKQoEgLgVZggCNDp3WJSYdXcA/TKB8hf5gy/t
	 CYbdbmJuMqQF2gE3fURQ2hRrPDwIu9wJi/IIdQSJAzoU5ykCLPFuvaJ2MorTQSrC28
	 kFGi91ecWA52rKyPawp3lZeKL/BJfrLAXN6Jhkj1EHVSadP7QOChPcLfj4Hy/R96uR
	 IvCBGda4sP1Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FEEA60671;
	Sun, 19 Jul 2026 12:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49546206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3226680B21
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzoNGEKocWXL for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 12:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B43108026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43108026F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B43108026F
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf2b.dip0.t-ipconnect.de [84.161.191.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3973FA4C2FBD;
 Sun, 19 Jul 2026 14:53:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60424)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wlR1S-000000000fS-2D6c;
 Sun, 19 Jul 2026 12:53:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>
Date: Sun, 19 Jul 2026 14:53:33 +0200
Message-ID: <20260719125334.1772882-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784465615;
 bh=j1yOi3i9ZprvVTDPg8ZgYIqsgUvNU8Uyw4NlUz81MRk=;
 h=From:To:Cc:Subject:Date:From;
 b=AYl2XpJaDjOJKEFjV/kAPAktyAmhobxl7MeGyq2Xvk3SpksZq3HOzkgg18hb1vJlV
 UweyL54O2J919T0hy4n4X18At1VFt2UAXg9qp45N1MidTOt339JsE23YsxUgK+lK6Y
 FcY0hKGmo024MttOoFck38SKcPxGHeOg8LmqNBp9DZNRuHfxgdKR0iPM4159RuMY9i
 s7iKVoh0pdMNugAoyQfz+rihw+mvuKOF6pQadsvbaAs0oM3SsXAs7SEA0gL6kev6Ip
 YX6/CipujYK4CFI8lZzKnNRxgIuvnRgUIROHHngg7pn0geb0Dp7cqGUrssFicJpHH5
 3LNHzBEj9CzzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AYl2XpJa
Subject: [Buildroot] [PATCH 1/2] package/libepoxy: needs dynamic library
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

Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
dependencies to gl/egl which revealed that libepoxy needs a toolchain
with dynamic library:

../src/dispatch_common.c:166:10: fatal error: dlfcn.h:
 No such file or directory
  166 | #include <dlfcn.h>

This patch disables static builds and propagates reverse dependencies.

Fixes:
https://autobuild.buildroot.net/results/9d5/9d56cb52eb57df61184e26cea9604f1521d135f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/434f04d604de12c7a4dcad4a605b0c5219d7319c

 package/libcamera-apps/Config.in                  | 2 +-
 package/libepoxy/Config.in                        | 4 ++++
 package/libfm/Config.in                           | 4 +++-
 package/libgtk3/Config.in                         | 4 +++-
 package/libgtk4/Config.in                         | 4 +++-
 package/menu-cache/Config.in                      | 6 ++++--
 package/pcmanfm/Config.in                         | 4 +++-
 package/qemu/Config.in                            | 8 ++++++++
 package/virglrenderer/Config.in                   | 5 +++--
 package/vte/Config.in                             | 4 +++-
 package/webkitgtk/Config.in                       | 2 +-
 package/wpebackend-fdo/Config.in                  | 2 +-
 package/wpewebkit/Config.in                       | 2 +-
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 5 +++--
 package/xscreensaver/Config.in                    | 4 +++-
 15 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index fa41d1be2d..a7f37e3e52 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
-	depends on !BR2_STATIC_LIBS # gnutls/libcamera
+	depends on !BR2_STATIC_LIBS # gnutls/libcamera, libepoxy
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	select BR2_PACKAGE_BOOST
diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 4b23497d46..269b43be85 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
@@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBEPOXY
 	  OpenGL entry points at runtime.
 
 	  https://github.com/anholt/libepoxy
+
+comment "libepoxy needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 9537a723ff..e4d6528db5 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libgtk3
@@ -26,11 +27,12 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "libfm needs X.org with an OpenGL backend"
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 52ee50db49..7717afdac2 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,8 +1,9 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
@@ -19,6 +20,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 3daa676169..958742ae43 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,9 +1,10 @@
-comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk4 needs an OpenGL(ES) EGL backend"
@@ -18,6 +19,7 @@ config BR2_PACKAGE_LIBGTK4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	# Even in the case of X11/OpenGL, libgtk4 needs epoxy built
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index e61ca447c1..3e7137c7a8 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFM_EXTRA
@@ -11,6 +12,7 @@ config BR2_PACKAGE_MENU_CACHE
 
 	  http://wiki.lxde.org/
 
-comment "menu-cache needs a toolchain w/ wchar, threads"
+comment "menu-cache needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index a4522d88f4..7e411b22ac 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libfm
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libfm
@@ -22,11 +23,12 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "pcmanfm needs X.org with an OpenGL backend"
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index bfb8ccea88..20a7fa3db7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -115,6 +115,7 @@ config BR2_PACKAGE_QEMU_SDL
 config BR2_PACKAGE_QEMU_OPENGL
 	bool "Enable OpenGL"
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # libepoxy
 	select BR2_PACKAGE_LIBEPOXY
 	help
 	  Say 'y' to enable OpenGL accelerated display frontend support.
@@ -126,9 +127,13 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+comment "OpenGL support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_VIRGLRENDERER
 	bool "Enable virglrenderer"
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # libepoxy -> virglrenderer
 	select BR2_PACKAGE_QEMU_OPENGL
 	select BR2_PACKAGE_VIRGLRENDERER
 	help
@@ -147,6 +152,9 @@ comment "virglrenderer needs virgl, venus, or a DRM backend for guest accelerati
 	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
 	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 
+comment "virglrenderer needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
index 281d99b22f..70b2944664 100644
--- a/package/virglrenderer/Config.in
+++ b/package/virglrenderer/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VIRGLRENDERER
 	bool "virglrenderer"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # needs gcc >= 4.9 for __sync builtins
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEPOXY
 	help
@@ -107,8 +108,8 @@ config BR2_PACKAGE_VIRGLRENDERER_VAAPI
 
 endif
 
-comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "virglrenderer needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	bool
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 8a231a21af..af6bfae890 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
@@ -22,12 +23,13 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
+comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3a4c3ed792..6e9d1d9188 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -28,7 +28,7 @@ comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL,
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index bd0ab5421e..0e59b8df1a 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -4,7 +4,7 @@ comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic librar
 
 config BR2_PACKAGE_WPEBACKEND_FDO
 	bool "wpebackend-fdo"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c4ee5a27f7..f7c0ad45f4 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -31,7 +31,7 @@ comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index fb23fc1fdf..e5adb73663 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
@@ -10,6 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	help
 	  AMD GPU video driver
 
-comment "xf86-video-amdgpu needs GBM"
+comment "xf86-video-amdgpu needs GBM and a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_LIBGBM
+	depends on !BR2_PACKAGE_HAS_LIBGBM || BR2_STATIC_LIBS
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 2bed8f4765..80fb1550f3 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -30,11 +31,12 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
+comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
