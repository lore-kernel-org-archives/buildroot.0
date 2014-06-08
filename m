From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 14:59:27 +0200
Subject: [Buildroot] [git commit] xbmc: add host-yasm dependency for
	MMX/64bit archs
Message-ID: <20140608130901.B6EC99B261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bfdf2aa50e800f45d19f88044c701b74dc1a2ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
