From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 20 Apr 2016 22:23:55 -0300
Subject: [Buildroot] [PATCH v2 1/2] efivar: new package
Message-ID: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efivar contains tools and libraries to manipulate EFI variables.

This package has some restrictions to build. It needs uchar.h which
apparently does not come in uClibc, and it also needs
__bswap_constant_*() definitions which are only present in glibc.
So, this package was limited to build with glibc toolchains.

Although it probably makes sense mostly on x86, x86-64 and aarch64
architectures, there are no architecture specific limitations which
would prevent it to build for other architectures, so this restriction
was not imposed. This package has been build-tested additionaly on many
architectures which support glibc, such as mips, MicroBlaze, sparc64,
ppc64. There were some build flag issues found when building to some of
these some architectures, although the flags can be also added in the
general case, so they were added by default.

It has also been found that in some host systems it failed to build due
to not generating the .pc files. This has been tracked to the use of
make 3.81, so a patch was prepared for it and was submitted upstream.
There's also a dependency on the linux/nvme.h header, which is somewhat
conturbed, as it has appeared in user space linux headers 3.12 and in
4.4 it was renamed. This has been solved by restricting it to build with
linux headers >= 3.12 and a patch from upstream was picked which fixes
it for linux headers >= 4.4.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

---
Changes v1 -> v2:
 - Remove musl as a possibility as it doesn't define
 __bswap_constant_*() which are required.
 - Add -fPIC and -shared-libgcc to fix issues in mips and MicroBlaze

 - Fix license to LGPLv2.1
 - Fix HOST_CFLAGS for makeguids host build
 - Use EFIVAR_MAKE_OPTS to change variables instead of patching Makefile
 (pointed out by Thomas Petazzoni)
---
 package/Config.in                                  |  1 +
 .../0001-Workaround-rename-of-linux-nvme.h.patch   | 32 ++++++++++++++
 .../0002-Make.rules-fix-build-with-make-3.81.patch | 45 +++++++++++++++++++
 package/efivar/Config.in                           | 15 +++++++
 package/efivar/efivar.hash                         |  2 +
 package/efivar/efivar.mk                           | 50 ++++++++++++++++++++++
 6 files changed, 145 insertions(+)
 create mode 100644 package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
 create mode 100644 package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
 create mode 100644 package/efivar/Config.in
 create mode 100644 package/efivar/efivar.hash
 create mode 100644 package/efivar/efivar.mk

diff --git a/package/Config.in b/package/Config.in
index 5103621..1d68822 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1625,6 +1625,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
+	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
diff --git a/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch b/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
new file mode 100644
index 0000000..c12a2d9
--- /dev/null
+++ b/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
@@ -0,0 +1,32 @@
+From 75a73111371526a12712bb7211da2116c0bf40f7 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Thu, 14 Jan 2016 17:02:31 -0500
+Subject: [PATCH] Workaround rename of linux/nvme.h
+
+Bug: https://bugs.gentoo.org/571548
+
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ src/linux.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/linux.c b/src/linux.c
+index b618cfd..9388cd3 100644
+--- a/src/linux.c
++++ b/src/linux.c
+@@ -22,7 +22,12 @@
+ #include <inttypes.h>
+ #include <limits.h>
+ #include <linux/ethtool.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
++#include <linux/nvme_ioctl.h>
++#else
+ #include <linux/nvme.h>
++#endif
+ #include <linux/sockios.h>
+ #include <net/if.h>
+ #include <scsi/scsi.h>
+-- 
+2.7.4
+
diff --git a/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
new file mode 100644
index 0000000..e4e5a2c
--- /dev/null
+++ b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
@@ -0,0 +1,45 @@
+From 00376f4dec71d4abb591ba07bc8164ba29e5955e Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Tue, 22 Mar 2016 21:43:44 -0300
+Subject: [PATCH] Make.rules: fix build with make <= 3.81
+
+Building with host make 3.81 resulted in an issue where src/efivar.pc
+was never generated.
+Even by running 'make efivar.pc' inside the src directory, make always
+returned that there was nothing to do.
+This was not observed when using make 3.82 or 4.x.
+It is apparently caused by the assignment operators in the multi-line
+defines in Make.rules, which do not seem to be supported by make 3.81.
+By omitting the assignment operators, the rule works with both versions
+of make.
+
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ Make.rules | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 8a50fa5..d9c0609 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -42,7 +42,7 @@ include $(TOPDIR)/Make.version
+ 
+ %.c : %.h
+ 
+-define substitute-version =
++define substitute-version
+ 	sed						\
+ 		-e "s,@@VERSION@@,$(VERSION),g"		\
+ 		-e "s,@@LIBDIR@@,$(libdir),g"		\
+@@ -61,7 +61,7 @@ pkg-config-ldflags = \
+ pkg-config-ldlibs = \
+ 	$(shell if [ -n "$(PKGS)" ]; then $(PKG_CONFIG) --libs-only-l $(PKGS) ; fi)
+ 
+-define deps-of =
++define deps-of
+ 	$(foreach src,$(filter %.c,$(1)),$(patsubst %.c,.%.d,$(src))) \
+ 	$(foreach src,$(filter %.S,$(1)),$(patsubst %.S,.%.d,$(src)))
+ endef
+-- 
+2.7.4
+
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
new file mode 100644
index 0000000..c507584
--- /dev/null
+++ b/package/efivar/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EFIVAR
+	bool "efivar"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	# doesn't build with uclibc due to lack of uchar.h
+	# doesn't build with musl due to lack of __bswap_constant_16
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_POPT
+	help
+	  Tools and libraries to manipulate EFI variables
+
+	  https://github.com/rhinstaller/efivar
+
+comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
new file mode 100644
index 0000000..6619229
--- /dev/null
+++ b/package/efivar/efivar.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 f807f5f0846323bc21b18043542b296f5ad81514f91f13c74a4b8da30c965c94 efivar-0.23.tar.gz
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
new file mode 100644
index 0000000..6e0ba68
--- /dev/null
+++ b/package/efivar/efivar.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# efivar
+#
+################################################################################
+
+EFIVAR_VERSION = 0.23
+EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
+EFIVAR_LICENSE = LGPLv2.1
+EFIVAR_LICENSE_FILES = COPYING
+EFIVAR_DEPENDENCIES = popt
+EFIVAR_INSTALL_STAGING = YES
+
+# BINTARGETS is set to skip efivar-static which requires static popt.
+# -fPIC is requested at least on MIPS, otherwise fails to build shared library.
+# Explicitly linking with shared libgcc is required at least on MicroBlaze,
+# otherwise it fails due to FDE encoding in static libgcc.
+EFIVAR_MAKE_OPTS = \
+	libdir=/usr/lib \
+	BINTARGETS=efivar \
+	LDFLAGS=-fPIC \
+	SOFLAGS="-shared -shared-libgcc"
+
+define EFIVAR_BUILD_CMDS
+	# makeguids is an internal host tool and must be built separately with
+	# $(HOST_CC), otherwise it gets cross-built.
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99" \
+		$(MAKE) -C $(@D)/src makeguids
+
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		$(EFIVAR_MAKE_OPTS) \
+		all
+endef
+
+define EFIVAR_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		$(EFIVAR_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" \
+		install
+endef
+
+define EFIVAR_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		$(EFIVAR_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.8.0
