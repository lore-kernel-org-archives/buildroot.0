From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 15:45:49 +0200
Subject: [Buildroot] [git commit] liquid-dsp: new package
Message-ID: <20151011134633.AED9E81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9e4ccac112e87c924ef9ff78049e35e65f3b465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - add patch to fix autoreconf issue, and use LIQUID_DSP_AUTORECONF =
    YES instead of an horrible hack calling aclocal/autoconf manually.
  - use the github macro instead of hand-coding <pkg>_SITE and
    <pkg>_SITE_METHOD. This allows to remove <pkg>_SITE_METHOD
    entirely.
  - use a full hash as the <pkg>_VERSION
  - remove trailing whitespace everywhere.
  - use one single assignment of LIQUID_DSP_CONF_OPTS
  - fix the comment about the eglibc/musl dependency (it was only
    mentioning eglibc, and the condition was inverted)
  - add the musl/glibc dependency on the package option itself
  - make the package depend on dynamic library support, since the
    makefile unconditionally builds a shared library.
  - add hash file.]

Signed-off-by: Guillaume William Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch |   45 ++++++++++++++++++++
 package/liquid-dsp/Config.in                       |   24 ++++++++++
 package/liquid-dsp/liquid-dsp.hash                 |    2 +
 package/liquid-dsp/liquid-dsp.mk                   |   39 +++++++++++++++++
 5 files changed, 111 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1ceb7d6..084efa0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1122,6 +1122,7 @@ comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
+	source "package/liquid-dsp/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
diff --git a/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch b/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch
new file mode 100644
index 0000000..c51f587
--- /dev/null
+++ b/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch
@@ -0,0 +1,45 @@
+From c9d239490d47d5dd3d7d7b8b7d9007171c5f60ce Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 11 Oct 2015 15:27:09 +0200
+Subject: [PATCH] configure.ac: use AC_CONFIG_MACRO_DIR
+
+Instead of having to explicitly pass -I./scripts when running aclocal,
+use the AC_CONFIG_MACRO_DIR() macro in configure.ac. This allows to
+use "autoreconf" normally, without any hacks.
+
+Submitted upstream at https://github.com/jgaeddert/liquid-dsp/pull/15.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ bootstrap.sh | 2 +-
+ configure.ac | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bootstrap.sh b/bootstrap.sh
+index 640e01d..eb4894e 100755
+--- a/bootstrap.sh
++++ b/bootstrap.sh
+@@ -27,7 +27,7 @@
+ #
+ 
+ rm -f config.cache aclocal.m4
+-aclocal -I./scripts
++aclocal
+ autoconf
+ autoheader
+ #automake --foreign --add-missing
+diff --git a/configure.ac b/configure.ac
+index a9ad1d7..3b1ba68 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,7 @@
+ 
+ AC_INIT([liquid-dsp],[1.2.0],[support at liquidsdr.org])
+ AC_CONFIG_SRCDIR([src/libliquid.c])
++AC_CONFIG_MACRO_DIR([scripts])
+ 
+ # permit auxiliary scripts directory (e.g. config.sub, config.guess, install-sh)
+ AC_CONFIG_AUX_DIR(scripts/)
+-- 
+2.6.1
+
diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
new file mode 100644
index 0000000..834496c
--- /dev/null
+++ b/package/liquid-dsp/Config.in
@@ -0,0 +1,24 @@
+comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIQUID_DSP
+	bool "liquid-dsp"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_STATIC_LIBS
+	help
+	  Liquid-DSP is a free and open-source signal processing
+	  library for software-defined radios written in C.  Its
+	  purpose is to provide a set of extensible DSP modules that
+	  do no rely on external dependencies or cumbersome
+	  frameworks.
+
+	  http://liquidsdr.org/
+
+if BR2_PACKAGE_LIQUID_DSP
+
+config BR2_PACKAGE_LIQUID_DSP_FAST
+	bool "optimize for speed over accuracy"
+	help
+	  Optimize for speed over accuracy.
+
+endif
diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
new file mode 100644
index 0000000..5c1c0a8
--- /dev/null
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4b6dcb0846ed884c55984494adef721f910ac6f895174b31ec52138263842637 liquid-dsp-df5a459fa05dba4199c1299555891104cc1fdca7.tar.gz
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
new file mode 100644
index 0000000..5a5f583
--- /dev/null
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# liquid-dsp
+#
+################################################################################
+
+LIQUID_DSP_VERSION = df5a459fa05dba4199c1299555891104cc1fdca7
+LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,$(LIQUID_DSP_VERSION))
+LIQUID_DSP_LICENSE = MIT
+LIQUID_DSP_LICENSE_FILES = COPYING
+LIQUID_DSP_INSTALL_STAGING = YES
+LIQUID_DSP_AUTORECONF = YES
+
+LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
+LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Speed over accuracy trade off
+ifeq ($(BR2_PACKAGE_LIQUID_DSP_FAST),y)
+LIQUID_DSP_CFLAGS += -ffast-math
+endif
+
+# use FFTW instead of built-in FFT
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+LIQUID_DSP_LDFLAGS += -lfftw3f
+endif
+
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+LIQUID_DSP_LDFLAGS += -lfftw3
+endif
+
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
+LIQUID_DSP_LDFLAGS += -lfftw3l
+endif
+
+LIQUID_DSP_CONF_OPTS += \
+	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
+	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
+
+$(eval $(autotools-package))
