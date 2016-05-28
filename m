From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 10:56:05 +0200
Subject: [Buildroot] [git commit] package/mplayer: add x86-specific
	configure options
Message-ID: <20160528085610.961DA81807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03fef14fb892a5fdec1863667a7ec2f448228ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mplayer configure script tries to detect the capabilities of the CPU
used by probing the host CPU. This leads to compilation failures if the
target CPU has lesser features, like missing mmx support for
BR2_x86_i686=y:

Checking for CPU vendor ... GenuineIntel (6:58:9)
Checking for CPU type ...  Intel(R) Core(TM) i7-3770S CPU @ 3.10GHz
Checking for kernel support of sse ... yes
Checking for kernel support of sse2 ... yes
Checking for kernel support of sse3 ... yes
Checking for kernel support of ssse3 ... yes
Checking for kernel support of sse4_1 ... yes
Checking for kernel support of sse4_2 ... yes
Checking for kernel support of avx ... yes

For this patch I copied most of ffmpeg configure options for x86 CPUs
because mplayer contains its own copy of ffmpeg.

Fixes
http://autobuild.buildroot.net/results/c5a/c5a722607ec9797c317b63b0fd3235608a340c98/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk | 56 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index cbbd1e7..41a52b0 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -268,10 +268,62 @@ MPLAYER_CFLAGS += -fomit-frame-pointer
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-MPLAYER_CONF_OPTS += --yasm=$(HOST_DIR)/usr/bin/yasm
+MPLAYER_CONF_OPTS += \
+	--enable-mmx \
+	--yasm=$(HOST_DIR)/usr/bin/yasm
 MPLAYER_DEPENDENCIES += host-yasm
 else
-MPLAYER_CONF_OPTS += --yasm=''
+MPLAYER_CONF_OPTS += \
+	--disable-mmx \
+	--yasm=''
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+MPLAYER_CONF_OPTS += --enable-sse
+else
+MPLAYER_CONF_OPTS += --disable-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+MPLAYER_CONF_OPTS += --enable-sse2
+else
+MPLAYER_CONF_OPTS += --disable-sse2
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
+MPLAYER_CONF_OPTS += --enable-sse3
+else
+MPLAYER_CONF_OPTS += --disable-sse3
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+MPLAYER_CONF_OPTS += --enable-ssse3
+else
+MPLAYER_CONF_OPTS += --disable-ssse3
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
+MPLAYER_CONF_OPTS += --enable-sse4
+else
+MPLAYER_CONF_OPTS += --disable-sse4
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
+MPLAYER_CONF_OPTS += --enable-sse42
+else
+MPLAYER_CONF_OPTS += --disable-sse42
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_AVX),y)
+MPLAYER_CONF_OPTS += --enable-avx
+else
+MPLAYER_CONF_OPTS += --disable-avx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
+MPLAYER_CONF_OPTS += --enable-avx2
+else
+MPLAYER_CONF_OPTS += --disable-avx2
 endif
 
 define MPLAYER_CONFIGURE_CMDS
