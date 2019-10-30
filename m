From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:42:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] packages/sox:
 unconditionaly disable custom SSP detection
Message-ID: <20191030123712.DD7F58E0B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab6b418b42acc877718b0b77497e0ae7089f5cdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

sox implements a custom mechanism to detect whether the toolchain has
SSP suport or not. In doing so, it explicitly tries to see if libssp.so
is present, in which case it unconditionally links with it, even though
the compiler, if left by itself, would have used the SSP support
provided by the C library.

However, with Buildroot, the SSP options are handled in our gcc
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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4653d273b82e130c8d72622448bf720e6e6c4eb1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
