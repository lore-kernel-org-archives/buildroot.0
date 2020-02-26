From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 26 Feb 2020 10:52:43 -0800
Subject: [Buildroot] [PATCH/next v3 2/3] package/gobject-introspection:
 export cc in g-ir-scanner
In-Reply-To: <20200226185244.31556-1-aduskett@gmail.com>
References: <20200226185244.31556-1-aduskett@gmail.com>
Message-ID: <20200226185244.31556-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Without this export, the host variant of g-ir-scanner will call the host
gcc for linking.

For autotools packages, this is not an issue as they use
Makefile.introspection, which will export the cross-cc, however for meson,
this is not the case, and linking errors occur when meson packages generate
.gir and .typelib files.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Make the CC path relocatable. (Yann)

 package/gobject-introspection/g-ir-scanner.in          | 2 ++
 package/gobject-introspection/gobject-introspection.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 9f97497b7e..d5847ad063 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -1,6 +1,8 @@
 #!/usr/bin/env bash
 
 export GI_SCANNER_DISABLE_CACHE=1
+export CC="$(dirname "${0}")/../../../../bin/@BASENAME_TARGET_CC@"
+
 ${HOST_DIR}/bin/g-ir-scanner \
 --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
 --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index e28748be2e..6472f89c52 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -101,6 +101,8 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 		$(INSTALL) -D -m 755 \
 			$(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
 	)
+	$(SED) "s%@BASENAME_TARGET_CC@%$(notdir $(TARGET_CC))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+
 	# Gobject-introspection installs Makefile.introspection in
 	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
 	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
-- 
2.24.1
