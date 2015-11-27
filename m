From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 Nov 2015 13:54:28 +0000
Subject: [Buildroot] [PATCH] mongrel2: disable polarssl assembly as we do in
	the polarssl package
Message-ID: <1448632468-45374-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mongrel2 bundles polarssl so it has the same problem as the polarssl
with the assembly optimization, so let's use the same solution here.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mongrel2/mongrel2.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 0be4832..d0640c9 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -13,6 +13,21 @@ MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
 MONGREL2_DEPENDENCIES = sqlite zeromq
 
+define MONGREL2_POLARSSL_DISABLE_ASM
+	$(SED) '/^#define POLARSSL_HAVE_ASM/d' $(@D)/src/polarssl/include/polarssl/config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
+else ifeq ($(BR2_microblaze),y)
+MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
+else ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+MONGREL2_POST_CONFIGURE_HOOKS += MONGREL2_POLARSSL_DISABLE_ASM
+endif
+
 define MONGREL2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		PREFIX=/usr all
-- 
2.4.10
