From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:17:24 +0100
Subject: [Buildroot] [git commit] package/gcnano-binaries: install .pc files
Message-ID: <20191202083935.378F1817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee546d87bbea0059e1d33d1204090c33d9ac4e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt needs the package config files for building.

Signed-off-by: Jens Kleintje <scooby22@web.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 4bfb5ad952..2913e664dc 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -48,6 +48,8 @@ GCNANO_BINARIES_LIBRARIES = \
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
 
+GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
+
 define GCNANO_BINARIES_INSTALL
 	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
 		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
@@ -55,6 +57,10 @@ define GCNANO_BINARIES_INSTALL
 		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
 	)
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
+	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
+		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
+			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
+	)
 endef
 
 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
