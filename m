From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:24:16 +0100
Subject: [Buildroot] [git commit] package/python-protobuf: eliminate
	unneeded build-time dependencies
Message-ID: <20151111222448.006D481778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6eb7600c2ff5aa0f179464ee7428b99ff21818a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was causing unexpected HTTP requests by the setup.py script for
python-protobuf. These "dependencies" aren't actually required for a successful
build, and are not staged into the target install directory.

Fixes:

  http://autobuild.buildroot.org/results/e44/e44694f30e39266491a1040e284e504d6d37ef9e/

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-disable-unneeded-build-dependencies.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch b/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch
new file mode 100644
index 0000000..3f0eabd
--- /dev/null
+++ b/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch
@@ -0,0 +1,37 @@
+From 7e7db7225e227905acabfa2149152ece21c93e70 Mon Sep 17 00:00:00 2001
+From: Steven Noonan <steven@uplinklabs.net>
+Date: Sun, 8 Nov 2015 09:03:00 -0800
+Subject: [PATCH] python-protobuf: don't require google-apputils
+
+This dependency is totally superfluous for successfully building/running
+python-protobuf. It's only "required" at build time and is not staged into the
+install directory, but it isn't even really required for a successful build.
+
+Signed-off-by: Steven Noonan <steven@uplinklabs.net>
+---
+ python/setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/python/setup.py b/python/setup.py
+index 2450a77..db6f497 100755
+--- a/python/setup.py
++++ b/python/setup.py
+@@ -160,7 +160,6 @@ if __name__ == '__main__':
+         packages = [ 'google' ],
+         namespace_packages = [ 'google' ],
+         test_suite = 'setup.MakeTestSuite',
+-        google_test_dir = "google/protobuf/internal",
+         # Must list modules explicitly so that we don't install tests.
+         py_modules = [
+           'google.protobuf.internal.api_implementation',
+@@ -189,7 +188,6 @@ if __name__ == '__main__':
+           'google.protobuf.text_format'],
+         cmdclass = { 'clean': clean, 'build_py': build_py },
+         install_requires = ['setuptools'],
+-        setup_requires = ['google-apputils'],
+         ext_modules = ext_module_list,
+         url = 'https://developers.google.com/protocol-buffers/',
+         maintainer = maintainer_email,
+-- 
+2.6.2
+
