From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:36:54 +0200
Subject: [Buildroot] [git commit] package/libselinux: fix the build with
 Python 3.8
Message-ID: <20191026103024.8E8BE88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fce6f1c150dbe4be58d083008ca8dbe7257836e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the switch to Python 3.8, the libselinux Python extension
started to fail building. This is fixed by upstream commit
2efa06857575e4118e91ca250b6b92da68b130d5, which we backport as
0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch.

This patch has the nice merit of switching to using distutils to build
the Python extension of libselinux, instead of some custom logic. This
allows to significantly simplify our libselinux.mk: we can rely on
PKG_PYTHON_DISTUTILS_ENV and HOST_PKG_PYTHON_DISTUTILS_ENV instead of
lots of custom variables.

However, upstream commit 2efa06857575e4118e91ca250b6b92da68b130d5 had
its own issues:

 * Hardcode of -I $(DESTDIR)/$(INCLUDEDIR) -L $(DESTDIR)/$(LIBDIR) at
   build time, while DESTDIR is normally empty at build time, causing
   bogus -I /usr/include -L /usr/lib to be used

   This is fixed in
   0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch

 * New usage of ln --relative, which is not supported in older
   distributions.

   This is fixed in
   0005-Remove-ln-relative-usage-in-install-pywrap.patch

 * Usage of the host Python "imp" module to query the extension used
   for native Python module, but that returns an incorrect result when
   cross-compiling. We chose to simplify the code to not have to query
   for this information.

   This is fixed in
   0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch

With this patch, the libselinux Python module was built-tested with
Python 2 and Python 3, and run-time tested as well in both
configurations, for both the target and host variants of libselinux.

Fixes:

  http://autobuild.buildroot.net/results/aeb58de7ad674b980258e6ed30c7da3949a04452/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Use-Python-distutils-to-install-SELinux-p.patch | 207 +++++++++++++++++++++
 ...e-don-t-pass-bogus-I-and-L-to-python-setu.patch |  34 ++++
 ...emove-ln-relative-usage-in-install-pywrap.patch |  27 +++
 ...PYCEXT-and-rely-on-the-installed-file-nam.patch |  47 +++++
 package/libselinux/libselinux.mk                   |  16 +-
 5 files changed, 319 insertions(+), 12 deletions(-)

diff --git a/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch b/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
new file mode 100644
index 0000000000..b1727af459
--- /dev/null
+++ b/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
@@ -0,0 +1,207 @@
+From 89c296e7e9219f54c74f8c3f42940100cbcac962 Mon Sep 17 00:00:00 2001
+From: Petr Lautrbach <plautrba@redhat.com>
+Date: Fri, 7 Jun 2019 17:35:44 +0200
+Subject: [PATCH] libselinux: Use Python distutils to install SELinux python
+ bindings
+
+Follow officially documented way how to build C extension modules using
+distutils - https://docs.python.org/3.8/extending/building.html#building
+
+Fixes:
+
+- selinux python module fails to load when it's built using SWIG-4.0:
+
+>>> import selinux
+Traceback (most recent call last):
+  File "<stdin>", line 1, in <module>
+  File "/usr/lib64/python3.7/site-packages/selinux/__init__.py", line 13, in <module>
+    from . import _selinux
+ImportError: cannot import name '_selinux' from 'selinux' (/usr/lib64/python3.7/site-packages/selinux/__init__.py)
+
+SWIG-4.0 changed (again?) its behavior so that it uses: from . import _selinux
+which looks for _selinux module in the same directory as where __init__.py is -
+$(PYLIBDIR)/site-packages/selinux. But _selinux module is installed into
+$(PYLIBDIR)/site-packages/ since a9604c30a5e2f ("libselinux: Change the location
+of _selinux.so").
+
+- audit2why python module fails to build with Python 3.8
+
+cc -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -DOVERRIDE_GETTID=0 -I../include -D_GNU_SOURCE -DDISABLE_RPM -DNO_ANDROID_BACKEND -DUSE_PCRE2 -DPCRE2_CODE_UNIT_WIDTH=8  -Wl,-z,relro -Wl,--as-needed  -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -L. -shared -o python-3.8audit2why.so python-3.8audit2why.lo -lselinux -l:libsepol.a  -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
+/usr/bin/ld: python-3.8audit2why.lo: in function `finish':
+/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:166: undefined reference to `PyArg_ParseTuple'
+/usr/bin/ld: python-3.8audit2why.lo: in function `_Py_INCREF':
+/usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
+/usr/bin/ld: /usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
+/usr/bin/ld: python-3.8audit2why.lo: in function `check_booleans':
+/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:84: undefined reference to `PyExc_RuntimeError'
+...
+
+It's related to the following Python change
+https://docs.python.org/dev/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+
+Python distutils adds correct link options automatically.
+
+- selinux python module doesn't provide any Python metadata
+
+When selinux python module was built manually, it didn't provide any metadata.
+distutils takes care about that so that selinux Python module is visible for
+pip:
+
+$ pip3 list | grep selinux
+selinux              2.9
+
+Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
+[Upstream: commit 2efa06857575e4118e91ca250b6b92da68b130d5]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/.gitignore |  2 +-
+ src/Makefile   | 36 ++++++++----------------------------
+ src/setup.py   | 24 ++++++++++++++++++++++++
+ 3 files changed, 33 insertions(+), 29 deletions(-)
+ create mode 100644 libselinux/src/setup.py
+
+diff --git a/src/.gitignore b/src/.gitignore
+index 4dcc3b3b..428afe5a 100644
+--- a/src/.gitignore
++++ b/src/.gitignore
+@@ -1,4 +1,4 @@
+ selinux.py
+-selinuxswig_wrap.c
++selinuxswig_python_wrap.c
+ selinuxswig_python_exception.i
+ selinuxswig_ruby_wrap.c
+diff --git a/src/Makefile b/src/Makefile
+index e9ed0383..2b1696a0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -36,7 +36,7 @@ TARGET=libselinux.so
+ LIBPC=libselinux.pc
+ SWIGIF= selinuxswig_python.i selinuxswig_python_exception.i
+ SWIGRUBYIF= selinuxswig_ruby.i
+-SWIGCOUT= selinuxswig_wrap.c
++SWIGCOUT= selinuxswig_python_wrap.c
+ SWIGPYOUT= selinux.py
+ SWIGRUBYCOUT= selinuxswig_ruby_wrap.c
+ SWIGLOBJ:= $(patsubst %.c,$(PYPREFIX)%.lo,$(SWIGCOUT))
+@@ -55,7 +55,7 @@ ifeq ($(LIBSEPOLA),)
+         LDLIBS_LIBSEPOLA := -l:libsepol.a
+ endif
+ 
+-GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) selinuxswig_python_exception.i
++GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) $(SWIGCOUT) selinuxswig_python_exception.i
+ SRCS= $(filter-out $(GENERATED) audit2why.c, $(sort $(wildcard *.c)))
+ 
+ MAX_STACK_SIZE=32768
+@@ -125,25 +125,18 @@ DISABLE_FLAGS+= -DNO_ANDROID_BACKEND
+ SRCS:= $(filter-out label_backends_android.c, $(SRCS))
+ endif
+ 
+-SWIG = swig -Wall -python -o $(SWIGCOUT) -outdir ./ $(DISABLE_FLAGS)
+-
+ SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
+ 
+ all: $(LIBA) $(LIBSO) $(LIBPC)
+ 
+-pywrap: all $(SWIGFILES) $(AUDIT2WHYSO)
++pywrap: all selinuxswig_python_exception.i
++	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
+ 
+ rubywrap: all $(SWIGRUBYSO)
+ 
+-$(SWIGLOBJ): $(SWIGCOUT)
+-	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(PYINC) -fPIC -DSHARED -c -o $@ $<
+-
+ $(SWIGRUBYLOBJ): $(SWIGRUBYCOUT)
+ 	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(RUBYINC) -fPIC -DSHARED -c -o $@ $<
+ 
+-$(SWIGSO): $(SWIGLOBJ)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $< -lselinux $(PYLIBS)
+-
+ $(SWIGRUBYSO): $(SWIGRUBYLOBJ)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(RUBYLIBS)
+ 
+@@ -161,29 +154,15 @@ $(LIBPC): $(LIBPC).in ../VERSION
+ selinuxswig_python_exception.i: ../include/selinux/selinux.h
+ 	bash -e exception.sh > $@ || (rm -f $@ ; false)
+ 
+-$(AUDIT2WHYLOBJ): audit2why.c
+-	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
+-
+-$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
+-
+ %.o:  %.c policy.h
+ 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
+ 
+ %.lo:  %.c policy.h
+ 	$(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
+ 
+-$(SWIGCOUT): $(SWIGIF)
+-	$(SWIG) $<
+-
+-$(SWIGPYOUT): $(SWIGCOUT)
+-
+ $(SWIGRUBYCOUT): $(SWIGRUBYIF)
+ 	$(SWIGRUBY) $<
+ 
+-swigify: $(SWIGIF)
+-	$(SWIG) $<
+-
+ install: all 
+ 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
+ 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
+@@ -194,10 +173,9 @@ install: all
+ 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+ 
+ install-pywrap: pywrap
+-	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
+-	install -m 755 $(SWIGSO) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
+-	install -m 755 $(AUDIT2WHYSO) $(DESTDIR)$(PYTHONLIBDIR)/selinux/audit2why$(PYCEXT)
++	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
++	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
+ 
+ install-rubywrap: rubywrap
+ 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
+@@ -208,6 +186,8 @@ relabel:
+ 
+ clean-pywrap:
+ 	-rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
++	$(PYTHON) setup.py clean
++	-rm -rf build *~ \#* *pyc .#*
+ 
+ clean-rubywrap:
+ 	-rm -f $(SWIGRUBYLOBJ) $(SWIGRUBYSO)
+diff --git a/src/setup.py b/src/setup.py
+new file mode 100644
+index 00000000..4dc03f55
+--- /dev/null
++++ b/src/setup.py
+@@ -0,0 +1,24 @@
++#!/usr/bin/python3
++
++from distutils.core import Extension, setup
++
++setup(
++    name="selinux",
++    version="2.9",
++    description="SELinux python 3 bindings",
++    author="SELinux Project",
++    author_email="selinux at vger.kernel.org",
++    ext_modules=[
++        Extension('selinux._selinux',
++                  sources=['selinuxswig_python.i'],
++                  include_dirs=['../include'],
++                  library_dirs=['.'],
++                  libraries=['selinux']),
++        Extension('selinux.audit2why',
++                  sources=['audit2why.c'],
++                  include_dirs=['../include'],
++                  library_dirs=['.'],
++                  libraries=['selinux'],
++                  extra_link_args=['-l:libsepol.a', '-Wl,--version-script=audit2why.map'])
++    ],
++)
+-- 
+2.21.0
+
diff --git a/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch b/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
new file mode 100644
index 0000000000..4c568d3386
--- /dev/null
+++ b/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
@@ -0,0 +1,34 @@
+From 4b1568bce5bbdc7bf76a4bbf1066ba7e7b84649f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 25 Oct 2019 11:45:04 +0200
+Subject: [PATCH] src/Makefile: don't pass bogus -I and -L to python setup.py
+ build_ext
+
+Using $(DESTDIR) during the build does not follow the normal/standard
+semantic of DESTDIR: it is normally only needed during the
+installation. Therefore, a lot of build systems/environments don't
+pass any DESTDIR at build time, which causes setup.py to be called
+with -I /usr/include -L /usr/lib, which breaks cross-compilation.
+
+[Upstream: https://github.com/SELinuxProject/selinux/pull/183]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 2b1696a0..3b8bad81 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -130,7 +130,7 @@ SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
+ all: $(LIBA) $(LIBSO) $(LIBPC)
+ 
+ pywrap: all selinuxswig_python_exception.i
+-	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
++	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext
+ 
+ rubywrap: all $(SWIGRUBYSO)
+ 
+-- 
+2.21.0
+
diff --git a/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch b/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
new file mode 100644
index 0000000000..bf482af68a
--- /dev/null
+++ b/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
@@ -0,0 +1,27 @@
+From af2284b8510161e8742787a632ebb2aaef8fc045 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 25 Oct 2019 13:36:29 +0200
+Subject: [PATCH] Remove ln --relative usage in install-pywrap
+
+[Upstream: https://github.com/SELinuxProject/selinux/pull/184]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 2b1696a0..799df2b0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -175,7 +175,7 @@ install: all
+ install-pywrap: pywrap
+ 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+-	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
++	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux$(PYCEXT) _selinux$(PYCEXT)
+ 
+ install-rubywrap: rubywrap
+ 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
+-- 
+2.21.0
+
diff --git a/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
new file mode 100644
index 0000000000..57cc151e70
--- /dev/null
+++ b/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -0,0 +1,47 @@
+From 0d4da8093bc2ef92b7c6f7fd1f4804f6ebc6cb56 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 25 Oct 2019 13:37:14 +0200
+Subject: [PATCH] Do not use PYCEXT, and rely on the installed file name
+
+PYCEXT is computed by asking the Python intrepreter what is the
+file extension used for native Python modules.
+
+Unfortunately, when cross-compiling, the host Python doesn't give the
+proper result: it gives the result matching the build machine, and not
+the target machine. Due to this, the symlink has an incorrect name,
+and doesn't point to the .so file that was actually built/installed.
+
+To address this and keep things simple, this patch just changes the ln
+invocation to rely on the name of the _selinux*.so Python module that
+was installed.
+
+[Upstream: https://github.com/SELinuxProject/selinux/pull/184]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 799df2b0..95684ed7 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
+ PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
+ PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
+ PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
+-PYCEXT ?= $(shell $(PYTHON) -c 'import imp;print([s for s,m,t in imp.get_suffixes() if t == imp.C_EXTENSION][0])')
+ RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
+ RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
+ RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
+@@ -175,7 +174,7 @@ install: all
+ install-pywrap: pywrap
+ 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+-	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux$(PYCEXT) _selinux$(PYCEXT)
++	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux*.so .
+ 
+ install-rubywrap: rubywrap
+ 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
+-- 
+2.21.0
+
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c68721e3a7..dd68ad9298 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -33,19 +33,15 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBSELINUX_DEPENDENCIES += python3 host-swig
-LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
 LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBSELINUX_DEPENDENCIES += python host-swig
-LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
 LIBSELINUX_MAKE_OPTS += \
-	PYTHON=$(LIBSELINUX_PYLIBVER) \
-	PYINC="$(LIBSELINUX_PYINC)" \
-	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
-	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
+	$(PKG_PYTHON_DISTUTILS_ENV) \
+	PYTHON=$(LIBSELINUX_PYLIBVER)
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
 
@@ -85,23 +81,19 @@ HOST_LIBSELINUX_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 HOST_LIBSELINUX_DEPENDENCIES += host-python
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	PYTHON=$(HOST_LIBSELINUX_PYLIBVER) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
-	PYINC="$(HOST_LIBSELINUX_PYINC)" \
-	PYSITEDIR="$(HOST_DIR)/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
-	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
+	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
+	PYTHON=$(HOST_LIBSELINUX_PYLIBVER)
 
 define HOST_LIBSELINUX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
