From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Mar 2020 20:13:56 -0700
Subject: [Buildroot] [PATCH v5 1/3] package/gobject-introspection: fix
 host-linking
Message-ID: <20200315031359.365637-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When building, gobject-introspection uses tools/g-ir-scanner to build several
.gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
links to the system-installed libglib2 path. To remedy this issue, defining
either LD_LIBRARY_PATH or LD_RUN_PATH forces g-ir-scanner to use the host
installed libglib2 files. The decision to use LD_RUN_PATH instead of
LD_LIBRARY_PATH is because this is a run time issue with g-ir-scanner and not
a compile-time issue.

g-ir-scanner can use the argument --lib-dirs-envvar to pass a list of library
directories in place of LD_LIBRARY_PATH, which the installed g-ir-scanner
wrapper does. However, during the build process, this is not possible due to
the build process calling g-ir-scanner directly.

This fix has the added benefit of allowing the host gobject-introspection to
build the host .gir, .rnc, and .typelib files, which some packages may require.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Update comment to be more clear.

Changes v3 -> v4:
  - Update patch to work with gobject-introspection 2.64.0

Changes v4 -> v5:
  - Changed LD_LIBRARY_PATH to LD_RUN_PATH after more testing.
  - Updated the commit message and comments in the .mk file to better describe
    what the problem was and why this is necessary.

 .../gobject-introspection/gobject-introspection.mk  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index c18a1f17d3..19071ba1cb 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -33,11 +33,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
 GOBJECT_INTROSPECTION_NINJA_ENV += \
 	CC="$(TARGET_CC)"
 
-# Disable introspection data on the host, as it is not needed and
-# the package will attempt to use the systems libglib2 which will fail
-# if the systems libglib2 version is older than 2.60.
-HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
-	-Dbuild_introspection_data=false
+# When building, gobject-introspection uses tools/g-ir-scanner to build several
+# .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
+# links to the system-installed libglib2 path. To remedy this issue, defining
+# either LD_LIBRARY_PATH or LD_RUN_PATH forces g-ir-scanner to use the host
+# installed libglib2 files. Use LD_RUN_PATH instead of LD_LIBRARY_PATH because
+# this is a run time issue with g-ir-scanner and not a compile-time issue.
+HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+	LD_RUN_PATH="$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
-- 
2.24.1
