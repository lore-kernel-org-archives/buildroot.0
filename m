From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 11:12:30 +0200
Subject: [Buildroot] [git commit] package/python-bluezero: add recursive
 dependencies
Message-ID: <20210521085447.0BE2A86AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2bcf6605a540ff370479dffe94cd26ee6df2c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-bluezero selects python-gobject but fails to include its arch and
toolchain dependencies. Add them now, as well as the corresponding
comment.

dbus-python also has some dependencies, but all of them are covered by
the python3 dependency, so don't bother with those.

Fixes: 8bdc5e7c4d975193b1e18999ed840507cea63bd6

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-bluezero/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 3a9e5df6b7..7126b3ca50 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_GOBJECT # runtime
@@ -7,3 +10,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	  Python library for Bluetooth Low Energy (BLE) on Linux.
 
 	  https://github.com/ukBaz/python-bluezero
+
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
