From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 14:42:21 +0200
Subject: [Buildroot] [PATCHv2] mpg123: use code optimized for ARM NEON SIMD
	engine if available
Message-ID: <1401626541-11036-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <neumann@teufel.de>

[Thomas: as suggested by Peter, enable NEON as soon as NEON is
available, not necessarily when NEON is used as the default FPU. Note
that this requires passing -mfpu=neon to build mpg123, so that for
this specific package, the NEON unit is used as the FPU.]

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpg123/mpg123.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index d66592c..98fdc3e 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -13,10 +13,16 @@ MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
+MPG123_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_arm),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+MPG123_CPU = neon
+MPG123_CFLAGS += -mfpu=neon
+else
 MPG123_CPU = arm_nofpu
 endif
+endif
 
 ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
@@ -34,6 +40,7 @@ MPG123_CPU = x86-64
 endif
 
 MPG123_CONF_OPT += --with-cpu=$(MPG123_CPU)
+MPG123_CONF_ENV += CFLAGS="$(MPG123_CFLAGS)"
 
 MPG123_AUDIO = dummy oss
 
-- 
1.9.3
