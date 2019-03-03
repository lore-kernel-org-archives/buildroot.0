From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Mar 2019 23:10:29 +0100
Subject: [Buildroot] [git commit] package/gqrx: link with libatomic when
 needed
Message-ID: <20190303220826.061F48165D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0928b7c0e9cb67db0e746c6373bf20ca8aa62f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures, atomic builtins are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.net/results/a003ad5324a0c0f55cb8db5d3e5d69bd21999e16/
 - http://autobuild.buildroot.net/results/464602175d026d135125e5baa00e0729aec7a931/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Peter: add dependency on sync or atomic builtins in Config, addd comment]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqrx/Config.in | 2 ++
 package/gqrx/gqrx.mk   | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index a46409e333..b0d7e7b9f3 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,6 +1,7 @@
 comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU # gnuradio
 	depends on !BR2_PACKAGE_PYTHON3 # gnuradio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
 
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_BOOST
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index b51bb23eaf..d93c07d10c 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -12,4 +12,10 @@ GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
 
 GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
 
+# gqrx can use __atomic builtins, so we need to link with
+# libatomic when available
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GQRX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
