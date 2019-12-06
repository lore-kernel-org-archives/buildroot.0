From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 10:00:52 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-gobject:
 depend on python2
Message-ID: <20191206085334.BB0FC81121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0ed87e197cb4888705cce4d36c09e48e2ab6276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12286

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4a392d1678a0d63652e0a40f7a3aa5e8a249961d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
