From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 Sep 2018 21:17:36 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build on arm without neon
Message-ID: <20180907191736.19192-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.py only supports --disable-neon

Fixes:
 - http://autobuild.buildroot.org/results/26eec7e20795068613616a7312681853232ec764

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 39a2c4c72b..e352fab6c9 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -74,6 +74,10 @@ ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 BOTAN_CONF_OPTS += --disable-altivec
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+BOTAN_CONF_OPTS += --disable-neon
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
-- 
2.17.1
