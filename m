From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:27 +0200
Subject: [Buildroot] [PATCH 04/30] xbmc: add host-yasm dependency for
	MMX/64bit archs
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <5810451463cd76bb800631a689cdcdfba282ec22.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes error during xbmc configure:

yasm not found, use --disable-yasm for a crippled build

If you think configure made a mistake, make sure you are using the latest
version from Git.  If the latest version fails, report the problem to the
ffmpeg-user at ffmpeg.org mailing list or IRC #ffmpeg on irc.freenode.net.
Include the log file "config.log" produced by configure as this will help
solving the problem.
configure: error: Submodule lib/ffmpeg failed to configure

This will be needed for 13.0 Gotham.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc/xbmc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 3522802..ffe573f 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -21,6 +21,13 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 # xbmc at i386 depends on nasm
 XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
 
+# ffmpeg depends on yasm on MMX archs
+# xbmc configure passes $(BR2_ARCH) to ffmpeg configure which adds
+# yasm as dependency for x86_64, even if BR2_x86_generic=y
+ifneq ($(BR2_X86_CPU_HAS_MMX)$(BR2_x86_64),)
+XBMC_DEPENDENCIES += host-yasm
+endif
+
 XBMC_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
-- 
1.8.3.2
