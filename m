From: Sven Neumann <neumann@teufel.de>
Date: Fri, 22 Nov 2013 23:00:53 +0100
Subject: [Buildroot] [PATCH 2/2] mpg123: use code optimized for ARM NEON
 SIMD engine if available
Message-ID: <1385157653.14731.35.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/mpg123/mpg123.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 3db2843..0d5b1bc 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -15,8 +15,12 @@ MPG123_LICENSE_FILES = COPYING
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
 ifeq ($(BR2_arm),y)
+ifeq ($(BR2_ARM_FPU_NEON),y)
+MPG123_CPU = neon
+else
 MPG123_CPU = arm_nofpu
 endif
+endif
 
 ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
-- 
1.8.4.2
