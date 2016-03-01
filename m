From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 11:30:34 +0100
Subject: [Buildroot] [git commit] sox: disable SSP when using MIPS Codescape
	toolchains
Message-ID: <20160301104143.24CCA7FCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1834024ba00caa91b5e6c32e15b142bfdfb19d15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS Codescape toolchains don't support stack-smashing protection
despite of using glibc, therefore we see failures like this one:

mips-img-linux-gnu/bin/ld: cannot find -lssp

Fixes:
  http://autobuild.buildroot.net/results/957/95721f7b88c46a20202fb02e408817097df965c3/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index f4d1608..61f5220 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -13,6 +13,12 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
 SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
+# MIPS Codescape toolchains don't support stack-smashing protection
+# despite of using glibc.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
+SOX_CONF_OPTS += --disable-stack-protector
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
 else
