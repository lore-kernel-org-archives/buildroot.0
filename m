From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 15:11:24 +0200
Subject: [Buildroot] [PATCH] mpg123: bump to 1.20.0,
	providing better optimizations for ARM and AArch64
Message-ID: <1401628284-23998-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Gustavo, this patch bumps mpg123 to 1.20.0, and
therefore superseds the patch initially provided by Sven Neumann. In
1.20.0, there is a new CPU type arm_fpu, which will compile code for
both VFP and NEON, and choose at runtime which one to use.

Similarly for AArch64, the option --with-cpu=aarch64 will compile both
the NEON and generic decoders, and select at runtime which one to use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpg123/mpg123.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

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
-- 
1.9.3
