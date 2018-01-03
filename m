From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed,  3 Jan 2018 22:08:51 +0100
Subject: [Buildroot] [PATCH] libselinux: add patch to create a proper
 pkg-config file
Message-ID: <20180103210851.26851-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`includedir` in libselinux.pc is set to $(PREFIX)/include if
not specified. This result in an incorrect include path when using
pkg-config.

Output from `pkg-config -cflags libselinux` without this patch:
-I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/home/marcus/git/buildroot-ostree/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/include
-I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include

Output from `pkg-config -cflags libselinux` with this patch:
-I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include

This is normally not an issue unless the depending package is compiled
with `-Werror=missing-include-dirs` as it will be treated as an error.

Fixes:
http://autobuild.buildroot.net/results/680458dc049d2c286918aeed745515894f8fcefa/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...introduce-PCPREFIX-substitute-variables-f.patch | 38 ++++++++++++++++++++++
 package/libselinux/libselinux.mk                   |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch

diff --git a/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch b/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch
new file mode 100644
index 0000000000..978d0591f3
--- /dev/null
+++ b/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch
@@ -0,0 +1,38 @@
+libselinux: introduce PCPREFIX substitute variable for .pc files
+
+`prefix` in the .pc file may be messed up when using a buildsystem
+that has specified a sysroot as DESTDIR.
+We need to make it possible to override the default `libdir`
+and `includedir`.
+
+`includedir` may be overridden by `INCLUDEDIR` but `libdir` is using
+`PREFIX` to setup the path.
+
+Therefore, introduce PCPREFIX to make it possible to generate a more
+customized .pc file.
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+--- libselinux.orig/src/Makefile	2018-01-03 21:44:49.548561421 +0100
++++ libselinux/src/Makefile	2018-01-03 21:44:35.581894904 +0100
+@@ -9,9 +9,10 @@
+ 
+ # Installation directories.
+ PREFIX ?= $(DESTDIR)/usr
++PCPREFIX ?= $(DESTDIR)/usr
+ LIBDIR ?= $(PREFIX)/lib
+ SHLIBDIR ?= $(DESTDIR)/lib
+-INCLUDEDIR ?= $(PREFIX)/include
++INCLUDEDIR ?= $(PCPREFIX)/include
+ PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
+ PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
+ PYSITEDIR ?= $(DESTDIR)$(shell $(PYTHON) -c 'import site; print(site.getsitepackages()[0])')
+@@ -148,7 +149,7 @@
+ 	ln -sf $@ $(TARGET)
+ 
+ $(LIBPC): $(LIBPC).in ../VERSION
+-	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
++	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PCPREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
+ 
+ selinuxswig_python_exception.i: ../include/selinux/selinux.h
+ 	bash -e exception.sh > $@ || (rm -f $@ ; false)
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 8ac8000de5..4d4a9d99e6 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -36,7 +36,8 @@ endif
 LIBSELINUX_MAKE_OPTS += \
 	PYINC="$(LIBSELINUX_PYINC)" \
 	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
-	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
+	PCPREFIX=/usr
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
 
-- 
2.15.1
