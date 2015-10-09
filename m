From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Fri, 9 Oct 2015 11:20:16 -0600
Subject: [Buildroot] [PATCH v2] liquid-dsp: new package
Message-ID: <1444411216-20242-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Applied modifications suggested by Thomas:

package/liquid-dsp/Config.in =>
	updated dependencies: BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL,
	fixed indentation problem,
	PACKAGE_VERSION = commit ID instead of master branch,
	updated licence,
	removed -mfloat-abi=hard from CFLAGS,
	renamed linker flags to LDFLAGS.


Signed-off-by: Guillaume William Bres <guillaume.bressaix@gmail.com>
---
 package/Config.in                |    1 +
 package/liquid-dsp/Config.in     |   21 +++++++++++++++++
 package/liquid-dsp/liquid-dsp.mk |   48 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 package/liquid-dsp/Config.in
 create mode 100644 package/liquid-dsp/liquid-dsp.mk

diff --git a/package/Config.in b/package/Config.in
index 3794f44..60ad72a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1123,6 +1123,7 @@ comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
+	source "package/liquid-dsp/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
new file mode 100644
index 0000000..261d3af
--- /dev/null
+++ b/package/liquid-dsp/Config.in
@@ -0,0 +1,21 @@
+comment "liquid-dsp requires a (e)glibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_LIQUID_DSP
+	bool "liquid-dsp"
+	help
+	  Liquid-DSP is a free and open-source signal processing library 
+	  for software-defined radios written in C. 
+	  Its purpose is to provide a set of extensible DSP modules 
+	  that do no rely on external dependencies or cumbersome frameworks.
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
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
new file mode 100644
index 0000000..ccabbf9
--- /dev/null
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# liquid-dsp
+#
+################################################################################
+
+LIQUID_DSP_VERSION = df5a459fa0
+LIQUID_DSP_SITE = https://github.com/jgaeddert/liquid-dsp.git
+LIQUID_DSP_SITE_METHOD = git
+LIQUID_DSP_LICENSE = MIT 
+LIQUID_DSP_LICENSE_FILES = COPYING
+LIQUID_DSP_INSTALL_STAGING = YES 
+
+LIQUID_DSP_DEPENDENCIES = host-autoconf host-automake
+
+define LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP
+	rm -f $(LIQUID_DSP_DIR)/config.cache 
+	rm -f $(LIQUID_DSP_DIR)/aclocal.m4
+	cd $(LIQUID_DSP_DIR) && $(ACLOCAL) -I./scripts && $(AUTOCONF) && $(AUTOHEADER) 
+endef
+
+LIQUID_DSP_PRE_CONFIGURE_HOOKS += LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP
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
+LIQUID_DSP_CONF_OPTS += CFLAGS="$(LIQUID_DSP_CFLAGS)"
+LIQUID_DSP_CONF_OPTS += LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
+
+$(eval $(autotools-package))
-- 
1.7.10.4
