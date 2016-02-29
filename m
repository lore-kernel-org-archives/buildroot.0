From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Feb 2016 16:39:42 +0000
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
Message-ID: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS Codescape toolchains don't support stack-smashing protection
despite of using glibc, therefore we see failures like this one:

mips-img-linux-gnu/bin/ld: cannot find -lssp

Fixes:
  http://autobuild.buildroot.net/results/957/95721f7b88c46a20202fb02e408817097df965c3/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.4.10
