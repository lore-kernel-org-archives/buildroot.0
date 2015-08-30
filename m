From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 23:46:27 +0200
Subject: [Buildroot] [git commit] package/x264: Fix aarch64 support,
	bump version
Message-ID: <20150830214721.69D1681776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5435c304f03897b2dba72be573cc4c329cc2b044
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current x264 revision fails to include asm code from common/aarch64
which is needed by packages linking to x264, like ffmpeg:

Quoting http://autobuild.buildroot.net/results/189/189f215bcbc510cd292c0f337fe6b39979f01813//ffmpeg-2.7.2/config.log

/home/test/autobuild/instance-3/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libx264.so:
 undefined reference to `x264_deblock_h_chroma_422_intra_neon'

Function "chroma_422_intra_neon" is defined in
x264/common/aarch64/deblock-a.S. The code in
x264/common/aarch64/* is only compiled if an
assembler was found:
http://git.videolan.org/?p=x264.git;a=blob;f=Makefile;h=6193c5936939fda36f9a2e00c734223318ccda14;hb=HEAD#l134

To allow this add BR2_aarch64 as an assembler-enabled arch.

This however breaks compilation due to broken NEON detection:
"no NEON support, try adding -mfpu=neon to CFLAGS
If you really want to run on such a CPU, configure with --disable-asm."

The bug was fixed upstream Jul, 25th, 2015:
http://git.videolan.org/?p=x264.git;a=commit;h=73ae2d11d472d0eb3b7c218dc1659db32f649b14

When we already have to do a version bump let's take the latest one ;)

Fixes
http://autobuild.buildroot.net/results/90a/90ae4b2fa8a6cff0f18abea2b1c45282afe99e4b/
http://autobuild.buildroot.net/results/109/109686cbc8327e62f757db576cfff49c490b52ae/
http://autobuild.buildroot.net/results/189/189f215bcbc510cd292c0f337fe6b39979f01813/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index ace7f43..d24cf20 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = c8a773ebfca148ef04f5a60d42cbd7336af0baf6
+X264_VERSION = e86f3a1993234e8f26050c243aa253651200fa6b
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
@@ -14,7 +14,7 @@ X264_CONF_OPTS = --disable-avs
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X264_DEPENDENCIES += host-yasm
-else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
 X264_CONF_ENV += AS="$(TARGET_CC)"
