From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:18 +0100
Subject: [Buildroot] [PATCH 3 of 9] manual: explain how to express Python
	dependencies
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <6e353a0a1ef0fcc27294.1391343078@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the mailing list [1] [2], there are basically three cases in
which a package may need to depend on the Python interpreter. This patch
clarifies what to add in Config.in in these three cases.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

[1] http://lists.busybox.net/pipermail/buildroot/2013-December/085324.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-January/086396.html

---
 docs/manual/adding-packages-dependencies.txt |  43 ++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-dependencies.txt b/docs/manual/adding-packages-dependencies.txt
--- a/docs/manual/adding-packages-dependencies.txt
+++ b/docs/manual/adding-packages-dependencies.txt
@@ -236,3 +236,46 @@ management, use this format:
 --------------------------
 foo needs udev /dev management and a toolchain w/ featA, featB, featC
 --------------------------
+
+Dependencies on the Python interpreter
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+How to depend on the Python interpreter depends on the type of package.
+
+If the package is _a Python module_, it should use +depends on
+BR2_PACKAGE_PYTHON+. There shouldn't be any comment making this
+dependency explicit to the user, as it should be obvious that Python
+modules require Python to be enabled.
+
+If the package is _a regular (non-Python) package that requires Python_
+to function properly, it should use +select BR2_PACKAGE_PYTHON+. The
+reasoning here is that it is not user-friendly to require the user to
+enable Python prior to being able to enable this package, since the
+Python dependency is not obvious. As in the previous case, there
+shouldn't be any comment mentioning this Python dependency. However,
+the regular rules for propagating package dependencies when selecting
+a package still apply: you'll need to add +depends on+ statements for
+Python's dependencies, and you'll need to add an appropriate comment,
+as explained in xref:dependencies-target-toolchain-options[].
+
+If the package is _a regular (non-Python) package that has an optional
+Python dependency_ (for example because it provides optional Python
+bindings), this should be handled transparently in the +.mk+ file of
+the package. If Python is enabled, the optional support should be
+enabled as well. If Python is disabled, then so should the optional
+support. In this case, there is nothing added in the +Config.in+
+file. A typical construct in the +.mk+ file is:
+--------------------------
+  ifeq ($(BR2_PACKAGE_PYTHON),y)
+  LIBFOO_CONF_OPT += --with-python-support
+  LIBFOO_DEPENDENCIES += python
+  else
+  LIBFOO_CONF_OPT += --without-python-support
+  endif
+--------------------------
+
+Exceptions to this last rule can be made if the optional support has a
+large impact that is not acceptable for all users, unless explicitly
+requested. In this case, add an explicit config option to the
++Config.in+ file to enable the optional Python support. This option
+should use +depends on BR2_PACKAGE_PYTHON+. Again, there shouldn't be
+any comment mentioning this dependency.
