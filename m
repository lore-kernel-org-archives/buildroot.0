From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Dec 2009 22:17:12 +0100
Subject: [Buildroot] [git commit master] mpg123: select sensible cpu
	optimization depending on arch/fpu
Message-ID: <20091217211833.77FCC7763F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f81d072f15e986b8d9e95039a66688333d259353
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 25d5dd2..ea35220 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -7,7 +7,19 @@ MPG123_VERSION = 0.66
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 
-MPG123_CONF_OPT = --program-prefix='' --with-cpu=generic_nofpu
+MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic)
+
+ifeq ($(BR2_i386),y)
+MPG123_CPU = x86
+endif
+
+ifeq ($(BR2_powerpc),y)
+ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)
+MPG123_CPU = altivec
+endif
+endif
+
+MPG123_CONF_OPT = --program-prefix='' --with-cpu=$(MPG123_CPU)
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
-- 
1.6.3.3
