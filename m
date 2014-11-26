From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 14:41:58 +0100
Subject: [Buildroot] [git commit] lame: also disable debug handling on
	arm(eb)
Message-ID: <20141126134700.598727FF16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6455547a43bd181802c5cfb508b3f0f37bad520b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not all arm (E.G. non-VFP) toolchains define the control word macros, so
disable debug handling for arm(eb) as well.

As the debug handling has limited value (it simply forces CFLAGS which we
don't want and enables exceptions on FP errors) don't try to be clever about
what toolchain variants to disable it for, but just disable it for all arm(eb).

Fixes http://autobuild.buildroot.net/results/672/672a31c0bd329dec566ba74e0e1be43abd0f16c2/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lame/lame.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index c179cef..e9d5d73 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -19,7 +19,7 @@ LAME_LICENSE_FILES = COPYING
 # So, if BR2_ENABLE_DEBUG is selected, then we have force lame to be
 # built without debug symbols for Aarch64 and MIPS because these
 # architectures don't have those macros defined.
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),yy)
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),yy)
 LAME_CONF_OPTS += --disable-debug
 endif
 
