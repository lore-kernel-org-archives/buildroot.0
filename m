From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:34:51 +0100
Subject: [Buildroot] [git commit] package/python-m2crypto: fix build on arm
 and mips
Message-ID: <20201109202325.C7A858225F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c7e161c17bae2bc1109fd33e85b0e4df7906e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure on arm and mips (perhaps also other)

Fixes:
 - http://autobuild.buildroot.org/results/7f63e6a2d8681cc3408f344556afd5dd16eb7368
 - http://autobuild.buildroot.org/results/d115a082418321e7dc4715c635f94b30b3cad387

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...move-swig-default-includes-before-openssl.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch b/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
new file mode 100644
index 0000000000..f4d7e428f1
--- /dev/null
+++ b/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
@@ -0,0 +1,63 @@
+From 1aab31787a8d1ef9436d9cf81832691f729b6282 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 7 Nov 2020 23:26:30 +0100
+Subject: [PATCH] setup.py: move swig default includes before openssl
+
+Move swig default includes before openssl to avoid the following build
+failure when cross-compiling for some architectures (e.g. arm, mips):
+
+swig -python -py3 -D__x86_64__ \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/python3.9 \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/openssl \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include-fixed \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/../../../../mipsel-buildroot-linux-gnu/include \
+ -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include \
+ -includeall -modern -builtin -outdir \
+ /srv/storage/autobuild/run/instance-0/output-1/build/python-m2crypto-0.36.0/M2Crypto -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
+Deprecated command line option: -modern. This option is now always on.
+/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/types.h:139:
+Error: CPP #error "". Use the -cpperraswarn option to continue swig processing.
+
+This build failure is probably raised because swig includes a wrong types.h file
+from the openssl directory (e.g.
+/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7f63e6a2d8681cc3408f344556afd5dd16eb7368
+ - http://autobuild.buildroot.org/results/d115a082418321e7dc4715c635f94b30b3cad387
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/m2crypto/m2crypto/-/merge_requests/248]
+---
+ setup.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 89d03bb..0045fda 100644
+--- a/setup.py
++++ b/setup.py
+@@ -154,6 +154,9 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+         if sys.version_info[:1] >= (3,):
+             self.swig_opts.append('-py3')
+ 
++        # swig seems to need the default header file directories
++        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
++
+         log.debug('self.include_dirs = %s', self.include_dirs)
+         log.debug('self.library_dirs = %s', self.library_dirs)
+ 
+@@ -204,8 +207,6 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+             self.swig_opts.append(
+                 '-I' + os.path.join(openssl_include_dir, 'openssl'))
+ 
+-        # swig seems to need the default header file directories
+-        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
+         self.swig_opts.append('-includeall')
+         self.swig_opts.append('-modern')
+         self.swig_opts.append('-builtin')
+-- 
+2.28.0
+
