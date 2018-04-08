From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 21:31:44 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] php: fix how PCRE JIT is
 disabled
Message-ID: <20180408194523.B545B80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50f01475aaa9115cbe91d0bbdd5e81be0be5e22e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When the internal PCRE library of PHP is used, it tries to use a JIT
engine, which is only available on some architectures.

However, the mechanism used to disable JIT has changed in recent PHP
versions, and it now has a proper --without-pcre-jit option. Switch
over to that to properly disable JIT on unsupported platforms.

It has been tested to fix the build of PHP on ARC and Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/e1359fcad7bc57e3c5a7ecc37abaa2cf6a6a9ffa/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9850612ea5e9fc9c377d11ec9c2930bfd812754a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index bfd25de875..91756794ee 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -228,10 +228,6 @@ ifneq ($(BR2_PACKAGE_PHP_EXT_MYSQLI)$(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),)
 PHP_CONF_OPTS += --with-mysql-sock=$(MYSQL_SOCKET)
 endif
 
-define PHP_DISABLE_PCRE_JIT
-	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
-endef
-
 define PHP_DISABLE_VALGRIND
 	$(SED) '/^#define HAVE_VALGRIND/d' $(@D)/main/php_config.h
 endef
@@ -249,8 +245,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 PHP_CFLAGS += -DSLJIT_SINGLE_THREADED=1
 endif
 # check ext/pcre/pcrelib/sljit/sljitConfigInternal.h for supported archs
-ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),)
-PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_PCRE_JIT
+ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
+PHP_CONF_OPTS += --with-pcre-jit
+else
+PHP_CONF_OPTS += --without-pcre-jit
 endif
 endif
 
