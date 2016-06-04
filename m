From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2016 14:31:44 +0200
Subject: [Buildroot] [git commit] package/nodejs: Add NODEJS_CONF_OPTS
Message-ID: <20160604123235.0836481916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af37338488ddf036a60c4694feac4f62bb3fca34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most packages in buildroot pass a FOO_CONF_OPTS variable into the
configure script.  Transition nodejs to follow this convention.

Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0329299..d2c5be4 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -13,6 +13,13 @@ HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 
+NODEJS_CONF_OPTS = \
+	--without-snapshot \
+	--shared-zlib \
+	--without-dtrace \
+	--without-etw \
+	--dest-os=linux
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
 endif
@@ -97,18 +104,14 @@ define NODEJS_CONFIGURE_CMDS
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
-		--without-snapshot \
-		--shared-zlib \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
 		$(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
-		--without-dtrace \
-		--without-etw \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
 		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
-		--dest-os=linux \
+		$(NODEJS_CONF_OPTS) \
 	)
 endef
 
