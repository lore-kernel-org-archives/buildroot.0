From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 22 Feb 2020 13:31:42 -0800
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: depend on
 python3
Message-ID: <20200222213142.2213941-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, the Config.in file has the line:
select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON

This line is incorrect as gobject-introspection does not support python2.
Instead, remove the select line and make python3 a dependency with a new
message that explains that gobject-introspection requires python3.

Note:
gobject-introspection does not require python3 to run on the target; however,
because the tools run in a qemu wrapper, a cross-compiled python3 must be
installed to staging. As there is no current mechanism to tell Buildroot only
to install python to staging, then python must also be installed
unconditionally to the target when building gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gobject-introspection/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 0537cc0404..26ca5d6e3a 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -9,11 +9,11 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_HOST_QEMU
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZLIB
 	help
 	  GObject introspection is a middleware layer between C
@@ -25,6 +25,9 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 
 	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
 
+comment "gobject-introspection needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
 comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
-- 
2.24.1
