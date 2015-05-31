From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:24:18 +0200
Subject: [Buildroot] [git commit] package/php: Disable jit in bundled pcre
	library
Message-ID: <20150531082433.0FF8B8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80db0345bdbd7f1c83d6e169b0bc3fef2f0c481f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quote from ext/pcre/pcrelib/doc/pcre.txt
"This support is available only for certain hardware architectures. If
 this  option is set for an unsupported architecture, a compile time
 error occurs."

Disable jit support on unsupported archs by updating ext/pcre/pcrelib/config.h

Fixes
http://autobuild.buildroot.net/results/966/966d6c47d1ed13a90c2846d96fb3d193df4b2aaa/ (bfin)
http://autobuild.buildroot.net/results/3f5/3f53751b192078714860e64d3f6d8d7398433d5a/ (xtensa)
http://autobuild.buildroot.net/results/de1/de12474d2b5cce251b1ab10f7d7e28c90545a1f0/ (arcle)
http://autobuild.buildroot.net/results/358/358b54245bb48f653ce209be070bd5fe6b17afc4/ (microblazeel)
http://autobuild.buildroot.net/results/a7c/a7c161ca0b424ae35634c9f2d8a8111cedec8181/ (nios2)
http://autobuild.buildroot.net/results/dad/dad1128f58fc601bf96da5fa0635b9b9c6c8f0b8/ (sh)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 448b7ef..89d22aa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -209,6 +209,10 @@ PHP_DEPENDENCIES += unixodbc
 endif
 endif
 
+define PHP_DISABLE_PCRE_JIT
+	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
+endef
+
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
@@ -220,6 +224,10 @@ else
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 PHP_CFLAGS += -DSLJIT_SINGLE_THREADED=1
 endif
+# check ext/pcre/pcrelib/sljit/sljitConfigInternal.h for supported archs
+ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),)
+PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_PCRE_JIT
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
