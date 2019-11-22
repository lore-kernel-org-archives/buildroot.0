From: Jens Kleintje <scooby22@web.de>
Date: Fri, 22 Nov 2019 16:00:32 +0100
Subject: [Buildroot] [PATCH] package/gcnano-binaries: Add package config
 files
Message-ID: <20191122150032.7239-1-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt needs the package config files for building.

Signed-off-by: Jens Kleintje <scooby22@web.de>
---
 package/gcnano-binaries/gcnano-binaries.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 4bfb5ad952..b27571a08c 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -48,13 +48,20 @@ GCNANO_BINARIES_LIBRARIES = \

 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)

+GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
+
 define GCNANO_BINARIES_INSTALL
 	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
 		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
 			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
 		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
 	)
+	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
+	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
+		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
+			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
+	)
 endef

 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
--
2.17.1
