From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:27 -0800
Subject: [Buildroot] [PATCH 05/11] package/libselinux: bump version to 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Remove upstream patchs:
    - 0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
    - 0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch

  - Refresh the following patches to work with 3.0:
    - 0001-fix-musl-build.patch
    - 0002-revert-ln-relative.patch
    - 0003-Remove-ln-relative-usage-in-install-pywrap.patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/0001-fix-musl-build.patch  |  22 +-
 .../libselinux/0002-revert-ln-relative.patch  |  24 +-
 ...ln-relative-usage-in-install-pywrap.patch} |   0
 ...ython-distutils-to-install-SELinux-p.patch | 207 ------------------
 ...-and-rely-on-the-installed-file-nam.patch} |   6 +-
 ...-t-pass-bogus-I-and-L-to-python-setu.patch |  34 ---
 package/libselinux/libselinux.hash            |   2 +-
 package/libselinux/libselinux.mk              |   4 +-
 8 files changed, 40 insertions(+), 259 deletions(-)
 rename package/libselinux/{0005-Remove-ln-relative-usage-in-install-pywrap.patch => 0003-Remove-ln-relative-usage-in-install-pywrap.patch} (100%)
 delete mode 100644 package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
 rename package/libselinux/{0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch => 0004-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch} (95%)
 delete mode 100644 package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch

diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
index 7af3a3c36f..44189e6400 100644
--- a/package/libselinux/0001-fix-musl-build.patch
+++ b/package/libselinux/0001-fix-musl-build.patch
@@ -1,4 +1,7 @@
-fix undefined macros in musl
+From 78f7f09028fdd6a5e8e4e4b584749621eaef412f Mon Sep 17 00:00:00 2001
+From: Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 7 Dec 2019 17:24:50 -0800
+Subject: [PATCH] fix undefined macros in musl
 
 musl does not define glibc-specific macros, so use a simple version of
 the macro when it is not defined.
@@ -9,11 +12,13 @@ Domain, and we want to avoid license propagation, so this macro is
 completely written from scratch, and non-optimal.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN libselinux-2.1.13.orig/src/booleans.c libselinux-2.1.13/src/booleans.c
---- libselinux-2.1.13.orig/src/booleans.c	2013-02-06 02:43:22.000000000 +0100
-+++ libselinux-2.1.13/src/booleans.c	2015-07-26 20:40:41.311801914 +0200
-@@ -62,6 +62,14 @@
+[Updated for 3.0]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+diff --git a/src/booleans.c b/src/booleans.c
+index ffa8d26..8569002 100644
+--- a/src/booleans.c
++++ b/src/booleans.c
+@@ -65,6 +65,14 @@ int security_get_boolean_names(char ***names, int *len)
  		goto bad;
  	}
  
@@ -26,5 +31,8 @@ diff -durN libselinux-2.1.13.orig/src/booleans.c libselinux-2.1.13/src/booleans.
 +#endif
 +
  	for (i = 0; i < *len; i++) {
- 		n[i] = (char *)malloc(_D_ALLOC_NAMLEN(namelist[i]));
+ 		n[i] = strdup(namelist[i]->d_name);
  		if (!n[i]) {
+-- 
+2.23.0
+
diff --git a/package/libselinux/0002-revert-ln-relative.patch b/package/libselinux/0002-revert-ln-relative.patch
index f7beab2697..166b583add 100644
--- a/package/libselinux/0002-revert-ln-relative.patch
+++ b/package/libselinux/0002-revert-ln-relative.patch
@@ -1,4 +1,7 @@
-Makefile: revert libselinux: use ln --relative to create .so symlinks
+From b82e75b030a3bb44a32d163753598b60ce2d669b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 7 Dec 2019 17:27:06 -0800
+Subject: [PATCH] Makefile: revert libselinux: use ln --relative to create .so symlinks
 
 This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
 
@@ -11,11 +14,17 @@ For the sake of Buildroot, revert the upstream patch.
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8 (with assumption that SHLIBDIR=LIBDIR)]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Updated for 3.0]
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -durNw libselinux-2.7.orig/src/Makefile libselinux-2.7/src/Makefile
---- libselinux-2.7.orig/src/Makefile	2018-01-15 20:53:50.168525700 +0100
-+++ libselinux-2.7/src/Makefile	2018-01-15 20:55:27.061858005 +0100
-@@ -181,7 +181,7 @@
+diff --git a/src/Makefile b/src/Makefile
+index 7f5a5d7..4b6a4d4 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -170,7 +170,7 @@ install: all
 	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
 	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
 	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
@@ -23,4 +32,7 @@ diff -durNw libselinux-2.7.orig/src/Makefile libselinux-2.7/src/Makefile
 +	cd $(DESTDIR)$(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
  
  install-pywrap: pywrap
-	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
+ 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
+-- 
+2.23.0
+
diff --git a/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch b/package/libselinux/0003-Remove-ln-relative-usage-in-install-pywrap.patch
similarity index 100%
rename from package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
rename to package/libselinux/0003-Remove-ln-relative-usage-in-install-pywrap.patch
diff --git a/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch b/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
deleted file mode 100644
index b1727af459..0000000000
--- a/package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From 89c296e7e9219f54c74f8c3f42940100cbcac962 Mon Sep 17 00:00:00 2001
-From: Petr Lautrbach <plautrba@redhat.com>
-Date: Fri, 7 Jun 2019 17:35:44 +0200
-Subject: [PATCH] libselinux: Use Python distutils to install SELinux python
- bindings
-
-Follow officially documented way how to build C extension modules using
-distutils - https://docs.python.org/3.8/extending/building.html#building
-
-Fixes:
-
-- selinux python module fails to load when it's built using SWIG-4.0:
-
->>> import selinux
-Traceback (most recent call last):
-  File "<stdin>", line 1, in <module>
-  File "/usr/lib64/python3.7/site-packages/selinux/__init__.py", line 13, in <module>
-    from . import _selinux
-ImportError: cannot import name '_selinux' from 'selinux' (/usr/lib64/python3.7/site-packages/selinux/__init__.py)
-
-SWIG-4.0 changed (again?) its behavior so that it uses: from . import _selinux
-which looks for _selinux module in the same directory as where __init__.py is -
-$(PYLIBDIR)/site-packages/selinux. But _selinux module is installed into
-$(PYLIBDIR)/site-packages/ since a9604c30a5e2f ("libselinux: Change the location
-of _selinux.so").
-
-- audit2why python module fails to build with Python 3.8
-
-cc -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -DOVERRIDE_GETTID=0 -I../include -D_GNU_SOURCE -DDISABLE_RPM -DNO_ANDROID_BACKEND -DUSE_PCRE2 -DPCRE2_CODE_UNIT_WIDTH=8  -Wl,-z,relro -Wl,--as-needed  -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -L. -shared -o python-3.8audit2why.so python-3.8audit2why.lo -lselinux -l:libsepol.a  -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
-/usr/bin/ld: python-3.8audit2why.lo: in function `finish':
-/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:166: undefined reference to `PyArg_ParseTuple'
-/usr/bin/ld: python-3.8audit2why.lo: in function `_Py_INCREF':
-/usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
-/usr/bin/ld: /usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
-/usr/bin/ld: python-3.8audit2why.lo: in function `check_booleans':
-/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:84: undefined reference to `PyExc_RuntimeError'
-...
-
-It's related to the following Python change
-https://docs.python.org/dev/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
-
-Python distutils adds correct link options automatically.
-
-- selinux python module doesn't provide any Python metadata
-
-When selinux python module was built manually, it didn't provide any metadata.
-distutils takes care about that so that selinux Python module is visible for
-pip:
-
-$ pip3 list | grep selinux
-selinux              2.9
-
-Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
-[Upstream: commit 2efa06857575e4118e91ca250b6b92da68b130d5]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/.gitignore |  2 +-
- src/Makefile   | 36 ++++++++----------------------------
- src/setup.py   | 24 ++++++++++++++++++++++++
- 3 files changed, 33 insertions(+), 29 deletions(-)
- create mode 100644 libselinux/src/setup.py
-
-diff --git a/src/.gitignore b/src/.gitignore
-index 4dcc3b3b..428afe5a 100644
---- a/src/.gitignore
-+++ b/src/.gitignore
-@@ -1,4 +1,4 @@
- selinux.py
--selinuxswig_wrap.c
-+selinuxswig_python_wrap.c
- selinuxswig_python_exception.i
- selinuxswig_ruby_wrap.c
-diff --git a/src/Makefile b/src/Makefile
-index e9ed0383..2b1696a0 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -36,7 +36,7 @@ TARGET=libselinux.so
- LIBPC=libselinux.pc
- SWIGIF= selinuxswig_python.i selinuxswig_python_exception.i
- SWIGRUBYIF= selinuxswig_ruby.i
--SWIGCOUT= selinuxswig_wrap.c
-+SWIGCOUT= selinuxswig_python_wrap.c
- SWIGPYOUT= selinux.py
- SWIGRUBYCOUT= selinuxswig_ruby_wrap.c
- SWIGLOBJ:= $(patsubst %.c,$(PYPREFIX)%.lo,$(SWIGCOUT))
-@@ -55,7 +55,7 @@ ifeq ($(LIBSEPOLA),)
-         LDLIBS_LIBSEPOLA := -l:libsepol.a
- endif
- 
--GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) selinuxswig_python_exception.i
-+GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) $(SWIGCOUT) selinuxswig_python_exception.i
- SRCS= $(filter-out $(GENERATED) audit2why.c, $(sort $(wildcard *.c)))
- 
- MAX_STACK_SIZE=32768
-@@ -125,25 +125,18 @@ DISABLE_FLAGS+= -DNO_ANDROID_BACKEND
- SRCS:= $(filter-out label_backends_android.c, $(SRCS))
- endif
- 
--SWIG = swig -Wall -python -o $(SWIGCOUT) -outdir ./ $(DISABLE_FLAGS)
--
- SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
- 
- all: $(LIBA) $(LIBSO) $(LIBPC)
- 
--pywrap: all $(SWIGFILES) $(AUDIT2WHYSO)
-+pywrap: all selinuxswig_python_exception.i
-+	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
- 
- rubywrap: all $(SWIGRUBYSO)
- 
--$(SWIGLOBJ): $(SWIGCOUT)
--	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(PYINC) -fPIC -DSHARED -c -o $@ $<
--
- $(SWIGRUBYLOBJ): $(SWIGRUBYCOUT)
- 	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(RUBYINC) -fPIC -DSHARED -c -o $@ $<
- 
--$(SWIGSO): $(SWIGLOBJ)
--	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $< -lselinux $(PYLIBS)
--
- $(SWIGRUBYSO): $(SWIGRUBYLOBJ)
- 	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(RUBYLIBS)
- 
-@@ -161,29 +154,15 @@ $(LIBPC): $(LIBPC).in ../VERSION
- selinuxswig_python_exception.i: ../include/selinux/selinux.h
- 	bash -e exception.sh > $@ || (rm -f $@ ; false)
- 
--$(AUDIT2WHYLOBJ): audit2why.c
--	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
--
--$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
--	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
--
- %.o:  %.c policy.h
- 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
- 
- %.lo:  %.c policy.h
- 	$(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
- 
--$(SWIGCOUT): $(SWIGIF)
--	$(SWIG) $<
--
--$(SWIGPYOUT): $(SWIGCOUT)
--
- $(SWIGRUBYCOUT): $(SWIGRUBYIF)
- 	$(SWIGRUBY) $<
- 
--swigify: $(SWIGIF)
--	$(SWIG) $<
--
- install: all 
- 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
- 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
-@@ -194,10 +173,9 @@ install: all
- 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
- 
- install-pywrap: pywrap
--	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
--	install -m 755 $(SWIGSO) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
--	install -m 755 $(AUDIT2WHYSO) $(DESTDIR)$(PYTHONLIBDIR)/selinux/audit2why$(PYCEXT)
-+	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
-+	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
- 
- install-rubywrap: rubywrap
- 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
-@@ -208,6 +186,8 @@ relabel:
- 
- clean-pywrap:
- 	-rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
-+	$(PYTHON) setup.py clean
-+	-rm -rf build *~ \#* *pyc .#*
- 
- clean-rubywrap:
- 	-rm -f $(SWIGRUBYLOBJ) $(SWIGRUBYSO)
-diff --git a/src/setup.py b/src/setup.py
-new file mode 100644
-index 00000000..4dc03f55
---- /dev/null
-+++ b/src/setup.py
-@@ -0,0 +1,24 @@
-+#!/usr/bin/python3
-+
-+from distutils.core import Extension, setup
-+
-+setup(
-+    name="selinux",
-+    version="2.9",
-+    description="SELinux python 3 bindings",
-+    author="SELinux Project",
-+    author_email="selinux at vger.kernel.org",
-+    ext_modules=[
-+        Extension('selinux._selinux',
-+                  sources=['selinuxswig_python.i'],
-+                  include_dirs=['../include'],
-+                  library_dirs=['.'],
-+                  libraries=['selinux']),
-+        Extension('selinux.audit2why',
-+                  sources=['audit2why.c'],
-+                  include_dirs=['../include'],
-+                  library_dirs=['.'],
-+                  libraries=['selinux'],
-+                  extra_link_args=['-l:libsepol.a', '-Wl,--version-script=audit2why.map'])
-+    ],
-+)
--- 
-2.21.0
-
diff --git a/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0004-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
similarity index 95%
rename from package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
rename to package/libselinux/0004-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 57cc151e70..348b956fc3 100644
--- a/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0004-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -17,12 +17,14 @@ was installed.
 
 [Upstream: https://github.com/SELinuxProject/selinux/pull/184]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Refreshed for 3.0]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
  src/Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 799df2b0..95684ed7 100644
+index 4b6a4d4..7b14ef1 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
@@ -43,5 +45,5 @@ index 799df2b0..95684ed7 100644
  install-rubywrap: rubywrap
  	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
 -- 
-2.21.0
+2.23.0
 
diff --git a/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch b/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
deleted file mode 100644
index 4c568d3386..0000000000
--- a/package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4b1568bce5bbdc7bf76a4bbf1066ba7e7b84649f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 25 Oct 2019 11:45:04 +0200
-Subject: [PATCH] src/Makefile: don't pass bogus -I and -L to python setup.py
- build_ext
-
-Using $(DESTDIR) during the build does not follow the normal/standard
-semantic of DESTDIR: it is normally only needed during the
-installation. Therefore, a lot of build systems/environments don't
-pass any DESTDIR at build time, which causes setup.py to be called
-with -I /usr/include -L /usr/lib, which breaks cross-compilation.
-
-[Upstream: https://github.com/SELinuxProject/selinux/pull/183]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 2b1696a0..3b8bad81 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -130,7 +130,7 @@ SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
- all: $(LIBA) $(LIBSO) $(LIBPC)
- 
- pywrap: all selinuxswig_python_exception.i
--	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
-+	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext
- 
- rubywrap: all $(SWIGRUBYSO)
- 
--- 
-2.21.0
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index ed61ea8bd2..d1b4210483 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 1bccc8873e449587d9a2b2cf253de9b89a8291b9fbc7c59393ca9e5f5f4d2693 libselinux-2.9.tar.gz
+sha256 2ea2b30f671dae9d6b1391cbe8fb2ce5d36a3ee4fb1cd3c32f0d933c31b82433 libselinux-3.0.tar.gz
 
 # Hash for license file
 sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b8ef4f5fba..b8996461dd 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.9
-LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSELINUX_VERSION = 3.0
+LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
-- 
2.23.0
