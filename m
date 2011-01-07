From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:13:02 -0300
Subject: [Buildroot] [PATCH 13/13] mpg123: bump to version 1.13.1
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpg123/mpg123.mk |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index ea35220..ddd891f 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -3,11 +3,16 @@
 # mpg123
 #
 #############################################################
-MPG123_VERSION = 0.66
+
+MPG123_VERSION = 1.13.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
+MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
+MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
-MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic)
+ifeq ($(BR2_arm),y)
+MPG123_CPU = arm_nofpu
+endif
 
 ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
@@ -17,9 +22,16 @@ ifeq ($(BR2_powerpc),y)
 ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)
 MPG123_CPU = altivec
 endif
+ifeq ($(BR2_SOFT_FLOAT),y)
+MPG123_CPU = ppc_nofpu
+endif
+endif
+
+ifeq ($(BR2_x86_64),y)
+MPG123_CPU = x86-64
 endif
 
-MPG123_CONF_OPT = --program-prefix='' --with-cpu=$(MPG123_CPU)
+MPG123_CONF_OPT += --program-prefix='' --with-cpu=$(MPG123_CPU)
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
-- 
1.7.2.2
