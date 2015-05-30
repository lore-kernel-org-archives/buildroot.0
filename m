From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 May 2015 22:31:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Disable jit in bundled pcre
	library
Message-ID: <1433017886-26362-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/php/php.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 30ab4f3..9be07d5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -228,6 +228,10 @@ PHP_DEPENDENCIES += unixodbc
 endif
 endif
 
+define PHP_DISABLE_PCRE_JIT
+	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
+endef
+
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
@@ -239,6 +243,9 @@ else
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 PHP_CFLAGS += -DSLJIT_SINGLE_THREADED=1
 endif
+ifeq ($(BR2_arcle)$(BR2_bfin)$(BR2_microblazeel)$(BR2_nios2)$(BR2_sh)$(BR2_xtensa),y)
+PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_PCRE_JIT
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
-- 
1.7.10.4
