From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 21:51:17 +0200
Subject: [Buildroot] [git commit] mpg123: bump to 1.20.0,
	providing better optimizations for ARM and AArch64
Message-ID: <20140601200641.161549CE45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cf2c6ea93d3bd855df7c9883d3882034f0568fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Gustavo, this patch bumps mpg123 to 1.20.0, and
therefore superseds the patch initially provided by Sven Neumann. In
1.20.0, there is a new CPU type arm_fpu, which will compile code for
both VFP and NEON, and choose at runtime which one to use.

Similarly for AArch64, the option --with-cpu=aarch64 will compile both
the NEON and generic decoders, and select at runtime which one to use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index d66592c..ac64132 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.18.0
+MPG123_VERSION = 1.20.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --disable-lfs-alias
@@ -14,9 +14,17 @@ MPG123_LICENSE_FILES = COPYING
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
+ifeq ($(BR2_aarch64),y)
+MPG123_CPU = aarch64
+endif
+
 ifeq ($(BR2_arm),y)
+ifeq ($(or $(BR2_ARM_CPU_HAS_NEON),$(BR2_ARM_CPU_HAS_VFPV2)),y)
+MPG123_CPU = arm_fpu
+else
 MPG123_CPU = arm_nofpu
 endif
+endif
 
 ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
