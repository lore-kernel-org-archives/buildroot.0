From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 22:14:53 +0100
Subject: [Buildroot] [git commit] mplayer: fix build on i386
Message-ID: <20111114212022.E56488F4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd38100e1189d19cad87a64c52df2c773eb47e40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mplayer needs to be built with -fomit-frame-pointer on x86, otherwise
gcc errors out on the inline asm with too few registers.

Also disable yasm support, both because this mplayer revision forgets
to build the gpl'ed asm snippets (fixed in r32736), breaking the build
- And also to ensure the build is reproducable and doesn't use host
components behind the users' back (E.G. if yasm is available on host).

Once we have added yasm as a package, this can get removed again (and
mplayer svn rev bumped) for the performance boost it gives.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 776cc68..2ac5e16 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -108,6 +108,12 @@ ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
 MPLAYER_CONF_OPTS += --enable-neon
 endif
 
+ifeq ($(BR2_i386),y)
+# inline asm breaks with "can't find a register in class 'GENERAL_REGS'"
+# inless we free up ebp
+MPLAYER_CFLAGS += -fomit-frame-pointer
+endif
+
 define MPLAYER_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -122,6 +128,7 @@ define MPLAYER_CONFIGURE_CMDS
 		--charset=UTF-8 \
 		--extra-cflags="$(MPLAYER_CFLAGS)" \
 		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
+		--yasm='' \
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
