From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 26 Mar 2016 15:25:31 -0300
Subject: [Buildroot] [PATCH 1/2] efivar: new package
Message-ID: <1459016732-27843-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efivar contains tools and libraries to manipulate EFI variables.

This package has some restrictions to build. First, it needs uchar.h
which apparently does not come in uclibc, so it has been disabled for
uclibc.
It has also been found that in some systems it failed to build due to
not generating the .pc files. This has been tracked to the use of make
3.81, so a patch was prepared for it. I have also sent this patch to the
upstream development.
And then there's the linux/nvme.h header, which is somewhat conturbed,
as it has appeared in user space linux headers 3.12 and in 4.4 it was
renamed. This has been solved by restricting it to build with linux
headers >= 3.12 and a patch from upstream was picked which fixes it for
linux headers >= 4.4.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in                                  |  1 +
 .../0001-Workaround-rename-of-linux-nvme.h.patch   | 32 +++++++++++++++
 .../0002-Make.rules-fix-build-with-make-3.81.patch | 45 ++++++++++++++++++++++
 package/efivar/Config.in                           | 14 +++++++
 package/efivar/efivar.hash                         |  2 +
 package/efivar/efivar.mk                           | 43 +++++++++++++++++++++
 6 files changed, 137 insertions(+)
 create mode 100644 package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
 create mode 100644 package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
 create mode 100644 package/efivar/Config.in
 create mode 100644 package/efivar/efivar.hash
 create mode 100644 package/efivar/efivar.mk

diff --git a/package/Config.in b/package/Config.in
index 1467f33..b8d142f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1612,6 +1612,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
index 0000000..baddddd
--- /dev/null
+++ b/package/efivar/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EFIVAR
+	bool "efivar"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC || \
+		BR2_TOOLCHAIN_USES_MUSL # uchar.h
+	select BR2_PACKAGE_POPT
+	help
+	  Tools and libraries to manipulate EFI variables
+
+	  https://github.com/rhinstaller/efivar
+
+comment "efivar requires an (e)glibc/musl toolchain w/ headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
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
index 0000000..9775777
--- /dev/null
+++ b/package/efivar/efivar.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# efivar
+#
+################################################################################
+
+EFIVAR_VERSION = 0.23
+EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
+EFIVAR_LICENSE = GPLv2.1
+EFIVAR_LICENSE_FILES = COPYING
+EFIVAR_DEPENDENCIES = popt
+EFIVAR_INSTALL_STAGING = YES
+
+define EFIVAR_BUILD_CMDS
+	# makeguids is an internal host tool and must be built separately with
+	# $(HOST_CC), otherwise it gets cross-built.
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CFLAGS+=-std=c99 \
+		$(MAKE1) -C $(@D)/src makeguids
+
+	# skip efivar-static build, otherwise we always require static popt
+	$(SED) 's/^BINTARGETS=.*/BINTARGETS=efivar/g' \
+		$(@D)/src/Makefile
+
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		libdir="/usr/lib/" \
+		all
+endef
+
+define EFIVAR_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		libdir="/usr/lib/" \
+		DESTDIR="$(STAGING_DIR)" \
+		install
+endef
+
+define EFIVAR_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		libdir="/usr/lib/" \
+		DESTDIR="$(TARGET_DIR)" \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
