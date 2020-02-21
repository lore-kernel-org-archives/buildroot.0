From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 21 Feb 2020 14:43:11 -0800
Subject: [Buildroot] [PATCH 1/3] package/gobject-introspection: fix
 host-linking
In-Reply-To: <20200221224313.854089-1-aduskett@gmail.com>
References: <20200221224313.854089-1-aduskett@gmail.com>
Message-ID: <20200221224313.854089-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The host-variant of gobject-introspection currently links against the host
libraries. To resolve this, specify the LD_LIBRARY_PATH in
HOST_GOBJECT_INTROSPECTION_NINJA_ENV.

This fix has the added benefit of allowing the host gobject-introspection to
build the host .gir, .rnc, and .typelib files, which some packages may require.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gobject-introspection/gobject-introspection.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 67e5e37dee..e719588437 100644
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
+# g-ir-scanner will default to /usr/bin/ld for linking if this is not set,
+# which will cause gobject-introspection to attempt to link against the hosts
+# libglib2
+HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+	LD_LIBRARY_PATH="$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
-- 
2.24.1
