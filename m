From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Mar 2020 20:13:58 -0700
Subject: [Buildroot] [PATCH v5 3/3] package/gobject-introspection: export
 variables in g-ir-scanner
In-Reply-To: <20200315031359.365637-1-aduskett@gmail.com>
References: <20200315031359.365637-1-aduskett@gmail.com>
Message-ID: <20200315031359.365637-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When building .gir .typelib files, the g-ir-scanner wrapper calls the host
g-ir-scanner. g-ir-scanner calls ccompiler.py, which searches for the following
environment variables:
CC, CXX, CPP, LDFLAGS, CFLAGS, CPPFLAGS

These environment variables are empty by default, and as such ccompiler.py
defaults to either using the system tools (CC, CXX, and CPP) or leaving
the variables blank (LDFLAGS, CFLAGS, and CPPFLAGS.)

For autotools packages, this issue does not occur because autotools uses
Makefile.introspection found on the staging directory in
usr/share/gobject-introspection-1.0/ which automatically exports the above
variables.

However, for meson, the above variables are not exported when meson calls
g-ir-scanner to build .gir and .typelib files, which results in linking errors.

Exporting these variables in the g-ir-scanner wrapper fixes these issues and
ensures all build systems can generate .gir and .typelib files properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Use relative paths. (Yann)

Changes v4 -> v5:
  - Switch back to using HOST_DIR. (Yann)
  - Update commit message as to why this patch is necessary.
  - Add CXX, CPP, LDFLAGS, CFLAGS and CPPFLAGS to the list of variables of
    which are exported.
  - Add a comment in g-ir-scanner as to why these exports are necessary.

 package/gobject-introspection/g-ir-scanner.in       | 13 +++++++++++++
 .../gobject-introspection/gobject-introspection.mk  |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 9f97497b7e..13c99ce28f 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -1,6 +1,19 @@
 #!/usr/bin/env bash
 
+# These environment variables are empty by default, and as such ccompiler.py
+# defaults to either using the system tools (CC, CXX, and CPP) or leaving
+# the variables blank (LDFLAGS, CFLAGS, and CPPFLAGS.)
+# Export these variables in to ensure all build systems can generate .gir and
+# .typelib files properly.
+export CC="${HOST_DIR}/bin/@BASENAME_TARGET_CC@"
+export CXX="${HOST_DIR}/bin/@BASENAME_TARGET_CXX@"
+export CPP="${HOST_DIR}/bin/@BASENAME_TARGET_CPP@"
+export LDFLAGS="@TARGET_LDFLAGS@"
+export CFLAGS="@TARGET_CFLAGS@"
+export CPPFLAGS="@TARGET_CPPFLAGS@"
+
 export GI_SCANNER_DISABLE_CACHE=1
+
 ${HOST_DIR}/bin/g-ir-scanner \
 --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
 --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 19071ba1cb..741cd27886 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -107,6 +107,15 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 		$(INSTALL) -D -m 755 \
 			$(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
 	)
+	$(SED) "s%@BASENAME_TARGET_CC@%$(notdir $(TARGET_CC))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@BASENAME_TARGET_CXX@%$(notdir $(TARGET_CXX))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@BASENAME_TARGET_CPP@%$(notdir $(TARGET_CPP))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@TARGET_LDFLAGS@%$(TARGET_LDFLAGS)%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@TARGET_CFLAGS@%$(TARGET_CFLAGS)%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@TARGET_CPPFLAGS@%$(TARGET_CPPFLAGS)%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
+
+
+
 	# Gobject-introspection installs Makefile.introspection in
 	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
 	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
-- 
2.24.1
