From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 16:33:20 +0100
Subject: [Buildroot] [PATCH 2/3 v6] package/gobject-introspection: export
 variables in g-ir-scanner
In-Reply-To: <cover.1584286382.git.yann.morin.1998@free.fr>
References: <cover.1584286382.git.yann.morin.1998@free.fr>
Message-ID: <08a9fbe78f417f2b1a8b346263c72ceb12fba9c6.1584286382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When building .gir .typelib files, the g-ir-scanner wrapper calls the host
g-ir-scanner. g-ir-scanner calls ccompiler.py, which searches for the following
environment variables:
    CPP, CC, CXX, CPPFLAGS, CFLAGS, CXXFLAGS, LDFLAGS

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v3:
  - Use relative paths. (Yann)

Changes v4 -> v5:
  - Switch back to using HOST_DIR. (Yann)
  - Update commit message as to why this patch is necessary.
  - Add CXX, CPP, LDFLAGS, CFLAGS and CPPFLAGS to the list of variables
    of which are exported.
  - Add a comment in g-ir-scanner as to why these exports are necessary.

Changes v5 -> v6  (Yann):
  - only set the variables if not already set
  - use a single call to $(SED) instead of one per variable
  - reorder variables in a more logical order
  - add missing CXXFLAGS
---
 package/gobject-introspection/g-ir-scanner.in      | 14 ++++++++++++++
 .../gobject-introspection/gobject-introspection.mk |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 9f97497b7e..22df7be309 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -1,6 +1,20 @@
 #!/usr/bin/env bash
 
+# These environment variables are empty by default, and as such ccompiler.py
+# defaults to either using the system tools (CC, CXX, and CPP) or leaving
+# the variables blank (LDFLAGS, CFLAGS, and CPPFLAGS.)
+# Export these variables to ensure all build systems can generate .gir and
+# .typelib files properly.
+export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
+export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
+export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
+export CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
+export CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
+export CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
+export LDFLAGS="${LDFLAGS:- at TARGET_LDFLAGS@}"
+
 export GI_SCANNER_DISABLE_CACHE=1
+
 ${HOST_DIR}/bin/g-ir-scanner \
 --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
 --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 35b6669469..0a395b814c 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -105,6 +105,15 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 		$(INSTALL) -D -m 755 \
 			$(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
 	)
+	$(SED) "s%@BASENAME_TARGET_CPP@%$(notdir $(TARGET_CPP))%g" \
+		-e "s%@BASENAME_TARGET_CC@%$(notdir $(TARGET_CC))%g" \
+		-e "s%@BASENAME_TARGET_CXX@%$(notdir $(TARGET_CXX))%g" \
+		-e "s%@TARGET_CPPFLAGS@%$(TARGET_CPPFLAGS)%g" \
+		-e "s%@TARGET_CFLAGS@%$(TARGET_CFLAGS)%g" \
+		-e "s%@TARGET_CXXFLAGS@%$(TARGET_CXXFLAGS)%g" \
+		-e "s%@TARGET_LDFLAGS@%$(TARGET_LDFLAGS)%g" \
+		$(STAGING_DIR)/usr/bin/g-ir-scanner
+
 	# Gobject-introspection installs Makefile.introspection in
 	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
 	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
-- 
2.20.1
