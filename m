From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:18:28 +0100
Subject: [Buildroot] [git commit branch/next] package/python-m2crypto: bump
 to version 0.37.1
Message-ID: <20210301210039.DD3168679E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c017f37773079d83acf147e0517af538bd3514b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also, removed 0001 patch since it's already merged upstream.

https://gitlab.com/m2crypto/m2crypto/-/merge_requests/248

Signed-off-by: Gustavo Heinz <gustavo@gsthnz.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...move-swig-default-includes-before-openssl.patch | 63 ----------------------
 package/python-m2crypto/python-m2crypto.hash       |  4 +-
 package/python-m2crypto/python-m2crypto.mk         |  4 +-
 3 files changed, 4 insertions(+), 67 deletions(-)

diff --git a/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch b/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
deleted file mode 100644
index f4d7e428f1..0000000000
--- a/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 1aab31787a8d1ef9436d9cf81832691f729b6282 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Nov 2020 23:26:30 +0100
-Subject: [PATCH] setup.py: move swig default includes before openssl
-
-Move swig default includes before openssl to avoid the following build
-failure when cross-compiling for some architectures (e.g. arm, mips):
-
-swig -python -py3 -D__x86_64__ \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/python3.9 \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/openssl \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include-fixed \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/../../../../mipsel-buildroot-linux-gnu/include \
- -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include \
- -includeall -modern -builtin -outdir \
- /srv/storage/autobuild/run/instance-0/output-1/build/python-m2crypto-0.36.0/M2Crypto -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
-Deprecated command line option: -modern. This option is now always on.
-/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/types.h:139:
-Error: CPP #error "". Use the -cpperraswarn option to continue swig processing.
-
-This build failure is probably raised because swig includes a wrong types.h file
-from the openssl directory (e.g.
-/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include)
-
-Fixes:
- - http://autobuild.buildroot.org/results/7f63e6a2d8681cc3408f344556afd5dd16eb7368
- - http://autobuild.buildroot.org/results/d115a082418321e7dc4715c635f94b30b3cad387
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/m2crypto/m2crypto/-/merge_requests/248]
----
- setup.py | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 89d03bb..0045fda 100644
---- a/setup.py
-+++ b/setup.py
-@@ -154,6 +154,9 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-         if sys.version_info[:1] >= (3,):
-             self.swig_opts.append('-py3')
- 
-+        # swig seems to need the default header file directories
-+        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
-+
-         log.debug('self.include_dirs = %s', self.include_dirs)
-         log.debug('self.library_dirs = %s', self.library_dirs)
- 
-@@ -204,8 +207,6 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-             self.swig_opts.append(
-                 '-I' + os.path.join(openssl_include_dir, 'openssl'))
- 
--        # swig seems to need the default header file directories
--        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
-         self.swig_opts.append('-includeall')
-         self.swig_opts.append('-modern')
-         self.swig_opts.append('-builtin')
--- 
-2.28.0
-
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 148cdd8317..1ccc786f51 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  b8b34c5b83892096a8676b6f2e8f4e7e  M2Crypto-0.36.0.tar.gz
-sha256  1542c18e3ee5c01db5031d0b594677536963e3f54ecdf5315aeecb3a595b4dc1  M2Crypto-0.36.0.tar.gz
+md5 1f3095440092ca5e54007d1f3fa2562a M2Crypto-0.37.1.tar.gz
+sha256 e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3 M2Crypto-0.37.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index ccc63058ce..557985eb0e 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.36.0
+PYTHON_M2CRYPTO_VERSION = 0.37.1
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/df/84609ed874b5e6fcd3061a517bf4b6e4d0301f553baf9fa37bef2b509797
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/aa/36/9fef97358e378c1d3bd567c4e8f8ca0428a8d7e869852cef445ee6da91fd
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
