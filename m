From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Oct 2019 15:42:42 +0200
Subject: [Buildroot] [PATCH 2/2 v2] packages/sox: unconditionaly disable
 custom SSP detection
In-Reply-To: <cover.1572010936.git.yann.morin.1998@free.fr>
References: <cover.1572010936.git.yann.morin.1998@free.fr>
Message-ID: <0311678e7e917354544483e815ce7112d9fe830c.1572010936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann Droneaud <ydroneaud@opteya.com>

sox implements a custom mechanism to detect whether the toolchain has
SSP suport or not. In doing so, it explicitly tries to see if libssp.so
is present, in which case it unconditionally links with it, even though
the compiler, if left by itself, would have used the SSP support
provided by the C library.

However, with Buildroot, the SSP options arfe handled in our gcc
wrapper, so packages should just not bother with that.

It turns out that, when sox is configured with --disable-stack-protector,
it does not disable it, but really does nothing, which is good for us.

Currently, SSP is conditionally disabled in sox, under various
conditions: that the toolchain does not have SSP, or that it is one of
the know SSP-challenged (i.e. broken) toolchains. Those conditions dates
back tpo before our wrapper started handling that.

Remove all those conditions, unconditionally disable SSP in sox, and let
our gcc wrapper handle the SSP options.

Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - reword commit log  (Yann)
  - remove all conditions  (Yann)
---
 package/sox/sox.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 0b3dc136d8..013ccbbcf4 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -8,16 +8,14 @@ SOX_VERSION = 14.4.2
 SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
 SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
-SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
-	$(if $(BR2_TOOLCHAIN_HAS_SSP),,--disable-stack-protector)
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
-# MIPS Codescape toolchains don't support stack-smashing protection
-# despite of using glibc.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-SOX_CONF_OPTS += --disable-stack-protector
-endif
+SOX_CONF_OPTS = \
+	--with-distro="Buildroot" \
+	--without-ffmpeg \
+	--disable-gomp \
+	--disable-stack-protector
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
-- 
2.20.1
