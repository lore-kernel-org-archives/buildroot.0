Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D6AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D747400CD;
	Sun,  9 Jan 2022 16:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFkQ1dkzQd-t; Sun,  9 Jan 2022 16:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29EF040495;
	Sun,  9 Jan 2022 16:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 792F31BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68270402D1
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUAsP5avzIdO for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:47:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28F764024E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:47:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 40F1D82DEC; Sun,  9 Jan 2022 16:41:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 17:47:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b102352b62917b053cae1f5d0591fe6507d81522
X-Git-Newrev: 0378e2e5d9ce9d5676975dfbff501360094fdc1a
X-Patchwork-Hint: ignore
Message-Id: <20220109164105.40F1D82DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0378e2e5d9ce9d5676975dfbff501360094fdc1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglvnd is the GL Vendor-Neutral Dispatch library, used to dispatch
GL calls across multiple GL implementations at runtime.

Full GL support, as usual, requires (parts of) the X11 stack: libX11,
libXext, and xorgproto (for glproto). However, with just libX11, it is
possible to do EGL on X11. EGL and GLES have no dependencies.

Note: x11 and glx are 'features', so need to be 'enabled' or 'disabled'
(or 'auto', but we don't care in Buildroot), while egl and gles1/2 are
'booleans', so need to be 'true' or 'false'.

When an actual provider for GL, EGL, or GLES is enabled, so must the
corresponding flavour be enabled in libglvnd. Conversely, when there is
no actual provider, the corresponding support must be disabled in
libglvnd. So we make each flavour selectable with hidden options, which
actual providers will have to select.

The license for libglvnd itself is a custom license by NVidia. It is
pretty close to MIT, but it's different (although Debian does classify
it as MIT); SPDX has no identifier for that license either. As such, we
choose to just identify it as 'libglvnd license', and let users deal
that with their legal department. Additionally, libglvnd bundles some
code from other projects, so we list them explicitly as well.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
[yann.morin.1998@free.fr:
  - provide help text
  - don't force X11 libraries, split them between X11 and full GL
  - make each flavour selectable
  - fix make check-package issues
  - fix and complete licensing information
  - bump to 1.3.2
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/libglvnd/Config.in     | 44 +++++++++++++++++++++++++++++++++++
 package/libglvnd/libglvnd.hash |  7 ++++++
 package/libglvnd/libglvnd.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..2ad76a80e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1265,6 +1265,9 @@ F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
+N:	Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
+F:	package/libglvnd/
+
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
 F:	package/exfatprogs/
diff --git a/package/Config.in b/package/Config.in
index 85193f7802..edae7e4f62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,6 +331,7 @@ comment "Graphic libraries"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libglvnd/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
new file mode 100644
index 0000000000..acf6247e94
--- /dev/null
+++ b/package/libglvnd/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_LIBGLVND
+	bool "libglvnd"
+	help
+	  The GL Vendor-Neutral Dispatch library
+
+	  libglvnd is a vendor-neutral dispatch layer for arbitrating
+	  OpenGL API calls between multiple vendors. It allows multiple
+	  drivers from different vendors to coexist on the same
+	  filesystem, and determines which vendor to dispatch each API
+	  call to at runtime.
+
+	  Both GLX and EGL are supported, in any combination with OpenGL
+	  and OpenGL ES.
+
+if BR2_PACKAGE_LIBGLVND
+
+# The following symbols should be selected by the libglvnd-aware
+# GL/EGL/GLES providers.
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+	bool
+	depends on BR2_PACKAGE_XORG7 # libx11, libXext, xorgproto
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_XORGPROTO
+	select BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
+	bool
+	select BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
+	bool
+	select BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
+
+endif
diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
new file mode 100644
index 0000000000..15e76ea9e8
--- /dev/null
+++ b/package/libglvnd/libglvnd.hash
@@ -0,0 +1,7 @@
+# Locally computed
+sha256  6332c27f4c792b09a3eb1d7ae18c2d6ff6a0acaf3a746489caf859e659fca2f7  libglvnd-v1.3.2.tar.gz
+
+# Locally computed hashes for license files
+sha256  224534547628a9e5e889d8808385bd38839e6bdb77d89c90ac04dad6891a4f5f  README.md
+sha256  bebdc0fd27cd37af8406e47af23c113866b7856c3f7349ffcbc672029ec8acf7  src/util/uthash/LICENSE
+sha256  f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  src/util/cJSON/LICENSE
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
new file mode 100644
index 0000000000..3df609f6eb
--- /dev/null
+++ b/package/libglvnd/libglvnd.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# libglvnd
+#
+################################################################################
+
+LIBGLVND_VERSION = 1.3.2
+LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+
+LIBGLVND_LICENSE = \
+	libglvnd license, \
+	Apache-2.0 (Khronos headers), \
+	MIT (Xorg; mesa; cJSON), \
+	BSD-1=Clause (uthash)
+
+LIBGLVND_LICENSE_FILES = \
+	README.md \
+	src/util/uthash/LICENSE \
+	src/util/cJSON/LICENSE
+
+LIBGLVND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+LIBGLVND_DEPENDENCIES += xlib_libX11
+LIBGLVND_CONF_OPTS += -Dx11=enabled
+else
+LIBGLVND_CONF_OPTS += -Dx11=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GL),y)
+LIBGLVND_DEPENDENCIES += xlib_libXext xorgproto
+LIBGLVND_CONF_OPTS += -Dglx=enabled
+LIBGLVND_PROVIDES += libgl
+else
+LIBGLVND_CONF_OPTS += -Dglx=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_EGL),y)
+LIBGLVND_CONF_OPTS = -Degl=true
+LIBGLVND_PROVIDES += libegl
+else
+LIBGLVND_CONF_OPTS = -Degl=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GLES),y)
+LIBGLVND_CONF_OPTS = -Dgles1=true -Dgles2=true
+LIBGLVND_PROVIDES += libgles
+else
+LIBGLVND_CONF_OPTS = -Dgles1=false -Dgles2=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
