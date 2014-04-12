From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Apr 2014 16:53:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] host-libxml2: Prefer python2 when
	python3 is also installed
Message-ID: <1397314396-2489-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes mesa3d build errors:
http://autobuild.buildroot.net/results/d10/d105a0b3ca11fad34f9a2dae0dae9bd041d918a6/
http://autobuild.buildroot.net/results/d71/d7121443715024d15a66ff1abf1261803c10cd35/
http://autobuild.buildroot.net/results/ce6/ce64164d76972f82acab277afc9c95a876c6433e/

checking for python2... python2
checking python2 module: libxml2... no
configure: error: failed to find required module libxml2
make: *** [/home/test/test/1/output/build/mesa3d-10.0.4/.stamp_configured] Error 1

mesa3d needs python2 bindings installed by libxml2. To enforce their build
option BR2_PACKAGE_HOST_LIBXML2_PYTHON is used exclusively by mesa3d so this
patch does not affect other packages.

Without this patch host-libxml2 installs the python bindings in
$(HOST_DIR)/usr/lib/$(PYTHON3_VERSION_MAJOR) using this defconfig:

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_PYTHON3=y

because $(HOST_DIR)/usr/bin/python points to $(HOST_DIR)/usr/bin/python3:

Quote from host-libxml2 configure log:
Found python in /home/fli4l/br2/buildroot/output/host/usr/bin/python
Found Python version 3.4

HOST_$(PACKAGE)_NEEDS_HOST_PYTHON does not work here because libxml2 does
not use the python-package infrastructure.

libxml2-python2.patch extends the python detection code in host-libxml2 to
first look for python2, to keep the patch small I did not update the indentions:

Found python2 in /home/fli4l/br2/buildroot/output/host/usr/bin/python2
Found Python version 2.7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Add more autobuilder URLs, add s-o-b to patch file

 package/libxml2/libxml2-python2.patch |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libxml2/libxml2-python2.patch

diff --git a/package/libxml2/libxml2-python2.patch b/package/libxml2/libxml2-python2.patch
new file mode 100644
index 0000000..19195a6
--- /dev/null
+++ b/package/libxml2/libxml2-python2.patch
@@ -0,0 +1,27 @@
+Prefer python2 binary in case python points to python3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libxml2-2.9.1.org/configure.in libxml2-2.9.1/configure.in
+--- libxml2-2.9.1.org/configure.in	2013-04-19 09:25:20.000000000 +0200
++++ libxml2-2.9.1/configure.in	2014-04-12 14:16:26.579361068 +0200
+@@ -748,6 +748,11 @@
+ PYTHON_TESTS=
+ pythondir=
+ if test "$with_python" != "no" ; then
++    if test -x "$with_python/bin/python2"
++    then
++        echo Found python2 in $with_python/bin/python2
++        PYTHON="$with_python/bin/python2"
++    else
+     if test -x "$with_python/bin/python"
+     then
+         echo Found python in $with_python/bin/python
+@@ -773,6 +778,7 @@
+ 	    fi
+ 	fi
+     fi
++    fi
+     if test "$PYTHON" != ""
+     then
+         PYTHON_VERSION=`$PYTHON -c "from distutils import sysconfig; print(sysconfig.get_python_version())"`
-- 
1.7.10.4
