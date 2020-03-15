From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 17:37:09 +0100
Subject: [Buildroot] [git commit] package/gobject-introspection: fix
 host-linking
Message-ID: <20200315163201.B0812815CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8270fca228b1892b699801536ce136460e4892e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building, gobject-introspection uses tools/g-ir-scanner to build
several .gir and .typelib files. To that goal, it internally builds and
runs a few small executables linked to libglib2. However, it does not
pass them any LDFLAGS that we could pass the buildsystem. So, it either
ends up trying to link with the system's libglib2, which may not be
instaleld (build breaks), or is installed to an other version (build may
break); in either cases, this is not good...

g-ir-scanner can use the argument --lib-dirs-envvar to pass a list of
library directories to search for. However, during the build process,
this is not possible due to the build process calling g-ir-scanner
directly without letting the user (us) pass any option.

When discussing with upstream, they explained that the only solution in
that case was to set and export LD_LIBRARY_PATH to point to the location
where the correct libglib2 was installed.

Ergo, that's what we do.

This fix has the added benefit of allowing the host gobject-introspection
to build the host .gir, .rnc, and .typelib files, which some packages
may require.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/gobject-introspection.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index c18a1f17d3..35b6669469 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -33,11 +33,12 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
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
+# LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
+HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
