From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  1 Dec 2019 10:39:08 -0800
Subject: [Buildroot] [PATCH v2 1/2] package/python-gobject: depend on python2
Message-ID: <20191201183909.3756147-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Version 2.86.6 of python-gobject is quite old and no longer works with
Python versions > 3.7. When importing a user will recieve the following error:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
  <module>
  File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in <module>
SystemError: initialization of _glib raised unreported exception

Because new versions of python-gobject require gobject-introspection, which is
not currently available in Buildroot, add a dependency on python2 to prevent
users from receiving the above error.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Add missing depends on in the comment section of python-gobject/Config.in
    (Thomas)

 package/python-gobject/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 475ff25185..36ddffebb0 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_PACKAGE_PYTHON # Broken with python 3.8
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library
@@ -10,5 +11,6 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
 comment "python-gobject needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.23.0
