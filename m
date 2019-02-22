From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 22 Feb 2019 14:12:18 +0100
Subject: [Buildroot] [PATCH] package/gqrx: link with libatomic when needed
Message-ID: <1550841138-57083-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.net/results/a003ad5324a0c0f55cb8db5d3e5d69bd21999e16/
 - http://autobuild.buildroot.net/results/464602175d026d135125e5baa00e0729aec7a931/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/gqrx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index b51bb23eaf..4dbef47222 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -12,4 +12,8 @@ GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
 
 GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GQRX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
