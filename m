From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 26 Feb 2020 10:52:42 -0800
Subject: [Buildroot] [PATCH/next v3 1/3] package/gobject-introspection: fix
 host-linking
Message-ID: <20200226185244.31556-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When building, gobject-introspection uses g-ir-scanner to build several .gir
files. g-ir-scanner does not use LDPATH, so LD_LIBRARY_PATH must be used in
order to ensure that g-ir-scanner does not use the host library path.

This fix has the added benefit of allowing the host gobject-introspection to
build the host .gir, .rnc, and .typelib files, which some packages may require.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Provide better documentation as to why this is needed. (Yann)

 package/gobject-introspection/gobject-introspection.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 67e5e37dee..e28748be2e 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -33,11 +33,11 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
 GOBJECT_INTROSPECTION_NINJA_ENV += \
 	CC="$(TARGET_CC)"
 
-# Disable introspection data on the host, as it is not needed and
-# the package will attempt to use the systems libglib2 which will fail
-# if the systems libglib2 version is older than 2.60.
-HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
-	-Denable-introspection-data=false
+# When building, gobject-introspection uses g-ir-scanner to build several .gir
+# files. g-ir-scanner does not use LDPATH, so LD_LIBRARY_PATH must be used in
+# order to ensure that g-ir-scanner does not use the host library path.
+HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+	LD_LIBRARY_PATH="$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
-- 
2.24.1
