Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57394CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 15:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD2C60B1E;
	Sat, 18 Oct 2025 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pd3tK7u9meT6; Sat, 18 Oct 2025 15:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AE860BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AE860BD5;
	Sat, 18 Oct 2025 15:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E35D8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D871860B17
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7rJG2eAqiNN for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B3B608F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B3B608F6
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7CF887490; Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 17:56:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d188bd4231816993de51b38894701788459b593
X-Git-Newrev: 106b3d43a44fb126d4bd7ff6828110e85e3eca22
X-Patchwork-Hint: ignore
Message-Id: <20251018155752.C7CF887490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waffle: bump to
 v1.8.0-95-g5f1f48287e
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=106b3d43a44fb126d4bd7ff6828110e85e3eca22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Waffle has two build systems.  In commit f162f8126ec4 ("cmake:
deprecate cmake in favour of meson") [1], cmake is not the preferred
build system, and fails when used.  Bump to latest version available
(which has been released a year ago) and switch to meson build system.

This commit also removes the package patches. They make no longer
sense since they are either merged or related to deprecated cmake
build. The .checkpackageignore patch entries are also removed.

This commit also forces the meson build.pkg_config_path value. The
default path goes for $(HOST)/lib/pkgconfig.  This does not work for
latest waffle version since prefix in the pkg-config file points to the
host directory.  This results in the concatenation of $(STAGING_DIR)/xxx
and $(HOST_DIR)/... which ultimately resolve in a file not found.
Instead, override the default path to $(STAGING_DIR)/usr/share.

[1] https://gitlab.freedesktop.org/mesa/waffle/-/commit/f162f8126ec479f794bf337cd1dbb0d898ae5640

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
[Julien:
 - squash patches related to the bump altogether
 - change _VERSION to use "git describe --abbrev=40" format
 - remove .checkpackageignore entries to fix check-package errors
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 --
 ...rd-cflags-from-.pc-files-to-waffle-cflags.patch | 42 ---------------
 ...02-wayland-fix-build-against-version-1-20.patch | 59 ----------------------
 package/waffle/0003-drop-C-dependency.patch        | 46 -----------------
 package/waffle/waffle.hash                         |  4 +-
 package/waffle/waffle.mk                           | 40 ++++++++-------
 6 files changed, 22 insertions(+), 172 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 847e1f1156..e8c97c2d63 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1117,9 +1117,6 @@ package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch lib
 package/vtun/0001-fix-installation.patch lib_patch.Upstream
 package/vtun/0002-fix-ssl-headers-checks.patch lib_patch.Upstream
 package/vtun/0003-openssl11.patch lib_patch.Upstream
-package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch lib_patch.Upstream
-package/waffle/0002-wayland-fix-build-against-version-1-20.patch lib_patch.Upstream
-package/waffle/0003-drop-C-dependency.patch lib_patch.Upstream
 package/wampcc/0001-Add-RISC-V-endian-detection.patch lib_patch.Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch lib_patch.Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch lib_patch.Upstream
diff --git a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
deleted file mode 100644
index b2a1294f24..0000000000
--- a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8b0ae49c8bea78df73c3ecae0059d54a95c561fa Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 24 Dec 2017 00:11:45 +0100
-Subject: [PATCH] cmake: forward cflags from *.pc files to waffle cflags
-
-When building mesa egl without x11 and gles2 the headers need a
-EGL_NO_X11 define to avoid including X11 headers.
-
-This define EGL_NO_X11 is lost while building waffle
-since CFLAGS defined by pc files are not used.
-
-EGL_NO_X11 is defined in CFLAGS from egl.pc.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/111]
----
- src/waffle/CMakeLists.txt | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
-index d76e029..2ff72c8 100644
---- a/src/waffle/CMakeLists.txt
-+++ b/src/waffle/CMakeLists.txt
-@@ -5,6 +5,14 @@
- add_definitions(
-     -DWAFFLE_API_VERSION=${waffle_api_version}
-     -DWAFFLE_API_EXPERIMENTAL
-+    ${egl_CFLAGS}
-+    ${gbm_CFLAGS}
-+    ${gl_CFLAGS}
-+    ${GLEXT_CFLAGS}
-+    ${libudev_CFLAGS}
-+    ${wayland-client_CFLAGS}
-+    ${wayland-egl_CFLAGS}
-+    ${x11-xcb_CFLAGS}
-     )
- 
- include_directories(
--- 
-2.14.3
-
diff --git a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
deleted file mode 100644
index d3b66180ec..0000000000
--- a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2c33597245bb74f19104f0a858cd40e80b26991d Mon Sep 17 00:00:00 2001
-From: Philipp Zabel <p.zabel@pengutronix.de>
-Date: Fri, 17 Dec 2021 13:46:40 +0100
-Subject: [PATCH] wayland: fix build against version 1.20
-
-Wayland 1.20 introduces two new symbols wl_proxy_marshal_flags and
-wl_proxy_marshal_array_flags, which need to be wrapped as well.
-
-Closes: https://gitlab.freedesktop.org/mesa/waffle/-/issues/76
-Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
-[Retrieved from:
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/waffle/wayland/wayland_sym.h     | 18 ++++++++++++++++++
- src/waffle/wayland/wayland_wrapper.h |  2 ++
- 2 files changed, 20 insertions(+)
-
-diff --git a/src/waffle/wayland/wayland_sym.h b/src/waffle/wayland/wayland_sym.h
-index 3d48625..4c6ac8d 100644
---- a/src/waffle/wayland/wayland_sym.h
-+++ b/src/waffle/wayland/wayland_sym.h
-@@ -26,3 +26,21 @@ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor,
- WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned,
-                    (struct wl_proxy *proxy, uint32_t opcode,
-                     const struct wl_interface *interface, uint32_t version, ...))
-+
-+WAFFLE_WAYLAND_SYM(struct wl_proxy *,
-+                   wl_proxy_marshal_flags,
-+                   (struct wl_proxy * p,
-+                    uint32_t opcode,
-+                    const struct wl_interface *interface,
-+                    uint32_t version,
-+                    uint32_t flags,
-+                    ...))
-+
-+WAFFLE_WAYLAND_SYM(struct wl_proxy *,
-+                   wl_proxy_marshal_array_flags,
-+                   (struct wl_proxy * p,
-+                    uint32_t opcode,
-+                    const struct wl_interface *interface,
-+                    uint32_t version,
-+                    uint32_t flags,
-+                    union wl_argument *args))
-diff --git a/src/waffle/wayland/wayland_wrapper.h b/src/waffle/wayland/wayland_wrapper.h
-index 4af2f64..6addf4f 100644
---- a/src/waffle/wayland/wayland_wrapper.h
-+++ b/src/waffle/wayland/wayland_wrapper.h
-@@ -65,5 +65,7 @@ struct wl_display;
- #define wl_proxy_marshal (*wfl_wl_proxy_marshal)
- #define wl_proxy_marshal_constructor (*wfl_wl_proxy_marshal_constructor)
- #define wl_proxy_marshal_constructor_versioned (*wfl_wl_proxy_marshal_constructor_versioned)
-+#define wl_proxy_marshal_flags (*wfl_wl_proxy_marshal_flags)
-+#define wl_proxy_marshal_array_flags (*wfl_wl_proxy_marshal_array_flags)
- 
- #include <wayland-client-protocol.h>
--- 
-GitLab
-
diff --git a/package/waffle/0003-drop-C-dependency.patch b/package/waffle/0003-drop-C-dependency.patch
deleted file mode 100644
index 89c0cd09f2..0000000000
--- a/package/waffle/0003-drop-C-dependency.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a54a5d086c5f7e0751f68ac1a2942d8077922ebc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Aug 2022 16:18:22 +0200
-Subject: [PATCH] drop C++ dependency
-
-C++ dependency has been added for nacl backend which has been added by
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61
-and dropped by
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/a7c7152b054e6d2b9af36ed9db9a0df44731b279
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- CMakeLists.txt            | 2 +-
- src/waffle/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index acece86..04ea68c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,7 +23,7 @@
- # OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--project(waffle1 C CXX)
-+project(waffle1 C)
- 
- cmake_minimum_required(VERSION 2.8.12)
- 
-diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
-index 8014b51..276f276 100644
---- a/src/waffle/CMakeLists.txt
-+++ b/src/waffle/CMakeLists.txt
-@@ -238,7 +238,7 @@ include_directories(
-     ${XCB_INCLUDE_DIRS}
-     )
- 
--add_library(${waffle_libname} SHARED ${waffle_sources} ${waffle_cxx_sources})
-+add_library(${waffle_libname} SHARED ${waffle_sources})
- 
- # Debian's packaging system emits warnings if wflinfo directly links to any
- # library that it doesn't directly use. Silence the warnings by annotating
--- 
-2.35.1
-
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index 8968dd6fd3..bb12efefca 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,5 +1,3 @@
-# From https://gitlab.freedesktop.org/mesa/waffle/uploads/42030b1cc0f81fd738152104e1811919/waffle-1.7.0.sha256sums
-sha256  69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3  waffle-1.7.0.tar.xz
-
 # Locally calculated
+sha256  1058cca5ccd6c0c22c9c0cbe65f91a5dda5f77d08dac4ac8a38400bdd72be491  waffle-v1.8.0-95-g5f1f48287e806544d745e9a8f5aed47234c61292-git4.tar.gz
 sha256  630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 87d44c4217..24c7efe64d 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,47 +4,49 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = 1.7.0
-WAFFLE_SOURCE = waffle-$(WAFFLE_VERSION).tar.xz
-WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/uploads/9eaadda4ec2ed1d8a26ddefd2cfd16be
+WAFFLE_VERSION = v1.8.0-95-g5f1f48287e806544d745e9a8f5aed47234c61292
+WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle.git
+WAFFLE_SITE_METHOD = git
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
 
 WAFFLE_DEPENDENCIES = host-pkgconf
 
-WAFFLE_CONF_OPTS = -Dwaffle_build_tests=OFF \
-	-Dwaffle_build_examples=OFF \
-	-Dwaffle_build_manpages=OFF \
-	-Dwaffle_build_htmldocs=OFF \
-	-Dwaffle_has_nacl=OFF
+WAFFLE_CONF_OPTS = \
+	-Dbuild.pkg_config_path=$(STAGING_DIR)/usr/lib/pkgconfig \
+	-Dbuild-tests=false \
+	-Dbuild-examples=false \
+	-Dbuild-manpages=false \
+	-Dbuild-htmldocs=false \
+	-Dnacl=false
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND),y)
 WAFFLE_DEPENDENCIES += libegl wayland
-WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=ON
+WAFFLE_CONF_OPTS += -Dwayland=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=OFF
+WAFFLE_CONF_OPTS += -Dwayland=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL),y)
 WAFFLE_DEPENDENCIES += libegl libxcb xlib_libX11
-WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=ON
+WAFFLE_CONF_OPTS += -Dx11_egl=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=OFF
+WAFFLE_CONF_OPTS += -Dx11_egl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_GLX),y)
 WAFFLE_DEPENDENCIES += libgl libxcb xlib_libX11
-WAFFLE_CONF_OPTS += -Dwaffle_has_glx=ON
+WAFFLE_CONF_OPTS += -Dglx=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_glx=OFF
+WAFFLE_CONF_OPTS += -Dglx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_GBM),y)
 WAFFLE_DEPENDENCIES += libegl udev
-WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=ON
+WAFFLE_CONF_OPTS += -Dgbm=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=OFF
+WAFFLE_CONF_OPTS += -Dgbm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
@@ -53,9 +55,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 WAFFLE_DEPENDENCIES += mesa3d
-WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=ON
+WAFFLE_CONF_OPTS += -Dsurfaceless_egl=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=OFF
+WAFFLE_CONF_OPTS += -Dsurfaceless_egl=disabled
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
